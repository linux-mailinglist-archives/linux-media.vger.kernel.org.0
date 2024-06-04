Return-Path: <linux-media+bounces-12523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0B18FB094
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 12:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C09E1C20C0A
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 10:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368CC1459E9;
	Tue,  4 Jun 2024 10:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CtLwSL70"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8320144D03;
	Tue,  4 Jun 2024 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717498434; cv=none; b=TokivlMN2TF90mZFYx91OJZHSHDToPfdoyeuORn5UNJEDZFdTMAQ5cqdNMki0oVR2pAhMnS5UjbYS+pPlAbpBBF9ipGd6IKBOs5iChzlmZKeBfBE88sZcZJy9s+1Oi042eS7ksDFAh3BXIgdYql2iVZtwC3vkqFvQMY0BPWttjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717498434; c=relaxed/simple;
	bh=zIi+rQm13ErlIx/zeUByBpBclT5laiaNC0ssvXS+RKI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R6eWnv839oeUH9s9tFb7PZBz0Q3Xyz/yOCNfE1Uxy6/5GHE1slv52Yj8UdkGvdA2EXFh70MoEGIHF6xsjU8nErsK+XgCI4S7d5s4RKVO0mlOeF7ap9PR+Lt9xkI8xxHwAS+jVsPAlPy0zCvCNJkNNZoEPAgcjT21B0EahzPC4bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CtLwSL70; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454Arb7N104586;
	Tue, 4 Jun 2024 05:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717498417;
	bh=d3r0wLtyLKE2OgIyTtkCM29t6IlewSqA7H9LkkdsBPw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CtLwSL70keUHFBB50CFPyV9Xe97veEwA50r8GiS2g8ibyISqDgrThKS9IERvz/5Ui
	 oNoNsbDrjjNuxt91C93nuS6iggmV1MQG9TKtzukpkENILf/5QDLj12f8O5We4iEhes
	 U3p1G4b3SHuZHsbcgt2Na+cG3rH+ltMC0rDpColA=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454ArbZC033176
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 05:53:37 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 05:53:37 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 05:53:37 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454Arado075929;
	Tue, 4 Jun 2024 05:53:36 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
        <dri-devel@lists.freedesktop.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <akpm@linux-foundation.org>,
        <gregkh@linuxfoundation.org>, <andriy.shevchenko@linux.intel.com>,
        <adobriyan@gmail.com>, <jani.nikula@intel.com>
Subject: [PATCH v12 12/13] media: imagination: Round to closest multiple for cropping region
Date: Tue, 4 Jun 2024 16:23:35 +0530
Message-ID: <20240604105335.2257629-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240604104001.2235082-1-devarsht@ti.com>
References: <20240604104001.2235082-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

If neither of the flags to round down (V4L2_SEL_FLAG_LE) or round up
(V4L2_SEL_FLAG_GE) are specified by the user, then round to nearest
multiple of requested value while updating the crop rectangle coordinates.

Use the rounding macro which gives preference to rounding down in case two
nearest values (high and low) are possible to raise the probability of
cropping rectangle falling inside the bound region.

This complies with the VIDIOC_G_SELECTION, VIDIOC_S_SELECTION ioctl
description as documented in v4l uapi [1] which specifies that driver
should choose crop rectangle as close as possible if no flags are passed by
user-space, as quoted below :

"``0`` - The driver can adjust the rectangle size freely and shall choose a
crop/compose rectangle as close as possible to the requested
 one."

Link: https://www.kernel.org/doc/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst [1]
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V12: No change
V11: No change
V10: No change
V9:  No change
V8:  Update commit message with specification reference
V1->V7 (No change, patch introduced in V7)
---
 drivers/media/platform/imagination/e5010-jpeg-enc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index e701d573a26a..d65646f0c38c 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -517,10 +517,10 @@ static int e5010_s_selection(struct file *file, void *fh, struct v4l2_selection
 
 	switch (s->flags) {
 	case 0:
-		s->r.width = round_down(s->r.width, queue->fmt->frmsize.step_width);
-		s->r.height = round_down(s->r.height, queue->fmt->frmsize.step_height);
-		s->r.left = round_down(s->r.left, queue->fmt->frmsize.step_width);
-		s->r.top = round_down(s->r.top, 2);
+		s->r.width = round_closest_down(s->r.width, queue->fmt->frmsize.step_width);
+		s->r.height = round_closest_down(s->r.height, queue->fmt->frmsize.step_height);
+		s->r.left = round_closest_down(s->r.left, queue->fmt->frmsize.step_width);
+		s->r.top = round_closest_down(s->r.top, 2);
 
 		if (s->r.left + s->r.width > queue->width)
 			s->r.width = round_down(s->r.width + s->r.left - queue->width,
-- 
2.39.1


