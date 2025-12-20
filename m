Return-Path: <linux-media+bounces-49242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E50FCD33DE
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 17:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C15330088F5
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 16:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CB1287510;
	Sat, 20 Dec 2025 16:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBn99ai6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDD923185E
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 16:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766249191; cv=none; b=ODxngtUF9YkCh8h///eh/9wUUhz6xs/DgagO2i1gjzoalYlxIWmOfeB1NYXeRfdAALL9IqGqRxKHQXPf+80q00S3LEUPmSDtMNspwnmT7NQ2pXbl3p9CyV71qf1HU+EcooatNxynwC7WVawSLn3VmHByIDsGpSqzZm9fz1jdwbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766249191; c=relaxed/simple;
	bh=QEkg/gYIMGsgcTI8cfHodqbEwqtmmBSR03OAXL50yrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SBg0dxZW8YdZS7NNDOCKXqb+ykTlcwDqqQTVWgUQ+SlvvNh76A7JaVbEy1yU2ajbMBTdCyid2BRLKKC1+n5KBtnHXP1CQr3cxHRb9SFeNtW0dqAi3WXH6QKj7mL3X+Ru+ZXJRdlfLSFXV94w0hkk16LAlBLW/urMEFZ1K/wP7KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBn99ai6; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b9a2e3c4afcso143612a12.1
        for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 08:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766249190; x=1766853990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7EP/tpx9GWxii+AYAC7WJOYO3DbJ6aXW68IWJvk5iw=;
        b=TBn99ai6ibwitAU8mBf+ovkRIQbbscKC7TObUF9B9B9CbEYFtwgQuSa+H66DPW2Z0G
         FjZEoq1OST/m+eMp1rp4fYGoXB7TtvjbLp+V2lVj+Di7adHS/O4bOwG/mAGYoMynKdiv
         lQzZHX6rxoZk8oBAQHdK3Fi6ojLt/gAooKHiXCqcdq407TPo/LXXGsHlMdJp5KFRgQKM
         YW+GkXhG3qRh6kG5DGSKMOHzB8KN18Dcky/G15WXNQd74QEkXF6EiSNu8Oxn4cSXVd0B
         T8Xk/Tg2yT4sSCwCAr6GJGut8619R2PJEUM8FTdqJ/aOEYqzH3Ksp49/2Wq66LaRC0TY
         kHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766249190; x=1766853990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c7EP/tpx9GWxii+AYAC7WJOYO3DbJ6aXW68IWJvk5iw=;
        b=l0e5W9yUekJu2xj3kAnbh83UZGCX+AsA8ogqrSsyG4G4IoWSxhF9sJj/GVTiRJiGOU
         hiep4IfzRynZ+Jowo84vuk9ebbSUc0K6Jg3zuiOq42UBqEhi0n3mi+HfxKwjC7IBBGzJ
         iyK4kn2dUGT93n5Bs8BCo+CWACiDpvRVYoRhJkewOS+hiPdVkajiTWqZfhkBvnVqSEM5
         K2gMNgXK0uINOKz4D1dIm/ggAEGxF9Dtw+B1PcHKw53DLwgA1kUfhizkZpZRiHiQwQ/Y
         p95TFbfJY+5HGTPULKpG6mF40wem+B55OYsW4swJVpD95KSYrVXICHGRVkwDXnJhasoL
         aBVg==
X-Forwarded-Encrypted: i=1; AJvYcCWbodcZ1GHJiLG8vm8JMZR9XiwncU5V3HIkD8TWzkQsUsxFvziSMXjgo6BKiV3rN1Fg3mzChlmTw+K4fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDcDPpoLjKy2oOX6A7ZFTEnaDq9MYENyH9tQfQWeckYyn0w2an
	EPq5pm3cAJGSjOwY3gloEj4mmcr3ykr7cCZAV6FwIfdkEGXWudnRdJ0g
X-Gm-Gg: AY/fxX7V2JtmdSE5L0onRQ+1rEt/x49Fyddd2ujYy7mwbrScavFNvh5poM3+LV+TA9j
	SA3pyGf73L7gKkaRCyNLBYiXSQ0kMe5bn1v/5dWEn+8C6s57ibk5UyYf6UwiC2xFKvL61eek0l+
	mSKm8/NJ0r0pmqCVE68onWniXsNHofLvGvU1BbCO9XEXzpTGMTxonSELXlmHhzmtu3uGmIu48fJ
	HjkOwsL5ML5B6oR8MOggWAawNbg/+ZSNvR9JDIIYet0I9NMv6KKZLWrhkbzu5b63SFdIoClCZJ4
	JiN79C0pGq606exieGDoXsNV+arOjzWH5ihhwgcH2Q2UG9YKmoNhgdTuhQ5sECIO9qpZmD10nk6
	ueSzt2myTTFec1ueYa8AYjaAQp+uGHj4kzQg22Mdtr4w3zoOAxPVBzMCkz/nvHlSgxPCte6JdUn
	aXCSHmAKX3AJ4=
X-Google-Smtp-Source: AGHT+IGdbB/Ckh95eIe2oO+uZBQ1VnyCdlca/UmZcXPpvQIRCA3Pnsjbf93FSIDDgBGYnoV1NiUdeg==
X-Received: by 2002:a05:6a00:a89:b0:776:19f6:5d3d with SMTP id d2e1a72fcca58-7ff6430c36bmr4406942b3a.2.1766249189699;
        Sat, 20 Dec 2025 08:46:29 -0800 (PST)
Received: from rock-5b.. ([45.32.55.39])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfab841sm5623899b3a.35.2025.12.20.08.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 08:46:29 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: detlev.casanova@collabora.com
Cc: corbet@lwn.net,
	daniel.almeida@collabora.com,
	didi.debian@cknow.org,
	ezequiel@vanguardiasur.com.ar,
	hansg@kernel.org,
	heiko@sntech.de,
	hverkuil@kernel.org,
	james.cowgill@blaize.com,
	jonas@kwiboo.se,
	kernel@collabora.com,
	laurent.pinchart@ideasonboard.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com,
	opensource206@gmail.com,
	ribalda@chromium.org,
	sakari.ailus@linux.intel.com,
	yunkec@google.com
Subject: Re: [PATCH v7 14/17] media: rkvdec: Add H264 support for the VDPU381 variant
Date: Sun, 21 Dec 2025 00:46:04 +0800
Message-ID: <20251220164604.10052-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218232829.337811-15-detlev.casanova@collabora.com>
References: <20251218232829.337811-15-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On Thu, 18 Dec 2025 18:28:24 -0500, Detlev Casanova wrote:
>+static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
>+{
>+	struct rkvdec_dev *rkvdec = ctx->dev;
>+	struct rkvdec_h264_priv_tbl *priv_tbl;
>+	struct rkvdec_h264_ctx *h264_ctx;
>+	struct v4l2_ctrl *ctrl;
>+	int ret;
>+
>+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
>+			      V4L2_CID_STATELESS_H264_SPS);
>+	if (!ctrl)
>+		return -EINVAL;
>+
>+	h264_ctx = kzalloc(sizeof(*h264_ctx), GFP_KERNEL);
>+	if (!h264_ctx)
>+		return -ENOMEM;

I can see the sps validation is removed:

	ret = rkvdec_h264_validate_sps(ctx, ctrl->p_new.p_h264_sps);
	if (ret)
		return ret;

This should fix decoding issue with chromium when minimum size of h264
decoder is lower than 32. While I find this issue is caused by chromium
not following v4l2 stateless spec, and I think checking sps at start
should be still necessary.

I have sent a fix to chromium[1] and it should get merged later.

[1] https://chromium-review.googlesource.com/c/chromium/src/+/7274555

Best regards,
Jianfeng

