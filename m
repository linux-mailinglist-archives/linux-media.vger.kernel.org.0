Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB30B336FC7
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 11:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbhCKKUt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 05:20:49 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:34859 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232282AbhCKKUa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 05:20:30 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KIQYlPLX0C40pKIQelKo5B; Thu, 11 Mar 2021 11:20:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615458029; bh=9RmIS0uPt9uV4t5Ps4lrvIgv+2Z9aLGG7N3DtMlAlWQ=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=CfUW3XNE5qmhjfGJg8zmkAq3F+LRnGjjzaFv4RegTRAxqwQ96V4HfSDzIObGt0Ldg
         3thiQTeoNJaW9WRaxpg4Exym7KOkvBCLGXATjltm9OZldBiMbeHMFClFPo06KP13nW
         QxGEVH9gXNn0K+91mo8TqaM9msqXFMq9VtjJjoo2NC38txHWzQQFI03oaIKxTHkD+a
         PRAfZ4bHxW6Y6AOyQb+aL6UDipeu9C9/grWRFJupkcseTJHXJ8Xov084V165ql1fZK
         ZphDMjGy+/OE79jMXZTK/iPsEmXQ8CLlWgXqSQchgsQSXto94WFoaspmWxRgKclYGx
         ncF0F+GgkrT3g==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jean-Christophe Trotin <jean-christophe.trotin@st.com>
Subject: [PATCH 05/13] media/platform/sti: fix kernel-doc formatting
Date:   Thu, 11 Mar 2021 11:20:14 +0100
Message-Id: <20210311102022.96954-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJ2t2hEZx/QeWjdRyHoE/3o+ITKtl1JBIhvi1AKPJPEiDGao1h+/Sg4NVx25QIPjhcgyHLu1I1hUODliM2dBLTwkxpqIEab/wIQCIgAQ2SGffk2RzLw3
 SZrOEPdycO75DKE/yJCc4p4985KciOw7LYIZCDmCG0e4qJVMAz90hpx3JUkY8J4zuAZauMq8VeSLTeR7bLVra2uBFD3eLj8JZyFD/oub4dya1pOBosUuYVBk
 IFiXaGxdNq/JpyEhGIplt7Oc1QNRegj42BVAKu9a7xhIsrX0Cb9URfDjoo6nmfG2
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

bdisp/bdisp-filter.h: coef: -> @coef:  (missing @)
c8sectpfe/c8sectpfe-debugfs.h: /** -> /* (wasn't a kernel-doc comment)
sti/hva/hva.h: @v4l2: -> @vbuf:  (wrong name)

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Jean-Christophe Trotin <jean-christophe.trotin@st.com>
---
 drivers/media/platform/sti/bdisp/bdisp-filter.h          | 4 ++--
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-debugfs.h | 3 +--
 drivers/media/platform/sti/hva/hva.h                     | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/sti/bdisp/bdisp-filter.h b/drivers/media/platform/sti/bdisp/bdisp-filter.h
index d25adb57e3d0..9e1a95fd27ed 100644
--- a/drivers/media/platform/sti/bdisp/bdisp-filter.h
+++ b/drivers/media/platform/sti/bdisp/bdisp-filter.h
@@ -12,7 +12,7 @@
  *
  * @min:        min scale factor for this filter (6.10 fixed point)
  * @max:        max scale factor for this filter (6.10 fixed point)
- * coef:        filter coefficients
+ * @coef:       filter coefficients
  */
 struct bdisp_filter_h_spec {
 	const u16 min;
@@ -24,7 +24,7 @@ struct bdisp_filter_h_spec {
  *
  * @min:	min scale factor for this filter (6.10 fixed point)
  * @max:	max scale factor for this filter (6.10 fixed point)
- * coef:	filter coefficients
+ * @coef:	filter coefficients
  */
 struct bdisp_filter_v_spec {
 	const u16 min;
diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-debugfs.h b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-debugfs.h
index b8c30bcc8df9..d2c35fb32d7e 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-debugfs.h
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-debugfs.h
@@ -1,11 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
  * c8sectpfe-debugfs.h - C8SECTPFE STi DVB driver debugfs header
  *
  * Copyright (c) STMicroelectronics 2015
  *
  * Authors: Peter Griffin <peter.griffin@linaro.org>
- *
  */
 
 #ifndef __C8SECTPFE_DEBUG_H
diff --git a/drivers/media/platform/sti/hva/hva.h b/drivers/media/platform/sti/hva/hva.h
index 1226d60cc367..ba6b893416ec 100644
--- a/drivers/media/platform/sti/hva/hva.h
+++ b/drivers/media/platform/sti/hva/hva.h
@@ -130,7 +130,7 @@ struct hva_frame {
 /**
  * struct hva_stream - hva stream buffer (capture)
  *
- * @v4l2:       video buffer information for V4L2
+ * @vbuf:       video buffer information for V4L2
  * @list:       V4L2 m2m list that the frame belongs to
  * @paddr:      physical address (for hardware)
  * @vaddr:      virtual address (kernel can read/write)
-- 
2.30.1

