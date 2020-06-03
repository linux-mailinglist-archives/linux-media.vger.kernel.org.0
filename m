Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D660A1EC9FD
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgFCHBG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:01:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:43086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725275AbgFCHBG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 03:01:06 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B85E2068D;
        Wed,  3 Jun 2020 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591167665;
        bh=X6b/gWynMj6O0LBu5lg93RyXNZhB8+OyiX4pPl3hTxc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hm2I/uQnEbenI4pv9BwcBiwMDwyP/m8TuPtpk+K4tDvBJkxjQbmh1Nql44CdXSGfq
         qXUr1Qrp6zL8b2Zo+7sWMHElYFZWtw1pp6jVp+Hlw63GkMK5XpcCyGYsuZ8X52ZDl0
         TwbagmK7gz4rqwepI+/IrzXVy4nTvsJRmrtfpd1k=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgNOZ-004j8Q-BX; Wed, 03 Jun 2020 09:01:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/15] media: atomisp: remove some unused defines from *mamoiada_params.h
Date:   Wed,  3 Jun 2020 09:00:52 +0200
Message-Id: <58f2e1d429aaa2d77fbcd96694368b7b7e15d963.1591167358.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591167358.git.mchehab+huawei@kernel.org>
References: <cover.1591167358.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are some parameters that are different between
isp2400 and isp2401. None of those are actually used.

So, get rid of them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../hrt/isp2400_mamoiada_params.h             | 20 +------------------
 .../atomisp/pci/isp2401_mamoiada_params.h     | 20 +------------------
 2 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/css_2400_system/hrt/isp2400_mamoiada_params.h b/drivers/staging/media/atomisp/pci/css_2400_system/hrt/isp2400_mamoiada_params.h
index 4a2345c38b8c..e18e5f3576df 100644
--- a/drivers/staging/media/atomisp/pci/css_2400_system/hrt/isp2400_mamoiada_params.h
+++ b/drivers/staging/media/atomisp/pci/css_2400_system/hrt/isp2400_mamoiada_params.h
@@ -16,11 +16,6 @@
 /* Version */
 #define RTL_VERSION
 
-/* Cell name  */
-#define ISP_CELL_TYPE                          isp2400_mamoiada
-#define ISP_VMEM                               simd_vmem
-#define _HRT_ISP_VMEM                          isp2400_mamoiada_simd_vmem
-
 /* instruction pipeline depth */
 #define ISP_BRANCHDELAY                        5
 
@@ -154,12 +149,6 @@
 
 #define ISP_VEC_ALIGN                          ISP_VMEM_ALIGN
 
-/* HRT specific vector support */
-#define isp2400_mamoiada_vector_alignment         ISP_VEC_ALIGN
-#define isp2400_mamoiada_vector_elem_bits         ISP_VMEM_ELEMBITS
-#define isp2400_mamoiada_vector_elem_precision    ISP_VMEM_ELEM_PRECISION
-#define isp2400_mamoiada_vector_num_elems         ISP_VEC_NELEMS
-
 /* register file sizes */
 #define ISP_RF0_SIZE        64
 #define ISP_RF1_SIZE        16
@@ -173,14 +162,7 @@
 #define ISP_RF9_SIZE        16
 #define ISP_RF10_SIZE       16
 #define ISP_RF11_SIZE       16
-#define ISP_VRF1_SIZE       24
-#define ISP_VRF2_SIZE       24
-#define ISP_VRF3_SIZE       24
-#define ISP_VRF4_SIZE       24
-#define ISP_VRF5_SIZE       24
-#define ISP_VRF6_SIZE       24
-#define ISP_VRF7_SIZE       24
-#define ISP_VRF8_SIZE       24
+
 #define ISP_SRF1_SIZE       4
 #define ISP_SRF2_SIZE       64
 #define ISP_SRF3_SIZE       64
diff --git a/drivers/staging/media/atomisp/pci/isp2401_mamoiada_params.h b/drivers/staging/media/atomisp/pci/isp2401_mamoiada_params.h
index 03d3329cd228..e18e5f3576df 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_mamoiada_params.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_mamoiada_params.h
@@ -16,11 +16,6 @@
 /* Version */
 #define RTL_VERSION
 
-/* Cell name  */
-#define ISP_CELL_TYPE                          isp2401_mamoiada
-#define ISP_VMEM                               simd_vmem
-#define _HRT_ISP_VMEM                          isp2401_mamoiada_simd_vmem
-
 /* instruction pipeline depth */
 #define ISP_BRANCHDELAY                        5
 
@@ -154,12 +149,6 @@
 
 #define ISP_VEC_ALIGN                          ISP_VMEM_ALIGN
 
-/* HRT specific vector support */
-#define isp2401_mamoiada_vector_alignment         ISP_VEC_ALIGN
-#define isp2401_mamoiada_vector_elem_bits         ISP_VMEM_ELEMBITS
-#define isp2401_mamoiada_vector_elem_precision    ISP_VMEM_ELEM_PRECISION
-#define isp2401_mamoiada_vector_num_elems         ISP_VEC_NELEMS
-
 /* register file sizes */
 #define ISP_RF0_SIZE        64
 #define ISP_RF1_SIZE        16
@@ -173,14 +162,7 @@
 #define ISP_RF9_SIZE        16
 #define ISP_RF10_SIZE       16
 #define ISP_RF11_SIZE       16
-#define ISP_VRF1_SIZE       32
-#define ISP_VRF2_SIZE       32
-#define ISP_VRF3_SIZE       32
-#define ISP_VRF4_SIZE       32
-#define ISP_VRF5_SIZE       32
-#define ISP_VRF6_SIZE       32
-#define ISP_VRF7_SIZE       32
-#define ISP_VRF8_SIZE       32
+
 #define ISP_SRF1_SIZE       4
 #define ISP_SRF2_SIZE       64
 #define ISP_SRF3_SIZE       64
-- 
2.26.2

