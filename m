Return-Path: <linux-media+bounces-31180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53797A9ED44
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0659118875F1
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A49425EFB6;
	Mon, 28 Apr 2025 09:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pt/9xNwK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B123211;
	Mon, 28 Apr 2025 09:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745833937; cv=none; b=D9KKQSIRiqXNdhUxlllSEq9lDd0uc9HuVLG+Tm9KmhSN8HsitsvSwkBfJY6Fd8t5zrAMCIRJy53pjF6B34A+6XH8KYbGLfQGFBIfUeRgQdnBdc/4XZNa7J279/APZGiBKdwZaMDwshbvll3TkEaxYAwK7XC11hAungjl4bu9dYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745833937; c=relaxed/simple;
	bh=vPO7FCqTPBnOCQ2w7fDeoAW8wssO18SdE/68cKcOv7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T0SlRKCzRXRzujtLb7JaSPUGm1ANMr8kzxIyPcxhn3AvObJCuZ9g+ubMp3kweTQzJuHr2KzSCyZfPHHUfd6xK8rM+2orTZNwufSuICAIqn7XsiPC5BZOURGW9iwTVAltEay2FQOSYiKoIuCLKByV0V1XOQtzdtbkO8NaHbhPN/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pt/9xNwK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso53244185e9.3;
        Mon, 28 Apr 2025 02:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745833934; x=1746438734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3iYa4MxU6eARu1/VvWGOAcWwlx81rdNPO/NjIIvnc1I=;
        b=Pt/9xNwKun4Ezj6eyF05cve9XHEfzKo0HKKYD9YeCuRoHt/NdQVx9jmGnND6LPyS2O
         UD6BsfIjbPkAPIWH+3VXZ5HK+h5RXW8OIAiNqqHLtkc/It/sDZ5ud6DdAis3qYcAjoWM
         iEE6A/rfVMw5GEsMwDTNbOuAsE7ZT267R10F/07AFlSnbBJS5jGxH/zOQoNZslCebtfh
         48S5EzWbmp0Wp6NFsHsyrPCYfc1A1SN/MwFovmro5fu+udOwDdcHOFzGyyXe+4xnD3mF
         L93G48+H2CFvnibKdELLQclpQVHlUqxfIfiwzjhGLDPL3Sw9YCHrInJlNFtR9oadkmhr
         PiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745833934; x=1746438734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iYa4MxU6eARu1/VvWGOAcWwlx81rdNPO/NjIIvnc1I=;
        b=S040mko3icILkUiJReVTiSq63AFRRbQHKx+12Fh4wEjqK6gb1RZ+tSyyo2tbImscGL
         xnOZlHyn5rqGcNyABSnRs28uTfcgarjYqzy8tzHjehxJhpX7LXgtrrVOb1wTzx5TrvT3
         3n9OpqHhBpdZGqbfcnsxxW7cl/LTM5nKzgYv3axrNS/Z/uqDCTLMPvr2KleZbfYyPRIe
         GZyjAU8PO6iXQauCGwki/HUxlTMloWcxqT26vnUrsH8vuXnbTUKMPsiXwfXXZNBro+zw
         ZXJTT04lLPhoTwTVDOs7HI38b1C2XhLx+W17LWV2YA8eqNX0ohiRGrJ8whHaR6NBwq7x
         hZmw==
X-Forwarded-Encrypted: i=1; AJvYcCUakVlEBTYemxfDDw9AGjw7XsTF0K+249TNmtUUcSrqmUxXEtlWP6IFayOznFjaQ9ud4rnFHl+pHHCcM68fvcduUZ8=@vger.kernel.org, AJvYcCWMhNV9UdOj+9SjZ3r4wQPRlEZOHghhRM8BaJtdvSRDrlZSDuzKjJrjaBXJ3WS4CXlnjfUMAJn7Jv3UuY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfkNGqdtBnq8Clj1CrunazKRHBkBzcr7mcRIfk+BYjqXVgbJ+I
	d5vSiTVBb28cPyMUgsnmD3grGTYamWCBw5BCiRdxYi9Ka0NPpdA9
X-Gm-Gg: ASbGnctAnrGsKL6CK/4ZlWk5NeWdWHKu4AlzOk+dJAhWMW/5pxZFnEnL3YG6aL/yMtQ
	LvEXgJBbQaxI1MsmLaGXDv/fqJc/PRtYCFzQZr9qg6n/pm5aXfwXRdF4RJ6UlyQFD6dY73xafic
	2HHTXC75b4neQzh5dC3GmGhufahY5/PLtGHYnEoRTCUlISHdhfdDEy0AzWSMO3ZGOgzaThpqAQa
	twilZ9DdlRcREgP1dcWqEzNmShm1kky5VX+InUtiWLfiezywxAsa34jk2WMyDDOIE9PhI4KUqSj
	nGJ6MilaRuWZwNgRuhvm1o1cERdcqx/PmKLt/W7kBgZAcQhM0JZaTvn+lSgpwD8BSa2BMLfWTQ=
	=
X-Google-Smtp-Source: AGHT+IHQIE3IbLN9grTmPPTyYeJCMY0+kRbu20H7dv/9Ml0ERyaY34QGpx1q/Q8dd+TjlLPZxxuzgA==
X-Received: by 2002:a05:600c:1911:b0:43d:83a:417d with SMTP id 5b1f17b1804b1-440a65dbddcmr91918865e9.12.1745833933918;
        Mon, 28 Apr 2025 02:52:13 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:593b:8313:b361:2f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca497esm10551270f8f.24.2025.04.28.02.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 02:52:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] media: renesas: rzg2l-cru: Simplify FIFO empty check
Date: Mon, 28 Apr 2025 10:52:08 +0100
Message-ID: <20250428095208.99062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Simplify the `rzg2l_fifo_empty()` helper by removing the redundant
comparison in the return path. Now the function explicitly returns `true`
if the FIFO write and read pointers match, and `false` otherwise, improving
readability without changing behavior.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aAtQThCibZCROETx@stanley.mountain/
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 067c6af14e95..97faefcd6019 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -348,7 +348,7 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
 	if (amnfifopntr_w == amnfifopntr_r_y)
 		return true;
 
-	return amnfifopntr_w == amnfifopntr_r_y;
+	return false;
 }
 
 void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
-- 
2.49.0


