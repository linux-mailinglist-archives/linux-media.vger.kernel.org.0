Return-Path: <linux-media+bounces-38050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4517B09FF1
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 11:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FC013B096F
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 09:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F1D298CA3;
	Fri, 18 Jul 2025 09:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJkJlA5j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C05E1E98E3;
	Fri, 18 Jul 2025 09:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752831477; cv=none; b=VT3ceDutxgXYGmEBbkcv0ln5ScqfqaCXvUfWxtvMsE9/PHPFf76xhqHgxbmfOkFupNePAb+s881bwW0GpVpr7EZqpP9wJZMabPRjQ/N8zOw4OIEtABXTztdAzp543UEt+r9F387dcNKM7p+RgZGKiF5+s5t5hadX//ZepRPZNTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752831477; c=relaxed/simple;
	bh=ReHjsVXp7ohLyv/lf76DeoY5tQfhSF7bMuX6/3JjT1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q+1PihhJTRR51ljxiHmG5Cw6hOWOuqiSIFKOxQCKlJxTanjR6Zlt+zPvqHG0OIODJX4dM4hEap8Xi2zmBdpreUm3tmcDcQdreVoEM5YVa6l/xOQhfyR2Ex6zPWwHp3ZNdIV39FhFZr9ZWw2ZTYnzPH6ugjjm+rpdBq5rlAzjWoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJkJlA5j; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b26fabda6d9so322818a12.1;
        Fri, 18 Jul 2025 02:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752831475; x=1753436275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EBd4deoSlWWu5r7TOgG4vdhxOZPcQceO0h84RqTHMo=;
        b=hJkJlA5jripXa7Qe74/kPCF0G8vYUx+rQTVdYOkBKMaRSI1nESqCKEgYKcjJQNKVl8
         68FwD2TCO4sQiHdSpSJ3nYdNgflMLs+8bS6IG8qFDrjvYbnOhMkiAn/7rtOROlDuYvTz
         04/GeTjMIeJ9klZdWAgjM0xY0m4gd2/iFUBv6KNBETLCtHq1ACU9zfuS24+qaFHBUd2H
         YZdGE9Fyq8uod3oPyYP1lhPCaHwJU7BK9NRhbLKbr+9lAUssJGzOIreewXWyCKcPbINx
         VriX/Uo7g6h+yVbnQn3PtWzXEbV0ybSZojFZZnWENjaaiit3YN40Px0+WYpVaGd326xh
         Czgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752831475; x=1753436275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EBd4deoSlWWu5r7TOgG4vdhxOZPcQceO0h84RqTHMo=;
        b=NZHKDqZYA0SEF7tmANC0jJKg9IS5RQXpKwKObznQww5OPX+29bjfL+R8c2w7NTvmXM
         95wx6wBtfko8tsAG8t/5nbKwp8E3aeSWJW0txWA0kSXn7o5rBtDHPOfMi02SHVnGzUN+
         OL5vWiJHLRzl//IGqoK/sbvi3AdhVETE7tfDMJcrxaL14mmPZk3TLuOUiCoHFBQTVOdR
         pmqHXsy0ZhmJVy97SCUYcMnx5kIn4whipjOU91TcJxPk7dCa3jgCU9mlWEjHYy2Xj8mW
         9wSbsgy/NbKc4AQ8QudPdWH6RQqj4kansQcYijSEhFmNYLj256XGQJs6tX8V76oSztkL
         grRg==
X-Forwarded-Encrypted: i=1; AJvYcCUddGmutQnKm6K5lneTSXYBskCVS21qFs1RQ2HMLP9FdYzJht8nFdRWW8iyTS589MBPyOixBSgSmpVjvvc=@vger.kernel.org, AJvYcCVAbpTy74OQLCxxP0m2IB7fEe+q+oZze72smmarVT7FYqGZdyGvAHzn1Opkb4Lcqp4SPNhs0Lic5Kild+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4P6aRt6iY8D6bJ1AvUOengoQh8gpqfiI1SENOiSA1fuku+Ard
	QhxMRiydEqqLhWvFM+fcFGavBbaUkEv+KeD7+++RRryRn3Eafvp1c4rX7hilQYaU
X-Gm-Gg: ASbGncvh7Cw+yC4IKtrdPCeif0ztObFIf41IkE9tbRH5SXEtEOi0uecf2L433JK5KXR
	Y0K+gR0Qaw+jFKODEVo3qtrXLRahBzwxkzsVnvxpYCsIj3/13gDorkWS4nNYhPMHaXNbJYUCUL3
	Q2ucoo3ELpLGWSiipr56g9c120ddTqTsdg5TK1MBOrfX01Qq9AIcmigGmraZgldF+OLLY6SIDAz
	ivDX9/fmNJmvKDAN+fTQxRNt6x33SHYEPadSV7xKN6dn1z/QlQ0/drtKxxl3m5o4oAyPGR7w/Ah
	FWJl25+UHJe2q7yllftYzfhHRLP3tMu1J7dS6IEiRGgO4c9CcEsRJRErxCUF6HGfUmIS2RmQImU
	PyRWN8gAdAkwON9qju3Jw07DFdXiX9w==
X-Google-Smtp-Source: AGHT+IGCUC6qtOTPLVD5EFj2fkX/fbe7ZYZSvuYuyD99VU2oBiOtt+o9kheMsFPNhNInYamunyzPbA==
X-Received: by 2002:a05:6a00:300b:b0:736:6ecd:8e39 with SMTP id d2e1a72fcca58-756e80a30abmr6780556b3a.2.1752831475105;
        Fri, 18 Jul 2025 02:37:55 -0700 (PDT)
Received: from rock-5b.. ([111.172.109.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc68ba1sm908771b3a.146.2025.07.18.02.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 02:37:54 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: liujianfeng1994@gmail.com
Cc: detlev.casanova@collabora.com,
	heiko@sntech.de,
	kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com,
	nicolas.frattaroli@collabora.com,
	jonas@kwiboo.se,
	benjamin.gaignard@collabora.com
Subject: Re: [PATCH 00/12] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Fri, 18 Jul 2025 17:37:46 +0800
Message-ID: <20250718093746.631072-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250714144610.258372-1-liujianfeng1994@gmail.com>
References: <20250714144610.258372-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On Mon, 14 Jul 2025 22:46:10 +0800, Jianfeng Liu wrote:
>You are right, the code of chromium should be fixed for frame size type
>V4L2_FRMSIZE_TYPE_CONTINUOUS.

I have just sent a cr at chromium[1] to fix this.

>I have checked that this issue is not introduced by your series. After
>reverting this commit[2] which adds Support High 10 and 4:2:2 profiles,
>chromium can play video well on rk3399. I will investigate further.

I found that this issue is caused by this code block[2]. Before adding
.get_image_fmt, rkvdec_s_ctrl will just return 0. But now when detecting
image format change(usually from RKVDEC_IMG_FMT_ANY to real video format
like RKVDEC_IMG_FMT_420_8BIT), it will return -EBUSY, then I get green
frame at chromium.

After taking a look at hantro's code, I find that it is not necessary to
let .s_ctrl return -EBUSY when format changes, here is a commit[3]
disabling this check in hantro_set_fmt_cap. I have written a patch that
can fix my issue with chromium, you can see it at the bottom of my mail.

[1] https://chromium-review.googlesource.com/c/chromium/src/+/6767118
[2] https://github.com/torvalds/linux/blob/v6.16-rc6/drivers/staging/media/rkvdec/rkvdec.c#L143-L146
[3] https://github.com/torvalds/linux/commit/bbd267daf4fc831f58bf4a2530a8b64881779e6a

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 5d86fb7cdd6..7800d159fad 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -185,7 +185,6 @@ static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
 	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
 	enum rkvdec_image_fmt image_fmt;
-	struct vb2_queue *vq;
 
 	/* Check if this change requires a capture format reset */
 	if (!desc->ops->get_image_fmt)
@@ -193,11 +192,6 @@ static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	image_fmt = desc->ops->get_image_fmt(ctx, ctrl);
 	if (rkvdec_image_fmt_changed(ctx, image_fmt)) {
-		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
-				     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-		if (vb2_is_busy(vq))
-			return -EBUSY;
-
 		ctx->image_fmt = image_fmt;
 		rkvdec_reset_decoded_fmt(ctx);
 	}

