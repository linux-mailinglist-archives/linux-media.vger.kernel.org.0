Return-Path: <linux-media+bounces-44100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A113BC98AB
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 16:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DE3E3A832E
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 14:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4C62EBBBC;
	Thu,  9 Oct 2025 14:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FWGAsSwJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71182EA48D
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 14:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020530; cv=none; b=W/j9QIa6gI3ZhEAefptLLQ8rQsE6rg+wiBGDM2l8E5039pE+XNVmINMTLPp7JpVHRsxD7JoJ1y0751HCmNvisgjSeMNNaHqWpQztRXCzNEpTnGBMPbi544iZ9ZlsrCeqSZskcF2ELw407pEcEZ1jGZ/iC4EqX8v4jDDZCj8y1cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020530; c=relaxed/simple;
	bh=Tm5EfTqaC5QMSjBI6EGvo9CBBe5CgOuV/UJUlgWJ3EU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LmMY3zjyH0I1ivtZn5RYLmHMoLQApx46o/23fNEw5vF+zU1ogdPOOteCxK+KQGrWFn2vy3lDchAj1TGnWGH0UqRXHRAyZGa96+CMvapEVS2VTlRBDaB5B7PPxSLFXp7iePSx/VIdFYL+t+l6aYkFZoV87mKMK19XKPVLpknI3yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=FWGAsSwJ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-637dbabdb32so1978530a12.2
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 07:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760020526; x=1760625326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DHPPLmhygT7LvJBN57iAEhxLZcu4AGW0vEJ/bXem0w=;
        b=FWGAsSwJ3ha8UBWVQv4NUbw2spgvlyISDgiNnytekBK6x+iRxmEcsZPy6Cca3Igftl
         4Ni6eVw95BhWjN6WASYjUpkzl7cfyGwcizsPV3c98RVkATctQHQqd5HFuxTfAzbBl0OF
         sCIKyKmBi1jkgUXm2JUkEFPyb4bwdIMCWllRQEvrF+6ESzRLKA3yZItBGKlCEH8ZzRj+
         yMoNEH8y3+/xHaKZkKuBcu3qKHgZUp3xNfyeWIu8y5vNjcHUeFQzdngdyRw0K3XemWzJ
         3pvQmhOgV6Nhcy92dZHQcB8tMRtfnUhu7Dn2lWLx8U4um4OKOc7kdK3qSUhDqiOSDVmX
         wv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020526; x=1760625326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DHPPLmhygT7LvJBN57iAEhxLZcu4AGW0vEJ/bXem0w=;
        b=AMJ6fAtxjLa2fkkwLpPCF55nXKL2aYtfaSJp4ncTDMAt25sfxVwNMCIQ1aWV9I5nlt
         kjQqnLs+cNCjhVMRaaJeCtKinN4VA3dA+k4KgGu9CGomVeWW7ejYbjV6vxouG6HXVTfo
         Im3hVs2zYYLM6kS5BNgg/6OvzbtCa+FBgjX1bR0mxGs+SSkq8sSijhCWHc6ymD8e+xqK
         /yOogXsXWimKjaD8PGF2Je8e8S9Pvd/aevll0U0aO+V49xpCPpYl18gMOsQotiox8yXD
         dn94QS5RSP+uEXQXrxScPijor/Yh0zDMJyz/pqxolYGhnto3Btv4OTkYd10a7EciJeBk
         AvSg==
X-Gm-Message-State: AOJu0YzWDy7kG4FTCaHOJVy4nlBQJdfFEMe2KhP4xSmVcyNr3mqY1Wzq
	2Wr+IDQRvgFQRW9ZOSScvpHEYFmmXIvRFJ1pXsjYIkD2wb45UIf/2te3n+fBWo46AmFxhZuk48B
	BNLxi
X-Gm-Gg: ASbGncvdUyg+jfbg+ZHDRsn1sV6NMPz0d8WMq7mP87ywLFgMjTvxLjEmclFSq7TKQ4i
	ndCnLQzif2AbQHd6VPsJW1G+HvlUkuCjyK4CEJ6AgDF1wycitaZAcvUeqm3dgHH3slnWFxUGlVn
	TqdYjmaUZ4s6eTdigmPVrKYrT0Mksxnn5SbW0PXz5yHRxu9AwfDDC+L4dW7VRxv0a3FV6viKCNf
	ouHcD3ZGFnqfMIA3xMZSNc3jveKFuV8+Ek6aO8hEGfvWJScCMyxEC28UZgChB1RrhBwFoCGugM/
	S2FF04PW/BZn7eKHqe4vott5A28GrXDhBu2Gr1l90IdXM2xo6YDtRPOKS2bZDGu3Ti+Y7KUAQ/d
	F8LK2d3k0rH51j18UabFbpVoX+2ygfdz0NPhH2FAsfvcO5RLx0IfLl2KYnX9QD9/TKjIWDe6A1o
	Csi7qBcDsQqhOMAZAQiRu3/Jj612yB
X-Google-Smtp-Source: AGHT+IGpvCBf/6AFoWh0ryKjV63PoQaWy0iA6WnNNox2AMwgEWvefm4/UWZWVAqH1ctSB2lwwtUAdA==
X-Received: by 2002:a17:907:809:b0:b45:b078:c534 with SMTP id a640c23a62f3a-b50ac5cf768mr908616266b.45.1760020526492;
        Thu, 09 Oct 2025 07:35:26 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486606dc84sm1885797166b.45.2025.10.09.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:35:26 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 09 Oct 2025 16:35:09 +0200
Subject: [PATCH v2 3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI
 pull-up
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-dw9800-driver-v2-3-3c33ccd1d741@fairphone.com>
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
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760020524; l=972;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=Tm5EfTqaC5QMSjBI6EGvo9CBBe5CgOuV/UJUlgWJ3EU=;
 b=MhSWOCpqJXGxUUtwnLCjRnSXLNXuk0uH/IvCO/kBKSyHfHxd6pY7k98vC8oLKyZhywKKumTV/
 Jt2jzAYz2tFBY0G0R+MUbdpyJQCiZtm2ZXzcXrxBIT6qg6CP9LTR11j
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Enable vreg_l6p, which is the voltage source for the pull-up resistor of
the CCI busses.

This ensures that I2C communication works as expected.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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


