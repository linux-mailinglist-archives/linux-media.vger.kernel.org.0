Return-Path: <linux-media+bounces-29184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C868DA7867F
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 04:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD7FD3AFCF5
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 02:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B8112D1F1;
	Wed,  2 Apr 2025 02:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmyzG7Mi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A768584A35;
	Wed,  2 Apr 2025 02:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743561614; cv=none; b=tm5ASssAst3tbGhgJ1YV+S/sQRkzDU7k22BYwHcLqGyE92hzfk+gbzY7E9YvAldEMJbHurirgaJMANr0QQpTQCTdaCpNlqy1npf0z8Ee0Nt2YHaw6gzIOOz3QMw17xU4dOwNDfLJappQ+N8tgSWLObeM5KA+UGKRH6n9XyImPLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743561614; c=relaxed/simple;
	bh=a/Dm+u6pjuizxHvTTkTB3tGMpeDmkV9MptDSw5z7NEA=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=XgQjCeX1rBQIfIFpqVn+ugLZ3YdMqtejr1oh4e8DtEeOJ7ZRWkkdTAaOrGeXGRzg+j8lEctV7WrVcVL8iZlxJXWRgjbSlTuIibX4ADeBLu7RLhd/Qdyh9S+2TNlKcty2pQZQzPiaX2zJbXhJbykvQykncKxzo2/javu9hGsKIkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmyzG7Mi; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e41e18137bso48436446d6.1;
        Tue, 01 Apr 2025 19:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743561611; x=1744166411; darn=vger.kernel.org;
        h=subject:cc:to:from:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q9GE2K19EwxzhRGjXGYJR11XLLTVZECnfrYRAnlaA5E=;
        b=PmyzG7MipNvG4PZDEtoHnTrBNAVY/dUgEsm71G9G3iLh1Ih169ycSyzvip6yft8rTK
         5WAySmkYr7DzmBb+tn7Z/eYsyx/GRSo/oZTuOgRR/El+2bFlsd/JqwrIlxNFhRLBb+jE
         H6E2P97E/5OwOF/hd142H6NCv9ImS/N9QACCMoek3ky8yhRTZqysvTU9O3Nap/yEqTz4
         Fbun5sSjn7S4vh9A3HECKl/pUsam9Asdq8+vy/GcACQ5mnz6RATFfgDi6xhJ9rWVoJEf
         +26f45APYzO4ahQSgZKPdG+CzSxxRdpnBsr0EyRLEe4/FpTi4gqx9GQSBkRt5qgvFj4e
         zYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743561611; x=1744166411;
        h=subject:cc:to:from:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9GE2K19EwxzhRGjXGYJR11XLLTVZECnfrYRAnlaA5E=;
        b=R7JLZztfmvCGaLJPIylXUDnC+FtT+sVZJ1gi+PSM3uLwBuWVtabuYmRtYGIC0HZEGq
         lxULIq0KjGmaHHDYutjc/CHDHvEcn5FTzdo1kfNIsR+3RWo34lCYs6j4E7mnUL4J/djN
         5w8e05tbGPLZXpqsmCQD+JnSG1uYoMEHa9Y77DoUz/4idFAf7b7gehSWQlI7ZgkKQ86S
         +VlFZ58brqdfxtkjNoiCMmG8ClI7bTFDYCWeAQAlgL+8ffbOY83+Vss4Ij5CIhbm3sUF
         wH8ZiKVZX4vp+Zyq8PnT1jyht9/yJB13jWwHpBW6JBN4cQBaSjVnCtHe61fQgcgLAnW0
         3XCg==
X-Forwarded-Encrypted: i=1; AJvYcCXjXe0xv4xjto2zCG3KXSDd7M9qNrYQbVMcTun2uuT71JGy6Wsw/5307114u4y7ygybqI9MifupOu6gkTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZEVlapHUsbjbwpdIaxeO74ywXOyPJrfJN9QKB55vNph7Got6q
	jAQpsnvu4QYkdYxTHczhrRKfLUIJqwS/BKLNGreBgdg57Ldv6Mx5sD0A35LnMho=
X-Gm-Gg: ASbGncsz7sdz8klvPLFFctEdf46AF7/Ssp4VK/DE/R4N14koywtIMRvf+H0TZhzXQVn
	+B0NyyhMygQ4CkUqEEaWBuRWv++Sd2CWn08e/1rZq+XB8C7wi0Igr7KVX+YZWUvznK1VistdDwr
	EofAYSGayAFnrrdrCXPM6kLNmk9KJwzs8ZwRm6m4YVZAscl2aMwy6pL2k6a9UOZXaPpyqFcglok
	pnaFSex+tkNLIyVUiOyS1Xh5Df6yvSf/Kl22QPbCu+BEffPvGP+eKFutMkKAVtTTbBfE3p9v1IE
	SOCb3Vdmo7nOla3Vj1cpQIWh7UYYKM92xgRPfi+PiAbL8YkJA+DSB5jO1xuNMk9OAdyUwZnanPF
	GnEBY2xBGwQ==
X-Google-Smtp-Source: AGHT+IG6oBRbFTU+JNE1XfUccc29qRR2X6E2rPN3IJOPLpWVzZ+2Jtmw9GAzmXQJYrQTeGlRpNKD2Q==
X-Received: by 2002:a05:6214:268f:b0:6e6:646e:a0f0 with SMTP id 6a1803df08f44-6ef02bc43c1mr14855456d6.12.1743561611219;
        Tue, 01 Apr 2025 19:40:11 -0700 (PDT)
Received: from [127.0.1.1] (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9771dbcsm69163526d6.87.2025.04.01.19.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 19:40:10 -0700 (PDT)
Message-ID: <67eca38a.d40a0220.22c3d5.88f3@mx.google.com>
Date: Tue, 01 Apr 2025 19:40:10 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============4398481999678097914=="
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: gshahrouzi@gmail.com
To: linux-media@vger.kernel.org
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: media: Fix indentation to use tabs instead of spaces

--===============4398481999678097914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

>From d6a08153171ac52b438b6ddc1da50ebdd3550951 Mon Sep 17 00:00:00 2001
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Tue, 1 Apr 2025 22:04:25 -0400
Subject: [PATCH] staging: media: Fix indentation to use tabs instead of spaces

Replace spaces with tab to comply with kernel coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index ece5e3da34ee..127f12ba2214 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -114,7 +114,7 @@ configure_dma(
 }
 
 int ia_css_vf_configure(const struct ia_css_binary *binary,
-		        const struct ia_css_frame_info *out_info,
+			const struct ia_css_frame_info *out_info,
 			struct ia_css_frame_info *vf_info,
 			unsigned int *downscale_log2)
 {
-- 
2.43.0


--===============4398481999678097914==--

