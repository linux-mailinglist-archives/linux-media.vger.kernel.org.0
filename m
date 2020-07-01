Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F2E210CEB
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 15:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731395AbgGAN5M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 09:57:12 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33009 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731365AbgGAN44 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 09:56:56 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jqdEK-0003Lw-Cm; Wed, 01 Jul 2020 13:56:52 +0000
From:   Colin King <colin.king@canonical.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: gspca: remove redundant initialization of variable status
Date:   Wed,  1 Jul 2020 14:56:52 +0100
Message-Id: <20200701135652.549979-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable status is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/gspca/sn9c2028.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/sn9c2028.c b/drivers/media/usb/gspca/sn9c2028.c
index aff01b753853..dbd1d6da37f1 100644
--- a/drivers/media/usb/gspca/sn9c2028.c
+++ b/drivers/media/usb/gspca/sn9c2028.c
@@ -215,7 +215,7 @@ static int sd_config(struct gspca_dev *gspca_dev,
 /* this function is called at probe and resume time */
 static int sd_init(struct gspca_dev *gspca_dev)
 {
-	int status = -1;
+	int status;
 
 	sn9c2028_read1(gspca_dev);
 	sn9c2028_read1(gspca_dev);
-- 
2.27.0

