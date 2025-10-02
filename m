Return-Path: <linux-media+bounces-43600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C565BB3947
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECA003BDDD2
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453D7307AF8;
	Thu,  2 Oct 2025 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="UJQxz+/Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7AE307AD6
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759400148; cv=none; b=OxlymRqzcXs+/NKMHJBp4wwscFUzO5ZPY8ghChham4/1Blip0oSSrc38XpcjAhtrhDoFIYiXRWRGbd9MP+N7nDNfo9kVViwgOc0R958mmMy1FW9Cxe/el/RTQavABAI4lMNqOu6vZzhdIDLmPUlaYF8bOd4/N1C9QmCAbZDlXY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759400148; c=relaxed/simple;
	bh=Czqxeo15fjZo1C4s++w8GwAplorv0FEgEEDoqJ3EFac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MLR3caPDNfNS9/mrlt4WqNjQwss8gFZ3tt1bGjYBiECxmbZr9QMsGOdhmJR9+NVvDXTCTOyhiktJ8EUuy7b0WuTjELTUnUJ7GahMmgLXZwIHiEKXB06+flg9HDHUSO79MBFoZoHnylpCGaaUkLMLuoxnGwzZaolBce8agXNMpIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=UJQxz+/Y; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62ec5f750f7so1408891a12.3
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 03:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759400145; x=1760004945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpOCePemL6vEYpCvPcTB5T61Ggf93+sTv7+KCD/4Us0=;
        b=UJQxz+/YsmpwUudE4NGVXFNmVMb+WRqECfLJRi1MEXdsTteqHFONywaj1DpRlSrOf3
         n6K+YAjbTY2HZPYfrYVaILm6M9uvB7KD8fG2XALl2peuYASRrgf9SZrNDAik+tkSZ7Nz
         aUDvqkr5jXO5x3Ub06XPAlnCGpKALMpq0pDJqVFNZ0tlcoGArHHbAhI0unuAwz4KI8js
         7DcVm2jT+pi/oakuWrN4FpSgyta0fUx96YAYHXkCgVyzCHxQDAl+mTCE7DCGHDWIhx28
         68LTtM1GqZ0ctYw7/c8ORx9Sq2Qe13f/bUYenYtUANz14+uy42MaVoaslSa15G/EKi17
         4ICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759400145; x=1760004945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MpOCePemL6vEYpCvPcTB5T61Ggf93+sTv7+KCD/4Us0=;
        b=pPfHvFYY0/xEYMSXZ6QJB4gTJKu8PYuLF3jwuf/+TrZuuVB65dzKpr19rqpziSx84y
         uI/NxV9k5sXuIITaLkja4Y4BeaxPrdqcVPZI7McviCX5EgcVw2rIllBJlooVVpM+UqF+
         jkAO2P9OHN/SI+bq3ciRd46oriUtA91DCkVm9FkENUqJl5NmoGM7rE6qS9IjNBwrsAXF
         n2u9i4rG6b3wxjtYqyQ/MJYVO9yL+rqDWqaMmG8NFbQTgwtNVxzXC3xF/1XRX3E+6Vrk
         /c48W8XUfNGnplUIpUHCiSUuK0R0GdiphRSJZS1a5GIWOi6MfB7drnZE+6qjLRJipnwW
         iJyQ==
X-Gm-Message-State: AOJu0Yz14UscLYnwY5x535rg8k2y+vXtu5AJ55eM9B5aDMsiKDG77qyI
	7Mbp/B1smkcx93ISC9nrGi3+mLLFTcLvadKWfYpeQiWIlKw0GtJEJ9yoyUID3K+dxUQ=
X-Gm-Gg: ASbGncuSAIlyJGlwnEVZ8t2pxTtDPV6cyvqLEgIFA3Pfpj7cGKlWzwuYQKNYRl8THdz
	tYeYHtkKDxfb6ke5CpZKJF/5IJfRAq2oZE2ai7DIIVq7vQShofddUzxV94yLEAwI9FEg/puWGGb
	pzRgC2XIGBQWI9i0Jkj9YTnNmTFpovE4AqnRxYrb3yKm5Y91cuJx7S+fuDnwZkXMmTPhGsayoBT
	TGfoeqoG1idKF3ytUtWX7Ph+v+XcsxIrOdbu+mAUFEqghKjx/fafXP5aQyS7KoGXtkAKqDBB2Gp
	1sJE2Bw7LGP9nfzmtCOUMR/lyGATyIwSXH+adl14dlBx/Osa4K7QAkxA+1R+NqAkA8/OV7X4XRC
	GfR/+C0S2b9o/iqfjDGqZo7Z8JV7DW57rDAh0LMDBpEoj1LU9rw8RJnlVSvrFJHDDsr9hzmziJc
	YkhsWb4+on/O6ShZ/sI/LD0EnzOQu0BmOcIM+Nf6M=
X-Google-Smtp-Source: AGHT+IHKPsH/a02esz5LFnruQITPPJCRHmW0KtrQ8DbN5B/ZLJUobNZd3CSpWIcrjaZ7zFTzB4mmOg==
X-Received: by 2002:a17:907:2683:b0:b3c:a161:684c with SMTP id a640c23a62f3a-b46e4b8f4d0mr793928266b.2.1759400145146;
        Thu, 02 Oct 2025 03:15:45 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e77427sm174862366b.36.2025.10.02.03.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:15:44 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 02 Oct 2025 12:15:33 +0200
Subject: [PATCH 1/4] dt-bindings: media: i2c: dw9719: Document DW9800K
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-dw9800-driver-v1-1-c305328e44f0@fairphone.com>
References: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
In-Reply-To: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759400143; l=792;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=Czqxeo15fjZo1C4s++w8GwAplorv0FEgEEDoqJ3EFac=;
 b=Hi0LkYUTZVrvOTQFoVlNKM7KXL/UaLULs3trcSM4BexT71jmcaLwOrvt96+R1RR88o8Sk2fzF
 H6ol8Mgw8xwCfvrKeHqCMt9buYB1LcZxGoskfW41ktXPr9Lu4j6yy3u
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Document the Dongwoon Anatech DW9800K.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
index 38db0764c0f70ad49295dcddc182b7e100a68b29..8e8d62436e0d0c4f9af9e52262b23881abd37cec 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
@@ -21,6 +21,7 @@ properties:
       - dongwoon,dw9718s
       - dongwoon,dw9719
       - dongwoon,dw9761
+      - dongwoon,dw9800k
 
   reg:
     maxItems: 1

-- 
2.43.0


