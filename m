Return-Path: <linux-media+bounces-33915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 811D1ACAE96
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F5387ACE30
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA05222580;
	Mon,  2 Jun 2025 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i1FTJ476"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9B62222BB
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 13:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869598; cv=none; b=TjDjo0s8FsLDqXlGnomed9hngijyHwLiyi0PNs5AIZKLXSAvDU6BoycoL7O4nFbUcoLH85z5uz+dLUkEExB+AqKWWSWCk97QWZ3WvMqzRu+jqXuGt+7/XM6iX8F6nH1gr2ZA58G+7dTpWZcqqRCz1J9NnXI2DBL3gVJuObbYhQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869598; c=relaxed/simple;
	bh=f8DLJRlfWk3JbMbPVn9HOqED6ZsFtjWYBvOs/iqXSX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N7FEJ61yEirSta0pQRvmB9+6oAaHSAa7pMscNFeJRCJIZG+kHIZaykT6Yu+uhY9qq04eOigWsofqnHldhbpfITUFErAc7jC5SMg+4nT3/2gnqzg8UjZ0nXmPWpO/5GhF5m9AEgJfidDp6JQa7O2aPJvCqmUBjnv9sZwhGeqjSYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i1FTJ476; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553246e975fso5276130e87.0
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 06:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869595; x=1749474395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qCzJrisjpk+CFUwffyPuVe/ToQ4yyR1pmcjuE70Cqq8=;
        b=i1FTJ476yX5TTQAHlbB/36hu+yKAl/An+K2kVCKDuMle4k2YCMAkLQAqYrEm9fQFYz
         c28qsbQyhIR+UQBKKiPtAk059gXF3fgSZldL2v05b0DGL5uKZ6xV8DkAfo0Dk2+bwqEg
         JjjLUJi3CSOcty1Kduuv0gMkjpB97NiXBK4/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869595; x=1749474395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCzJrisjpk+CFUwffyPuVe/ToQ4yyR1pmcjuE70Cqq8=;
        b=B8VdixyuK+qu+MYFnm7lyFtaJrtUoqaQ7fGi1hazZ8jS2z7XGrJ4MseXHyaNlPhTu4
         uDYDdHMJzC12f5phj/WZLsEdvHfA/ukRgW9Pk6FwhY02sqyPQMLYzmvXpvJ+iYHGEjTC
         0gA0IWj9QYW/EqQZCXQcHS7ZZpQ6nrmuwjyebe2AR/IVoHjDrVhFOfpWmp5F3hKCN/++
         fPAwrAtdpUBSOQR1BPpngi1QMPIPwtB5y5aBCBQDRYJ2QDPOB+PdfxFSAFJTHmZ82vYa
         B0DyDNw6u24ARq/qRHIlb/Ggrej+fg9pln41SBTKUDtU05mDDIDUHBiEZPRknmiQkC/M
         Rv1A==
X-Gm-Message-State: AOJu0YxIuZfKqMTS3KcBWW4gkrcK5kWxfpfFKUiZalsCMsUDgb82vilK
	iF+6j2A1NEi0Zas1bT2e2hrYD2TV7maLXOP6DUABrxVlnDUBMhnyqyhChYgrBzw85A==
X-Gm-Gg: ASbGnctRYjZ6spUVw4iC4C0UJuVjkTVJGCchQl1S5SmvYEPYM4zuZ5ZZMe/Cs65oBi9
	WIoKJS6AnIEb/gq7j3vNcJkHZSZH0Rxw4gDXU/PmUcrTpHfpuvV2or6VwdFd/5TymeeVcFcvtNT
	v2bmJtysbJ1IMciKKeS1iHgOWjFZk9Eom2x4WfdNSMyo3lMg4Z7pQZe/hqZH59tHYUpFrC/VfJ+
	ltsvWz2cw6VcRBYK1RD+Pe4hptJu/Ci5lxC6/SgoYmyAQkjkbO+RTRW143dRQihZMOeYifcgSlE
	5zVwQXMZKkilIeTdfyiTS8OJrAv1umeIG0fkwurXc1tVEHZWULy62paoXyj5dfae0j8KVCnRhhX
	P8B0XyupQwBNFKHftEpPrsjCd64nyuCUfQvy5
X-Google-Smtp-Source: AGHT+IH0NosGo5ALPzrWCPZ3VJBx3Lh/ZXu9d1HFFdcNMNRnaVj/eitBGu6FAAYNgPu1yP6pmJLffA==
X-Received: by 2002:a05:6512:68f:b0:553:2882:d78a with SMTP id 2adb3069b0e04-5533d13e791mr3173981e87.1.1748869595433;
        Mon, 02 Jun 2025 06:06:35 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d26esm1590160e87.41.2025.06.02.06.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:06:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 13:06:20 +0000
Subject: [PATCH v2 8/9] media: core: export v4l2_compat_translate_cmd()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-grannular-invert-v2-8-c871934ad880@chromium.org>
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

v4l2_compat_translate_cmd() can be useful for drivers to convert between
the VIDIOC_*32 and VIDIOC_ defines.

The VIDIOC_*32 defines are not accessible by the drivers, they live in
v4l2-compat-ioctl32.c.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 8c07400bd280dea5d2e66e2759658c423bcd3866..ced4892b42597d605887b7c6a14373e3922f7bc6 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -929,6 +929,7 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 	}
 	return cmd;
 }
+EXPORT_SYMBOL_GPL(v4l2_compat_translate_cmd);
 
 int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
 {

-- 
2.49.0.1266.g31b7d2e469-goog


