Return-Path: <linux-media+bounces-43643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E977EBB3FE9
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 15:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0EAF2A13DF
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 13:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AA0311953;
	Thu,  2 Oct 2025 13:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="oNSIoVly"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEE9279DD3
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 13:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759410858; cv=none; b=L/B/iW1NhwIUXw0mWCQcXTE/d18cfVc58JvqsHBop/msh9PPSQ57oti0V8NhDGkK+8bUziULAgqDuw4/ooC7kf/ud28P/s1gUF2syWuNrG8LO4lzhjrKyHczFlLZ5NcTN7lnAWbO9ZAP5/3w3VNtmfT32LYQTpwFVLpAGsLZSIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759410858; c=relaxed/simple;
	bh=abn3PG8XEoGYwcyzS9IOIA5hdgX+qSfZsqs7WVvuQUk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eKv8KASppKkLKn+eTc0duVqRB+RMapAfRzFc3UaBxS/mPbmEGwV+ioljAWUnuzxkiqwDY6PKp5isH4D6tvROJ1a48lZpVLM1vnqF38vqcfwOoyE+KnotvCklbAuPWxB4DeXJ3RHE5RFDCt19mtsPoRqZeQPto8VjhrgBUf5rSjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oNSIoVly; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb7a16441so179769066b.2
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 06:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759410855; x=1760015655; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqfTggLDM2JL6k3wlUbLdqaGH8N69rA5/6pVtkxsZXM=;
        b=oNSIoVly8WAY8ECxlj73sDNml9qZPGLVVqB5sn5bHKVtZlVyfyaGy6bFKQz7ObjVry
         sDN2p0Ro6RMNzLgr17wcuFSrylh1l1POEvR1fuRhyWjbhrHnj5CilepQoBa+W3ZgDA4B
         D0m1f+l9VomdMHfHTaQLll7rify2cX56m/kFWPvXc1C6SCqnn2D1h3swKWA46m6eeeKz
         kI79JorICoNLqz+95+iWGI5RdIeeoZ6+nHZ2KB1A/+Cz2d8orkIRJpaaN3GqRV499Fx2
         R0M5SyPhxbeT7ErZ6fY2gy/j2Hg9OUihC+TQf7Gi05rlSUmRPX3xRxL8CIjOf9SyMSRa
         yESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759410855; x=1760015655;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yqfTggLDM2JL6k3wlUbLdqaGH8N69rA5/6pVtkxsZXM=;
        b=wpfdwqLSLxmiT6Pdj97yjGIXTQkwCxuT39zCUTpTX21CLjzKXi4r4Uy9cpCbBCZ+Zn
         1Bsd9lioRjc9DgpCgLLrcWepXaTh9ZX0y6tT2bLcinaSiHqev547A4EJDOkQmOY7T9mL
         lBmcQA+7VkLdrTsYzHlVXn1HuCI17IIOuEy8SjikPQCuBdj8PjBPqiiJM6erplDzG8oC
         DcW4BtxeftSEadIKLWWnwh3NbnySSfcTrTs2uVNqyj6ya/swcAjvsAQ6iL2YUAZ2+CxM
         T/jNcJ0Ca5XL0WO5N6eRcGJbmu1nMqPLS4ol2rvV2Fw+oNsrQ1mRN/w3WpePidFMguAF
         fp9A==
X-Gm-Message-State: AOJu0Yxh6pauA3XTMUYBuV8mlzSyikhPGEmCXK/x3/p10pvC0qYZ66+D
	CRRtVrLYj+F95IHBQwf9NFfht7g5fxu+qmXQYaFB3CPnsP4maveu8T0kRnSTQJeyXC0=
X-Gm-Gg: ASbGnctmQ0ydlUvtZvjLxptzNoj0FQeTnvAk+imOvaW6jPt8NaTFXPX2EfLECOA5/fw
	aoYewXPoUHL7IQt5C60toDBhjiQD6NFNcl3Rn5v7CZr+sFfiQ03xqUw7hdWjnWFZs+9wCHR7/Qx
	MWvn1sPGnqCsAtyA1EcJqeNBjIhzpKDtJ0uq1tavEjyckUerfqjDCYzrqjdXFmWzpoZUQ5AZZp0
	kn9hrkxFMzXRTQ8+fhe4e4E1Rm4avIheRqsPvZagvYP0TqrDKNyJ9gJ4Rhw0EEI8k13vO5bPp3t
	f7LgXyGkbkHKiI7aGknLMjZ905FNd2W8S06zkBveAZHtMmZT/1YZoCLfGe/0y2mmiJMbtQsp5M9
	FIr+UqQ/bhuQMdRxDbc5AfRPbJ53BL+lU33eYNNLHBoBaOXoFDG0tso8HSa/VDr8rl0sBnx9V5H
	DBpqlmjgJeZ9vWEM5ECLAmYRQjJfc=
X-Google-Smtp-Source: AGHT+IHdC79LilPtaS8UDTu8UX4x3ltn3xPSSVu5zWW7q/miLeA66hPm/5CSpLhwtBO8hi4Phex1ug==
X-Received: by 2002:a17:907:3e92:b0:b3d:30d8:b897 with SMTP id a640c23a62f3a-b46e1767bf4mr871148066b.14.1759410854778;
        Thu, 02 Oct 2025 06:14:14 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4d9f5sm210176266b.66.2025.10.02.06.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 06:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 15:14:13 +0200
Message-Id: <DD7V3G4RLB2I.QYT4BWT1LA5U@fairphone.com>
Cc: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI
 pull-up
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Griffin
 Kroah-Hartman" <griffin.kroah@fairphone.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, "Daniel Scally" <djrscally@gmail.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Wolfram Sang" <wsa@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
 <20251002-dw9800-driver-v1-3-c305328e44f0@fairphone.com>
 <1be80052-3ba5-46de-804a-de995f8db5d4@oss.qualcomm.com>
In-Reply-To: <1be80052-3ba5-46de-804a-de995f8db5d4@oss.qualcomm.com>

Hi Konrad,

Answering on behalf of Griffin :)

On Thu Oct 2, 2025 at 2:45 PM CEST, Konrad Dybcio wrote:
> On 10/2/25 12:15 PM, Griffin Kroah-Hartman wrote:
>> Enable vreg_l6p which is used as a pull-up for the CCI busses, to make
>> sure I2C communication works as expected.
>>=20
>> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
>> ---
>
> Makes me wonder if we should maybe extend the CCI definition
> (or maybe the common i2c-bus binding?) to accept an external
> pull-up supply, as this is a common problem.. (+Bryan, Wolfram)

Yes!

Unfortunately though this effort has stalled some years ago. There is
"struct regulator *bus_regulator;" in "struct i2c_adapter" already and
vbus-supply is documented in i2c-mt65xx but afaik this not functional
because some code was ripped out ago because of some AMDGPU regressions.

> We could then shut down the regulator when cameras are not
> in use, preserving some trace amounts of power.
>
> Or maybe L6P is already used as a pull-up supply for more things
> onboard and should be always-on either way? Could you please
> check that, Griffin?

L6P is only used as pull-up reg for cci0, cci1 and cci3; and as power
for stuff in the camera modules. So if everything camera-related is off,
turning it off is actually a good idea.

Regards
Luca

>
> Konrad
>
>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/a=
rm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> index e115b6a52b299ef663ccfb614785f8f89091f39d..2dd2c452592aa6b0ac826f19=
eb9cb1a8b90cee47 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> @@ -749,6 +749,8 @@ vreg_l6p: ldo6 {
>>  				regulator-name =3D "vreg_l6p";
>>  				regulator-min-microvolt =3D <1700000>;
>>  				regulator-max-microvolt =3D <1904000>;
>> +				/* Pull-up for CCI I2C busses */
>> +				regulator-always-on;
>>  			};
>> =20
>>  			vreg_l7p: ldo7 {
>>=20


