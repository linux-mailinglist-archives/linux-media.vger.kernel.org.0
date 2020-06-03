Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A0C1ECA06
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbgFCHBy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:01:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:43404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726122AbgFCHBI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 03:01:08 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 835BF207DF;
        Wed,  3 Jun 2020 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591167665;
        bh=aO/eNnWMPoyWWYFwMjUCvhFtUVjC34oKmnoqH7DxW3E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CPnyLGeBL0dBvrkg14aURykBWp5d6YaIuipGjum+Q+/ZFjGJuUDHU1CC5aF0KQ+td
         J+R3WvTjsgTxskgnhYwrymzTZ7wi1Lp8k1yUv99c2n+kh6+oppWv60qsk8IKpqT/yE
         pTxZPmfzWjr2qlscVrntkUJuxB7yZI4daIwo9qkA=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgNOZ-004j8f-GZ; Wed, 03 Jun 2020 09:01:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/15] media: atomisp: don't set hpll_freq twice with different values
Date:   Wed,  3 Jun 2020 09:00:55 +0200
Message-Id: <1ae1868ee95529ce2a2fa4ae3390b3f77219c5a0.1591167358.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591167358.git.mchehab+huawei@kernel.org>
References: <cover.1591167358.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The logic which sets the hpll_freq for BYT sets hpll_freq
to 1600MHz, but ignores it, and sets it again after reading
from-device-specific EFI vars (this time, using a default
of 2000MHz).

Remove the first set, as this will be overriden anyway.

While here, do minor adjustments on comments and on a
printk message.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index c7f6b621ef3f..64e2386f328f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1659,10 +1659,12 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 		 * resolution accordingly.
 		 */
 		isp->dfs = &dfs_config_byt;
-		isp->hpll_freq = HPLL_FREQ_1600MHZ;
-		/* HPLL frequency is known to be device-specific, but we don't
+
+		/*
+		 * HPLL frequency is known to be device-specific, but we don't
 		 * have specs yet for exactly how it varies.  Default to
-		 * BYT-CR but let provisioning set it via EFI variable */
+		 * BYT-CR but let provisioning set it via EFI variable
+		 */
 		isp->hpll_freq = gmin_get_var_int(&dev->dev, false, "HpllFreq",
 						  HPLL_FREQ_2000MHZ);
 
@@ -1714,7 +1716,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 		default:
 			isp->hpll_freq = HPLL_FREQ_1600MHZ;
 			dev_warn(isp->dev,
-				 "read HPLL from cck failed.default 1600MHz.\n");
+				 "read HPLL from cck failed. Default to 1600 MHz.\n");
 		}
 		break;
 	default:
-- 
2.26.2

