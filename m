Return-Path: <linux-media+bounces-47358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B55CC6D9E7
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 10:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 656EA387487
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 09:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123F8335576;
	Wed, 19 Nov 2025 09:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjCsFkNo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JeiZDdJi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7B5335092
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 09:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543339; cv=none; b=gxCeTIMf67hTHbMcuUxIiRofbRKM2k5Ft+oV72Agc6DdnMsgdNgDkhC4Md18+lMTHLysm16oAak+qPTV67yI0YxS7Ie+m9XzNm+eCuah9N/yrUVSQe0XXfprty7jyxrehHSEF0HL+rMGVM5MMcxn87tqQ/TlhFeR5/oh80hEyJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543339; c=relaxed/simple;
	bh=jrwnzPmjdWuo+o7DXPlCIozS2cMqp4j1IJeC2T9P/qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=an8I8Eia+ZKneoiBIaU2BhiytJFwADJmmPruLAK12JnNpnFMutXJeGh8AwkkKBdknd/eC+yx27/J0eAuu53sR/4kgLUqz+y7KB1CDykKct0fzZsSJhSeR6Rls/0HVgB9b/qf9aog2+t/D4ErXt+SgCa/UzrtOOemwWffxlt3A1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjCsFkNo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JeiZDdJi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ5Dowd2926673
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 09:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BTbtZPuzr8b614zgVfcZ7nzI
	mjQhffBU/Mc4TshKik4=; b=TjCsFkNoamUiOkS2tV7Dtuf2GEc3ApHpjs9lzqiS
	sqHHSe692rrAvrjMu6nmrmdTSwm2kkksZbqBvgtHy6rnARhMJot7KcrcOZIinrHN
	imDH+SZUDh7hcjNjsX7dz+7HNS8vpqsRsA1C0izpskT7iqCzd3i2ckvdu4c+hZb+
	JSkQJCG36Cf1FyYHdhk+N4JTufTSlwAoYA9FW6919nMEpzSL9L+MOYOmnp/cIIS3
	HAd2ewmKBU+cpeCww4rsu8xG18vVMuU/+pVwQMJNZ6NxiB3Di7Cmy0LzvC0la8jH
	aH/n3hCYt93I6BUY80NZuLxJpBzpw8ejS8EQlpCLdDieTg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agq293m5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 09:08:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee42d99125so6662521cf.3
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 01:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763543334; x=1764148134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BTbtZPuzr8b614zgVfcZ7nzImjQhffBU/Mc4TshKik4=;
        b=JeiZDdJinThZh0iSOLsSeihC7uydknra24JDOM3NjPMT0DExxkaxkaixXGSyFG5scd
         l22uGmWrasZC2146MuTmm8PU5CxqPrE2nH5p9OIxvNUGTeYte3/Zd4tmUObA9SejLvNq
         mANf2r9FOdnU0rduP/dabCnsG3F1gN6fIN8f2p+2qJuWaSqzrvDj696vlvMJbseJ7EYv
         LBRkXFcyzdgIb20dZMld9DdzZe0zU/FW/WpHo6HU+wGmEeEMW8IY4XPUaumxADqyVZgY
         6m3svfeYTtPTIUK6jJ1zXNaXJ2DRCcKZabc8exksbe7xvuEgZ6jIb+8IywGY72SCPAc2
         xizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763543334; x=1764148134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTbtZPuzr8b614zgVfcZ7nzImjQhffBU/Mc4TshKik4=;
        b=qVOWb/InMHhdJZjW7V1MeXzs8mHLM9/f+/h8Ob1oKasgMGBlYD6TpHHcqVefAQAt5r
         saEPjUC6s71Lvox5tdEcRS+ufGmOLyxx6WsKynLcUrbDlncdY7Xp/THx/ngvuBze8+GQ
         wGWrj5N/QC5+Csnr6d41I4gdpBJNzQvUft5GufTyD31NoAcajzuyYZfOd8AtNRXyB27T
         38db22KN6NZRLzZlY6d/YPd/WzKECxIvjiUhNGw+5wrQVVHzku4b98G36YkLE4mIJDuE
         ObHFe5aLa+nYE9NtX9Nw0KQkMVw6h/Epe750hMZmQyDBuNneRFxdprJ+HaiUSX6eZn1n
         z+mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXWwajRt+JZQIAO8cB13jRRMBobHaN54BOxFX0lOowbZVKa5r4SQsDGFcyYTD25pUV8KXgj8mSEdqAmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRy5+n9o239xc51tzzq/Ze81RAcXs6wuqPMjqASPYNL4j2UErc
	CWS045P+RC5V/Lu1SN00a87Mln4lb1tFM8MjlQ+VvmveClqZzCvdfXPT+cvo63GBaRqnIE99YAg
	r3gHN8vPGCzqvtykI6X2WnmI3UkyRl3RcfJDeKtELTh2CjJ0kwHvVSu5aBR8sJccVeg==
X-Gm-Gg: ASbGncvCiyMmitq9FGoH4eK9JNo3EEu9BB8NSO3KRV3i/3sanRHboX1eJWcXL6ltABv
	GFUtrC1kNx/VCzScuGACsSOOCzjYO2YNkjqMD2Ur6AiJrDaX46jBEkQtIEZUgP9muGvGb61y7By
	aRdKB+lNV6j9gWA+PTacVnckh5OawunNCx36yeP2XjZXH7BDrEDIo/EiatblU/neP3tVF3VW4wf
	GSwT4DgsCsEA1AQgB1TGFreSbnhSbY+ZBDd7QHEKituk5Om+k37pThBdRzQZSIt6CuLWT9XKSsT
	Yz9AYK7SR06vgN95sMPe++fxUCSWdND4vz/D/Tlii/5h7LHDD3TJrF5kzpog7zJOYzLij1CyzK7
	TrLv4qS1Nd0ucsfrrAr4EvoZXdCMknGwu3D/JGEwnsdiJ6Vu1qwXdXB77bTNJ/kqhYIogQytRvW
	64AGgvjpr16ggDI3gCi21ilmg=
X-Received: by 2002:a05:622a:1a8d:b0:4ee:219e:e66 with SMTP id d75a77b69052e-4ee219e1ccbmr132271801cf.83.1763543334075;
        Wed, 19 Nov 2025 01:08:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvGrTwGWgt3h25w1spAqf1PMbfdl26WuMNR8Rh1qTaBhxRDJpt0kYDPqbU3TG80HYKB1z85g==
X-Received: by 2002:a05:622a:1a8d:b0:4ee:219e:e66 with SMTP id d75a77b69052e-4ee219e1ccbmr132271461cf.83.1763543333526;
        Wed, 19 Nov 2025 01:08:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce080casm42649461fa.5.2025.11.19.01.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 01:08:51 -0800 (PST)
Date: Wed, 19 Nov 2025 11:08:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
Subject: Re: [PATCH v3 0/6] media: iris: prepare support for video codecs on
 Qcom vpu4 platform
Message-ID: <a4wd4u4qh7ldiz6qzvmse72vhsuh5i6erpbglgzgnz2zdo75tq@xnwmwrij7rqx>
References: <20251107-knp_video-v3-0-50c86cbb0eb8@oss.qualcomm.com>
 <3vbq76dpjnadfrnufojq4zqiv7p5p555rhxfx6yoncc354p3lk@ohcs3ldhuoao>
 <2d56fc4b-6e3c-4f83-aab1-c48db3b8bb2d@oss.qualcomm.com>
 <CAO9ioeXSXwm03e_j8TuXz2Sqr1J2n3uEFH6dJoKVyE+hJx+woQ@mail.gmail.com>
 <be157faa-b062-4726-83e2-ffdeaf792b50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be157faa-b062-4726-83e2-ffdeaf792b50@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=691d8926 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=74vutVrwjju_euDmxZsA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: cExY8Vl_Xx5UhgxuvMuKoE604CujcdBV
X-Proofpoint-GUID: cExY8Vl_Xx5UhgxuvMuKoE604CujcdBV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA3MSBTYWx0ZWRfXxGKEuZsYM4HS
 MMxGqTIgbo4Iwk6KIP0N5O0Gv7+XL/DvqR36rMj6/xVu8w14v1ILrVTcT/ChU4QxBEt3Q98hhD7
 gSiTAmPe1pDkEmpFZ/ryTBxsU8nSU5SHPgx/UcqkmiVDiWli77M/bqLyQhZoOk5mN3/pQ8Hr0Uu
 kdk8JP02ArG87w90FORej6WeW1uTEYCZ6alVcin6TS27Jad84moWY4vFJUquuBap1ipsUCf5HYz
 e6jfKbdlsr9XUO0lj4PeeEoi3yRuDubmH/H9lDAzD1+yzUZ+o+hM50gRyAuZT8L5tDvCdND8gFM
 vnjAfZsIe5u8Hj3PP5OvzyNORYJUGP8iLSCsfsv9FYMmH3skxl0aZK4e45jfpaVHRuEcZIiOdbH
 Z4TykqWLSVnAfFKM5f1Qy61AA5GYhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190071

On Wed, Nov 12, 2025 at 10:39:16AM +0530, Vikash Garodia wrote:
> 
> On 11/11/2025 7:09 PM, Dmitry Baryshkov wrote:
> > On Tue, 11 Nov 2025 at 14:43, Vikash Garodia
> > <vikash.garodia@oss.qualcomm.com> wrote:
> > > 
> > > 
> > > On 11/11/2025 4:08 PM, Dmitry Baryshkov wrote:
> > > > On Fri, Nov 07, 2025 at 03:19:35PM +0530, Vikash Garodia wrote:
> > > > > Upcoming Qualcomm kaanapali platform have a newer generation of video
> > > > > IP, iris4 or vpu4. The hardware have evolved mostly w.r.t higher number
> > > > > of power domains as well as multiple clock sources. It has support for
> > > > > new codec(apv), when compared to prior generation.
> > > > > 
> > > > >   From previous version of this series, the kaanapali binding patch(#1/8)
> > > > > and the compatible patch(#8/8) have been dropped. The discussion for
> > > > > this is captured here [1].
> > > > > The series introducs buffer calculation and power sequence for vpu4. It
> > > > > prepares for vpu4 when kaanapali is enabled after the binding discussion
> > > > > is concluded.
> > > > > 
> > > > > 
> > > > > gstreamer test:
> > > > > Decoders validated with below commands, codec specific:
> > > > Why not just run the fluster testsuite?
> > > > 
> > > 
> > > yeah, fluster can also be executed. Individual codec commands were
> > > explicitly called out incase someone wants to run standalone gst pipeline.
> > 
> > Please switch to fluster (in addition to Gst), ideally running all
> > test cases for a codec. While enabling SC7280 support I found that
> > there are enough corner cases which are being ignored by the driver.
> > One additional bonus is that fluster runs several process in parallel
> > by default, catching issues caused by several decode threads running
> > in parallel.
> > 
> 
> multi process issue is due to below [1] (tried it on lemans). Due to higher

I haven't seen SMMU errors on Kodiak.

> concurrency, we can see that the DMA buffer is mapped into un-addressable
> range (0-0x25800000) i.e 0x24b00000, and leading to global fault. This was
> the reason i was keeping 2 memory-region in kaanapali binding, to restrict
> certain ranges of IOVA.
> 
> Below solutions are being tried, again this is not limited to kaanapali and
> applies to existing enabled SOCs as well.
> 
> 1. introduce dynamic device for output buffers which are big size
> comparatively, via iommu-map
> 2. introduce the restrictions to the addressable range.

Hoping to see them posted and land soon.

> 
> [1]
> 157.511807:   SMMU_ERR_FATAL_NSEC_FAULT_NAME_REG : SMMU:>> 0x0x15000000
> NonSec Global Fault: NSGFSR=0x80000002, NSGFAR1=0x00000000,
> NSGFAR0=0x24b00000,  NSGFSYNR0=0x00000004,  NSGFSYNR1=0x08840884,
> NSGFSYNR2=0x00000000,  NSCR0=0x00280406
> 
> > > 
> > > > > gst-launch-1.0 multifilesrc location=<input_file.h264> stop-index=0 !
> > > > > parsebin ! v4l2h264dec ! video/x-raw ! videoconvert dither=none !
> > > > > video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> > > > > 
> > > > > gst-launch-1.0 multifilesrc location=<input_file.hevc> stop-index=0 !
> > > > > parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none !
> > > > > video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> > > > > 
> > > > > gst-launch-1.0 filesrc location=<input_file.webm> stop-index=0 !
> > > > > parsebin ! vp9dec ! video/x-raw ! videoconvert dither=none !
> > > > > video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> > > > > 
> > > > > Encoders validated with below commands:
> > > > > gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
> > > > > format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h264enc
> > > > > capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> > > > > location=<output_file.h264>
> > > > > 
> > > > > gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
> > > > > format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h265enc
> > > > > capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> > > > > location=<output_file.hevc>
> > > 
> > > Regards,
> > > Vikash
> > 
> > 
> > 
> 

-- 
With best wishes
Dmitry

