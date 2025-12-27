Return-Path: <linux-media+bounces-49595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64071CDF92D
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 12:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FE9A3005483
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 11:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E8F31352B;
	Sat, 27 Dec 2025 11:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k75MGki/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AA3248F7C
	for <linux-media@vger.kernel.org>; Sat, 27 Dec 2025 11:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766836324; cv=none; b=TKVDPZeTugMfhr2tXKOrw+M5pGIBIEJkSUYnXa9kZ0gtfET3AjjWZxGFapA4ltn/8uJe62MwDDEQShkf6mMCwBzKYOJMREOu6+zNX+Ekbj1d/Ng15kPsTu9H23uT+wYX7Vds/4GtZJXLKxPlnJGEdxRuW3nGUfsH9/z5iRoXou4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766836324; c=relaxed/simple;
	bh=9Ro0Yy4FOznrUpy9UlA8AQBEagQRfZ38KkYQg3NOGSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qb+uGvi59K8SV9EhUnJ4zXTtXVXa8RF1Xl21TUJ6DwQA0FBjndG1Vc4LffcLgTp5rmR4DjsnnylA7lAFMiv+QQBvbuvArRMJzoSBJCGTaAnxLaZOjSkMPAoFiJxj2SY00dnG3Nzu/HmVJT31GBW0SphoVK+xHFnWY3CVwKnVIig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k75MGki/; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-598f8136a24so8812571e87.3
        for <linux-media@vger.kernel.org>; Sat, 27 Dec 2025 03:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766836321; x=1767441121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJLtG+kSnBxO8u9tWSlN4IpEKdHgADBZMUIyM3jPy1A=;
        b=k75MGki/v4UkyhooCo8aG1+YNyowrQ6oViSn66NWaDc7OqoAjnvN4qXWALWxiVh7w0
         Uawqtxrxkm/ssxzIuynFJql4fqRrDK6f+uSSEc23ZclCtDZ3nBUdyEwK1GonoP106gbz
         iVidNJriAYz/337VMWYRBsAu4a1we+96Oo+RQrM048XnQ/ltHyQ0drI6J9KkonXeASXp
         mZ5/Q/gAdoeclkIqNJ6z4aX0O97GGCl51U1yRz0qS4P6C0AJIi+vo2TBgkWGjrVR7pK+
         YRriGNVS+4YM0xKT38HcL9aaF4Xni31vJFiqrbP7NU6cVpxw40MfEB+sqLFxvSTP7aeI
         AWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766836321; x=1767441121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJLtG+kSnBxO8u9tWSlN4IpEKdHgADBZMUIyM3jPy1A=;
        b=hE+HvmShkgOy+L3JI1Kz2QJWeV4tX/B6nHySiFVzl6qv7gvx8elOBt/8WrV+VYsTwX
         TZK9RHn9HQdLD1HjMpdcPsopP8QQQr9IZdlvyBMq0OIKBSj4uE5VnM3hxbJ4ck5tNjTp
         pI7i7wHkjeZNnzYTzjF5DJETgiYVffbx812L+kZKhOgrmoBxUISxXAliNAmKIivhpRlj
         do/+ZXqSRLeIivTedxA2Ux2O5IB1QuqjA8pjpq9H9ksob43TvmpQsBREs9erQQ1kiH6l
         EsrFm8Gr9km/UPywMeFBWHAlPaXvf9LtUW16v76+ltn+Dlqjy+0Z6xxie4Y3wUrUbqcn
         uqSg==
X-Forwarded-Encrypted: i=1; AJvYcCUP5McSxyvBmQV9Ya2gApxcHlod7Nvm5SkHkt2xUGRc5OJXHQM9iPcH7Ug1VYvUpTc1SRlPraJXnz4J1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwrwiceTa0nVzqgzLobkZjbzLRPGzNfzmRc5u+KTSKJYgvkghX
	6zv+OiQ0b8bOGKun6MbHyaU3Tkt6ze4TbecsOYs97SKivgWauRCac1vw
X-Gm-Gg: AY/fxX6ZdvBW44G/ADXs2nza+8bbtWGi2BMou/r1oWAP5FG7ls+U+nAkrzgxfH+OdvC
	xy0vyl70OHUUIxSplR/yqtW1EZYiVnhXhU7G0hwO/o4rnOYFPCO1wn6edUifZYhjYnBgqsos7Pj
	syEIJllyshvM4lg6TOyLeEiRmQ65QUwqRbJLuq3WUpRBCYWiZ8u8bDnAC/pTt/TxbRvAuSevBQC
	Cc0HV5tgvMrB8gm5ewbirWduJt/UBInRc+U/7Vbcy0bVT9V1z2mIW5Q7wbY+d1K7J78M4JxW2Eo
	xjNMxPAAdewIvlBIn/9e5cljofjjlxxujZTEG/BQ2HQ+ImwiJ2CPBcPsvPZkOWAicvE/kdsdXTp
	p3x3BPtTFpx7OGyljBsyqd+jXqOwHWnrb0JJ6udjyw04rlNrdefkF5leWiC3EwUPOOX1GfXp1bU
	/blz+0R+M1IygSSg9vYDr/XPjz4Qw=
X-Google-Smtp-Source: AGHT+IHNyWALcAMTdxM9LLuSqGEv7zHOvrXmkX/bjPMMH/JHgWLBT/zRZsDTTIWmQlxCRXQndj5nzg==
X-Received: by 2002:a05:6512:32c7:b0:595:9da3:fe6a with SMTP id 2adb3069b0e04-59a17d495f4mr9170706e87.10.1766836320371;
        Sat, 27 Dec 2025 03:52:00 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.121])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5e5csm7406722e87.15.2025.12.27.03.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 03:51:59 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com
Cc: Alper Ak <alperyasinak1@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nayden Kanchev <nayden.kanchev@arm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: mali-c55: Fix possible ERR_PTR dereference in mali_c55_isp_enable_streams()
Date: Sat, 27 Dec 2025 14:51:52 +0300
Message-ID: <20251227115153.60862-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

media_pad_remote_pad_unique() can return ERR_PTR(-ENOTUNIQ) or
ERR_PTR(-ENOLINK) on error situation.

The current code dereferences isp->remote_src without checking
for these error cases, which could lead to invalid memory access.

Add IS_ERR() check before dereferencing the pointer.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
index 497f25fbdd13..ca1f0bde6f13 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
@@ -359,7 +359,11 @@ static int mali_c55_isp_enable_streams(struct v4l2_subdev *sd,
 	 */
 
 	sink_pad = &isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO];
+
 	isp->remote_src = media_pad_remote_pad_unique(sink_pad);
+	if (IS_ERR(isp->remote_src))
+		return PTR_ERR(isp->remote_src);
+
 	src_sd = media_entity_to_v4l2_subdev(isp->remote_src->entity);
 
 	isp->frame_sequence = 0;
-- 
2.43.0


