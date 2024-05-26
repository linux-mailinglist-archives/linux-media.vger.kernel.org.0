Return-Path: <linux-media+bounces-11898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 022848CF543
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2024 20:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72389B20ACF
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2024 18:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B96B12BE93;
	Sun, 26 May 2024 18:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Rq1TPalf"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C648112B14F;
	Sun, 26 May 2024 18:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716747066; cv=none; b=s9iL1HS2CXUn4WS8objCIaYPlGvDn4tqBY6ySQn9DvRRBJ/E5g+aht+XICDbqjjscBC/cLNHImPpQQlCpWO1ZAHZpwlMEe6xc8cjfPoo/Ljp6ur0mXPdbw/TmRyfBo7sz+UgpBiKWWB76bKdZYG+1QvjgUW0GX/8HqWV9vrLmXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716747066; c=relaxed/simple;
	bh=FM4pY47nx/nc68aOoIAprSxY2GKe/egbTDvUuPkal5c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fz3nB3lp7U+lKjEzCXqcVG7qriL3E4QoDIzjUFz6giwmEY+B4daXf+pU78J4xhrnSuT9jVs/5JYp9v4oUevZosCsBhjjxQRQcsv9SX3VV5+NuPNI3pb+qjgdVzs9fcJuy5rjweA9TNcD9BfpPveU7avJSd0JpkVwWL821zhxcNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Rq1TPalf; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44QIAkdT102380;
	Sun, 26 May 2024 13:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716747046;
	bh=qd+KcOEaFQHVVnZb7mqh9WMdlPTc/5gcnwkt9UVyhQo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Rq1TPalf+PhnJfuZShoPaQwJm+e45ovq90rkXJjaoH2cI6QabyqCFKZX5HnAQBR4N
	 gsfGn/Y2XPLloOGEFF2ULk47fHx1PCa2E18909LqI8rPq3VFsqmozM/JO/1IEJWm7N
	 FMvkH1BBwzcsYOHCuVU+912RsKB/yE7UeNhZFazE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44QIAkJa108837
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 26 May 2024 13:10:46 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 26
 May 2024 13:10:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 26 May 2024 13:10:45 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44QIAja0063838;
	Sun, 26 May 2024 13:10:45 -0500
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
Subject: [PATCH v9 09/10] media: imagination: Round to closest multiple for cropping region
Date: Sun, 26 May 2024 23:40:44 +0530
Message-ID: <20240526181044.1129242-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240526175655.1093707-1-devarsht@ti.com>
References: <20240526175655.1093707-1-devarsht@ti.com>
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

[1] :
https://www.kernel.org/doc/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V9: No change
V8: Update commit message with specification reference
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


