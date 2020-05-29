Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542991E8860
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 22:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbgE2UBV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 16:01:21 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:46469 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbgE2UAt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 16:00:49 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MyK9S-1imwbt0Oxo-00yeuk; Fri, 29 May 2020 22:00:41 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 4/9] staging: media: atomisp: fix a type conversion warning
Date:   Fri, 29 May 2020 22:00:26 +0200
Message-Id: <20200529200031.4117841-4-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529200031.4117841-1-arnd@arndb.de>
References: <20200529200031.4117841-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qWBqLiHAEPDMF8js3BlDSPtIsv7NefuRl9Ih3YXihEz3ytqwK7I
 95pwIVpN2VK2c6MErMz1nU1mqoSwXJZ4oreJOy0xL2phOWMHcUrB6rNLLn3e/qEBBzYsS81
 tCgb/sdTaV85b0SQpiut7Q2R2d230ZF+dUvb77YsIW7R1Uz+1iRLVu9ZEj+sAJOEKZN3QeP
 Y9Z7KixTphCsicYvRwfpg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ElPwMuZ6EYA=:0afz9AlQbCrElA4/wPvPtt
 I8ZVINFuuOu0sb0PG4sb88XGYuSFmLYxK911LA6eDkfXasPoS5F0s+NL6Fcg4ExHQIMpOijg4
 YBr0uyt7M/yh+nEFrnEmk60iNgmBumR4US/B+RrKhJ4wLeM73A9MU7OcAhRegL4sdtQhO1B6l
 Nls2QL0fKd2PBW0R/IDTen/u0pfGjJ7AW0eW/022wQaW7dpHKCXqgwFbORCECWTjAkZNgXK8s
 RioqNoWlKhifzzPbSSFw0zg0TEtL2xoa8bCICFUjV9k1AFHhJrii1aj8VJUUG+IhGcrCxpg7R
 8b1nABsEqSYDyb1aQU1IZsklEjVEOip6Pa0XV6qzLYxIlMaMLzNnsLG0js7E8VvLkxkQuNZJL
 BoQ7DayVfuIkT/iA/xioZ9xSUzJy3Z0KCoX7KQzWFWe6tFdtS5h70i3xlZ/068EAZJeWuy1mx
 2M59u1tri8c8dJpM54fAJQLixVfN91s2DkEO2z7GimRUaIulBeUH/XxZX4jysiiJAZf4UecCQ
 vRyja1RjxpbWLDX/WPOc+Jus3RKAnleTwgHjJ+FHUnQMT4dH+gNhxzGq0T9Ft17w0q3YuC04s
 x+SIvCPSzL799skAtJDgxPqKuXyOScaj/SldgErWCTrpwEFDuSIMUo70DOGsHh+XGwus1gk5n
 K7hfDKlSvK9TA3wBueZX1Puke5NcxdlXFt5z+kG1ZI6vLiSi1W16RSAdXdeDn9MRqXGTKt36d
 21eLKPhNBs88rTvd8mnZjBT7Q/Dcwcys8bhN4wFy7n1leMS0otcgwuFd4JzrrLcXBV41TTMHw
 q2n7yBgknNPAruPsYYXpqqrDRw35/ewn//GLRvDMyVE1/UF5i0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

clang complains that the type conversion in the MAX() macro
contains an implied integer overflow to a signed number:

drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c:129:35:
error: implicit conversion from 'unsigned long' to 'int32_t' (aka 'int') changes value from 18446744073709543424 to -8192 [-Werror,-Wconstant-conversion]

As the conversion is clearly intended here, use an explicit cast.

Fixes: 9a0d7fb5ece6 ("media: atomisp: simplify math_support.h")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
index a9db6366d20b..613bace0522a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
@@ -126,7 +126,7 @@ compute_blending(int strength)
 	 * exactly as s0.11 fixed point, but -1.0 can.
 	 */
 	isp_strength = -(((strength * isp_scale) + offset) / host_scale);
-	return MAX(MIN(isp_strength, 0), -XNR_BLENDING_SCALE_FACTOR);
+	return MAX(MIN(isp_strength, 0), -(unsigned int)XNR_BLENDING_SCALE_FACTOR);
 }
 
 void
-- 
2.26.2

