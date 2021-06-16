Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 249033A9A58
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 14:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbhFPMar (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 08:30:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:49230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231179AbhFPMaq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 08:30:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8731A61356;
        Wed, 16 Jun 2021 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623846520;
        bh=DzuXxK/L6L29nZjYPejhCPD+EXffrWanY9DtdBFUzHw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fhQOAShvNZjN60DXwljR4nweOGTtAFZkmpxoqazHz2NKexrPctvIleK7jG0i349a8
         4Fp5Mq9TbF/Un6n+1k3jkKovA7O/GbxYJxBZcqj3n1Ft5mtCkZSXXoKhBIh40h024s
         skoypPmN02+w+pKV2a5hGzwoE9Ej0l5Ihn5W6JG2rcY6s0Rs4tgffI34NgM8BUhCZo
         tqAEO1o7sxl96S5/bBI3bWBLmIi4f/wDSAvEC9D4LHgN9/AbAEyjGg4UXrH4ZfslLc
         2wCCx2vBmLcCDF+984IMqcDxhcdeseY9qFn/Hz/koqXWWsoAXNyo4QhMhTWttbNIlg
         JmU3qqaaYtJEw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ltUes-004oiV-9G; Wed, 16 Jun 2021 14:28:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peilin Ye <yepeilin.cs@gmail.com>, Sean Young <sean@mess.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 03/11] media: dvbdev: fix error logic at dvb_register_device()
Date:   Wed, 16 Jun 2021 14:28:29 +0200
Message-Id: <56a94235a78b2313661154d6802dd8d3b9864de7.1623846327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623846327.git.mchehab+huawei@kernel.org>
References: <cover.1623846327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As reported by smatch:

	drivers/media/dvb-core/dvbdev.c: drivers/media/dvb-core/dvbdev.c:510 dvb_register_device() warn: '&dvbdev->list_head' not removed from list
	drivers/media/dvb-core/dvbdev.c: drivers/media/dvb-core/dvbdev.c:530 dvb_register_device() warn: '&dvbdev->list_head' not removed from list
	drivers/media/dvb-core/dvbdev.c: drivers/media/dvb-core/dvbdev.c:545 dvb_register_device() warn: '&dvbdev->list_head' not removed from list

The error logic inside dvb_register_device() doesn't remove
devices from the dvb_adapter_list in case of errors.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-core/dvbdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 3862ddc86ec4..795d9bfaba5c 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -506,6 +506,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 			break;
 
 	if (minor == MAX_DVB_MINORS) {
+		list_del (&dvbdev->list_head);
 		kfree(dvbdevfops);
 		kfree(dvbdev);
 		up_write(&minor_rwsem);
@@ -526,6 +527,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		      __func__);
 
 		dvb_media_device_free(dvbdev);
+		list_del (&dvbdev->list_head);
 		kfree(dvbdevfops);
 		kfree(dvbdev);
 		mutex_unlock(&dvbdev_register_lock);
@@ -541,6 +543,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		pr_err("%s: failed to create device dvb%d.%s%d (%ld)\n",
 		       __func__, adap->num, dnames[type], id, PTR_ERR(clsdev));
 		dvb_media_device_free(dvbdev);
+		list_del (&dvbdev->list_head);
 		kfree(dvbdevfops);
 		kfree(dvbdev);
 		return PTR_ERR(clsdev);
-- 
2.31.1

