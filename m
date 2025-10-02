Return-Path: <linux-media+bounces-43644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBA6BB400D
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 15:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3B272A23C9
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 13:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04663115AE;
	Thu,  2 Oct 2025 13:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jixoqxze"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E67B255F5E
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759410999; cv=none; b=gUF1uo2E3jgA6h4X/Kcx7fVn3tuaPn9+rTFVO25IOXGSD8dZFH8TxLaimGG+xW3YU8ekcxydTszHztM0hCnN6yhMdwdeCKE1vUGvl5KH15iA6WFvCUuomVekVyDzhPlEEx4T3ehSxH0OQES78fwHhJDd4U7uz4ir8BRLhMHRXVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759410999; c=relaxed/simple;
	bh=PDoZBktX5qGB4t+SzeuqklzlS14l06mZuJb7Ixusx2I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=D/9FvWjwsrH7bPQaHYjYTBNEx14KcE1JJyWAV3mBL/u3qnNgQBzM1TF/gGHQKbwLmtzaqNwhgF3zfzF4d0HAGghP+gHin5BkTdpWROIXq8Lb0ngQmjZzIg9djb2HOq8H3Ao4yQP1dvL6XDkCOc0E4/uSr4P9+h/VoJQ74rfrNJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jixoqxze; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62fc2d92d34so1964451a12.2
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 06:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759410996; x=1760015796; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ObT0eeBgwnHgQInGw6TZJgua4+bYG6hTqKqFI/jXoI=;
        b=jixoqxze+3feZDKcG2qX4LuOp4QIshUACyKzq72LeaCdCM3T1KecpawdlToeOqF0gm
         My106wS0SK8uAM8bSF2l5bChZnYDKGSRskSUrUS+G/3BnWfSLUlBVSuVw45KQ8vn4nU6
         2WrMCjAT+NrEbdZxa71imCAQB7zRjHVgUn+lY7w1H+SPoy8hYpbSetsEcYo/eARfqPJu
         Cfxcic7zLZnutWuwicxMDkhigFyARmoDeqOOpCzluD4ATfs6wMqFk6xa83kc3N88nXx1
         hI3PW7yRX1H3O1Po7ef8QOwDOiLMYJnWpqsNO6TdVZZj1daQl1NBohCaSlKf9FErX6UX
         FVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759410996; x=1760015796;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ObT0eeBgwnHgQInGw6TZJgua4+bYG6hTqKqFI/jXoI=;
        b=Mfr9B2bppidhbdBVQWUypBsi1E9orRSzkUlCnfESryXNvB7h84e3hFU5fX7/rkHM1F
         Y9caUHtOZCRIoKTI/Kewzp9+Nm11552mNsUgHJRuFQ8zVJUuUuuRkXYQ6YHJm1WwyJK/
         9Bh9UmRNKIA9cUSwKokokgHXEJO9MStpvq5VlEa4EzWCzo9aJ7etOrSZN2hpxfPUBYdg
         n0eOz5hfzWMwsQhoC74ArRFfaXiwjXZMYTUW97+79VvmUwAUSB1Xi7p7OmfKRH19t3Ce
         EqEK8YI2aqQ6oWydCBwU5g1UBKcL+N4tDIvXyiALnZhBkZyIlxJHlRzm7mnQYhpbQS6Y
         9aaA==
X-Gm-Message-State: AOJu0Yw/NVz2DGOSQgDxUgKpeZ5sJqlKUQoEZoTRfFcf0YKH+wjhDsj2
	sXY5/WtfyiMsq+2A0FEYAPbDEnk//6ec0CRJKxggVd+0gEy3nITmv0T89rgr1lhbMzs=
X-Gm-Gg: ASbGncttjY/3XQptGJpkFf3gPThiCnHzkEXhZgmL6MLSIdaHXSjmnPt6l8imMItbyqv
	yVnshgRoZ9VzjU+kdtjMpQJVKoGktqPnOWdAV3sT3S9Dy0SVXmoMez/0QhB1ykgrg21AE+iZzLI
	nFO/0/BhMmEDfBPIKUFt0dSmfRUPNKkX99ygs5ykmcgBAYTKHXTI8/C48rM1+kV8kCj7H0+NRRq
	G1ylgHYIOhq4/xStLjkM/BEXjC1R1M514084xCFFEobQFXnNPmeo9Gk6mKosJO4BpXTlZ19zyNA
	ecl+TDpCAfT2ErNAw+ITtep/hUT8IIgaPhuRHErloPYkTxn6n8xVvLMrHbic3sjyMUy+pjxbL+k
	FzXnWd01PnwhdQmzfCCuRkx9FaQ7AX9iTzi2xigNlSEE2n+4g4BcDJqid68XAUL8uP3hDz0lzF3
	oAJe2vF0hvCkrT2h3/XILcTyvm3lM=
X-Google-Smtp-Source: AGHT+IElAtV6AUMzxrPGPFH26HOMvAC/VCzDX87OsUzxYphcjqlRmrNm1j8deD2AOnXomH8ZKHZV4w==
X-Received: by 2002:a17:907:968c:b0:b40:33ec:51de with SMTP id a640c23a62f3a-b46e42b57dbmr835675766b.8.1759410995859;
        Thu, 02 Oct 2025 06:16:35 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b2desm202563766b.48.2025.10.02.06.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 06:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 15:16:35 +0200
Message-Id: <DD7V58XLAVQ4.23R46R62TU37E@fairphone.com>
Cc: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add UW cam
 actuator
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Griffin Kroah-Hartman" <griffin.kroah@fairphone.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, "Daniel Scally" <djrscally@gmail.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
 <20251002-dw9800-driver-v1-4-c305328e44f0@fairphone.com>
In-Reply-To: <20251002-dw9800-driver-v1-4-c305328e44f0@fairphone.com>

On Thu Oct 2, 2025 at 12:15 PM CEST, Griffin Kroah-Hartman wrote:
> Add a node for the Dongwoon DW9800K actuator, used for focus of the
> ultra-wide camera sensor.
>

Tested on a tree that also has the imx858 functional + linking them
through lens-focus =3D <&camera_imx858_dw9800k>;

Tested-by: Luca Weiss <luca.weiss@fairphone.com>

Regards
Luca

> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/ar=
m64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 2dd2c452592aa6b0ac826f19eb9cb1a8b90cee47..0e86cd5ff527925c7dba15c4e=
0ee5fc409fe4ce6 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -627,6 +627,15 @@ eeprom@50 {
>  };
> =20
>  &cci0_i2c1 {
> +	camera_imx858_dw9800k: actuator@e {
> +		compatible =3D "dongwoon,dw9800k";
> +		reg =3D <0x0e>;
> +		vdd-supply =3D <&vreg_afvdd_2p8>;
> +
> +		dongwoon,sac-mode =3D <1>;
> +		dongwoon,vcm-prescale =3D <16>;
> +	};
> +
>  	/* IMX858 @ 29 */
> =20
>  	eeprom@54 {


