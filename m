Return-Path: <linux-media+bounces-49564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB93CDE273
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 00:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C75973008E8D
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 23:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7884B2BEC20;
	Thu, 25 Dec 2025 23:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="lkZd5uXi"
X-Original-To: linux-media@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD60D1B4224
	for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 23:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766704336; cv=none; b=V9gAo1JHFO7Pcf9Y90X4Bhknkn9YVleRyxOwuUlVoX5M62xPpIOf3dYbFlexYYI61cRNjaGEEESuqVnp1SxslIfbnw2CABXqFwwaKn9TKCEZgKxczS86gVIEZXr16cN10qaqhtitONzc940woR6knbIpWC3Klof9EWE2I5E/53M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766704336; c=relaxed/simple;
	bh=OW+tKFQA4QHklyUUnfA8iHsuCzex8pHOxLOM2jmUq/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F3YRXxGEieFZ6CgI0wi3ZM5BzSisQwajui1QqcrLi8awZsGmmLmhLk7r6nkgBrbD+cmQGnXrUD6h2VsOvwX4Sue2R6/kVV77pKkSatx7XUGA2oda+VBd3xc4hlPFoPK7ocAGo7W7zQWnDkwb4ekZAOlaJJb0habqwldrokeGN1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=lkZd5uXi; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1766704329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4m18gDHR/bq9+dI3LebquLZAX4M3bH6VRTOXvEW7BPs=;
	b=lkZd5uXibstuiFIcCwnY27uJYQf1dw3hiVBYPeyuXmHiKzrv+97jAxOTdx2YnuMZbvmoxa
	ukJ7qj6ytiWhmDbnbsusniG8imZfHokwTPau5iy5bAuXz5QewR8giPvQx9d1NMwKblrNC5
	rHbqB/8gWID/MznWh1GZDZ+8RSR+PXe9xlm3KTbm4fg6qrlbNVXtWYd+P3NplDQ4Ke7H0w
	27XXWIHiALKciHrCDTHor+/5pHOUWpvbf74+asWgLHzo4v+gpEduCwpr4c00seGNJN1+qW
	rOw8jK/h/nftSseOyLjObW9w1Qip+94P7bbtCyTVDlKtY3kIz34KNuWMIDnCug==
From: Val Packett <val@packett.cool>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Vedang Nagar <quic_vnagar@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: Val Packett <val@packett.cool>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: iris: use fallback size when S_FMT is called without width/height
Date: Thu, 25 Dec 2025 20:09:10 -0300
Message-ID: <20251225231127.8642-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

According to 4.5.1.5 of the M2M stateful decoder UAPI documentation,
providing the width and the height to S_FMT is "required only if it
cannot be parsed from the stream", otherwise they can be left as 0
and the S_FMT implementation is expected to return a valid placeholder
resolution that would let REQBUFS succeed.

iris was missing the fallback, so clients like rpi-ffmpeg wouldn't work.
Fix by adding an explicit fallback to defaults.

Fixes: b530b95de22c ("media: iris: implement s_fmt, g_fmt and try_fmt ioctls")
Link: https://github.com/jc-kynesim/rpi-ffmpeg/issues/103
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
v2:
  - Added small comment as requested
  - Pulled an R-b (that depended on the comment)
  - Slightly reworded commit message
v1: https://lore.kernel.org/all/20251012235330.20897-1-val@packett.cool/

 drivers/media/platform/qcom/iris/iris_vdec.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 69ffe52590d3..227e4e5a326f 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -231,6 +231,14 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 	if (vb2_is_busy(q))
 		return -EBUSY;
 
+	/* Width and height are optional, so fall back to a valid placeholder
+	 * resolution until the real one is decoded from the bitstream.
+	 */
+	if (f->fmt.pix_mp.width == 0 && f->fmt.pix_mp.height == 0) {
+		f->fmt.pix_mp.width = DEFAULT_WIDTH;
+		f->fmt.pix_mp.height = DEFAULT_HEIGHT;
+	}
+
 	iris_vdec_try_fmt(inst, f);
 
 	switch (f->type) {
-- 
2.51.2


