Return-Path: <linux-media+bounces-44098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6107BC987E
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 16:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 74B484ED759
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 14:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337F42E9755;
	Thu,  9 Oct 2025 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="iUOJFunX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666D82E8E1F
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 14:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020529; cv=none; b=CNBnNwz0Iv1guNc9D/1gbNa3lAOhs1aAiza22pHk19ZbuR1mHBwxsAvk5I03phKpGDMAU8Ggf6GpGsN/bDUNmK8pbqQsOxjclhMoSXXmNMMmTvPjb9NCz5I3LRb0uyEyyCHMy2SilvvOT3O3Kcci7OKx3xOuWCbwAPTsqMvMWzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020529; c=relaxed/simple;
	bh=DC16tUoCJGqdCaZCKlPxmdAri6UTD51Yi97Na91Z5Ew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uuLimSitCl2ZUbClJixUJZhmW6VQ1F2wWBe+vGHcJjIFVIRs2P9+5SmHLNoPZdTH/xvJeN44vlp7wUFcDOwokBJ8rKavwX4qsVrMCt7hRS5b45x8WoTtRb6RwREuFiyHDk01TPVpSVXqUGovoRk1Tm8LgRsmltzijUbPL2M5f2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=iUOJFunX; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so190903166b.0
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 07:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760020525; x=1760625325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlfDjHrcdfKrGBvOyIQt5Lw/+fx5LVzeszJPP8D8ljg=;
        b=iUOJFunXX6SpHyVuun4dkJclFtfb1WyfNUpQ5owGJ6CZcnzRnViYgOfk5RanHIleDq
         q62E7zUIr0c4aL2dTS7YmBOEL+2F64uqojTFXrXxrzExreY/JMJXDw3raieN1HagAXug
         GtbC8Y/6xdiVkcU6wqIMGJ/+kDTEgjj6nk8u1yGY+PR03Wsz0WDwNAYCWNNeYpSnAwP3
         YImnI30IWQpOQv7V8b2stA/3r6HhNoL6hdDC0ZoayJxRGwz1bDX0mfqUvB62+t2WspgW
         WCUVmX1VVgJ7hMFyJAgxMAxy/dvs/vxLixPdk8HvDo+3PxHVX0Rkm1/23U4o421o2z/L
         OsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020525; x=1760625325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlfDjHrcdfKrGBvOyIQt5Lw/+fx5LVzeszJPP8D8ljg=;
        b=Nk5cYkGbRGg6YBEEMgmk7FnNg4wTAThwPVcfYTvs9Bnt2OGKhr4mIRLShyfYkfegie
         dHFQJTje0V+ST/0cW4ngcydkHI/BWwZxgcFWrC2o6BxZPUi1tiTeg7PS1rCcXl4R7676
         qAOMFrRRYlKIkZ+VgmvZxulUCdAcES5wRD9W8sU0QW5ze2ea/vTUyaIX6y2LbpjoVem1
         3IyDCK/Qqa8gA2YhEu6T8vXry1rPvY7WJEGAyGDjQ6HWlFYsApARJ6QSXWalTbOo3gbK
         9WUZcrOcuNo5ioi9Ivp4OllgKtdNNJ8PPfkPOwu34R/90qI0SuC0X7tg5KqhGY63IRCj
         dvdg==
X-Gm-Message-State: AOJu0YzLHdsQNBd25Mb6Cfoqbc9uHOg4ESafPx4XvxW3q2Ci7DfPU4bx
	dBKwQ2URr4bnoSQxhu4j0in6biu1W1vIX8qk2T048Y3QT0jw+YXmprjtKt/eoWHOpmK10v+6niF
	6enIi
X-Gm-Gg: ASbGncsu3UGbr31rhZTyq3RiSxa9FQDqyKmuE56icOgF5ixjRxd4p4m6AIdTnluMROh
	uCPc2PQVwgCzE6JlEGnYS9T09KKMTAIxzCRvUj99IaB29VOg+wuDMaU6P/pcFACBUcs+i0DFtV+
	GtzsZsPici9L7/MG8FaYrt8AVGbGYivIBKV//p7bnkgbHFEkfQ4nI+q5pZ9YD2oB6ZLW0UjMuHF
	sMUfodUlz/AEPb03Z+VKw70TRN0sQdzUCCmHklmQ6vKf/2+0DwvVdchfv4l5T/Nl4NBm86LCZIb
	clmQZcjhxyewJPVPRebgbpkxqQmIzQhVSXpDsyhKRIv50fznCGL7yNIReHF6qSgwDK/5Z84ZeSg
	djxdh7iJphIwmRiRzoa7yyM+LtCUKCcR+PCoEN4U3kwmemTKnKd3dxDoM4a8Zim6HMXjc7+5tA3
	dA75139idYepf59ekpiu7MkexntPAX
X-Google-Smtp-Source: AGHT+IFr+JayJiI/I7GtD5Am8LsYRvZTBEDWCg7gaW9yIcgYbX0jYmBj1aCqR/Li886um8C6i2SVAQ==
X-Received: by 2002:a17:907:3fa2:b0:b45:a6e6:97b4 with SMTP id a640c23a62f3a-b50ac7eab77mr881171466b.50.1760020525167;
        Thu, 09 Oct 2025 07:35:25 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486606dc84sm1885797166b.45.2025.10.09.07.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:35:24 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 09 Oct 2025 16:35:07 +0200
Subject: [PATCH v2 1/4] dt-bindings: media: i2c: dw9719: Document DW9800K
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-dw9800-driver-v2-1-3c33ccd1d741@fairphone.com>
References: <20251009-dw9800-driver-v2-0-3c33ccd1d741@fairphone.com>
In-Reply-To: <20251009-dw9800-driver-v2-0-3c33ccd1d741@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760020524; l=839;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=DC16tUoCJGqdCaZCKlPxmdAri6UTD51Yi97Na91Z5Ew=;
 b=81CtBnB7VTEGormq+HKUETLhCoxzffogHTSiVoP2MaW1g4FKdg9qmwnA68EPe1FVZMWa+413s
 odfYumDV0MPCcgnPpB7UaEjgGXjtymenX160dy74x1jX2K9F/LfIf6m
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Document the Dongwoon Anatech DW9800K.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


