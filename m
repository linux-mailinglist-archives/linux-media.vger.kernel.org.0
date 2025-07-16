Return-Path: <linux-media+bounces-37856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFB8B071E4
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 11:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01DF2582426
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 09:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E52D2F2C69;
	Wed, 16 Jul 2025 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Age+C2m5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606092EF646
	for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 09:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752658589; cv=none; b=pHpg0Pn5SD0B7NeuMHErQGZdIQ5fk/Bhy4hAzGYIt+GgboAIkOGoaLEWTB05zBPErj9u/OgNRatbhBA9mcaYiDM1+IedHh8CM1Y5o1NViMaKEZiL3+abHZ3nnrIuFKn0DdcqpHQ4e7QC0KlUHjcr83BoL0/jJ3C6q1wHQASVWc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752658589; c=relaxed/simple;
	bh=EExDnkbLNMmZL89WtYKR15I/FKUZ6Ju6W3z8pst4w7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a6HeAadCv5hHpKgPAe6D2txRp3E8oP4DNBAJDfAekqkTmfu06eif2/1NgoO5CAWr7jaRpdn4GLVrzUMtIMfa8pnMHQWtC5h2g4qxVwl2Wgj2B0qE+x9EIWnPRrqOaoI8yWMbBetTxQrIJmo20AtLkNezN0+HIZ4D3G7xDZIIPo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Age+C2m5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G6GtWW025752
	for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 09:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pPPqdCVa3SCxzu4lrBFnAzC+1OUqaDheNt9bAVS/Gg4=; b=Age+C2m5BTmyBzTR
	mCfV77xZzaG+hjtpbX1GfpKwgo3tjkjZJ7nW5HwKlRPm+H6kPXIjYilQl5HLlxwT
	/C+wlDQjj1qorBdQ9jUragYA0YbNDz60zHhHc7ookMQQAgbvlG+q+PDl0FHQtdFF
	c2onUBesW56g8RnZSOZRwG3IwC7VZ1JSHMf+LL1S2prRU72sJhg8JtJrynyQgnaL
	5AMKVeDOLzTyU4Hie7MyG4EFks8tnMfMZFpUPZU3RD1fDHGHZiaEKBKLUBHOI2hX
	zQ8Tt9jNTQ01YGM/Wn6UlMhv8mfC6D6VkCs4tVEinNy77P55fMi9lI+nbBzGbQ41
	9W4VhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy355u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 09:36:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e095227f5dso662297985a.1
        for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 02:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752658586; x=1753263386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPPqdCVa3SCxzu4lrBFnAzC+1OUqaDheNt9bAVS/Gg4=;
        b=Qd69KTNK83CPGgU0Qe6SPJA0/4mAw/c/nLoUf6UNcPej6zuYEEJLUAN//8wU/sg0m8
         UNE6pjacg+erdgSl9NnmhXVDeIvCqOCFuN26nG4bdkfORC+NedvwTdJOVcJNx3xjzYXV
         1J5/AhY1HvLwAe6rcEF7sbteDTuKlP9oRNM3Rixr+/JsazXFie/OtIFsh7iRvLldfwg+
         0CNjIGkQIWmdX3Ji0MBA2WVBMQ9onCSKdePl2jpO7LeXb6KFvOKFO/otFS8yWqfaXWbp
         DdDNgi4/Bwj+lbEZbBDAtOvVDTQkiMOebX+H7WlbrOl7c14xPkNZUOoHCwM92zFX0aRB
         nanw==
X-Forwarded-Encrypted: i=1; AJvYcCU/NAZf6fhv2Y17oPP10FEVfndZ7X/I6jbRjpVSUNwsFrBLg3lJXcChl0f/WN/ljXkpTpZEEef7cKIOVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM8JBqdqlOx7YGKTBFPrQoRt/whbetP0l8S3q7JzUQeM04/5H8
	5ODlfeLTkdDqSxChrxsuBLYWM39tIaq1rXWHCyti4kszd/OMVfNu2OozKT4d83/6adYcx0dkh9H
	amf/qlpT/6NrVad/RNCg/D1eStZjlTmHCHp2p6dqw5WSeu7TNeo/UIdrZ5aPBkvJMzEg7Tbdn9O
	BJLJ7aXbIjBh3jJOlwt5ywrojEsLfGZgzxi4fdKJo9
X-Gm-Gg: ASbGncu47sNTY9++Jc7mwuTlAHn5R1MUGlrVU/upo5i+K6G5KpmQ81A464yfCXokTh2
	jSKs73m3fflXgjZG0lM9VAu+F7fGsAxMjm1wOgPp0RS3wMsn3p2VMI5GMgHdlg4P/0ps+JKJj68
	cbG1RiBjUaG1uCu0qiMevaj7E=
X-Received: by 2002:a05:620a:1929:b0:7d3:f17d:10c8 with SMTP id af79cd13be357-7e342b5d72fmr280287385a.43.1752658585777;
        Wed, 16 Jul 2025 02:36:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXr4m/rEAU00SH9DRFKQSi0AhmxOWUFx/f1zI1Wgtyyg52FTZL3NGdZg2QnnuAtYu79yBXEICghW2VnnD/x6Q=
X-Received: by 2002:a05:620a:1929:b0:7d3:f17d:10c8 with SMTP id
 af79cd13be357-7e342b5d72fmr280284985a.43.1752658585313; Wed, 16 Jul 2025
 02:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-4-0bc5da82f526@linaro.org>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-4-0bc5da82f526@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 11:36:14 +0200
X-Gm-Features: Ac12FXxMF_KwmB0e7d8OZI-PBqUi87qmKKbR1OTMm1-rntep41MJ3C1KnX9YimY
Message-ID: <CAFEp6-0hDqgYsjOy2mCC6ssK2LkMM0z7L_szS+M_wSMeMe3pMg@mail.gmail.com>
Subject: Re: [PATCH v7 04/15] media: qcom: camss: Add support for PHY API devices
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA4NSBTYWx0ZWRfX3c8uCCq4hXeH
 gTHbEi2OEeBHaRmYfqAqVYueNgT7VKkqyzTj/wWJIwUktJ1tQwq0dpyJby1vqQol0LQrcacyC8Q
 1niPAPzgJQByEPgTX/FivJVadHop9eLRdzZhj0ShvgIs2NCTxy1vz2bFaob0RN+G64d4VDL/kdW
 RRBtc5kChz25fjpGqySWiAwrj4b+eEkpk7DnDBJAFO0KF6N3NwshGWaCT/ThoLv+r3ukz9RqJLz
 Lm80bHbWW/HdV4aK4rb6BH+1zSg8TC1DHeCq45MVOh0Rji5EO7S8BaQ9eiuQLGjH/LGHo+SIAH3
 ekFpMyIwLbvG6/wnIbJxZFOWizyxTJO9bbmgNQU5Ckh4LprVz4Pw/go0wfJcIBjAhR/0sjpNbar
 HiD9ulQmEG/7yOB/ExJbg4D+buWyuLuUXTo9kiAsDRuIZn67cXGIaloIO15WaP+zKV8ZKAOq
X-Proofpoint-GUID: 53W06fv_5hnmORuvNsz0egv__jk1W3mZ
X-Proofpoint-ORIG-GUID: 53W06fv_5hnmORuvNsz0egv__jk1W3mZ
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=6877729b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=KKAkSRfTAAAA:8 a=M0yTX6snB5HZV_fW_cUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160085

Hi Bryan,

On Fri, Jul 11, 2025 at 2:59=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add the ability to use a PHY pointer which interacts with the standard PH=
Y
> API.
>
> In the first instance the code will try to use the new PHY interface. If =
no
> PHYs are present in the DT then the legacy method will be attempted.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/Kconfig        |   1 +
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 157 +++++++++++++++++=
+++---
>  drivers/media/platform/qcom/camss/camss-csiphy.h |   7 +
>  drivers/media/platform/qcom/camss/camss.c        |  56 ++++++--
>  4 files changed, 194 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index 4eda48cb1adf049a7fb6cb59b9da3c0870fe57f4..1edc5e5a1829e033812bbadfa=
0de00625fd0c93a 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,3 +7,4 @@ config VIDEO_QCOM_CAMSS
>         select VIDEO_V4L2_SUBDEV_API
>         select VIDEOBUF2_DMA_SG
>         select V4L2_FWNODE
> +       select PHY_QCOM_MIPI_CSI2
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index 2de97f58f9ae4f91e8bba39dcadf92bea8cf6f73..185a51aa73d102b9555e550d8=
041c25c8adf9af8 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
[...]
> +int msm_csiphy_subdev_init_legacy(struct camss *camss,
> +                                 struct csiphy_device *csiphy,
> +                                 const struct camss_subdev_resources *re=
s, u8 id);
> +
>  int msm_csiphy_subdev_init(struct camss *camss,
>                            struct csiphy_device *csiphy,
>                            const struct camss_subdev_resources *res, u8 i=
d);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c8103f8b754a29a63e32bb7bc213bfe14b4e0748..1817fa7f922b3b30168655bff=
bcd629feeec167a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3092,18 +3092,40 @@ static int camss_init_subdevices(struct camss *ca=
mss)
>  {
>         struct platform_device *pdev =3D to_platform_device(camss->dev);
>         const struct camss_resources *res =3D camss->res;
> +       struct device_node *phy_np;
>         unsigned int i;
>         int ret;
>
>         for (i =3D 0; i < camss->res->csiphy_num; i++) {
> -               ret =3D msm_csiphy_subdev_init(camss, &camss->csiphy[i],
> -                                            &res->csiphy_res[i],
> -                                            res->csiphy_res[i].csiphy.id=
);
> -               if (ret < 0) {
> -                       dev_err(camss->dev,
> -                               "Failed to init csiphy%d sub-device: %d\n=
",
> -                               i, ret);
> -                       return ret;
> +               phy_np =3D of_parse_phandle(pdev->dev.of_node, "phys", i)=
;
> +               if (phy_np && of_device_is_available(phy_np)) {
> +                       ret =3D msm_csiphy_subdev_init(camss, &camss->csi=
phy[i],
> +                                                    &res->csiphy_res[i],
> +                                                    res->csiphy_res[i].c=
siphy.id);
> +                       if (ret < 0) {
> +                               dev_err(camss->dev,
> +                                       "Failed to init csiphy%d sub-devi=
ce: %d\n",
> +                                       i, ret);
> +                               return ret;
> +                       }
> +               }
> +       }
> +
> +       if (!phy_np) {
> +               if (!res->legacy_phy)
> +                       return -ENODEV;
> +
> +               for (i =3D 0; i < camss->res->csiphy_num; i++) {
> +                       ret =3D msm_csiphy_subdev_init_legacy(camss, &cam=
ss->csiphy[i],
> +                                                           &res->csiphy_=
res[i],
> +                                                           res->csiphy_r=
es[i].csiphy.id);
> +                       if (ret < 0) {
> +                               dev_err(camss->dev,
> +                                       "Failed to init csiphy%d sub-devi=
ce: %d\n",
> +                                       i, ret);
> +                               return ret;
> +                       }
> +                       camss->csiphy[i].phy =3D ERR_PTR(-ENODEV);
>                 }

So what happens if we have `phy_np` and `!of_device_is_available`, we
just continue without any phy initialized?

>         }
>
> @@ -3181,6 +3203,9 @@ static int camss_link_entities(struct camss *camss)
>
>         for (i =3D 0; i < camss->res->csiphy_num; i++) {
>                 for (j =3D 0; j < camss->res->csid_num; j++) {
> +                       if (!camss->csiphy[i].phy)
> +                               continue;
> +
>                         ret =3D media_create_pad_link(&camss->csiphy[i].s=
ubdev.entity,
>                                                     MSM_CSIPHY_PAD_SRC,
>                                                     &camss->csid[j].subde=
v.entity,
> @@ -3290,6 +3315,9 @@ static int camss_register_entities(struct camss *ca=
mss)
>         int ret;
>
>         for (i =3D 0; i < camss->res->csiphy_num; i++) {
> +               if (!camss->csiphy[i].phy)
> +                       continue;
> +
>                 ret =3D msm_csiphy_register_entity(&camss->csiphy[i],
>                                                  &camss->v4l2_dev);
>                 if (ret < 0) {
> @@ -3345,8 +3373,10 @@ static int camss_register_entities(struct camss *c=
amss)
>
>         i =3D camss->res->csiphy_num;
>  err_reg_csiphy:
> -       for (i--; i >=3D 0; i--)
> -               msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +       for (i--; i >=3D 0; i--) {
> +               if (camss->csiphy[i].phy)
> +                       msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +       }
>
>         return ret;
>  }
> @@ -3361,8 +3391,10 @@ static void camss_unregister_entities(struct camss=
 *camss)
>  {
>         unsigned int i;
>
> -       for (i =3D 0; i < camss->res->csiphy_num; i++)
> -               msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +       for (i =3D 0; i < camss->res->csiphy_num; i++) {
> +               if (camss->csiphy[i].phy)
> +                       msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +       }
>
>         for (i =3D 0; i < camss->res->csid_num; i++)
>                 msm_csid_unregister_entity(&camss->csid[i]);
>
> --
> 2.49.0
>
>

