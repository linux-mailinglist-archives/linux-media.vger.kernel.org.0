Return-Path: <linux-media+bounces-19866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B522A9A3FDA
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57795289AAB
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DED17C9E9;
	Fri, 18 Oct 2024 13:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9Jlmd+0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0567C1FF5ED;
	Fri, 18 Oct 2024 13:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258505; cv=none; b=dnE8Okh+ZwBxG4rKUPhZtJBMdvPlBnZN2EMFJ+XP4xRl1EiAPksewBYYdAMB0T9hZ4AbRBcIhRtB/46U444zlSCHz9QhBl4GzaJVTx7nmViMGTd43QkekmbcUKqzD4ys2sU7sIYv4DaLhimsi6MZCENA586ABCd8SaTYvHCsnvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258505; c=relaxed/simple;
	bh=fpUR1+qxDG2szYJO5YIaz2ZcwUG5msJngpgrZ86kV2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dKLnDprF75BeW9zyjGWJd15ezpSWoKDQiafhyi6zc3SehgGvycUxHvrNicmtnWzZ3nznOFlnlcyIe1jOQOpqo5YlxaQqZJcGkvvFgJC8zLS0LC3AqP0jFPLtneFj6lH/lNceHpi+2VUeo8aQIBXAVkR4NSzlnWNjTW9hgR/UzaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9Jlmd+0; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d4821e6b4so1328327f8f.3;
        Fri, 18 Oct 2024 06:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258501; x=1729863301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fnKsxu/i1g3u97zLV6i+rixu2RvWCgAvgDPPXQlvvI=;
        b=N9Jlmd+0zrCUjy19KAe3xFukzOEbL2zkxnqN06QG685/wBewMasQjOkdW37RnVh/5y
         LIKXwDNQG3UN8B5/NIUCpr1bImnBjolK031csVK2kOQGou6VMjNGlse7PdK/gJAYFs9B
         QmcmHZmFg9Xwf7k0YpXS6hNDKqP+1oDyJMCcA8dPE66a4Jg2gnTczm8bfZZSyAQVnoNK
         8vHFnuj9GgpE7S0CME+FjEi87TBum3gREPq9CbvbQ/4BfqRumjoOGKfMnM39BNvoNrzw
         /sWxbSGv/zFqLcs6wddD54W1/d0LPLbZi4N0ZDNkTlK4IXNQmMcKh/j6eX0Im2U1mIzq
         SIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258501; x=1729863301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fnKsxu/i1g3u97zLV6i+rixu2RvWCgAvgDPPXQlvvI=;
        b=qnMU0L8GBpifTuM+Tl0yt+ZzN+z/G4aZz0hG+k7eJPak/hQJeAAup2DZnEqipavdj/
         XfZkP2YOoyORCzB6zbf/Gr5UDgLfv9WM/0lsL3r0MBLkutSgaMguLm0mkIpBKPPEx6dA
         2KQu/U+CjoX9yKmnqOlxGlUnwC3QjMbzqen2f3lquZRmAH3dqaReKvsEzhAikLI7zyWE
         Uw1aaNgxxHrq3W1pvn/pV3QpaxUU5coCf2CaAwTvv6f/IePTLyfBUb9iAPgPws9UXf3G
         ucptRubihb0tBVO0nXdwB1lsKxqWCbJ5ezv6uOEZUhdoy4ANWuNxe4CpUSzdxgiHzEJT
         buTw==
X-Forwarded-Encrypted: i=1; AJvYcCUFdyo1kblJTmYcRME/x9QXcion6zzfmoTqg1WpqkuFJ9EIbbw4A0s82+HFDVlEohjkyJ31XEROrYoUDb9ZCJyb3FE=@vger.kernel.org, AJvYcCWEihKnpSJv6BXtW6XCvCjxAbsKGzOC4PJ+MuLIvCf1meGecb5UKqWu74JQqdhxp4GE3ALnfX6TsA4v0QE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuyjh/116AdpO1d7E3M2Vvvwd8wOthQ1K+F4UdVUc6JMLMLM+N
	FBrU7+PXWuC9EGuXsZzGMekkmgmXVLuC32iFBOnR9qCA4ddCs1OK
X-Google-Smtp-Source: AGHT+IFwBQKHB4F9egtSahGfU5PwpGVo/0Fn2JHbC8ZrHS2AzSzBU/BJTwId8Dnkmyx/V55VRbvpXA==
X-Received: by 2002:a5d:4d03:0:b0:37d:476d:2d58 with SMTP id ffacd0b85a97d-37eb47693bamr1710364f8f.45.1729258500312;
        Fri, 18 Oct 2024 06:35:00 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:34:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v6 05/23] media: rzg2l-cru: csi2: Implement .get_frame_desc()
Date: Fri, 18 Oct 2024 14:34:28 +0100
Message-ID: <20241018133446.223516-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G2L CRU requires information about which VCx to process data from,
among the four available VCs. To obtain this information, the
.get_frame_desc() routine is implemented. This routine, in turn, calls
.get_frame_desc() on the remote sensor connected to the CSI2 bridge.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 5d1050e685c6..dee8c1a749c7 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -582,6 +582,25 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				     struct v4l2_mbus_frame_desc *fd)
+{
+	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
+	struct media_pad *remote_pad;
+
+	if (!csi2->remote_source)
+		return -ENODEV;
+
+	remote_pad = media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]);
+	if (IS_ERR(remote_pad)) {
+		dev_err(csi2->dev, "can't get source pad of %s (%ld)\n",
+			csi2->remote_source->name, PTR_ERR(remote_pad));
+		return PTR_ERR(remote_pad);
+	}
+	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
+				remote_pad->index, fd);
+}
+
 static const struct v4l2_subdev_video_ops rzg2l_csi2_video_ops = {
 	.s_stream = rzg2l_csi2_s_stream,
 	.pre_streamon = rzg2l_csi2_pre_streamon,
@@ -593,6 +612,7 @@ static const struct v4l2_subdev_pad_ops rzg2l_csi2_pad_ops = {
 	.enum_frame_size = rzg2l_csi2_enum_frame_size,
 	.set_fmt = rzg2l_csi2_set_format,
 	.get_fmt = v4l2_subdev_get_fmt,
+	.get_frame_desc = rzg2l_csi2_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops rzg2l_csi2_subdev_ops = {
-- 
2.43.0


