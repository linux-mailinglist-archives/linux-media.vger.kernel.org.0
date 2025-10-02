Return-Path: <linux-media+bounces-43602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 249F7BB3959
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB0BE16CB68
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB7430AD19;
	Thu,  2 Oct 2025 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="gTekeNeW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8683090D4
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759400150; cv=none; b=FEdeDKrc0RNRrtzGo8mw0P4cFazKxtW4GbmI54WYyma6eQb5Hix3oSFotMJl82DV8PrU+7EuVUga6q7djSVxWYaOC2+6/E2d+SbOErNDtwU9aU0bFe7ep6ug1gTPA6HfZuBnfNxGx4CJhByoDOjJy/yEtZx8sKQcV2VZWf9C9Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759400150; c=relaxed/simple;
	bh=a8VvSdRcE37bEvbID0R9Aqu0kQVLK0s5VmuuV9Itpgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AbtZHhO+t/RqYRffxYa+IrmzELxC/DqPPkYCNCVYKGgK7xIa2VJ6sXex+A3DZ9QTC6LOyHNUmJg2nNOZfVrSzKIb0N6ZRo/vDSfYVaNMe+tVPy6pTzDQTxVlv8ivQa8tTnbh9RqNn+V0SNpArkFaYtstBGbr5kpb2uViBmiQ5fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=gTekeNeW; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so162979566b.3
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 03:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759400147; x=1760004947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AC/LdMw6FZSMvPRXK1WuNa8uhZBTEebdCq+JCaCht7M=;
        b=gTekeNeWgTLyGm9hhKGcmGojaDXr0RPvcc9lIud17p5ChXKtSPRnuWYu7dpM8bc8/3
         3mMlNM4zbdezqtfECD6BEppd0wmq72s04kmA2gAX3VkZb7IIhfP3r5Pp7SD1YcZOaSHO
         ObctSEmCWxfDPQl9iCIgvjatTpJ+NijDYVqMD4LOsbPZeRAyZVLVbOooszjqrPdlByFB
         uEZ8nXEGJCU9C3O0sUEccDaj59egV9VCgbFZhwrCODJp0UfKDW+I0qArtRuhbDh2wp4t
         UKyipg9YY7Mylx+dHXb6amWoU4eAgylJdPWp1f1Z45HxtAePN1mC5osYdFpdlwKzyd8N
         vQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759400147; x=1760004947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AC/LdMw6FZSMvPRXK1WuNa8uhZBTEebdCq+JCaCht7M=;
        b=oNOMaXmKqGxzG8DbGrs0+mco9xo/PR6DAigakrwxWp5CpTLwDUvcQ+nMFR5iecKAP0
         CvC5ND4rl0Glf+IHzO8r8aml3zErJ/PQCiiw93BvH6vl6CFGk7p4cbnd5NJkh009xjDc
         mILJjRzROzNEPEpkdonGJBzSrG2asvPW63KxQ48gha8+uRIt2XQ+6jpSVagAuwoE39ps
         dj7tK8COZQPvqlHNOEO4pwRHf5icIDZnyxLPMIurIBhXeVwpTPuhYzUkUOGMlokWxRJm
         xHExdHP7XZyAH547hVoKkSDWizykH6XCC0MJkh5U40WobWbCGmisuIGS+EBL3e+NeHwQ
         Tfmw==
X-Gm-Message-State: AOJu0Yy3uwv3AxeTuAffcpZDImiGZZ2Ycah5YvpYZBzNqM64XoLAZejW
	UYC6AzaDCtBm2abjDYzVbzUQrK5kOmEHGby/r7RZ1sxhgwmaAUrfFtb+Ogh0i89928g=
X-Gm-Gg: ASbGncuDmhWpceYK1qjP4B1UKKRZlPh+HEWooCeoIU/9VBv9J6aVsY/j5IHTpRd9FvF
	LGFfj0RZGXIDyAdIwAdWBHIucmHEF5EACXRZZVfVBj8P/j833pj/ZGs9GnhL7xqxFPYKSY3UTN0
	5fQ2JgUuEbwhCdYYx29ZksrE38VNyDb5qeTLAh9L/Mzd01wmxm+Eem2xwAkvwQg/IzVoCXfmTQg
	DUfa1iD8LLvePDfykkJixM/X8xbIh7QRb+rc5NQg/dOCFqRhGCBElTMb+FX7dg0BKWcBbQc5iui
	1HTq/CEghnLeFaQ6PIiSP13cYA+tuogmlTYO18hlN23kpj83fHLmjIPmwR6LHmfjH5ksG45N/q9
	4MSLp7bjXXZWPdQz9NaTwiT2z3zPzIiNG7prwT1KmXw1nFHcck45MWznwaKtdRTbRW+SNb5f7aO
	qTkW8XyAPKSACdNoNLZq7MpobuWZ7M
X-Google-Smtp-Source: AGHT+IFBQc+UWs4C3L8hAlOuT2nukbt7+lK54zMXakkct4VbXH11C5hVxnyT0Y/kKa90uz2FQgzAjQ==
X-Received: by 2002:a17:907:6d0b:b0:b46:91d0:674f with SMTP id a640c23a62f3a-b46e42b4ae7mr897450766b.11.1759400146799;
        Thu, 02 Oct 2025 03:15:46 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e77427sm174862366b.36.2025.10.02.03.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:15:46 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 02 Oct 2025 12:15:35 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI
 pull-up
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-dw9800-driver-v1-3-c305328e44f0@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759400143; l=890;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=a8VvSdRcE37bEvbID0R9Aqu0kQVLK0s5VmuuV9Itpgk=;
 b=7zjwZjLkUkJuApFza1ngzCnIwrs/bKRoo0e8/PQdnfVku+GF2lp8A6yRC6ZaQPxQeykHmkxCu
 a9sRiC4NKR4B+Os1aCKXVlMfyQ2GNj8RitSMRAk179zdrbjoM4gM44g
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Enable vreg_l6p which is used as a pull-up for the CCI busses, to make
sure I2C communication works as expected.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index e115b6a52b299ef663ccfb614785f8f89091f39d..2dd2c452592aa6b0ac826f19eb9cb1a8b90cee47 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -749,6 +749,8 @@ vreg_l6p: ldo6 {
 				regulator-name = "vreg_l6p";
 				regulator-min-microvolt = <1700000>;
 				regulator-max-microvolt = <1904000>;
+				/* Pull-up for CCI I2C busses */
+				regulator-always-on;
 			};
 
 			vreg_l7p: ldo7 {

-- 
2.43.0


