Return-Path: <linux-media+bounces-18783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 314B2989FD7
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA25F1F20F88
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 10:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9725618D65C;
	Mon, 30 Sep 2024 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ALVfrWqs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC28218CBEE
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 10:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727693545; cv=none; b=gwN19qS9XP3yQvStH20gdOGZ+FoQvwksloKKpYK07yi9etE6VnrJvrI0SRl5GOVHGe2eAxUjLpkr3EpypAm7rABKs8i/awc6Ch6QZSGePEpAIx0oW5SnuRZXrBbf9vWUjV1GZQgcX49/elNb9lxMxE5MasTALS5Fg94eJVr8rgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727693545; c=relaxed/simple;
	bh=qgtXNHUaMC9gvm0ihmJZWKtB+fMuAqQuoPe5R0FlK4I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=l6OsEMBjKgV9gqj6MYIqWth7F37yUj9sDLOPKHK5TUeQprXfz91RZH+zFR2K2W0tcInmDlVPw01wfyqa8/N/o8+jSL9c9EflPFEEwQJM2E1NSGJmCZIO4e+TwtCRA3xGDt/6iyXEhX07Ib/5BM8FS+tCefTVGLOJ6AYf685Jbkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ALVfrWqs; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53991d05416so1263023e87.2
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 03:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1727693540; x=1728298340; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzUsANdIoZzXorl2vv0C4CsPY69b8z7/pL6IfXOL+tw=;
        b=ALVfrWqs6Exok1jgn8uhnvMe5w0KS8YXUKfqG8/WWIsJPlNb3ymlJyYjR0JXvVt5oe
         MHP3AnkvlJza7ZymckT1i637MaotE25ra8H9S3uzV8O0sg1w//L2JK7oTDW8ByGjQsdw
         ZZX2xO9GPzQqSrZK9VrfrRKX4HK7LzB7s3bXNm7DEiNO2/3aYene12gfiImR47c7INMY
         wdor82ArZaeyyEwCMVG4KdDTHUNJqxxwLgCFz7JdFtgeRpkGAZYwunK7bj1q2maYhFJU
         K8JQ+yfu5ipllmoFBaQg6ccBpxtQgn3zhkP6DlfT3za2hRQ1U+O+1K1h6nTK/L/BbtNM
         /rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727693540; x=1728298340;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EzUsANdIoZzXorl2vv0C4CsPY69b8z7/pL6IfXOL+tw=;
        b=XxjuU6c0KjAhHcP61In4ZN543wVe4qP4UnL52hjQ7tnf8sLIbC6nk4CLW4ljebaTRU
         tIjBMRsy3CQz8f7PRv2IEwjkHdGE3AYs/6mDZUJWWwix/zc1IP4M+yHKWh5LG0m+XnEu
         NBMIbFK9g1ek1jBcm8R15zpo/A10fNN4wIGb+bhDsGgwMYrjBNsmLVGK4dmkGxQpm2xH
         xf0xGugh80tepyXz0qIU7r4vyVR3CS0hoVUU9pSjraS2+ZsC1zTbFHyxK143BTQToh+h
         O64RxCIut5DA6SYwVF/mQwe1ewoVE2JrIgGtHh/Jk6xKEcgsTKBAczxVt5+h2DNQPXDd
         sumQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/jCfrGQy7SIgmIwn+v6aVnbPgt6/OZaPZxkGEO8ahclPIN8E1w4PqGNuVPQ9sGqxn3GPgcyf7/9we2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp/8sSP4JBi7m/nUJip//EswnDzwvM+6NRNYDt0JdrpaAKERKs
	RtUh7OwprlQhfL9aKsT+ERxOpUwMjZvGYxEFakwuqQgU+3MVvq5ApyJfgmnaGWk=
X-Google-Smtp-Source: AGHT+IGhRweJOPkFGgAuNfktksGfPKXdF/ylFGqi9MZzfaoXda6AfoM5num/meZEhH8NA2EoHz2Tyw==
X-Received: by 2002:a05:6512:3ca0:b0:539:9767:903d with SMTP id 2adb3069b0e04-539976791e8mr1198960e87.60.1727693539700;
        Mon, 30 Sep 2024 03:52:19 -0700 (PDT)
Received: from localhost (dynamic-176-000-009-164.176.0.pool.telefonica.de. [176.0.9.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c299861bsm511772866b.192.2024.09.30.03.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 03:52:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Sep 2024 12:52:16 +0200
Message-Id: <D4JK8TRL7XBL.3TBA1FBF32RXL@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Suresh Vankadara"
 <quic_svankada@quicinc.com>, "Trishansh Bhardwaj"
 <quic_tbhardwa@quicinc.com>, <stable@vger.kernel.org>, "Hariram
 Purushothaman" <quic_hariramp@quicinc.com>
Subject: Re: [PATCH 00/10] (no cover subject)
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vikram Sharma" <quic_vikramsa@quicinc.com>, "Robert Foss"
 <rfoss@kernel.org>, "Todor Tomov" <todor.too@gmail.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Kapatrala
 Syed" <akapatra@quicinc.com>, "Hariram Purushothaman"
 <hariramp@quicinc.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Hans Verkuil"
 <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
In-Reply-To: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>

On Wed Sep 4, 2024 at 1:10 PM CEST, Vikram Sharma wrote:
> SC7280 is a Qualcomm SoC. This series adds support to
> bring up the CSIPHY, CSID, VFE/RDI interfaces in SC7280.
>
> SC7280 provides
>
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 5 x CSI PHY

Hi Vikram,

I tried this on my QCM6490 Fairphone 5 smartphone.

Unfortunately I couldn't get e.g. CSID test pattern out of camss. I've
tested this patchset on v6.11.

These commands did work on an older sc7280 camss patchset (which was
never sent to the lists). Can you please take a look?

v4l2-ctl -d /dev/v4l-subdev5 -c test_pattern=3D1
media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -d /dev/media0 -V '"msm_csid0":1[fmt:UYVY8_2X8/1920x1080 field:no=
ne],"msm_vfe0_rdi0":0[fmt:UYVY8_2X8/1920x1080 field:none]'
gst-launch-1.0 v4l2src device=3D/dev/video0 num-buffers=3D1 ! 'video/x-raw,=
format=3DUYVY,width=3D1920,height=3D1080' ! jpegenc ! filesink location=3Di=
mage01.jpg

The last command just hangs instead of producing a picture in
image01.jpg. Can you please check if this works for you on your board?

Regards
Luca


>
> The changes are verified on SC7280 qcs6490-rb3gen2-vision board,
> the base dts for qcs6490-rb3gen2 is:
> https://lore.kernel.org/all/20231103184655.23555-1-quic_kbajaj@quicinc.co=
m/
>
> V1 for this series: https://lore.kernel.org/linux-arm-msm/20240629-camss_=
first_post_linux_next-v1-0-bc798edabc3a@quicinc.com/
>
> Changes in V2:
> 1)  Improved indentation/formatting.
> 2)  Removed _src clocks and misleading code comments.
> 3)  Added name fields for power domains and csid register offset in DTSI.
> 4)  Dropped minItems field from YAML file.
> 5)  Listed changes in alphabetical order.
> 6)  Updated description and commit text to reflect changes
> 7)  Changed the compatible string from imx412 to imx577.
> 8)  Added board-specific enablement changes in the newly created vision
>      board DTSI file.
> 9)  Fixed bug encountered during testing.
> 10) Moved logically independent changes to a new/seprate patch.
> 11) Removed cci0 as no sensor is on this port and MCLK2, which was a
>     copy-paste error from the RB5 board reference.
> 12) Added power rails, referencing the RB5 board.
> 13) Discarded Patch 5/6 completely (not required).
> 14) Removed unused enums.
>
> To: Robert Foss <rfoss@kernel.org>
> To: Todor Tomov <todor.too@gmail.com>
> To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Kapatrala Syed <akapatra@quicinc.com>
> To: Hariram Purushothaman <hariramp@quicinc.com>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> To: cros-qcom-dts-watchers@chromium.org
> To: Catalin Marinas <catalin.marinas@arm.com>
> To: Will Deacon <will@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
>
> Test-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
> Suresh Vankadara (1):
>       media: qcom: camss: Add support for camss driver on SC7280
>
> Vikram Sharma (9):
>       media: dt-bindings: media: camss: Add qcom,sc7280-camss binding
>       media: dt-bindings: media: qcs6490-rb3gen2-vision-mezzanine: Add dt=
 bindings
>       media: qcom: camss: Fix potential crash if domain attach fails
>       media: qcom: camss: Sort CAMSS version enums and compatible strings
>       media: qcom: camss: Add camss_link_entities_v2
>       arm64: dts: qcom: sc7280: Add support for camss
>       arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Enable IMX577 s=
ensor
>       arm64: dts: qcom: sc7280: Add default and suspend states for GPIO
>       arm64: defconfig: Enable camcc driver for SC7280
>
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
>  .../bindings/media/qcom,sc7280-camss.yaml          | 441 +++++++++++++++=
++++++
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dts  |  61 +++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 208 ++++++++++
>  arch/arm64/configs/defconfig                       |   1 +
>  drivers/media/platform/qcom/camss/camss-csid.c     |   1 -
>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  13 +-
>  drivers/media/platform/qcom/camss/camss-csiphy.c   |   5 +
>  drivers/media/platform/qcom/camss/camss-csiphy.h   |   1 +
>  drivers/media/platform/qcom/camss/camss-vfe.c      |   8 +-
>  drivers/media/platform/qcom/camss/camss.c          | 400 +++++++++++++++=
+++-
>  drivers/media/platform/qcom/camss/camss.h          |   1 +
>  13 files changed, 1131 insertions(+), 11 deletions(-)
> ---
> base-commit: fdadd93817f124fd0ea6ef251d4a1068b7feceba
> change-id: 20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-15c195fb3f1=
2
>
> Best regards,


