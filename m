Return-Path: <linux-media+bounces-19181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CCF9936BA
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0B5B1F23686
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F86D1DF735;
	Mon,  7 Oct 2024 18:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAu4MYdl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365191DF26E;
	Mon,  7 Oct 2024 18:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326948; cv=none; b=MZK/ueIKieNq56vmSbbFy33NlK68DNsiDk2Vv9mjM3N2C/Bahrc83LloREWvsrzlwXEbaxFpM43K+XgPxR1x0EbTD0TiaB6yMYt4B4OIDY3j0gYAmnM7QksGbUuI8hUY9ItTglos7BFjE01i88ehiRoH/6KeWNPkTw43PGJdUb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326948; c=relaxed/simple;
	bh=BK/nuBnleo0GMpERs+3xSBfnWAQP2PkPNF09ALoxB68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzZ1borxtInyQbX5CzUfhtkCi8A1t/xzoofW9SaAJIbwNzcNJcbWm/YB15VUP94/V1KCHZclr7IoC8SiTZYQTPhPAaaSVlZ3vy9dkr128v/hMWHVPTFX4SezCewAieJFHc5b9ho2h/scbBksU0rIlFWernrIytlW2FnJiZP6Rwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAu4MYdl; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c8844f0ccaso6572771a12.0;
        Mon, 07 Oct 2024 11:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326946; x=1728931746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVADDJD/udDduyc0qzmtsHFliZ+t+L+Lt159xgWI2tA=;
        b=GAu4MYdl8wBdV+8UvTiF7uZYdYMAYuZNJOjS2cdpWRi69Rfdhb8+sCNYO+fYhZisMu
         S+K4CqLqGmngKVhj8XU/PmfIVwk5QZUtQj5UbjlEceqT9VmxnbMVOBLCRNo1W8k4fND1
         WwqdYdAhaJqNyJGqTyuEg+FOwR4SPpkaMAfUmzQDuI6IGsi0Z4+FLjTNCoZvRvtVhG9k
         gkFzRqzVV48N09M5uZTFlmGMmoJN+zPOPZrjSZrUWBCpHNG7c8ywqnWjNylgdvsvgyl6
         hAbu8mfmxiaW8BZVY5eDuNpSv0xM8Z4VIgUTR3ltovIExPIIQIvBjovanqLFtpecc4hZ
         oR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326946; x=1728931746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVADDJD/udDduyc0qzmtsHFliZ+t+L+Lt159xgWI2tA=;
        b=CnCWADFkY4KFOW4ffbWihZd9M/AC74SMkZagfXr3d4bz7fvpeP9vTawQ/4KO/ulcki
         IOstfNp29+mmz3JFSHFs7rtA1bCe04wDFqSp9hBTs+QUQIPh/pdbD/yBhW7sAQd5ZYdn
         0Hamt91RzJyj6jC5HXFTtgytpCPCbcuxz/dmNP1MxRnI0DktQhsIWQCXaJqATY0WhKQv
         P2iG/LMaq3BUSB0tWtJJnnMkXyU+Iidr7x2SVDgLxcgWwa9JIVySKyH4JsZo13T5tHEn
         TbYbzDwKNE0UqhTka19VWIWfAJwss9LQ8mpYjN4yhNYwuG3DFJsST3H23R3zNX48n4IU
         evhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAIgVnqwZ19nrs3w8sAa4EB4JUOv+Tqy9B+nNWaHRSqWS8vcQwoL1sqK30dDzyZsCU5MAMUEJ+vQrIyOs=@vger.kernel.org, AJvYcCVkcEfN9YX51vUDe9dOZWxbU0NzWgP7S9hhwKK5PEgBVlS+FvPrOrrfyRkV60jrS5JVeDMzK7Mugb1wzt5pph3i8PM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7NbkPhyoC3L+r8p7xlDZ8gMFD9RPiCWF+yt7ZM2epl3YtGDIe
	rskosYQgKpUQJapQhz0jNnJtb57R8olBkZj0+q5PeMSfF3Z9wSKT
X-Google-Smtp-Source: AGHT+IGKLM4G7WyikQKuEzaTE/T5nEbBP7do9Gf+rgLPXe2Kq4Y0QiKaXxSklQMdrll6rx5p12uIbA==
X-Received: by 2002:a17:906:da89:b0:a8a:837c:ebd4 with SMTP id a640c23a62f3a-a991bd71c4emr1428063566b.27.1728326945440;
        Mon, 07 Oct 2024 11:49:05 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:49:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 12/17] media: rzg2l-cru: csi2: Remove unused field from rzg2l_csi2_format
Date: Mon,  7 Oct 2024 19:48:34 +0100
Message-ID: <20241007184839.190519-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the unused `datatype` field from the `rzg2l_csi2_format` struct and
update the `rzg2l_csi2_formats[]` array to reflect the updated structure.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 3fd0be6a3b65..7b76d495cfe4 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -183,12 +183,11 @@ static const struct rzg2l_csi2_timings rzg2l_csi2_global_timings[] = {
 
 struct rzg2l_csi2_format {
 	u32 code;
-	unsigned int datatype;
 	unsigned int bpp;
 };
 
 static const struct rzg2l_csi2_format rzg2l_csi2_formats[] = {
-	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16 },
 };
 
 static inline struct rzg2l_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
-- 
2.43.0


