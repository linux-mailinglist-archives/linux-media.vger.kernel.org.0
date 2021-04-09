Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 296E83598F6
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 11:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231954AbhDIJQI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 05:16:08 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37111 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbhDIJQI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 05:16:08 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lUnEh-0003Dt-TT; Fri, 09 Apr 2021 09:15:31 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: s2255drv: remove redundant assignment to variable field
Date:   Fri,  9 Apr 2021 10:15:31 +0100
Message-Id: <20210409091531.630379-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable 'field' is being assigned a value this is never read,
it is being updated in all the following if/else combinations. The
assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/s2255/s2255drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 4af55e2478be..3b0e4ed75d99 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -767,8 +767,6 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	if (fmt == NULL)
 		return -EINVAL;
 
-	field = f->fmt.pix.field;
-
 	dprintk(vc->dev, 50, "%s NTSC: %d suggested width: %d, height: %d\n",
 		__func__, is_ntsc, f->fmt.pix.width, f->fmt.pix.height);
 	if (is_ntsc) {
-- 
2.30.2

