Return-Path: <linux-media+bounces-1463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CBA80070F
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 10:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A3A3B20F2D
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 09:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069EB1D559;
	Fri,  1 Dec 2023 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="X2N9ZUfb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CD15584
	for <linux-media@vger.kernel.org>; Fri,  1 Dec 2023 01:30:58 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-54c109ed07aso2584943a12.0
        for <linux-media@vger.kernel.org>; Fri, 01 Dec 2023 01:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1701423049; x=1702027849; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygGbZBo+TdwBHujrvJwJMkwLK25AL7Tn/jyxEY8WKY4=;
        b=X2N9ZUfbSenInkzUsP02aUgjkHVLrFdMftu1tl052Gw3lvxyV5VNqybPwqPE75P+mT
         aBtKnbNn4+i+DKFtaurpVsbsavF32oN2vCshHND2VyrR7XOhpn++ZkKS6hdTbfC45hnU
         iSrV4/fNRjHhPB3uQ3HYvX3dxhPZcC58Rz/MqV3LAU9SIlXLbKzjy7acVKDcnQG1OLe5
         JugudTDDn2+qXmHCuuGhwLD/P537ff8Hc52CITjALm1tc7MHdQvOClo9DtyMMkHV809S
         ytkgAs3/9PQ+tNa1pkI+R92FpKTJIN5cgl1N1ynxu2NSNXmQjj2gCcxvAXNvCG3kuCW3
         w0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701423049; x=1702027849;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ygGbZBo+TdwBHujrvJwJMkwLK25AL7Tn/jyxEY8WKY4=;
        b=K7l8aYl//8C4+s2nR2gGEGWoEB4KSWjUTqY5qwGntXv+FyiWlcMP4LoWTCGx0V6o9W
         7EoAdlmftvxfqGT9wI1ICakBwpw5hzuQ7i8l5RAUvMboLQwOgl6GaF8qAH3TbQR5xMoZ
         aeIOUuSjEy0jw71MEDF+irfx2m+zppNnk0yLrYQIpy9IKjzDW3WeTHG6QqqmXLvyeCps
         IyjRSZDibw7Gr0JqniooBDNdjO6GSNC8YkwELTW64WrEfgsVQ09AvTyHmoWoEWuammM/
         up9HVsby/4mf2XiYKkWXv3R2lAFnozFT1l82IojUVVIrZ7pKilWIzWxNx9Wdqv8lMkWR
         ssfA==
X-Gm-Message-State: AOJu0YwHZ4kcFHh4DVEpSTsincyBnYzdCRoezrLD0iQ7Ssqy4WtXoJOP
	M2ftaLzLN+Wki1vYtmzPEsxjwQ==
X-Google-Smtp-Source: AGHT+IHYfJYwHA0j2Y4AKuDUFx7AebDZ3NL4yorO1OdFEKvIaaFqBiFiYcRJE7VdicrbRk/IR7RQ1g==
X-Received: by 2002:a17:906:3b9a:b0:a19:a409:37d9 with SMTP id u26-20020a1709063b9a00b00a19a40937d9mr1009266ejf.50.1701423048902;
        Fri, 01 Dec 2023 01:30:48 -0800 (PST)
Received: from localhost (dhcp-089-099-055-216.chello.nl. [89.99.55.216])
        by smtp.gmail.com with ESMTPSA id d15-20020a170906344f00b009eff65e6942sm1673780ejb.197.2023.12.01.01.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 01:30:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Dec 2023 10:30:47 +0100
Message-Id: <CXCW4TRVE6RX.32BBAPRTOPGR9@fairphone.com>
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
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vikash Garodia" <quic_vgarodia@quicinc.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>
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
 <CX75Y1X2QIN7.1GRH1YI56MMZ@fairphone.com>
 <a4e8b531-49f9-f4a1-51cb-e422c56281cc@quicinc.com>
In-Reply-To: <a4e8b531-49f9-f4a1-51cb-e422c56281cc@quicinc.com>

On Tue Nov 28, 2023 at 9:14 AM CET, Vikash Garodia wrote:
>
> On 11/24/2023 9:26 PM, Luca Weiss wrote:
> > On Fri Nov 24, 2023 at 2:35 PM CET, Vikash Garodia wrote:
> >>
> >>
> >> On 11/24/2023 6:23 PM, Dmitry Baryshkov wrote:
> >>> On Fri, 24 Nov 2023 at 14:30, Vikash Garodia <quic_vgarodia@quicinc.c=
om> wrote:
> >>>>
> >>>> On 11/24/2023 5:05 PM, Luca Weiss wrote:
> >>>>> On Fri Nov 24, 2023 at 7:38 AM CET, Vikash Garodia wrote:
> >>>>>>
> >>>>>> On 11/22/2023 7:50 PM, Luca Weiss wrote:
> >>>>>>> On Wed Nov 22, 2023 at 2:17 PM CET, Vikash Garodia wrote:
> >>>>>>>>
> >>>>>>>> On 10/2/2023 7:50 PM, Luca Weiss wrote:
> >>>>>>>>> If the video-firmware node is present, the venus driver assumes=
 we're on
> >>>>>>>>> a system that doesn't use TZ for starting venus, like on Chrome=
OS
> >>>>>>>>> devices.
> >>>>>>>>>
> >>>>>>>>> Move the video-firmware node to chrome-common.dtsi so we can us=
e venus
> >>>>>>>>> on a non-ChromeOS devices.
> >>>>>>>>>
> >>>>>>>>> At the same time also disable the venus node by default in the =
dtsi,
> >>>>>>>>> like it's done on other SoCs.
> >>>>>>>>>
> >>>>>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>>>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >>>>>>>>> ---
> >>>>>>>>>  arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 8 +++++++=
+
> >>>>>>>>>  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 6 ++----
> >>>>>>>>>  2 files changed, 10 insertions(+), 4 deletions(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi=
 b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> >>>>>>>>> index 5d462ae14ba1..cd491e46666d 100644
> >>>>>>>>> --- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> >>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> >>>>>>>>> @@ -104,6 +104,14 @@ &scm {
> >>>>>>>>>   dma-coherent;
> >>>>>>>>>  };
> >>>>>>>>>
> >>>>>>>>> +&venus {
> >>>>>>>>> + status =3D "okay";
> >>>>>>>>> +
> >>>>>>>>> + video-firmware {
> >>>>>>>>> +         iommus =3D <&apps_smmu 0x21a2 0x0>;
> >>>>>>>>> + };
> >>>>>>>>> +};
> >>>>>>>>> +
> >>>>>>>>>  &watchdog {
> >>>>>>>>>   status =3D "okay";
> >>>>>>>>>  };
> >>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/=
boot/dts/qcom/sc7280.dtsi
> >>>>>>>>> index 66f1eb83cca7..fa53f54d4675 100644
> >>>>>>>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>>>>>>>> @@ -3740,6 +3740,8 @@ venus: video-codec@aa00000 {
> >>>>>>>>>                            <&apps_smmu 0x2184 0x20>;
> >>>>>> 0x2184 is a secure SID. I think qcm6490-fairphone-fp5.dts needs to=
 override the
> >>>>>> iommus property as well to retain only the non secure SID i.e 0x21=
80 ? I am
> >>>>>> seeing below crash
> >>>>>>
> >>>>>> Call trace:
> >>>>>> [   47.663593]  qcom_smmu_write_s2cr+0x64/0xa4
> >>>>>> [   47.663616]  arm_smmu_attach_dev+0x120/0x284
> >>>>>> [   47.663647]  __iommu_attach_device+0x24/0xf8
> >>>>>> [   47.676845]  __iommu_device_set_domain+0x70/0xd0
> >>>>>> [   47.681632]  __iommu_group_set_domain_internal+0x60/0x1b4
> >>>>>> [   47.687218]  iommu_setup_default_domain+0x358/0x418
> >>>>>> [   47.692258]  __iommu_probe_device+0x3e4/0x404
> >>>>>>
> >>>>>> Could you please reconfirm if Video SID 0x2184 (and mask) is allow=
ed by the
> >>>>>> qcm6490-fairphone-fp5 hardware having TZ ?
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> On FP5 it seems it's no problem to have both SIDs in there, probe a=
nd
> >>>>> using venus appears to work fine.
> >>>>>
> >>>>> Are you using different firmware than QCM6490.LA.3.0 on the device =
where
> >>>>> you tested this?
> >>>> I was testing this on RB3 board which uses firmware [1].
> >>>
> >>> There is something wrong here.
> >>>
> >>> RB3 board uses venus-5.2
> >>> RB5 board uses vpu-1.0
> >>> Only sc7280 uses vpu-2.0
> >>
> >> Tested on QCM6490 IDP board, which is QCOM internal board similar to R=
B3 gen2.
> >=20
> > In any case, I don't know much about the venus & iommu setup here. I ca=
n
> > try removing the 0x2184 SID and test if venus still works on FP5.
>
> Please remove 0x2184 SID and confirm specifically encoder works. This SID=
 is for
> encoder.
>
> > Also should the chromebooks keep that iommu entry or not?
> Chrome-common can have 0x2184 since its no-TZ based solution. So in sc728=
0.dtsi,
> you can keep the default SID i.e 0x2180 (with respective mask) and in
> chrome-common, we can override the iommus property with 0x2180 and 0x2184=
.

Hi Vikash,

I'm moving 0x2184 to chrome-common in v3 but I couldn't test venus
encoding myself since I just don't know *how* to test it.

Would be nice if you could share how you test venus (decoding &
encoding) since seemingly nobody (at least in the postmarketOS
community) seems to know how to test/use it properly. See also
https://wiki.postmarketos.org/wiki/Hardware_video_acceleration

Regards
Luca

>
> Regards,
> Vikash
>
> > Regards
> > Luca
> >=20
> >>
> >>>>
> >>>> Regards,
> >>>> Vikash
> >>>>
> >>>> [1]
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmw=
are.git/tree/qcom/vpu-2.0
> >>>>
> >>>>>>
> >>>>>>>>>                   memory-region =3D <&video_mem>;
> >>>>>>>>>
> >>>>>>>>> +                 status =3D "disabled";
> >>>>>>>>> +
> >>>>>>>>>                   video-decoder {
> >>>>>>>>>                           compatible =3D "venus-decoder";
> >>>>>>>>>                   };
> >>>>>>>>> @@ -3748,10 +3750,6 @@ video-encoder {
> >>>>>>>>>                           compatible =3D "venus-encoder";
> >>>>>>>>>                   };
> >>>>>>>>>
> >>>>>>>>> -                 video-firmware {
> >>>>>>>>> -                         iommus =3D <&apps_smmu 0x21a2 0x0>;
> >>>>>>>>> -                 };
> >>>>>>>>> -
> >>>>>>>>>                   venus_opp_table: opp-table {
> >>>>>>>>>                           compatible =3D "operating-points-v2";
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>> Changes look good. Is this tested on SC7280 ?
> >>>>>>>
> >>>>>>> Hi Vikash,
> >>>>>>>
> >>>>>>> I didn't test it myself on sc7280 (just qcm6490-fp5) but dtx_diff
> >>>>>>> reports no differences except for status =3D okay property being =
added, so
> >>>>>>> there should be no change on those boards. See below.
> >>>>>>>
> >>>>>>> Regards
> >>>>>>> Luca
> >>>>>>
> >>>>>> I tested on SC7280 (herobrine) and all good.
> >>>>>
> >>>>> Great, thanks!
> >>>>>
> >>>>> Regards
> >>>>> Luca
> >>>>>
> >>>>>>
> >>>>>> Regards,
> >>>>>> Vikash
> >>>>>
> >>>>
> >>>
> >>>
> >=20


