Return-Path: <linux-media+bounces-19871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF4A9A3FEB
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EDA61C23F3C
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70288202F8F;
	Fri, 18 Oct 2024 13:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FK53hbX1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC882022FD;
	Fri, 18 Oct 2024 13:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258510; cv=none; b=ktjtaBQEDucnzEPPq1ANGcxgu6ANtDvKqUfNjSvPe2ztuTpmHAvjOtkmSZqixpM7qtmy+rOWlqJsxX0zvbVmX4xyw+QZNaWB18Lc4MnE2KJBJHx8ZhBKhcFRtA8lAA9/zmlWQ5ffGSpJfDPIBIdzX3iCyauG5sjwQzeH72DXDB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258510; c=relaxed/simple;
	bh=WaMT2+l3tGajGSAOHnITmChvR6gY6YGJIR7Q4psEVfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nkls+V+ZgYy03sDp59J8u15dZNTukVKo2cupg6QdVq+HUKPXvFU3TjiVCFWuOm9V5rLYwXLDn+yxm9tuwen4xKkUp3iA4N+szybv55Mwh2bseCeX6jmMWCBc3DiH6GxTyzy8i+S8dSdo96OfqCqw01H40MbHlHIVcWzvicK0uPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FK53hbX1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43152b79d25so20257555e9.1;
        Fri, 18 Oct 2024 06:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258507; x=1729863307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnwZfFFsmDCuxXuxjDHgIuMhjacz42UF8i31XPe25zk=;
        b=FK53hbX1C2DKbBOOZTPrqHSna/RYXg0ifYz0ssXlDXenFAWjxvIt55Cb9vq8AKWWG/
         j43qFJyVju5GU0FPuS+JrjIFJW9dJnLXfXfK9+Ql7PZf+qThQ0Du10do4DyDnZV0jQ57
         14HsCk6K00AHHBy2vB3XiipRWg0vNw+vFoyb4HkGW9fY6yXjx2dHQKgBGEeoEB3E2/ar
         DAa4WNrvzMP75n/P244rk1OuS1+yDss+jGIPhcRR90ugz73bga/FQziF25kPZBimBuY6
         fcUg2KGqEHzDvv1agDN6GwC77HcL8R80vAZsoAPqhuK+YGAdl3xOL544S97afVab+jbG
         lDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258507; x=1729863307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnwZfFFsmDCuxXuxjDHgIuMhjacz42UF8i31XPe25zk=;
        b=CP+p5AYrnObjNhbHsaHXVH26byj0MIssFV976+cmSf1dsf6G8nekG2rx33LAFPQ7lo
         liATr3G008Dq38tnsH6nSdBQZXLV8ICIahR/2tph+KP1EQEKRnIiWElnGx1QhAT3QQHH
         LYCFRICnGxZTHCw5ZXCFSTSo4Y3/616EjcjEu9VxupFZBABr/NG8M40tg03C9Ogvtluf
         P3U/ToWLAFI3B/RpdHw9Oj48kPl71IevACCk+KAovDk+neQxzeGI1hYT1ftVVbcQ5DwL
         7UkfmELglEeKV2m8k40htaZxGx3E8tWSKga7S+Fvi7470Sfq6usc1H9EI/Wc2zxji0rF
         9SQg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ9165/3SQduaR2f6dikXkriM8VD7vu4SsVydcImGBaS/lfVGOf9zSYHxEb/ogQESVqd4MgbgIHS+CAxA=@vger.kernel.org, AJvYcCXgp9ToomsblB/e67RRAFYDoWu9BMZnLQiFAib5kCPqTGjbqGblIcybvT9VL0o9tmfGWQWtEWR+GvxhTEdabNtNy8o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ZFONiL0l5gaIAPpmHYDNQFYH6Z4ug/bDvOCMDksvJJgocdLZ
	uq4fjLC7KPUPbIwvdBb284yl5ZmRslLAZVnsiHleQ2pPMf69Ds01+nhp5g==
X-Google-Smtp-Source: AGHT+IE7oXFB+1tY7zn/jzHxbE0oMKKILJsBRqLZfhhvSB5/MqsJ2j5hQxjuKY2BGIb/MJ4H702lew==
X-Received: by 2002:adf:fbc5:0:b0:374:babf:ac4f with SMTP id ffacd0b85a97d-37ea2151b96mr1780467f8f.12.1729258507051;
        Fri, 18 Oct 2024 06:35:07 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:06 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 10/23] media: rzg2l-cru: Remove unnecessary WARN_ON check in format func
Date: Fri, 18 Oct 2024 14:34:33 +0100
Message-ID: <20241018133446.223516-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

`WARN_ON(!fmt)` check in `rzg2l_cru_format_bytesperline()` is unnecessary
because the `rzg2l_cru_format_align()` function ensures that a valid
`pixelformat` is set before calling `rzg2l_cru_format_bytesperline()`. As
a result, `rzg2l_cru_format_from_pixel()` is guaranteed to return a
non-NULL value, making the check redundant.

Additionally, the return type of `rzg2l_cru_format_bytesperline()` is
`u32`, but the code returned `-EINVAL`, a negative value. This mismatch is
now resolved by removing the invalid error return path.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index de88c0fab961..401ef7be58ec 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -835,9 +835,6 @@ static u32 rzg2l_cru_format_bytesperline(struct v4l2_pix_format *pix)
 
 	fmt = rzg2l_cru_format_from_pixel(pix->pixelformat);
 
-	if (WARN_ON(!fmt))
-		return -EINVAL;
-
 	return pix->width * fmt->bpp[0];
 }
 
-- 
2.43.0


