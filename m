Return-Path: <linux-media+bounces-22854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3F29E8B97
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 07:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AB22161503
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 06:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296A1214809;
	Mon,  9 Dec 2024 06:40:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cmccmta1.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1241E4A4;
	Mon,  9 Dec 2024 06:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733726429; cv=none; b=gJwebT5Te2P8djkuAtgBCV1HyM7zaiWw++4gI3ACusFf3Gro5pUOhRb823Qry1uwPusL0YkkjLKzCspOEvE6homob/Hn6GinIL1+O6ck0Mc2PsaFxKwN5pgmNSwp6PGnVAOFEqeN1CgyvETAh4mwIj6kyeFsW1/F+DncSwWjQEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733726429; c=relaxed/simple;
	bh=MDU8qJbap1SIhGGyge/vVxPPo+c9g1a/1ysXlb0Y2rI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QcpVx6bk8v7LCndlvcgHEvfFFHnXfLXWI8Bq45UDKXbk9AgCVlNGdz+ZrR9sGNA29y0EIgklj3Zp+qny/w0nzvJBcdLZb0965zUkocgOpXza6Ih+OistuZl+/yglAoRxhNlBq6mFCjAQiLGuIezsjVG+LKmr2/3aQCObcyeQ1Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee1675690d711a-c1a37;
	Mon, 09 Dec 2024 14:40:24 +0800 (CST)
X-RM-TRANSID:2ee1675690d711a-c1a37
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee8675690d764f-a6ff4;
	Mon, 09 Dec 2024 14:40:24 +0800 (CST)
X-RM-TRANSID:2ee8675690d764f-a6ff4
From: Liu Jing <liujing@cmss.chinamobile.com>
To: andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Liu Jing <liujing@cmss.chinamobile.com>
Subject: [PATCH] media: atomisp: fix spelling error in ia_css_sdis2_types.h
Date: Mon,  9 Dec 2024 14:40:22 +0800
Message-Id: <20241209064022.4342-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the coefficients spelling error in ia_css_sdis2_types.h

Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
index f37802878528..2bed08435755 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
@@ -19,7 +19,7 @@
 #endif
 
 /* DVS 2.0 Coefficient types. This structure contains 4 pointers to
- *  arrays that contain the coeffients for each type.
+ *  arrays that contain the coefficients for each type.
  */
 struct ia_css_dvs2_coef_types {
 	s16 *odd_real; /** real part of the odd coefficients*/
-- 
2.27.0




