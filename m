Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F5A22263B
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 16:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbgGPOvm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 10:51:42 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:58566 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728551AbgGPOvl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 10:51:41 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jw5EY-0008Au-F2; Thu, 16 Jul 2020 14:51:38 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc:     kernel-janitors@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: fix mask and shift operation on ISPSSPM0
Date:   Thu, 16 Jul 2020 15:51:38 +0100
Message-Id: <20200716145138.1708693-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the check on bits 25:24 on ISPSSPM0 is always 0 because
the mask and shift operations are incorrect. Fix this by shifting
by MRFLD_ISPSSPM0_ISPSSS_OFFSET (24 bits right) and then masking
with RFLD_ISPSSPM0_ISPSSC_MASK (0x03) to get the appropriate 2 bits
to check.

Addresses-Coverity: ("Operands don't affect result")
Fixes: 0f441fd70b1e ("media: atomisp: simplify the power down/up code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index d36809a0182c..a59d11aa232d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -755,7 +755,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 
 		/* Wait until ISPSSPM0 bit[25:24] shows the right value */
 		iosf_mbi_read(BT_MBI_UNIT_PMC, MBI_REG_READ, MRFLD_ISPSSPM0, &tmp);
-		tmp = (tmp & MRFLD_ISPSSPM0_ISPSSC_MASK) >> MRFLD_ISPSSPM0_ISPSSS_OFFSET;
+		tmp = (tmp >> MRFLD_ISPSSPM0_ISPSSS_OFFSET) & MRFLD_ISPSSPM0_ISPSSC_MASK;
 		if (tmp == val) {
 			trace_ipu_cstate(enable);
 			return 0;
-- 
2.27.0

