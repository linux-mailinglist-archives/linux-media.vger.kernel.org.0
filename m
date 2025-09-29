Return-Path: <linux-media+bounces-43312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BF9BA852B
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 09:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE531189C7B4
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 07:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0B225FA2D;
	Mon, 29 Sep 2025 07:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQfDWEqA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3D22116F6
	for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 07:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759132349; cv=none; b=WRvMJl7CXx0akHOmka+jIEJeWQr83iHlA4LnoVbfah0/eM/zSg/a5FvylvhAt7H+MfVre3UhRJ5dyQCDPjYDSanlh7s2kFDkeEPVfTMY3bhBeK+enMZkt9scfPgwrkyF/ysba07GqkD2FfsTfn+8bYpQwdMILJ0eXpaCNhQqUqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759132349; c=relaxed/simple;
	bh=OYl49xeEXpiI0RagBTycUAoRztRBz7XsSTezk35V2Hc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PlOObufUZXcGc2pKyWk5TicVE7/BTpdgwISjRvoj4sXuJ1Y5mwELdLgiAtU5iWKeLDbUqEKPNw5ubplTyYRg+3jh3kaLEqeB9AtcsQtLlWcemoEB3jmHCCW6oZ9TBoMayJadNj+FgyLxaobg1AwUlGrdqgoeJZSDq3PdTsLC6u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQfDWEqA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SMvk48028043
	for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 07:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/3bhZMKmMUmaTU+3BKHI6HH3EfslIEObhFbsznu1nTQ=; b=gQfDWEqA6pW8PD/O
	PKx7NeY2Dh0Ed/hKDl9I0dGNTt9/XWKHn4rXnzNpbQIWSwHqQ7WIDQvYpYZ0XXee
	VNyPBLu13ODcsT76GqdOqifsEnJM7LFkrPIUMtp7flEmZqIrd8ZOsAop3eBYuzGf
	3Or8LvKCy/WE5W2xFZQIzbCudYRNKzzOi8etky94e5PwzZfSiNaWZPqsU87pvIuX
	TJmSHMjNtfkSpEXftwCJZuSDhGTOSnzx58FEg8evOmcD+fI4OTJRdzPARKWOpddw
	7p3YTQfWSfFJYFiOogqjRfcBLF+m7E5Cg0Iwi2DrOUf8xrzL68hOm7Z+AFjxk7i+
	pgX5bg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5meg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 07:52:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e1015c48c8so18344911cf.1
        for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 00:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759132345; x=1759737145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3bhZMKmMUmaTU+3BKHI6HH3EfslIEObhFbsznu1nTQ=;
        b=WmPSW/mPYM2uZ+Rs+aZpHJcUTSNeqYJ3i2mX4tURPhuRknQnsvIfWb4c74bwBv7azF
         Zt1sLi4w5IwEqvyK7kC5GntBqkfpBaTm4yi1qdXLm5ZXaLGjCHgSUqvcuG6k0QfeeAY5
         L3fdb2kyphrIfyKz3e6sVyVCnH+ZZ0Rqwxw9qguoEoZtxYhkyEy27zUlcf2KPEkAvPjG
         06AHtUeTTHflyk8Hf3g09cBifJ9Ld10eaUCGgr6O1HFYE8SI1IuA9kjXdqoY65wwYZ/6
         HIjSSoZiFKcGEEXG4jjfbnerzZPKmuZCq4HYOJqEkph6/qF/tV5ZbxAx6+kpTvv43rNp
         Cz5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcTsufzw54m/v4GVd9a7mJialLHNAh/fH1/kgViu0O79i3tHa6YfSxXWUBoMdxQMXVD4NYbMZ3g0nyBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvTO65IiRhNuhe1ZY3NaRl4hX5FwnliLs1WeSu+frgtK96Gy1H
	5FTRvCugwqxwh+QbDJYBj6QH8cBxCKh2ckiXYuD7FpH3k/EQV19dltDboZCqjfGF2VNGkahbh6N
	42eqI/b08k/rxxpkDhSxoT0t3D5S8PsI9wFqCBetu+aa4SLjRoeoq7+nDtPvnVdcxNqQvWvP7S3
	10kmUwLbJy3rZqKKH0UQ0vt9jhvZ1ClIxlbW1pQWm1
X-Gm-Gg: ASbGncvGCAS58l6G5fjrKY5JHlXmvqyvTo0GqLf3w2CWyb/0NKQahBXG25uP5UTpRCG
	YxXzF0GM93sMegMV1a/sXBNqlfLnj0Y0AfUrARHENeHiZ54gHqtAZBFE2mVPCOUT9bPzXozeGQ+
	uVTtlSJM0oli1vtbQwCmxyjNhFBoJXWalI+Qvwt6YPpopx9fh5GSTyq92lXbgj/ES/Qs+M3yKHi
	y/hfE8YWbg=
X-Received: by 2002:a05:622a:19a7:b0:4d0:b31:e63d with SMTP id d75a77b69052e-4ded5b24c34mr111775091cf.35.1759132345311;
        Mon, 29 Sep 2025 00:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwO8ztuFh5yRJFV/G0DsFEp5rqg88Rqt4skhMXTedmpDojowQVpiAMDQ3BA2b1xWzYqlOph04xzyNszTgwz3s=
X-Received: by 2002:a05:622a:19a7:b0:4d0:b31:e63d with SMTP id
 d75a77b69052e-4ded5b24c34mr111774841cf.35.1759132344766; Mon, 29 Sep 2025
 00:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
 <LAizvAKB21pYsBNwprUFqHcf56-GeWV5IFNd-yzGM688kLehFGW9bQ-LgO3uS6zSt5cXJKjwg8HAGa2ev9E4mw==@protonmail.internalid>
 <20250926073421.17408-4-loic.poulain@oss.qualcomm.com> <35402c21-bef8-44ac-844b-1cc97ff83c6f@kernel.org>
In-Reply-To: <35402c21-bef8-44ac-844b-1cc97ff83c6f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 09:52:14 +0200
X-Gm-Features: AS18NWDOSHkEL4yXiSPWpTN451IiyKugWRO9I8AyA7SxoQ6f_P5gemouvrFXM_s
Message-ID: <CAFEp6-3=5FLnn+uhJDaS4=szmeM6tLqoPCtweCLMV9y9vEtkig@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qrb2210-rb1: Add overlay for
 vision mezzanine
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
        robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: c0YrLynGMweGi-fIVzzkdnWBecQIvo8X
X-Proofpoint-ORIG-GUID: c0YrLynGMweGi-fIVzzkdnWBecQIvo8X
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68da3aba cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MUhHvKHzP_bnBK4GCF0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX3oAI92pcRXC3
 D/Id6wB6KY3pVolDwkD/Do78P6lQ83sWnwji9/44HYns+ybDwDC6KgMezdp/5W56It2EIksr/uG
 qfR+/gGSFCiX9byiuWh+A2lovAlnEsI51DT6r6ZeZUe+rleOXrx68g7b7nonpijCPbAad1ZeaXP
 eWbJhMZNRyFa4jxJSX9uXfjDfQ5rhYOjPUsnIbsxWplVrOcN+QBu/L92sDY6E9KWV6FxEob2I3V
 EZNhVpdylTH1A+OrG1Et9oOna8Sn2j87+NS1Nwmrl0LKlWeoWCDu30nW/+uGsBskdsXMhBJYZKD
 WMmu01yALNGQXUFxiCkLLrRTCQ3QNBJXY1o0ZDjBZyO0FehGOJVHFx4+vNGd8OfrJL6gOqqjZcu
 +LHAjJFVFbjlBItRIhCFFBlQFpVkkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

Hi Bryan,

On Sat, Sep 27, 2025 at 12:37=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> =
wrote:
>
> On 26/09/2025 08:34, Loic Poulain wrote:
> > This initial version includes support for OV9282 camera sensor.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   arch/arm64/boot/dts/qcom/Makefile             |  5 ++
> >   .../qcom/qrb2210-rb1-vision-mezzanine.dtso    | 76 ++++++++++++++++++=
+
> >   2 files changed, 81 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzan=
ine.dtso
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qc=
om/Makefile
> > index d7f22476d510..bee021efc249 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -138,6 +138,11 @@ dtb-$(CONFIG_ARCH_QCOM)  +=3D qcs9100-ride.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qcs9100-ride-r3.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qdu1000-idp.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qrb2210-rb1.dtb
> > +
> > +qrb2210-rb1-vision-mezzanine-dtbs    :=3D qrb2210-rb1.dtb qrb2210-rb1-=
vision-mezzanine.dtbo
> > +
> > +dtb-$(CONFIG_ARCH_QCOM)      +=3D qrb2210-rb1-vision-mezzanine.dtb
> > +
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qrb4210-rb2.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qrb5165-rb5.dtb
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso=
 b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
> > new file mode 100644
> > index 000000000000..3b6261131b75
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
> > @@ -0,0 +1,76 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/clock/qcom,gcc-qcm2290.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +&tlmm {
> > +     cam0a_default: cam0a-default-state {
> > +             pins =3D "gpio28";
> > +             function =3D "cam_mclk";
> > +             drive-strength =3D <16>;
> > +             bias-disable;
> > +     };
> > +};
> > +
> > +&pm8008 {
> > +     status =3D "okay";
> > +};
> > +
> > +&camss {
> > +     status =3D "okay";
> > +
> > +     vdd-csiphy-1p2-supply =3D <&pm4125_l5>;
> > +     vdd-csiphy-1p8-supply =3D <&pm4125_l13>;
> > +
> > +     ports {
> > +             port@0 {
> > +                     csiphy0_ep: endpoint {
> > +                             data-lanes =3D <0 1>;
> > +                             remote-endpoint =3D <&ov9282_ep>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&cci {
> > +     status =3D "okay";
> > +};
> > +
> > +&cci_i2c1 {
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +
> > +     /* Vision Mezzanine DIP3-1 must be ON (Selects camera CAM0A&B) */
> > +     camera@60 {
> > +             compatible =3D "ovti,ov9282";
> > +             reg =3D <0x60>;
> > +
> > +             /* Note: Reset is active-low but ov9282 driver logic is i=
nverted... */
> > +             reset-gpios =3D <&tlmm 18 GPIO_ACTIVE_LOW>;
>
> This comment is confusing me a bit.
>
> Shouldn't it be that the driver polarity gets fixed and the DTS just
> declares the correct thing ?

Yes, as Konrad pointed out, this comment is no longer relevant in V2.
I overlooked removing it when applying his suggested fix to the driver.


>
> > +
> > +             pinctrl-0 =3D <&cam0a_default>;
> > +             pinctrl-names =3D "default";
> > +
> > +             clocks =3D <&gcc GCC_CAMSS_MCLK3_CLK>;
> > +             assigned-clocks =3D <&gcc GCC_CAMSS_MCLK3_CLK>;
> > +             assigned-clock-rates =3D <24000000>;
> > +
> > +             avdd-supply =3D <&vreg_l3p>;
> > +             dvdd-supply =3D <&vreg_l1p>;
> > +             dovdd-supply =3D <&vreg_l7p>;
> > +
> > +             port {
> > +                     ov9282_ep: endpoint {
> > +                             link-frequencies =3D /bits/ 64 <400000000=
>;
> > +                             data-lanes =3D <1 2>;
> > +                             remote-endpoint =3D <&csiphy0_ep>;
> > +                        };
> > +                };
> > +     };
> > +};
> > --
> > 2.34.1
> >
> >
>
> ---
> bod

