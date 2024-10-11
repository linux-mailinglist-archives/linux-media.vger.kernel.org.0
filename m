Return-Path: <linux-media+bounces-19457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB19F99AA2F
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75558B235E2
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DA31D0BB6;
	Fri, 11 Oct 2024 17:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQY424bT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B466F1D07BB;
	Fri, 11 Oct 2024 17:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667872; cv=none; b=Hs6PgQtKQYR+eP1Eo/ge9rhCotn40gRw8fb7dMKee6vVBFjPBBeA+UacULVHjj2mgdADabERNnhfDDdEoX81pr9uAa2zuG4Z60ylJDlU6Kn1POVR+pQ5A6aBh1icO8IRREqCx4/pAqp47HN6F47kJj5MvdOsPd38oHtjijT8cJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667872; c=relaxed/simple;
	bh=jjKhdL2ZlFvCxK6TQCDrMqBP3ZWyNv7UnbEcwC/zyfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iF0oT3jgLv+NJqXENVZ4k7Dv+iRoPi0eAyy1hKn9wSrBScJCKNGgl98c/VsbBo94gfuzoQZWfXCyIpnPPMQjqcLXvZOYy9q0jK9uM3y1/eZzpBS4jEnq4TTHmHF8ikHpUx7kmg6147A7KsIjzTpziJWDqfIwjBGc+gD+06u07bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQY424bT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-431195c3538so14084385e9.3;
        Fri, 11 Oct 2024 10:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667869; x=1729272669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOA5rh/i3sB2aiZsIVyQZqxDqnBUHZOsMDWgLcJkZqo=;
        b=SQY424bTcM86j6QlrvQCSbY9j6+TNiKBmnS9oOSEdAMQnis+JGSv0aozmPUB8PXE3l
         Qco5ZWpVXcq2TFFrzax+RBJEDBz3o7cfXiacjb5xQISRY0s/3aUTKdIUUuNhacGJkfmY
         rLOadcV+g+916RDsfBrizOUepOiDrCaUxGtgXZRSFDpH2yZSGwuzZkc79xFI5n0qfPnn
         ZNR338gZlOVA8OMxKpTMnQopvOMtCOirWjFpZC2FIgGDDg8sglyCOJHPQ5XHvj+j8tj1
         EOiZVgx2MRXzrkj+TMnbqikda6F6aKt2eY8N81BnKqqcP00HjZ7qSduff/IHtOCDbihS
         3yCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667869; x=1729272669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOA5rh/i3sB2aiZsIVyQZqxDqnBUHZOsMDWgLcJkZqo=;
        b=mfAG1LKDDPSp+ZQYxLoewI1XoPMkl3yjXkchDX9xapQ1FCzBHpEcAGGCDxC9RWCaBb
         mEac5z1xEjxulqjUwVyuyvsesQ4ZNtkH1/BKqJlmPVoT4YkCxwgRTlvlVjNvgoSy5uRL
         /RWIZPuemVVTKClaAEJte4HqR8IGlSt34zEFBANkYV1riMX2LmhyAP8rpR6t6bT9Js2m
         LiQv/bzWp5rtNROMoGkbW+jQSNWuF50Z/fLFMj7HmnT0gyy3X0nbMXfnfZAOArHK2Nbb
         1iPDOMiWATmqTObIQIjf5waIQIGP9HiYEb+8Mlx1Ijiy6r0WgALLjfXfV9aXBGCvomFV
         AZng==
X-Forwarded-Encrypted: i=1; AJvYcCWNc7MjIMpfVuimbdjYf5eaNJvpze7gW80Tzm7+GStLIAmQyf+ftpnTVnw5BUMIkMrVTZ2DEAiSZXJU5oYBI5sGQOA=@vger.kernel.org, AJvYcCX3TTnBHi7n0vmxZw68VtDfgyjAL3eCr1zaQSwNd259WCpqsKW/J10mfgHiRq6RnUav+ZLFzGiOOSikXT0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr/rs4GYNF2USLJAZwH5XXc1zuhmWBP8NTJY4TiI6nEZGRDgKp
	P8X/LZD649ubKYkazj3dwe0+Qysc8DL+y3fo00m+UCvlMoPec7LU
X-Google-Smtp-Source: AGHT+IFGAO6T+onA77JYp1uDBIPc/erkj9W6nZlMCZgpZO1/soFy7ZTiRigXkOUPAYEeAXmGevGkDg==
X-Received: by 2002:a5d:460a:0:b0:37d:34f6:92a with SMTP id ffacd0b85a97d-37d5531b1b1mr1671628f8f.51.1728667868956;
        Fri, 11 Oct 2024 10:31:08 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:08 -0700 (PDT)
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
Subject: [PATCH v5 09/22] media: rzg2l-cru: Remove unused fields from rzg2l_cru_ip_format struct
Date: Fri, 11 Oct 2024 18:30:39 +0100
Message-ID: <20241011173052.1088341-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Simplified the `rzg2l_cru_ip_format` struct by removing the unused
`datatype` and `bpp` fields from the structure in `rzg2l-ip.c`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index aee7d4ba70b0..7b006a0bfaae 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -10,12 +10,10 @@
 
 struct rzg2l_cru_ip_format {
 	u32 code;
-	unsigned int datatype;
-	unsigned int bpp;
 };
 
 static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
-	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, },
 };
 
 static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
-- 
2.43.0


