Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5193512DE2B
	for <lists+linux-media@lfdr.de>; Wed,  1 Jan 2020 09:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbgAAIUR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jan 2020 03:20:17 -0500
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:56920 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727186AbgAAIUR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jan 2020 03:20:17 -0500
X-IronPort-AV: E=Sophos;i="5.69,382,1571695200"; 
   d="scan'208";a="429578761"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES128-SHA256; 01 Jan 2020 09:20:08 +0100
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/16] media: cx231xx: constify copied structure
Date:   Wed,  1 Jan 2020 08:43:29 +0100
Message-Id: <1577864614-5543-12-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The hauppauge_955q_lgdt3306a_config structure is only copied
into another structure, so make it const.

The opportunity for this change was found using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/usb/cx231xx/cx231xx-dvb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-dvb.c b/drivers/media/usb/cx231xx/cx231xx-dvb.c
index e205f7f0a56a..0037b4b1381e 100644
--- a/drivers/media/usb/cx231xx/cx231xx-dvb.c
+++ b/drivers/media/usb/cx231xx/cx231xx-dvb.c
@@ -147,7 +147,7 @@ static struct tda18271_config pv_tda18271_config = {
 	.small_i2c = TDA18271_03_BYTE_CHUNK_INIT,
 };
 
-static struct lgdt3306a_config hauppauge_955q_lgdt3306a_config = {
+static const struct lgdt3306a_config hauppauge_955q_lgdt3306a_config = {
 	.qam_if_khz         = 4000,
 	.vsb_if_khz         = 3250,
 	.spectral_inversion = 1,

