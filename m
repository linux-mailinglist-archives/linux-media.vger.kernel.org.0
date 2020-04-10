Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCA3A1A4712
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 15:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgDJNuR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 09:50:17 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36437 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbgDJNuR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 09:50:17 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jMu2x-00080m-2C; Fri, 10 Apr 2020 13:50:15 +0000
From:   Colin King <colin.king@canonical.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: pwc-ctl: remove redundant assignment to variable ret
Date:   Fri, 10 Apr 2020 14:50:14 +0100
Message-Id: <20200410135014.26396-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/pwc/pwc-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/pwc/pwc-ctrl.c b/drivers/media/usb/pwc/pwc-ctrl.c
index 315c55927f5c..cff64d872058 100644
--- a/drivers/media/usb/pwc/pwc-ctrl.c
+++ b/drivers/media/usb/pwc/pwc-ctrl.c
@@ -523,7 +523,7 @@ int pwc_set_leds(struct pwc_device *pdev, int on_value, int off_value)
 #ifdef CONFIG_USB_PWC_DEBUG
 int pwc_get_cmos_sensor(struct pwc_device *pdev, int *sensor)
 {
-	int ret = -1, request;
+	int ret, request;
 
 	if (pdev->type < 675)
 		request = SENSOR_TYPE_FORMATTER1;
-- 
2.25.1

