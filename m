Return-Path: <linux-media+bounces-19458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3F399AA32
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA6B128902A
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6FB1D0DEC;
	Fri, 11 Oct 2024 17:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVhZrv92"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1925A1D0B84;
	Fri, 11 Oct 2024 17:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667873; cv=none; b=j8yqzWcPty4D/KeCuJcMz8aqjcJDvbWnvweUk4dt8g/3j1PuBDsLdgt9iVlkahFU83Ka2Zi1MYT/Be985lk/Kd4ip8y5OsBwOk/QV3j5L8XDGH7J64EiVB1D7NCAdCXYjD8zfWdS0AC+xvFzzKYBlURBwU0aG0rGIXYeX5pA0Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667873; c=relaxed/simple;
	bh=EMEEGpz28ITh17bAsiQ44rC98irfH/K4wsPSJIRGzv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uHN4FJVPJ7tNvG61upp7zGxo866ZGazQFHZpCrRBebm5EPg5pHRA/9gtoATf9wuvqK2blbNyiQRqt0jOl799uQq+kPdKVl5SIsdbwHx69TkDddzYf2ra3CwMLdojAPllGS6gF+pKM2nI1EqXsGBaGhBCMAlL+j9XLuPHX51xfMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVhZrv92; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d4612da0fso1777913f8f.0;
        Fri, 11 Oct 2024 10:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667870; x=1729272670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxsnjdbvuiczwQuJWOsZrOkz65HLp7uxonqOMxE2zD4=;
        b=hVhZrv92XT1It7x3BbZaqK2U3Iljtj5bjs2evICp//17pBbkXLo8s3hKlIAtMl6F/P
         vTgVRczV5dPlwGdQBePqlzONcTIdO9bGtpTinkNUF9cJoUUV0ufCUqs8BI3QorWyAmKr
         Izb/WYJ/UMvcwOm9Co8de8flIF6dNcNdhdvTUseZjDIFJQqEweC7BSsClnm9XyRRhnad
         Oh+EMYQdLDwlDURZWobkeMpjFcZKxKxe+9RE2MswkqOkOIgG+vGXU3EZ+ddBRv3xJ8vr
         Q9Z62e4zgDZ5lyEHOxhwiqBNzDjyxUjqk+nwXpbWP1xmiPx4LgeqQg8CicGr9a5UbEuU
         lOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667870; x=1729272670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxsnjdbvuiczwQuJWOsZrOkz65HLp7uxonqOMxE2zD4=;
        b=tma3tcN7aPghr6uENtDgmjj9JL94XCFOZ1/r6wbT35EoyyZHeP8rxLkmHfpRtDYNoK
         m/XilfrKsw8h4wnpVCqxPxmUQFWmyyZ/fGPXNIBIlRgMCEjtGPfRBhmnpCjLh9P+nViK
         jzXifK3XtrnDE0djquboG3tsWfEJkgOv904+GWLYnEu9TNNS7J9mA9cxFtGJZSQnNNfZ
         /p4Q9Fl8KI6XuEbjW2NOnhPNMKKledWVrF1C8NIevJl3tzRuvOAtYCLoBTUFac2SBRSv
         NfE+Bn2IgAO9f8UXjlIkedJ/TaP3HR/9HaSurn9chnTO6x7thLq7QCd+Sn1BRsxwUHAP
         aY4w==
X-Forwarded-Encrypted: i=1; AJvYcCW/OmupsV3a/WHrbYKb0ZF7zK9dD1DYZdBuv5DVqCvbvDd9P/VLKmpshaBCfXBlFdwoPlsODgYye00UWys=@vger.kernel.org, AJvYcCXkJbE4RECHEthtEi1f8N472WBcdc+p4MTCOUiaSWMquGxzJ6VHsIJPZb7V9C9Cwu1izUr8E/UYCzjmDO2Lv0IEs8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwATUB2RhUoyCXxeYgAjLBKeqR7TgOTyzzBw26JBFIeO6ocEBe+
	tK317DK3SHTxhVb2jU5JaIZprowhXyLkGtdOOyaTcYeGtSYE5KNtx7AYOw==
X-Google-Smtp-Source: AGHT+IHRMzRhZXll7XaFFlaPTBjI7sVrtZlHzrVWQgMdan5CpLNnxFRcRVRDOTKqjIWR3QwLgw+UCg==
X-Received: by 2002:a5d:5350:0:b0:37d:2e74:2eea with SMTP id ffacd0b85a97d-37d5519cbd3mr2685157f8f.5.1728667870194;
        Fri, 11 Oct 2024 10:31:10 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:09 -0700 (PDT)
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
Subject: [PATCH v5 10/22] media: rzg2l-cru: Remove unnecessary WARN_ON check in format func
Date: Fri, 11 Oct 2024 18:30:40 +0100
Message-ID: <20241011173052.1088341-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

`WARN_ON(!fmt)` check in `rzg2l_cru_format_bytesperline()` is unnecessary
because the `rzg2l_cru_format_align()` function ensures that a valid
`pixelformat` is set before calling `rzg2l_cru_format_bytesperline()`. As
a result, `rzg2l_cru_format_from_pixel()` is guaranteed to return a
non-NULL value, making the check redundant.

Additionally, the return type of `rzg2l_cru_format_bytesperline()` is
`u32`, but the code returned `-EINVAL`, a negative value. This mismatch is
now  resolved by removing the invalid error return path.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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


