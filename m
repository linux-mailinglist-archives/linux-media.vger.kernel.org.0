Return-Path: <linux-media+bounces-13968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D292F913440
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 15:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1695EB2179F
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 13:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477F216F29A;
	Sat, 22 Jun 2024 13:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikEo3zAR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DE114D6EE;
	Sat, 22 Jun 2024 13:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719064046; cv=none; b=FG3uF7/UBORvQCYIiQ6VRLsV9pQTCldPOuRUONLM8Lm5OnpDey88hSFrPJCyY4vEB5BB5D9sdCfMdPURvQPKrTc4kq19OjG4hBJPqQmGylpQ4CC7Gb9qxVkKtZwWa7apF3aseDOIt/X5/Hb33ngXIr1GVzeJj+SVJR6UYq0jYhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719064046; c=relaxed/simple;
	bh=aYz1ndkOaTKnkrgbvyIOa27eGl/WVWdVOEBR6M52qOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P2y+H87xZMyKAZZV8ppX3K/EJmoz7QDzGzbBbQalAisNMqWrXwA1wGBRMo9OmuzRQ+xqX36yQI8CgkJfRi7gUgcvqzILvx6eLX+OAlKDfa9Xx1JNCi1SnYn/oVKCe7f1Rcv1E0/pFva3IxswEjM8mcV+xZZ2+lV1ee2ZyuxhLFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikEo3zAR; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cdb9526e2so976222e87.0;
        Sat, 22 Jun 2024 06:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719064043; x=1719668843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzDOBWm1Bza76au5EMycUxKs7sf6PRvFgQtnTRvoO68=;
        b=ikEo3zARimxyubyhIcj+6SNwwy0E9c6EYtohtYI8A89Dnhn2Gx8FsuNFjhBTn0OYUC
         Gh7l+MTymSwJHEibI8pRnQJ40/fJb3twQ/ic+pDQEjOxkOSTGLda8pqMjRvUkjbeUnUj
         UpzgXeWOUXTHYqKCFVgnArb58K5f4R1XR6vqYeeGvJdmaHAgqUAKKPtnf9xIcAqlt+Hp
         ZANrkNhYimWwKQzSog0wxkU2nbD5/oDH145xLhyJuuoi9U3YTCxqaFL7q2KqHdceC/Ow
         itr+P5c+VVZqJQz7koDhyZPljY6zHcaOsIjaofZ9DbbceMTzrSxZ0sTqn93KD01XBI0E
         t8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719064043; x=1719668843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzDOBWm1Bza76au5EMycUxKs7sf6PRvFgQtnTRvoO68=;
        b=KkLJkwiGuVCEX/Wah7Q4DgzjeHFhdvM8FZioN4h5yB9NAROgRNUCX5CN2YxKuW8Va+
         gwaQE0xxwHvADXTcdcQTi5GhbADmhqSLDJm5deLUEsjyBJKdkdtXUIgeFda+egVnxA17
         2xpaDVhzxdbu8OvJwlE7zr+cmDgLfPgxLfgluU4v8EWKiUwJlW2mDT7/7JN+pSydhAB6
         Lz5/iu4jU5qMvY8wZmrWT6Kr+YKPB8YjzI9VJqXy4uou5JNL50wVjSPNxytg/SoNMdSZ
         fF/M8NXU4LxumLB8Asu0rkrHpstJ0OO8EOktICqpTVNVfndGAQXk88PbQjcPgIKAM61Q
         bpOg==
X-Forwarded-Encrypted: i=1; AJvYcCXNuxsaZnrnu9bfaf3zr426yBnM3uhvsSDC/zbzlubywJ0TEH+zvoYmRqptN5LyNAzQ2WWR4KuPjRLgnV5Y/aMWJZiA6KTpDtupYvAUOz0e4cw82KSSqB4R19XWREFOhZIBOHXngNv81Ror/HNPkHs/DQzLsLJUVwAYkCRB3p2GCGvj6UaFCPMbIulnI8SW9jV0febV/GTHpawCU+Uk82j+oaqMOw==
X-Gm-Message-State: AOJu0Ywf9Xca4CamY8VLIWYQUMCfJzNzWV3aqzJAycnhhEcMoIA1Kmst
	81oWLLnbgV77uMDJpzG0YaFxfeQInAi1k2UdQOy+fk2mVIDy+YCiOomzhIzPnRZuClLycevzIok
	FsDu75+EE83dh9Kgrw37XvsfFuUo=
X-Google-Smtp-Source: AGHT+IH2lCl3T4pcjIHWIZp3BqoW9t0WI6X26FHKqKGqVsndzfblFuk7xQwvtcuSKJOI80Q9Xta6H8JLozf1v3p6aso=
X-Received: by 2002:a05:6512:32b5:b0:52c:80e6:60c7 with SMTP id
 2adb3069b0e04-52cdf3317bamr337302e87.13.1719064042778; Sat, 22 Jun 2024
 06:47:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-3-14937929f30e@gmail.com> <cd9b5612-1160-4284-be7f-4efbcbbbe346@linaro.org>
 <b9deca88-8e1a-4017-a0fc-6a77672d684d@linaro.org>
In-Reply-To: <b9deca88-8e1a-4017-a0fc-6a77672d684d@linaro.org>
From: george chan <gchan9527@gmail.com>
Date: Sat, 22 Jun 2024 21:47:09 +0800
Message-ID: <CADgMGSunjhnjv5+KpRskL+F22zz+E60dJPkzCdfTVTcEM+HRpw@mail.gmail.com>
Subject: Re: [PATCH 3/6] media: qcom: camss: csiphy-3ph: Add Gen2 v1.2.2
 two-phase MIPI CSI-2 DPHY init
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

resend with plain text

On Sat, Jun 22, 2024 at 7:20=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 21.06.2024 1:25 PM, Bryan O'Donoghue wrote:
> > On 21/06/2024 10:40, George Chan via B4 Relay wrote:
> >> From: George Chan <gchan9527@gmail.com>
> >>
> >> Add a PHY configuration sequence for the sc7180 which uses a Qualcomm
> >> Gen 2 version 1.2.2 CSI-2 PHY.
> >>
> >> The PHY can be configured as two phase or three phase in C-PHY or D-PH=
Y
> >> mode. This configuration supports two-phase D-PHY mode.
> >>
> >> Signed-off-by: George Chan <gchan9527@gmail.com>
> >> ---
> >>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 120 +++++++++++=
++++++++++
> >>   1 file changed, 120 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c =
b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> >> index df7e93a5a4f6..181bb7f7c300 100644
> >> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> >> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> >> @@ -348,6 +348,121 @@ csiphy_reg_t lane_regs_sm8250[5][20] =3D {
> >>       },
> >>   };
> >>   +/* GEN2 1.2.2 2PH */
> >
> > This is the init sequence for 1_2_1 not 1_2_2

Yes, undesirable copy-n-paste result.

> >
> > https://review.lineageos.org/c/LineageOS/android_kernel_xiaomi_sm8250/+=
/311931/10/techpack/camera/drivers/cam_sensor_module/cam_csiphy/include/cam=
_csiphy_1_2_1_hwreg.h
> >
> > https://review.lineageos.org/c/LineageOS/android_kernel_xiaomi_sm8250/+=
/311931/10/techpack/camera/drivers/cam_sensor_module/cam_csiphy/include/cam=
_csiphy_1_2_2_hwreg.h
>
> FWIW 1.2.2 seems to be the desired one: [1]
>
> Konrad
>
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/blob/UC.UM.1.0.r1=
-02500-sa8155.0/arch/arm64/boot/dts/qcom/atoll-camera.dtsi#L22

Here is the log from sm7125 joyeuse phone, not sure if it helps or not.
[  204.034767] qcom-camss acb3000.camss: CSIPHY 3PH HW Version =3D 0x010000=
00

I carefully looked into this csiphy_2ph_v1_2_2_reg of various trees,
and concluded below version:
(1)atoll, sdm845[1]
(2)surya[2], sa8155, factory-trogdor-13443.B-chromeos-5.4[3]

I was tempted to use (1)atoll one but it looked like (2) is newer. Is
it worthy to create CAMSS_7125 specially for SM7125. Please give me
some advice about it.

Regards,
George

[1] https://github.com/LineageOS/android_kernel_xiaomi_sm6250/blob/lineage-=
21/drivers/media/platform/msm/camera/cam_sensor_module/cam_csiphy/include/c=
am_csiphy_1_2_2_hwreg.h
[2] https://github.com/LineageOS/android_kernel_xiaomi_surya/blob/lineage-2=
1/drivers/media/platform/msm/camera/cam_sensor_module/cam_csiphy/include/ca=
m_csiphy_1_2_2_hwreg.h
[3] https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/=
heads/factory-trogdor-13443.B-chromeos-5.4/drivers/media/platform/camx/cam_=
sensor_module/cam_csiphy/include/cam_csiphy_1_2_2_hwreg.h

