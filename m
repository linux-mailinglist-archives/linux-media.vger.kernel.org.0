Return-Path: <linux-media+bounces-43996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A05A1BC631A
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4C04434EB6F
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33CE42C0F63;
	Wed,  8 Oct 2025 17:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Se1/aJq1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243E42C11C3;
	Wed,  8 Oct 2025 17:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945889; cv=none; b=NgS3K8+NMuX37ZGRfMYTNjQVla9DooZk1ZlpAZ+tJGJ/sxfwoWpGEHLqCHpF2Tj4eAIEJudQ2+5ffLf7UA4d3R82Xv/79TY4jIIWt/Az2Bz5kPQ4UDmt7syr7WjfpeB9RZ3m9gIpW1DshZ/JfPOu6xIoe35A1i46J46cJDtBI6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945889; c=relaxed/simple;
	bh=s2Grav4i4QRe9yPLqanavbTqVg5h/engnQUxVUqojKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h9junGnhJEKz4tC9Gl3IJhRo5OpbEh0+Wj3QkwGNdlC8SYhAcDVuaZsht214JU0eVbjMQ2XhJortLswJxBZoREsiLmmItd1ypurFGRUvf+44N9lDmaIEIt5nGwG5jTUL5HEH/4NPFvGFpF9bgu4AkyWi0UiZhNHzqikxFeQqYgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Se1/aJq1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EE82C191B;
	Wed,  8 Oct 2025 19:49:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945791;
	bh=s2Grav4i4QRe9yPLqanavbTqVg5h/engnQUxVUqojKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Se1/aJq1yBgvMO8VYR+H2cv0c3gbYjD2kzgd7CAx1JpLVmsRBC7/S9U3TV6eMF8RH
	 M/wOO6msdWtNM6EaLJ3NTMEpdi3S/8Bk7qXxMPL36OA2LkyZKXPJNb7XCAwQ9dY7G/
	 Fj2RJQn8uqfB0bgYNiYulIVblWtfGhbulaDup9BE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Subject: [PATCH 15/25] media: qcom: iris: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:42 +0300
Message-ID: <20251008175052.19925-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_m2m_get_vq() function never returns NULL. The check may have
been intended to catch invalid format types, but that's not needed as
the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
the format type, so the type can't be incorrect. Drop the unneeded
return value check.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index d670b51c5839..1e9ffdbb6e18 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -191,8 +191,6 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 	u32 codec_align;
 
 	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
-	if (!q)
-		return -EINVAL;
 
 	if (vb2_is_busy(q))
 		return -EBUSY;
-- 
Regards,

Laurent Pinchart


