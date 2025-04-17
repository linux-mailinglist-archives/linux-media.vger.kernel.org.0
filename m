Return-Path: <linux-media+bounces-30496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6069A92BDF
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 21:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D32A1B668EF
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 19:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591B31FFC7B;
	Thu, 17 Apr 2025 19:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ltBH42ik"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE2020013A
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 19:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744918436; cv=none; b=kxQKgDGOcNLxsqmJltTg3QcFL7S5ZjnM8VL8QkPt+F/rx1iR+TOd5P3QefPp/EjVd+qNeBssAbsdVg60OkZFOkS08V59ROgQI7BbjKImRysvFMLuS0QDIpIT8Pp2ji7TXiosGiwW/dcluOF7WJ3kfr6rRu2tfs4SqcORVzawaQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744918436; c=relaxed/simple;
	bh=yRRVy2xHGh5NhnrsjVe72cTfxvklFClIfnNoEVyS/gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6o7mviBmhNq7Q1E1fFWpdPQDCpbABZjeJGEKoRAfZkIZrPOtz3OA1UGVCmpBJ5UhHJ0g3/Oivs6YIq4epd51lzoRCtnlcW1ed39HUVevd97Tu/wcTgWObVh/vK0OeWyOn+oQuITLg2pqk5/BfPY56+nfkC37t/RCoNrUov4VaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ltBH42ik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClJmn013274
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 19:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BBOfhV42VjOm1soXFuVXR2vhbNsgpq/CqM2J31GQXQo=; b=ltBH42iksyPjtR4+
	N4ikuzHOC7Vp7dULMajfECvZrdKDyUl6nGtyOLzLSd0Sl3Rgz037hPshqEalCKP+
	H3nwbrxWdDQkiV+WE9QHlHMRdeB+4K0J3BnOkFlFJhs+aW+hRVK3j3pJ9PIhyNxk
	sEVmED1Y4rdL4L78/r/CEWjykbuWc0Z0o9f9EoVlLewMoTI0OduKYjO4Ju9KB7je
	JNhJNE1hROH+VQk/d5l2NIIj7zjWKLxnM1ObLhxbEZAfITntHfrS5xyHlm8Lxwiv
	evJjyHBdwp5NZ0V5UuXm2rAde89yYxeLhWITI6oIGz2be9YrwHl4CTeAQUEwf0yi
	VLW3oA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvdb90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 19:33:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476664bffbeso19640951cf.3
        for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 12:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744918433; x=1745523233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBOfhV42VjOm1soXFuVXR2vhbNsgpq/CqM2J31GQXQo=;
        b=G7pAaFgefiiKjNAywoBZVkwel+wAz1nuB6xt0rDkmqldE3Ri8KNpnTB5RS8Zj/3FKU
         3CZ4ylLy3gbEKiQK+iELGNg+CzCQ96JPYQsvzYBs5CPgu/hXXxYW5dBKNg3BgXJkN/Dx
         IN5UfmjvityrxZzHybcR/Rvy87XrKv/5oPEacisgdbP/W/hIDGm6WcSEVfnfw2FYJVjo
         J3tMgDqYOgxoq1rmTp+igR5g4L7SLK1I/xGL1Bt4ffe9AsPqAKrkpcdF1gl4YQWBQX7/
         e19hyTlEtmD2lMcgg2h3c2H0CUU5t8C7+c80idZ+Kg5RnSiMMcr6aqH0nF4DFzQbPGNm
         zhwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaJyqSsAsrV3Ocf0ymF1QBMaa3l2leEEkUwDEXhBql03mJJtERBtxTOBcbGiKfV0Eok8UPSw/PmT6ygw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzth4+KDDpD0rejj0E+KzMppQVEVwwyuLGndic3nTmwvbc6wnIX
	CyVCm4UVUTLsBDAbfBmoKYc4xvehVy/cdBsnNbjUhETq1sctB6F0bgsrxrfjp5EXqx+HkqkeCn7
	7o/Ci48daEmqKYPnpDY0kiyzvpz+nNHVSs6n9NNkICNaw/zNLNbEr8srUn5J6o+WNeT9uo4fhtF
	DKZ4wD0FnTZ0F0RUhk+Ry8ePvnBC4tHLi4yHtH
X-Gm-Gg: ASbGnctuqAHjnCJSV8O2+30TD2fWKgaPyNCapXsuZtnoMwH7AWLH/708zzTZ2SiCqyu
	Z9tFOq4q4r99kdZZL2pDxNW0D+VQyhVdZr3R4gHnWhgPkyiJ6fO0B+qbUxLe0KL5g/qtB5w==
X-Received: by 2002:a05:622a:1988:b0:476:a90b:986b with SMTP id d75a77b69052e-47aec3cbd65mr698261cf.28.1744918432971;
        Thu, 17 Apr 2025 12:33:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsNTDC1SH0ezt5ouAYo9qCu2e4f97nSM2O0VjLMf1GC5S8PAXQWMHH/GYp2bJil3mMNj9ufrDTFjsgSDgXr2M=
X-Received: by 2002:a05:622a:1988:b0:476:a90b:986b with SMTP id
 d75a77b69052e-47aec3cbd65mr698071cf.28.1744918432693; Thu, 17 Apr 2025
 12:33:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417145819.626733-1-loic.poulain@oss.qualcomm.com>
 <20250417145819.626733-2-loic.poulain@oss.qualcomm.com> <82415a35-2410-4c5d-aeac-3b4656804369@linaro.org>
In-Reply-To: <82415a35-2410-4c5d-aeac-3b4656804369@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 21:33:41 +0200
X-Gm-Features: ATxdqUFFH9wIe54N2rC2EYrUgetL69hhYOQegURyxTVVzUemQMqTWr70gmFhsJ8
Message-ID: <CAFEp6-1TEiuDN=By=R03wBtOK5ZcPEEPwNVB7dF9-QcOdq6T3w@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] media: qcom: camss: Add support for TFE (Spectra 340)
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: UtroK0Mqjt8KKIozCQLU9f2_o7iIFCgS
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=680157a2 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=D4ChjzI32PwueRJqcUAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: UtroK0Mqjt8KKIozCQLU9f2_o7iIFCgS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=721
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170143

Hi Bryan,

On Thu, Apr 17, 2025 at 5:49=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 17/04/2025 15:58, Loic Poulain wrote:
> > +static void vfe_enable_irq(struct vfe_device *vfe)
> > +{
> > +     writel_relaxed(TFE_IRQ_MASK_0_RST_DONE | TFE_IRQ_MASK_0_BUS_WR,
> > +                    vfe->base + TFE_IRQ_MASK_0);
> > +     writel_relaxed(TFE_BUS_IRQ_MASK_RUP_DONE_MASK | TFE_BUS_IRQ_MASK_=
BUF_DONE_MASK |
> > +                    TFE_BUS_IRQ_MASK_0_CONS_VIOL | TFE_BUS_IRQ_MASK_0_=
VIOL |
> > +                    TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_I=
RQ_MASK_0);
> > +}
>
> We could mix and match writel() and writel_relaxed() but you almost
> certainly want your IRQ enable write to be atomic from CPU to AHB/MMIO
> endpoint reg.

AFAIU, it's safe here because writel_relaxed will stay ordered in
respect to each other so the IRQ mask will always be configured before
we start the device.

For reset it's an other question because in that case:
```
reinit_completion(c)
writel(1, RESET_REG)
```
We don't want the writel to be executed before reinit_completion.
However in camss case we have:
```
reinit_completion(c)
ops->reset()
```
The compiler should not be able to reorder this because of the function poi=
nter.
But the CPU may... So that why I initially implemented vfe reset like this:
```
writel_relaxed(TFE_IRQ_MASK_0_RST_DONE, vfe->base + TFE_IRQ_MASK_0);
writel(TFE_GLOBAL_RESET_CMD_CORE, vfe->base + TFE_GLOBAL_RESET_CMD);
```
To prevent useless memory barrier instruction while keeping correct
ordering relatively to normal memory access.

That said, such micro-optimization is probably overkill for such a
non-critical path.

> Its simpler to drop the _relaxed() everywhere but, if you want to
> include the relaxed() variants I think you still need writel() @ IRQ
> enable as well as WM start and stop.

Yes, fair enough, so I will revisit and use writel for non-critical
control functions.

Regards,
Loic

