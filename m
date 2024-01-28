Return-Path: <linux-media+bounces-4286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7CA83F2D7
	for <lists+linux-media@lfdr.de>; Sun, 28 Jan 2024 03:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD0F7283143
	for <lists+linux-media@lfdr.de>; Sun, 28 Jan 2024 02:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8F6C13B;
	Sun, 28 Jan 2024 02:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cv1kF7YQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046D7523A
	for <linux-media@vger.kernel.org>; Sun, 28 Jan 2024 02:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706407947; cv=none; b=Y7NsMoFqv5KrxL6i20XZsoYMhU5A8yc8Wnf+7tsLlQ6QOKl9Ili/pWDAKRGalq+DyXzoSxQUuPbFt2TNkoIyCAReDjNXAQxhA/h0MvVTZeGu+UJOt0fcGeH6j9v904qshS7O42p8PFF9k/a/9RbgCpmJj87sn/7mj2kJmE2tWXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706407947; c=relaxed/simple;
	bh=9FkkM0hWSfNgvycjkBk9G6d+gbIZbwtTlwMJBT/mtG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j1fgJsXNIaDH3TWIvIg7LlPHwUhfpl6fWKJge/pj8BvNjOcwA/mhw99J+VnZHX6mUYxrtWuRgv7Xv1xKmi55PrrpiX8kIxK5SbcDPseXg90g1Aqp/UUubyNkrPj64PH7JhqzPNLNekBqucNF9hmq3iaqe22ZMWnJv1CunITXSs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cv1kF7YQ; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-42a8af3c724so4893251cf.2
        for <linux-media@vger.kernel.org>; Sat, 27 Jan 2024 18:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706407945; x=1707012745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3C7WQBZgNLZ3JFZZb+3FA3visUd8j+r0zGWZyg3Ybg=;
        b=cv1kF7YQM5NyC7/Jeh3KhL1qC/id6nz8hCXK0zJzhm7e1QGAwpIJCYF0dg6PoR0CyK
         sfVoLuXKp+C7E2VFBWxbrVZsg70FX+8gJT9hQP1KicVB9ejLwEZBueXnlyIC1TZNKdn+
         FgkdKDKqXmHzMsWOMz6AvdkjUvT8wugbh+RL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706407945; x=1707012745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3C7WQBZgNLZ3JFZZb+3FA3visUd8j+r0zGWZyg3Ybg=;
        b=EEZStR0ZHmGSnVzTg7oL0VgIF90ZeIGStHUBnQ6S2dzeZIcK8mD1lr3i9QlPymXkBL
         m1mDSWbsonUj1uJnDd2BWFYFBQkNz6POAG7iwjm5CQonwyfnTgOcMHx1Rn3QqT7zITxo
         n/412T+NDB6/DSZsfRiQ7iSF4vyIp/nDMmJkestC1mNkt9OmhXdflyedRblLD8fkkKRQ
         834ofy/6wAcMAACrB+mIfRjIhXw8+V7LQMGMtPNrt6Wq6ielqFtpwjxH/S4AEW2BE9Ee
         onITq07JHi0r5OaBi8/I9fNOwssTl+hy/na92sf32rGmN9e46eD0iX7c4rzqkEWsgCd6
         Pkiw==
X-Gm-Message-State: AOJu0YwBCtvxWvf0UG0s5QXlBu7LBH0ppJ8xArYG97VWLj6iejO7QKgX
	IGX+gdhsJJpGLGzkrVgoIl+7BZf2tvlBYct8UxFnTeOqy8VR4+l0LWefD7BdpA==
X-Google-Smtp-Source: AGHT+IFQh4FaJ+1XI2IdQ76ww3xRTWTulNHZ3WBhfnSPiasZomtas55CswgU5xylWxHtrHsOrzM/jg==
X-Received: by 2002:ac8:4e96:0:b0:42a:87ff:4b0a with SMTP id 22-20020ac84e96000000b0042a87ff4b0amr4978445qtp.99.1706407944870;
        Sat, 27 Jan 2024 18:12:24 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id ka23-20020a05622a441700b0042a98bf0117sm568061qtb.78.2024.01.27.18.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 18:12:24 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 28 Jan 2024 02:12:22 +0000
Subject: [PATCH 3/3] media: mediatek: vcodedc: Fix
 Wcast-function-type-strict warnings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240128-fix-clang-warnings-v1-3-1d946013a421@chromium.org>
References: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
In-Reply-To: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Mike Isely <isely@pobox.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3

Building with LLVM=1 throws the following warning:
drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c:38:32: warning: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsigned int, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned int, void *)') converts to incompatible function type [-Wcast-function-type-strict]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index 9f6e4b59455d..781a0359afdc 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -33,9 +33,11 @@ static int mtk_vcodec_vpu_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
 	 * The handler we receive takes a void * as its first argument. We
 	 * cannot change this because it needs to be passed down to the rproc
 	 * subsystem when SCP is used. VPU takes a const argument, which is
-	 * more constrained, so the conversion below is safe.
+	 * more constrained, so the conversion below is safe. We use the void
+	 * casting, to convince clang with -Wcast-function-type-sctrict that
+	 * this is safe.
 	 */
-	ipi_handler_t handler_const = (ipi_handler_t)handler;
+	ipi_handler_t handler_const = (ipi_handler_t)((void *)handler);
 
 	return vpu_ipi_register(fw->pdev, id, handler_const, name, priv);
 }

-- 
2.43.0.429.g432eaa2c6b-goog


