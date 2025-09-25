Return-Path: <linux-media+bounces-43221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2E1BA15C4
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 22:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68DF71C21236
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 20:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CF72741A6;
	Thu, 25 Sep 2025 20:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6OkcMTs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7602512DE
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 20:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758832410; cv=none; b=ZUWW8NuuldWO+DDOtMWoRLykMhUaVRE4bY2syW+Isa6cwMwKYqqMh89pVePSjNdwAkVG+OdvcTbl0SYm1wsPRzVk66YsdrNs1PPnylUspeZVzJUJjhP0THB6uMe6V8uevHYKCGTu+zNGlWPMNrs3V31SJke6ZJgVh3LGxB89IW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758832410; c=relaxed/simple;
	bh=P7qsP8loln8qJMKauzhZHNTaq5rBg6KgAlGOHlFpmFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOuEZ4A5V1oMsxCdIvkfdsc+OGABIBHUmArYl1YXUepBNklc1PMwHSWgHDiM1zJYh/KJwyAiOktG9oCQENTOljfOJbzdb9cEuNFHLHxrmF9y9Sp/AbBsJf0/7DgbEPnr1mQOVNU4Nl8MjVpXxCcHwQGIl0bugLLpPNJhpGx1A8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6OkcMTs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQKgT005316
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 20:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LPf7nEUMaiJcR9LEdY1KxASE
	IWgzMO7x5c68UwxFZjQ=; b=N6OkcMTsvKHif7LmU+reXU+a8reSNhVcIbWqYABh
	7ZApoulk/9wiCnqeUmqwjQBPk6JNm+xdWoTus2w2fjQKJhdPAKqM8ZkHbwHCY/AV
	t45a5sFsOBC1pf8x39oyCSojiva6nTvCgch2so8pcDxX5ppwgxu8yoHKiIsVU5U+
	G3BRMg1QH53a5dH1yZh8mBwsvCHXG80VL7FSjqPxxV0wyAE9VPxR+0wMLsD79MTv
	JPwrNyTOuy8Hn10LBccZUMEc1o9yitDq94KHdP+3OABlaGDvkfhvSHsajmSf2JuT
	EG/B3uzkDrjPKiDg4kqtRiASrl0FkqXmwJ2XFlketmY8CA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u09u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 20:33:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4db75c7fa8dso24610431cf.0
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 13:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758832407; x=1759437207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPf7nEUMaiJcR9LEdY1KxASEIWgzMO7x5c68UwxFZjQ=;
        b=iPmTBDnjrYxtfnWxuOJAOaP8NQYDT6C7Vh1RBMQ5oZGxCOsxg+8pTUrSDvGv1IymQS
         dO2RKLutRm4F296Hr/YW4SPhp9v/fizFcrTOgH2L/b27qCwHygl8Q9VKhiM8HO64uyKI
         r3ZIyCvSt1HoTfg9mE1SYqHGfonQe/AxZpOCj2aHVYdrZeF2Wmzrjot22kurdJyAqKNI
         d1HsvUP9GxyonilL3N7GpY1i2AQDdtsm3zExIwhEBJqxLqYhGDLCnQF1rzhnSRrL5Cpx
         ACLz04QYEKd23es2NOVXTu2nQKJ6+wGiWxeIb9aWL1ja0WSFXFcd1oQ9mIU2Vivzgdsn
         HmUg==
X-Forwarded-Encrypted: i=1; AJvYcCVYaTP1C3Zc6HSPEXVfv0d4qsEmprh7jq5CfY39tHDM9Bmd2v3sfH7geggRHEwPNL9vbzbSE2zYJqu4mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFy3ZhXesPJsna24tQDT+IJQSIsJG23nN/PpdusTJ0lNweD7f6
	ld9Ennmh3nmyBD8an0jPgflF3CdiDL/632IVK49yL6ue2DW61oX6IsBTl2mngi4VAA3dMCjK+g9
	SH3QyGLYTGCzrwf8nNh83rXyk8XrLTqTqgz3EY6CPFWaW6yEVrDqVr21fuLUOWFIKiA==
X-Gm-Gg: ASbGncuI0OlWrxH4YDAoTo9dbFpdQwym8nYGPRmV0r9M7jCeihYPeYyA3dJGbMZBfR8
	YD+w8MnOrUCByDJONb6iaQV5EghXQbcFHQBkLnbbcZd88R1R2098OYAPjLBuLI6dImJ0dcr3kb/
	pDJ9mUu9blX8rNPSlmereVB0sGNQChL2gVgPCdMXDE55khs9Ga5v7JhEFxkv4QC2YXB9wMUn9Fs
	TAJFl9gteX7xv1EEQiDUXLx+WxrWk3f/Nkt+2fNbpsz2Qw3U23vmKypew+BaTcGMgnGBsUoi4VJ
	E2Q5j0VrBKqqhrgAtpg5KznLortZVefjzf7rJY0/psOaFRkCeHFmcD1RY+l/x75sdtcUJFkMU2n
	YPFMnoVKEsaugRRkmysaxvkYAbQX49KYQ+/crYule9usYfottO8BZ
X-Received: by 2002:a05:622a:5c85:b0:4b7:9abe:e1e4 with SMTP id d75a77b69052e-4da4e56e355mr68594741cf.82.1758832406712;
        Thu, 25 Sep 2025 13:33:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTeVcYqwp20QhZ38nNSfsgwuGNMn6xonp3gorjVIZcc+CKmvrdXfDh6RJvsUaFMzQxM86eGw==
X-Received: by 2002:a05:622a:5c85:b0:4b7:9abe:e1e4 with SMTP id d75a77b69052e-4da4e56e355mr68594331cf.82.1758832406067;
        Thu, 25 Sep 2025 13:33:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a31be1sm1062049e87.112.2025.09.25.13.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 13:33:23 -0700 (PDT)
Date: Thu, 25 Sep 2025 23:33:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <sf2ujxfthvpwfp5ksqfww6qh5zfygf5lubylfrvtc5lwxakkz3@7gqxhbdafwvi>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
 <nuunkv3xwfes6wed5xf4re2efakndvvrfl4lhmenilkic4sjiy@5cb2f5ygegvm>
 <522d7244-0003-a42e-9be0-1d353df8d5bd@oss.qualcomm.com>
 <oimuo26ohcye74j6rl5hfbmd4ip5wzudhyiaibf74b5zmjb4vl@xh3dnp7gmvq7>
 <6198a56a-dbca-5cce-fcd2-43978e87236d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6198a56a-dbca-5cce-fcd2-43978e87236d@oss.qualcomm.com>
X-Proofpoint-GUID: MX96szVdQXCnn883xoj6IO7L_1fGQ7pX
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d5a717 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gEfo2CItAAAA:8
 a=QVIiKdR3HoERtcWfPvAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX+6FDgPExkM2g
 kK9Qixk8xdhfDJnVMvd0gLDj+MN2dUM7aAW3EoIYzX7AZBqwTnc70pPgWZE9Te9UBetaRA+rLVk
 WT+/SKuYW5JOlSPqY0E65rCDDfdZDETpaJrM6d8HH12a83g+sLhaecHCvdYUBW4HP5zdjJIO8iv
 L2GLrfOVKrdAUZY/ZnhvaLs2XDQVGZIqewGx4n9phT4orIUIeJiYuN3Od50EdkGixlIJauIFdRO
 tWvktfeaDVGK71dB+RbQIMqRwhxrPGCVH2+2aewU0u6wKtgqjstpVCB9N5qBZxEiOUcIjADheoz
 je8G9TsLzmBtxXgoOLVwIMHbvPMj0NIgtK3b79ie8THP2jqtehug+qzgzHrp0ItB8jNi9/e1QLZ
 xEsO+frTsUTMSmGmsEaaAoGKpsK9iw==
X-Proofpoint-ORIG-GUID: MX96szVdQXCnn883xoj6IO7L_1fGQ7pX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Fri, Sep 26, 2025 at 01:15:15AM +0530, Vikash Garodia wrote:
> 
> On 9/26/2025 1:08 AM, Dmitry Baryshkov wrote:
> > On Fri, Sep 26, 2025 at 01:01:29AM +0530, Vikash Garodia wrote:
> >>
> >> On 9/26/2025 12:55 AM, Dmitry Baryshkov wrote:
> >>> On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:
> >>>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> >>>> compared to previous generation, iris3x, it has,
> >>>> - separate power domains for stream and pixel processing hardware blocks
> >>>>   (bse and vpp).
> >>>> - additional power domain for apv codec.
> >>>> - power domains for individual pipes (VPPx).
> >>>> - different clocks and reset lines.
> >>>>
> >>>> There are variants of this hardware, where only a single VPP pipe would
> >>>> be functional (VPP0), and APV may not be present. In such case, the
> >>>> hardware can be enabled without those 2 related power doamins, and
> >>>> corresponding clocks. This explains the min entries for power domains
> >>>> and clocks.
> >>>> Iommus include all the different stream-ids which can be possibly
> >>>> generated by vpu4 video hardware in both secure and non secure
> >>>> execution mode.
> >>>>
> >>>> This patch depends on following patches
> >>>> https://lore.kernel.org/all/20250924-knp-interconnect-v1-1-4c822a72141c@oss.qualcomm.com/
> >>>> https://lore.kernel.org/all/20250924-knp-clk-v1-3-29b02b818782@oss.qualcomm.com/
> >>>>
> >>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >>>> ---
> >>>>  .../bindings/media/qcom,kaanapali-iris.yaml        | 236 +++++++++++++++++++++
> >>>>  1 file changed, 236 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
> >>>> new file mode 100644
> >>>> index 0000000000000000000000000000000000000000..f3528d514fe29771227bee5f156962fedb1ea9cd
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
> >>>> @@ -0,0 +1,236 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-iris.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: Qualcomm kaanapali iris video encode and decode accelerators
> >>>> +
> >>>> +maintainers:
> >>>> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >>>> +  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >>>> +
> >>>> +description:
> >>>> +  The iris video processing unit is a video encode and decode accelerator
> >>>> +  present on Qualcomm platforms.
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    const: qcom,kaanapali-iris
> >>>> +
> >>>> +  reg:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  interrupts:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  power-domains:
> >>>> +    minItems: 5
> >>>> +    maxItems: 7
> >>>
> >>> You are sending bindings for a single device on a single platform. How
> >>> comes that it has min != max?
> >>
> >> I was planning to reuse this binding for the variant SOCs of kaanapali/vpu4. If
> >> we do not have min interface, then for those variants, we have to either have
> >> separate bindings or add if/else conditions(?). Introducing min now can make it
> >> easily usable for upcoming vpu4 variants.
> > 
> > No, it makes it harder to follow the changes. This platform has
> > this-and-that requirements. Then you add another platform and it's clear
> > that the changes are for that platform. Now you have mixed two different
> > patches into a single one.
> 
> you are suggesting to add new schema when the new variant comes in ?

No, I'm suggesting extending the schema when the new variant comes in
instead.

> there is
> also a possibility that this hardware(kaanapali) can be used without those
> optional power domains as well. Let say, someone does not want apv codec, in
> such case, that pd becomes optional.

That's totally a software construct - not enabling unused domains. Here
you are describing, you know, the hardware. And in the hardware the IP
core has a fixed number of connected clocks and power domains.


-- 
With best wishes
Dmitry

