Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2238F3BB2B0
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 01:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233517AbhGDXQG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Jul 2021 19:16:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:48840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232701AbhGDXNR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 4 Jul 2021 19:13:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26D546196E;
        Sun,  4 Jul 2021 23:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625440152;
        bh=ehz4wRZJTq5WtUVqNeuBwjXjAL4ZYS58kSqK78k9AMM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rVHOKRd63Sp4w0vaCwXgWL2V5EnTrv0qcmFdq+to9Xqw/jCaS4VNj30pcJJ9u5NlO
         XNNBSDKuA1HEfyOpg/dWiet+9q8G9lg4ukV13pDW7eAyNnvGQQLqMQv0VGSl4byYWS
         UsFu8kuAa8UABup55BXqPwBGEoezA1BIkIekBveYrgux65fVAsinK2ffs8/qjli0HO
         vGR7rz3wVGd9wIgBvSPiNMs6iiJbdXDrRBBcQxuPhSmAKaUzTRAoCu0ZibpeJ41OF4
         Qei4VZzTQ8ZsLYOMc2mV5H8NjTzeX4zSIe0pftSZz7kx6Rr9z0E2eF/L6gtDhOzTRA
         jeli2YU09rzwg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 51/70] media: dvb_net: avoid speculation from net slot
Date:   Sun,  4 Jul 2021 19:07:44 -0400
Message-Id: <20210704230804.1490078-51-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704230804.1490078-1-sashal@kernel.org>
References: <20210704230804.1490078-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

[ Upstream commit abc0226df64dc137b48b911c1fe4319aec5891bb ]

The risk of especulation is actually almost-non-existing here,
as there are very few users of TCP/IP using the DVB stack,
as, this is mainly used with DVB-S/S2 cards, and only by people
that receives TCP/IP from satellite connections, which limits
a lot the number of users of such feature(*).

(*) In thesis, DVB-C cards could also benefit from it, but I'm
yet to see a hardware that supports it.

Yet, fixing it is trivial.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/dvb-core/dvb_net.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index 89620da983ba..dddebea644bb 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -45,6 +45,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/netdevice.h>
+#include <linux/nospec.h>
 #include <linux/etherdevice.h>
 #include <linux/dvb/net.h>
 #include <linux/uio.h>
@@ -1462,14 +1463,20 @@ static int dvb_net_do_ioctl(struct file *file,
 		struct net_device *netdev;
 		struct dvb_net_priv *priv_data;
 		struct dvb_net_if *dvbnetif = parg;
+		int if_num = dvbnetif->if_num;
 
-		if (dvbnetif->if_num >= DVB_NET_DEVICES_MAX ||
-		    !dvbnet->state[dvbnetif->if_num]) {
+		if (if_num >= DVB_NET_DEVICES_MAX) {
 			ret = -EINVAL;
 			goto ioctl_error;
 		}
+		if_num = array_index_nospec(if_num, DVB_NET_DEVICES_MAX);
 
-		netdev = dvbnet->device[dvbnetif->if_num];
+		if (!dvbnet->state[if_num]) {
+			ret = -EINVAL;
+			goto ioctl_error;
+		}
+
+		netdev = dvbnet->device[if_num];
 
 		priv_data = netdev_priv(netdev);
 		dvbnetif->pid=priv_data->pid;
@@ -1522,14 +1529,20 @@ static int dvb_net_do_ioctl(struct file *file,
 		struct net_device *netdev;
 		struct dvb_net_priv *priv_data;
 		struct __dvb_net_if_old *dvbnetif = parg;
+		int if_num = dvbnetif->if_num;
+
+		if (if_num >= DVB_NET_DEVICES_MAX) {
+			ret = -EINVAL;
+			goto ioctl_error;
+		}
+		if_num = array_index_nospec(if_num, DVB_NET_DEVICES_MAX);
 
-		if (dvbnetif->if_num >= DVB_NET_DEVICES_MAX ||
-		    !dvbnet->state[dvbnetif->if_num]) {
+		if (!dvbnet->state[if_num]) {
 			ret = -EINVAL;
 			goto ioctl_error;
 		}
 
-		netdev = dvbnet->device[dvbnetif->if_num];
+		netdev = dvbnet->device[if_num];
 
 		priv_data = netdev_priv(netdev);
 		dvbnetif->pid=priv_data->pid;
-- 
2.30.2

