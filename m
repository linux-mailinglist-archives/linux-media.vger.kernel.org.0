Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEF21A4749
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 16:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgDJOSQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 10:18:16 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37141 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgDJOSQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 10:18:16 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jMuU1-0001Ci-F1; Fri, 10 Apr 2020 14:18:13 +0000
From:   Colin King <colin.king@canonical.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: gspca: remove redundant assignment to variable status
Date:   Fri, 10 Apr 2020 15:18:13 +0100
Message-Id: <20200410141813.29497-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable status is being assigned a value that is never read.
The assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/gspca/mr97310a.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/gspca/mr97310a.c b/drivers/media/usb/gspca/mr97310a.c
index 502fc2eaffe0..464aa61cd914 100644
--- a/drivers/media/usb/gspca/mr97310a.c
+++ b/drivers/media/usb/gspca/mr97310a.c
@@ -287,7 +287,6 @@ static int zero_the_pointer(struct gspca_dev *gspca_dev)
 			return err_code;
 
 		err_code = cam_get_response16(gspca_dev, 0x21, 0);
-		status = data[0];
 		tries++;
 		if (err_code < 0)
 			return err_code;
-- 
2.25.1

