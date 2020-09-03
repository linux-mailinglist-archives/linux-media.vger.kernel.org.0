Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B76725C434
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 17:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729309AbgICPFq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 11:05:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:47824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728887AbgICN6P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Sep 2020 09:58:15 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 03E83208B3;
        Thu,  3 Sep 2020 13:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599141456;
        bh=vW65TbwI8SwZiwFXgxSf5xZsxuSUgeC5F1theLDAloE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0Lzx3zaoCsj75yzLW9jkI2nPXSTigMstiL8oNfRDjv3Z0+nkd4F0lxvL9zq75A8YQ
         w1GUEsDptIgb10tYVHYa5/OGUWAW17s4imCRSq/PpCMKZQskhwlGW77+GUwshrNv8s
         NVh1qsa8D/KeZL9AjG+m0xVhd84AzUxh7fgCn18o=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDpk6-004T6l-3r; Thu, 03 Sep 2020 15:57:34 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] media: atomisp: get rid of some cleanup leftovers
Date:   Thu,  3 Sep 2020 15:57:28 +0200
Message-Id: <1e7968e715e23b90ab4994b32301a6cf4faffca8.1599141140.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599141140.git.mchehab+huawei@kernel.org>
References: <cover.1599141140.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code that used to check for ISP2400/2401 version were
using the revision number in order to decide wheather
version should be used. With the new version, the code
doesn't need to check anymore for ISP version.

Fixes: ca133c395f2f ("media: atomisp: improve device detection code")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 8c1d5a3b8f45..304857bffc6a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1429,7 +1429,6 @@ atomisp_load_firmware(struct atomisp_device *isp)
  */
 static bool is_valid_device(struct pci_dev *pdev, const struct pci_device_id *id)
 {
-	unsigned int a0_max_id = 0;
 	const char *name;
 	const char *product;
 
@@ -1437,11 +1436,9 @@ static bool is_valid_device(struct pci_dev *pdev, const struct pci_device_id *id
 
 	switch (id->device & ATOMISP_PCI_DEVICE_SOC_MASK) {
 	case ATOMISP_PCI_DEVICE_SOC_MRFLD:
-		a0_max_id = ATOMISP_PCI_REV_MRFLD_A0_MAX;
 		name = "Merrifield";
 		break;
 	case ATOMISP_PCI_DEVICE_SOC_BYT:
-		a0_max_id = ATOMISP_PCI_REV_BYT_A0_MAX;
 		name = "Baytrail";
 		break;
 	case ATOMISP_PCI_DEVICE_SOC_ANN:
-- 
2.26.2

