Return-Path: <linux-media+bounces-991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 345827F7864
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 16:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCCBD2810AE
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 15:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C251D2D63A;
	Fri, 24 Nov 2023 15:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NYuGxzqA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD6119A2
	for <linux-media@vger.kernel.org>; Fri, 24 Nov 2023 07:56:11 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9ffef4b2741so285217766b.3
        for <linux-media@vger.kernel.org>; Fri, 24 Nov 2023 07:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1700841369; x=1701446169; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nw3Uf93v4iSEa/tdYMiQyvWyR4Di+Wg4uCLDclNVmg0=;
        b=NYuGxzqABuzAmy6p/kptBJtRuMvWkMfsoJSnoYeqfe9MFUh4mKd6b/bEJZ5udax3tH
         xzFWyA7g5o65v9079Tg0tYVMCAa4lfJarcKH3WeNSdycwiz9e2WbTKJV1UOjg16T/en1
         7Ki9iYsLxkTjD/f+NPFb588cbentamfYG+dIdQ8ZLcW5Pnseoy4X4tfbNgqE48X45FrH
         LfppJMWeSCpQT2MF7i752EHV8JOiLi9fnd0CRwaVRc991riZEoLhijudpYHv/DewCZ4P
         u3TTcSZQvFDG1Q1JCdclHRTqon7Rh+YBUlnjnE53cA3h5d3DDEeF+7LpUtTJzIHtZ8MZ
         g5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700841369; x=1701446169;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nw3Uf93v4iSEa/tdYMiQyvWyR4Di+Wg4uCLDclNVmg0=;
        b=N+fXJe5Y4Idk36f4gvLIz69z3ZFgfFHcshdmJLiRSqtNacEE3fzIvP39u0ov8F7Jq9
         g0t5YaVhdQpLhhFjjmOfLYoKFS0vGuYomMQ1cbVidSSBDASy2il8ghuh7wnKrMfuJ+Z6
         clBCVqsP6kaRp43592CLmQVezpRKDzN29p3+tyqn2lJd5JN40EfUvzZ9exMpSOakHyEk
         ukq5YawtQ9rWAa6Zn1SVBqpuI0OTrloVdhA7Fcv+hP5QXzyMtTPJSHrXPUleMn71h9ZV
         jTngrc0jx3CJp9NmkP+VJIvMhGdJrd2ndT8C62OThPcO+u4schm/7GX0ci1S2QNXkinG
         15Ow==
X-Gm-Message-State: AOJu0YxylqK0/AmccjMgEPMoFQCF6Dl4yyAkQdNXRHeVT60HSdaUJKw+
	q7N7zF72IovW+B91nLcKHUpteA==
X-Google-Smtp-Source: AGHT+IHdYT+wamtbURTY6Lg3vipmmatxHpZyDbbDEqCD+868icucZy3YUAsomjQh8KBK3Ob6gLqU1Q==
X-Received: by 2002:a17:906:747:b0:9e2:af47:54c9 with SMTP id z7-20020a170906074700b009e2af4754c9mr2612285ejb.19.1700841369481;
        Fri, 24 Nov 2023 07:56:09 -0800 (PST)
Received: from localhost (dhcp-089-099-055-216.chello.nl. [89.99.55.216])
        by smtp.gmail.com with ESMTPSA id k18-20020a17090646d200b009f826f1238esm2205215ejs.100.2023.11.24.07.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 07:56:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Nov 2023 16:56:08 +0100
Message-Id: <CX75Y1X2QIN7.1GRH1YI56MMZ@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vikash Garodia" <quic_vgarodia@quicinc.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>
Cc: "Stanimir Varbanov" <stanimir.k.varbanov@gmail.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Andy Gross" <agross@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sc7280: Move video-firmware to
 chrome-common
X-Mailer: aerc 0.15.2
References: <20231002-sc7280-venus-pas-v2-0-bd2408891317@fairphone.com>
 <20231002-sc7280-venus-pas-v2-2-bd2408891317@fairphone.com>
 <4cfad910-1821-3a31-c372-3f6b199e8f71@quicinc.com>
 <CX5ENKY70B5J.2D6DXKGI4EGX3@fairphone.com>
 <ff021f49-f81b-0fd1-bd2c-895dbbb03d56@quicinc.com>
 <CX70EBXCOB66.3998C482R86CN@fairphone.com>
 <a29123a3-afe1-8f92-ff6c-835926d411af@quicinc.com>
 <CAA8EJppkjpMmcHCvxomgUMPxGpf77iN9roRvb=NEcxdk237-UA@mail.gmail.com>
 <e6d80982-1674-d0c4-9dbe-94d77079f6ba@quicinc.com>
In-Reply-To: <e6d80982-1674-d0c4-9dbe-94d77079f6ba@quicinc.com>

On Fri Nov 24, 2023 at 2:35 PM CET, Vikash Garodia wrote:
>
>
> On 11/24/2023 6:23 PM, Dmitry Baryshkov wrote:
> > On Fri, 24 Nov 2023 at 14:30, Vikash Garodia <quic_vgarodia@quicinc.com=
> wrote:
> >>
> >> On 11/24/2023 5:05 PM, Luca Weiss wrote:
> >>> On Fri Nov 24, 2023 at 7:38 AM CET, Vikash Garodia wrote:
> >>>>
> >>>> On 11/22/2023 7:50 PM, Luca Weiss wrote:
> >>>>> On Wed Nov 22, 2023 at 2:17 PM CET, Vikash Garodia wrote:
> >>>>>>
> >>>>>> On 10/2/2023 7:50 PM, Luca Weiss wrote:
> >>>>>>> If the video-firmware node is present, the venus driver assumes w=
e're on
> >>>>>>> a system that doesn't use TZ for starting venus, like on ChromeOS
> >>>>>>> devices.
> >>>>>>>
> >>>>>>> Move the video-firmware node to chrome-common.dtsi so we can use =
venus
> >>>>>>> on a non-ChromeOS devices.
> >>>>>>>
> >>>>>>> At the same time also disable the venus node by default in the dt=
si,
> >>>>>>> like it's done on other SoCs.
> >>>>>>>
> >>>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >>>>>>> ---
> >>>>>>>  arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 8 ++++++++
> >>>>>>>  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 6 ++----
> >>>>>>>  2 files changed, 10 insertions(+), 4 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b=
/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> >>>>>>> index 5d462ae14ba1..cd491e46666d 100644
> >>>>>>> --- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> >>>>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> >>>>>>> @@ -104,6 +104,14 @@ &scm {
> >>>>>>>   dma-coherent;
> >>>>>>>  };
> >>>>>>>
> >>>>>>> +&venus {
> >>>>>>> + status =3D "okay";
> >>>>>>> +
> >>>>>>> + video-firmware {
> >>>>>>> +         iommus =3D <&apps_smmu 0x21a2 0x0>;
> >>>>>>> + };
> >>>>>>> +};
> >>>>>>> +
> >>>>>>>  &watchdog {
> >>>>>>>   status =3D "okay";
> >>>>>>>  };
> >>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/bo=
ot/dts/qcom/sc7280.dtsi
> >>>>>>> index 66f1eb83cca7..fa53f54d4675 100644
> >>>>>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>>>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>>>>>> @@ -3740,6 +3740,8 @@ venus: video-codec@aa00000 {
> >>>>>>>                            <&apps_smmu 0x2184 0x20>;
> >>>> 0x2184 is a secure SID. I think qcm6490-fairphone-fp5.dts needs to o=
verride the
> >>>> iommus property as well to retain only the non secure SID i.e 0x2180=
 ? I am
> >>>> seeing below crash
> >>>>
> >>>> Call trace:
> >>>> [   47.663593]  qcom_smmu_write_s2cr+0x64/0xa4
> >>>> [   47.663616]  arm_smmu_attach_dev+0x120/0x284
> >>>> [   47.663647]  __iommu_attach_device+0x24/0xf8
> >>>> [   47.676845]  __iommu_device_set_domain+0x70/0xd0
> >>>> [   47.681632]  __iommu_group_set_domain_internal+0x60/0x1b4
> >>>> [   47.687218]  iommu_setup_default_domain+0x358/0x418
> >>>> [   47.692258]  __iommu_probe_device+0x3e4/0x404
> >>>>
> >>>> Could you please reconfirm if Video SID 0x2184 (and mask) is allowed=
 by the
> >>>> qcm6490-fairphone-fp5 hardware having TZ ?
> >>>
> >>> Hi,
> >>>
> >>> On FP5 it seems it's no problem to have both SIDs in there, probe and
> >>> using venus appears to work fine.
> >>>
> >>> Are you using different firmware than QCM6490.LA.3.0 on the device wh=
ere
> >>> you tested this?
> >> I was testing this on RB3 board which uses firmware [1].
> >=20
> > There is something wrong here.
> >=20
> > RB3 board uses venus-5.2
> > RB5 board uses vpu-1.0
> > Only sc7280 uses vpu-2.0
>
> Tested on QCM6490 IDP board, which is QCOM internal board similar to RB3 =
gen2.

In any case, I don't know much about the venus & iommu setup here. I can
try removing the 0x2184 SID and test if venus still works on FP5.
Also should the chromebooks keep that iommu entry or not?

Regards
Luca

>
> >>
> >> Regards,
> >> Vikash
> >>
> >> [1]
> >> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmwar=
e.git/tree/qcom/vpu-2.0
> >>
> >>>>
> >>>>>>>                   memory-region =3D <&video_mem>;
> >>>>>>>
> >>>>>>> +                 status =3D "disabled";
> >>>>>>> +
> >>>>>>>                   video-decoder {
> >>>>>>>                           compatible =3D "venus-decoder";
> >>>>>>>                   };
> >>>>>>> @@ -3748,10 +3750,6 @@ video-encoder {
> >>>>>>>                           compatible =3D "venus-encoder";
> >>>>>>>                   };
> >>>>>>>
> >>>>>>> -                 video-firmware {
> >>>>>>> -                         iommus =3D <&apps_smmu 0x21a2 0x0>;
> >>>>>>> -                 };
> >>>>>>> -
> >>>>>>>                   venus_opp_table: opp-table {
> >>>>>>>                           compatible =3D "operating-points-v2";
> >>>>>>>
> >>>>>>>
> >>>>>> Changes look good. Is this tested on SC7280 ?
> >>>>>
> >>>>> Hi Vikash,
> >>>>>
> >>>>> I didn't test it myself on sc7280 (just qcm6490-fp5) but dtx_diff
> >>>>> reports no differences except for status =3D okay property being ad=
ded, so
> >>>>> there should be no change on those boards. See below.
> >>>>>
> >>>>> Regards
> >>>>> Luca
> >>>>
> >>>> I tested on SC7280 (herobrine) and all good.
> >>>
> >>> Great, thanks!
> >>>
> >>> Regards
> >>> Luca
> >>>
> >>>>
> >>>> Regards,
> >>>> Vikash
> >>>
> >>
> >=20
> >=20


