Return-Path: <linux-media+bounces-30359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9120EA90732
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 17:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 691ED7A151B
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 15:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62D81FECB0;
	Wed, 16 Apr 2025 15:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLY9uZYZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72A01FCFF0
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815720; cv=none; b=e9QB4kDPqnkrWNKRN54IdWU0JLKfoFxjnX+z1f6xeeE6oA45qeNVmOLNSeQMqBNIeASdBrC7YTrdSfQzxTQ7lWxKAnceEYgnUELfaYPxUzHdLCfvBPgtNJ5ymoCeDTF/0fgVJ0Xewh9Zq8wG/3wQungONdOcBTYB/gjOurnP65M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815720; c=relaxed/simple;
	bh=75khC+zUxMQHpAuSIar1FGlmT6yt20jE/My1l7urSYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpnPW5hPmakgKd4lCxREEONaMlDENxVJUGb4UcUhWROByTb4+F4qU8hy6IfGFhWyRc1ig196db/yarvnt1jamXDqq8ZZMbSCmQ0xoi4KKdHQObjc3kAgoGf9fFhATf4+LSjr7SSMDpjPgoKfBMfELf+SPhPJJlkGWOal8ht3LjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLY9uZYZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9nInF022075
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 15:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/sM7HZs5o8N/X1bsrNjj+lvilwYGw+kvYnGxXH8LTws=; b=PLY9uZYZ+nXGDROO
	VKJP0UIA+3IQIhBCA6RB2l8Eoqf2VLSIcRNf9zmoIuS0Dk5wkvy19iUnh0rfEx1e
	4EfYiChCbQr0iuCnVjR/hJ/XHdeXV1cgUzYbpOkKk7Me1KxiFi5phO8/+a5tq5e3
	IC/wgq5WOPt6d+zVP/Xjub64uFEdb+on09IqpPAuqBkWmBSMEqTYI4mGlv0rSmde
	47cMxAI6BvSX2JZvLjlVN4B5tIbHYVk3FDJ69oURS/7uDWcbGIcd/Vv4s1KDWyge
	UC9mcMnD1rMJ/yE3a1fr41cYJaSuV3TxFOIKSAU5ND8jZfynSUDLQEAGzW3vKkwa
	hhv8zw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpuqmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 15:01:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5b9333642so781954285a.3
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 08:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815714; x=1745420514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sM7HZs5o8N/X1bsrNjj+lvilwYGw+kvYnGxXH8LTws=;
        b=Ff0H8IDED+ybNn5xvP2B7vxL0RduFv020g+jHH4HUiuwrTJAJlAKX46f1JzEWwMus1
         vBu/gjKLC1175qleQglt1e/12iUk0sIfhABHnCpSz602fmkmD4dTIidLlym1EFxtgMZj
         auhb/XjhcpIY8bzfJ1Py87fz7XG5yJ1LxbQkZ0SNC+49s/r690nudYSfYdZy3CkuWHx5
         d16YNOSA8YUCe1EMGdF/4SdYVzKXos12/jiiBJ6UUv/aCg872sEOGlZbw+u8S65Ze+di
         QRi32Gda8m/wyBVDZv4HTcBVnaWjN/RKs168bLc06apiCQ3U+w7axedwQPWU1Wd4Onxr
         P0Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWdmcje4/yHB+yoIoihxDsbhvUsIBKh/ZvijVsTKPcRJd7Qc2k9Le75mSUyDqFNyMHRCNXsrjb28heEdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YySnI0RP+Pl+r0oQIpAevGAWxzgoGlCDGUy79mL5tk15GuC3cUA
	l69JSajyFNsKUf1wnDmBKMrDa1MnWln5qipU2ATvSVJVvFN7CC6hML2+I5CMkjawVkbD/6oScI/
	M8AydX7oVNV9O/rP6m0iDZCsKYPQfafbawMh2oLuHB6PUvdI1Eiv/wR2qeIOADW2f7wpalynuBF
	2whJuvP0MXBEIgCfHJs+n8tDpd17bNggyspnbs
X-Gm-Gg: ASbGncuyM/XH/fQ3jNPRHgAdn6HmatbZ6pOQygYjLMWeGwsobDXAskOR4Hw55N4tmwI
	e2IFWGgw8H7WwSoX0C0oayO573FAs6bQOK022Y8sM9ixbFQ4+C6EfIGByb5hm2UXkELjrZj0=
X-Received: by 2002:a05:6214:dcc:b0:6e8:fe60:fdeb with SMTP id 6a1803df08f44-6f2b2f30a5dmr30086436d6.17.1744815714337;
        Wed, 16 Apr 2025 08:01:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPdLuzk7/CU2LY/4LSlgvj1YT8WUyMkukjDJEnoQxJhTTig5RTwqFxGtUJv8uNIJqmBOBIoJ15MAW/YRMkMJw=
X-Received: by 2002:a05:6214:dcc:b0:6e8:fe60:fdeb with SMTP id
 6a1803df08f44-6f2b2f30a5dmr30085976d6.17.1744815713893; Wed, 16 Apr 2025
 08:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
 <20250416120908.206873-6-loic.poulain@oss.qualcomm.com> <c57084c4-189a-484f-af2f-8e4181f547fb@oss.qualcomm.com>
In-Reply-To: <c57084c4-189a-484f-af2f-8e4181f547fb@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 17:01:42 +0200
X-Gm-Features: ATxdqUErmQIrzn62w1Xb5N3d8Ov7Fc_Nkbi4kYygWJeHn7qIiuYSutOBzOQ4cCA
Message-ID: <CAFEp6-0tZQowmDrEsHgU1Ncx6jR2f=Lp259vaj3mefc-9BfUbg@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: jnanohBpWhXSxZA5balNDoVu1MDvC-Z0
X-Proofpoint-GUID: jnanohBpWhXSxZA5balNDoVu1MDvC-Z0
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67ffc663 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ncdiEfFe64kH1Y8Ome4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160123

On Wed, Apr 16, 2025 at 4:46=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/16/25 2:09 PM, Loic Poulain wrote:
> > Add node for the QCM2290 camera subsystem.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 93 +++++++++++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dt=
s/qcom/qcm2290.dtsi
> > index f0746123e594..4b81e721e50c 100644
> > --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > @@ -1579,6 +1579,99 @@ adreno_smmu: iommu@59a0000 {
> >                       #iommu-cells =3D <2>;
> >               };
> >
> > +             camss: camss@5c52000 {
>
> @5c6e000
> (first reg entry)

Ah right, I reordered reg to be aligned with other camss drivers.
Should I keep that order (and update node name) or reorder with phy
lower addresses first (PHYs)?

>
> > +                     compatible =3D "qcom,qcm2290-camss";
> > +
> > +                     reg =3D <0 0x5c6e000 0 0x1000>,
> > +                           <0 0x5c75000 0 0x1000>,
> > +                           <0 0x5c52000 0 0x1000>,
> > +                           <0 0x5c53000 0 0x1000>,
> > +                           <0 0x5c6f000 0 0x4000>,
> > +                           <0 0x5c76000 0 0x4000>;
> > +                     reg-names =3D "csid0",
> > +                                 "csid1",
> > +                                 "csiphy0",
> > +                                 "csiphy1",
> > +                                 "vfe0",
> > +                                 "vfe1";
>
> we also have a pair of TPGs at 0x5c6[68]000 - I think it would be good to
> describe them from the get-go

Indeed, will do.

>
> > +
> > +                     interrupts =3D <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>=
,
> > +                                  <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
> > +                                  <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>,
> > +                                  <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>,
> > +                                  <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
> > +                                  <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
>
> the two TPGs would have IRQs 309 and 310
>
> [...]
>
> > +                     interconnects =3D <&bimc MASTER_APPSS_PROC RPM_AL=
WAYS_TAG
> > +                                      &config_noc SLAVE_CAMERA_CFG RPM=
_ALWAYS_TAG>,
>
> This one should get a RPM_ACTIVE_TAG instead, on both endpoints

ok, thanks.

