Return-Path: <linux-media+bounces-48714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E50CB92B8
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 16:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 195A03007E5F
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 15:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0A731ED63;
	Fri, 12 Dec 2025 15:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCYuu6u1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B55822AE5D
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765554123; cv=none; b=Iu0XKG74FJixe3sD3Fz0RpLElRMY6BRAvUYas2Cu7WMu5fgY7d+qRQyB90HDmuFzZJmn86GBKzGXCC18mZrtMPG1Deoxddro4172RoYPdzkO+Wiai2zK4vMceHImBurLS44XPWfzLexZ8tD/1fxs4+r885dZkG2Dzwt/hbLrLzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765554123; c=relaxed/simple;
	bh=L3Y/NolXUSFlLrXD0WmZpK7la1QYFLW5jrLJlxqnx74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UDIWmahq9fHMGpn7bfOG3a3yk6ecEk+M6/PXdETSclupzPIvtocPIeIrDlcL3jvHiYnhknnZFYHkuQsErcC+hiDilyoECr7c2SBrl97ZI04JV5DuLzbgdnVSBtfjwG51BuLXLm6xZMdB2CovLlphRQ3LLCqQLH0Kq4hvdkVgUwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCYuu6u1; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-bd2decde440so79385a12.0
        for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 07:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765554121; x=1766158921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zvs0Y9fjkfpuOjqGiS1GxL1BaXlJ2gCK5y9BuiQG+A8=;
        b=KCYuu6u17c/RYiWdnPj9VNVw+KEma/B1un315bsIKKDo1lmKA8J+doMN6gAbjGXGkc
         Uis/gB8hxyz+3ka9GmX9n49LJbmR/HznQLAWzqZ10uCjLpnTsXLNBRzEEKV7xGzKQGzr
         sRMvp8hUrNYmBjfNHRXw6zaHWMXEgQDmvevRAfi39e/s1JAEyE+A0wdGu52h2Vb0R2AN
         ywvwEWpq2btaGYCPWFb7FR+RIzv7koDoAg/rNOOU83LrzPnJz7cSmZ07ZY3yw+jsVX8V
         3H1zvyx2SS1+mtLO3n1baRB/0LyFVHZX7M/h/gv9/xu4PAeTYdvw/FevKDzY92qnWUdQ
         C6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765554121; x=1766158921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zvs0Y9fjkfpuOjqGiS1GxL1BaXlJ2gCK5y9BuiQG+A8=;
        b=TsPLZHLwpvoKsV5iPRvF3E66QUfDfilP5vT7cOiAUrKjuWvdXImD21sImsrOTrDkBw
         UEg7hb8+wBSmnwn2aVXUxDkfLScGOiCZnbKSeTM+20xADgoCiG+YhDheRwVQfEXB31FN
         8d8q3HiS1XiSYVcbNnMPYJie3m30rbWkH4Hh8IgKNBEGEO5hwElDi9XXwngAN1jLzXlo
         eDIcl4SJD3Vv6kM608cHGfmFsYq7smFY2lUYt4ZK5A+GyQ9Mv6CjtWI0AftcZXhUSRtV
         RehVrjfEvtj79rnQ57VMREQhDYDwaIDglKyqVsLEvmYj89oauQQFarvQnkLa1GC3GmVd
         EE/g==
X-Forwarded-Encrypted: i=1; AJvYcCUMlMyG8zQK6oUtUovgbnP0v7xwrzhiIhytnjThWC1h8Tulfp1F+21iWjZk3KHCjPQJ2BqgKEEtXeL47Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJmdjlATif+q7Owm8/iTsbtPsh8wE3692pj2PiR+bH4u0oh9dI
	7rozZofaKuRAKog6fRef+OyIApBmBnPmoFW9lZVB04fYQgPMHAM/CRZo
X-Gm-Gg: AY/fxX5quhXrUgCUDRv1HT/ad12eqkYKhaLoP6cAu9bsw4trifeFy3Q47W1GEna0SUC
	JT4dvesthTtVw4rd5809TXWOWGFYGUeQHTKNgM4ZNnVH8lO7W21aDhmxGqEbgsTC8nW0nUWEKCh
	WhuDQpDsCWUOEPfKCNS00S/Eub9zUArepbD92ujjEnX1EqkwWT+0xGnA8oUHk2zuNJD1tKZZWSv
	dY2pAJP6jbdNz/VdHKg2zrmjIKcQ2lsA4QhPhAVIekWdxlj8fcHXflDEHo/FMwghFnYBWX+LKGH
	i12p94n9mehSHyND16yzB3OIITiFhRxEfYlZaSWJUZAwtJUBysWI3b1GzlEJdkE7yb3E1YVleDy
	kDl+p5wcZzzK5k1tGGtHLW8L1KQ9JWFSLzyO9Sd1avZG/sSTE6i9jtaBHRmi4UhNVndPH4RM2sJ
	3yEVbjqzGxsyJaCSn48s1Cmw==
X-Google-Smtp-Source: AGHT+IGjNBsdS6Z+owU1Z6BbP/qc6a4XyvaU3uhlw6ok1WkouJ/+QBfVTxzeOJSOKmt+ehQ/bAIRmw==
X-Received: by 2002:a05:6a00:234c:b0:7a2:855f:f88b with SMTP id d2e1a72fcca58-7f668dc54a6mr2134871b3a.3.1765554120540;
        Fri, 12 Dec 2025 07:42:00 -0800 (PST)
Received: from rock-5b.. ([45.32.55.39])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c237f357sm5652380b3a.6.2025.12.12.07.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:42:00 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH] media: rkvdec: set ctx->image_fmt in rkvdec_s_capture_fmt
Date: Fri, 12 Dec 2025 23:41:32 +0800
Message-ID: <20251212154138.3042300-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ctx->image_fmt is initialized as RKVDEC_IMG_FMT_ANY at
rkvdec_s_output_fmt, and get set at rkvdec_s_ctrl when userspace sends
SPS info via VIDIOC_S_EXT_CTRLS. This works fine with gstreamer because
it sends SPS info to kernel driver before requesting capture queue bufs.

But chromium requests capture queue bufs first and then sends SPS info
to kernel, then rkvdec_s_ctrl will return -EBUSY, and the video is
displayed green.

Chromium calls VIDIOC_S_FMT to capture queue instead before requesting
capture queue bufs, so setting ctx->image_fmt in rkvdec_s_capture_fmt
will make rkvdec_s_ctrl return 0 when the first SPS info sent to driver.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Fixes: d35c64eccf3b1 ("media: rkvdec: Add get_image_fmt ops")
---

 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 5af9aa5ab353..e7939d604f64 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -537,6 +537,18 @@ static int rkvdec_s_capture_fmt(struct file *file, void *priv,
 		return ret;
 
 	ctx->decoded_fmt = *f;
+
+	u32 fourcc = f->fmt.pix_mp.pixelformat;
+
+	if (fourcc == V4L2_PIX_FMT_NV12)
+		ctx->image_fmt = RKVDEC_IMG_FMT_420_8BIT;
+	else if (fourcc == V4L2_PIX_FMT_NV15)
+		ctx->image_fmt = RKVDEC_IMG_FMT_420_10BIT;
+	else if (fourcc == V4L2_PIX_FMT_NV16)
+		ctx->image_fmt = RKVDEC_IMG_FMT_422_8BIT;
+	else if (fourcc == V4L2_PIX_FMT_NV20)
+		ctx->image_fmt = RKVDEC_IMG_FMT_422_10BIT;
+
 	return 0;
 }
 
-- 
2.43.0


