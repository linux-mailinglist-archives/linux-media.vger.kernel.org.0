Return-Path: <linux-media+bounces-38834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8576FB1A05E
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 13:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A60371756BA
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 11:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD00E252917;
	Mon,  4 Aug 2025 11:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDaAN4Is"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58361482E8
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754306127; cv=none; b=F8KlYNbbRs2oBfdBiib084k1hDjV3m6K0PJNoImOfVhYKefWkTsJlMj38drOzIltMe7skjemTIZVg8BUXM/RqxnSZa576q5IEXwhxBh5VGU4TZ2BvCRCRxJC/cB5r9caFTzlqufAtjvZKnsaCyYkwRufAA+FBGsLS8f5QBIp924=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754306127; c=relaxed/simple;
	bh=G7VJRvbSdgS+wzOGL901RqaflLzSRJ9pft/+txq/7lI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAQ3JPlzwTEwf4pLfI0yeGfNqKFNQABDN/cKIq3ywgA3kTjs0AWiSEp72JdY5cBOrHpSQ2rsU0D9vCw9prKYR+5h/rDxJOU6GjPPJgUufFM3c/gm23OpAan2zDjnhGtSTnN4bXs6sriaP+/tnp6FYzKxSc+Rdhktt2tk9izPT30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDaAN4Is; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5745bSDh006478
	for <linux-media@vger.kernel.org>; Mon, 4 Aug 2025 11:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=khqumXgaeHAqtOicptnDS0Wb
	FDwIn2bilvzuMqy8oI8=; b=LDaAN4Is/O4pK5Lt70OteEtPMqmDjYYXCRomm1Eq
	jAeq/HHrrREWIRNOvWmD+2kGBxHhYasKCtlgrOUd9JU8y4XhHfITeipz1f92ob+3
	4bSwK2Q3qrxPnLvaVeJdJWGoZyY32xbdBnjEhZ2qV8TRdb7kE/+LbZC3/Rmyld92
	F0KteQ/E1uKcB0FRqvrrWOqAuwoAOeleT3pcufeUvggvE60P+WSomnhuJRaBss88
	36azY6ZJt6OCsyjRTSxb8Ml6OfX/ZUEG25cKvZA9TP7+YFVSTT4lKMnldXh/cnf9
	g34H/+LI8V+5vWuapipKE0ub9DC0P3ry+8/m93JTHUc7aQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a4mct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 11:15:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b07bf0783bso3465371cf.3
        for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 04:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754306123; x=1754910923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khqumXgaeHAqtOicptnDS0WbFDwIn2bilvzuMqy8oI8=;
        b=vyiidmpLla5VGBJ3ONp88JIN6RGk0/hqdcq0kLBwhw4vCCSX8sTd83sbyZH1LdspaA
         duibixWW144Q6tHBYF3CgjeLFkLj/Sf9BWohzedWJMtMNhb6WNnRqWIuVNhcuKJoxUOs
         6sCTKujgj6q8qVDeOiP577hXXtKBGcRidpol+JrNG4Ze3BiQ8JofOXKVSuZOnzULZ91+
         YqzzR2p6LxTCvCyos9ESVlnrRrgIhD0H3YntfiXQJhReG6aHZaJA0mpL4iIjHQx5JsWJ
         cVpuZnqoNUpjSKrsBq/Q2ls95B6/y1xN65DGDAJ6R5JT6V5aBYVCPSJichc4W+v9zmyu
         DvSw==
X-Forwarded-Encrypted: i=1; AJvYcCXBCnKPNGCIeyVjOSrNjpX7OLWgsIGuPVv/6P4vG9GL7IGZPKd6QbYHlr08Peo3Y5fh603CfuXNEsqztw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym0s6q2w0/7qRTuTfyBOgPYQV8dK4RziJ+p4pzXAaqJf7WY0Il
	NP/XuR58NJNGw78ernmTm+7O2V6jGm9IVVfH2LPZxOz70r+c1YlfLmL9HWQTgcQbFwNUzc2fM0S
	HuZMVLtV43AbubILrqEP5YcSNMSKROJfe7BGY4iPeKJO8XGSL1RafdFc6JVPSbU4q8w==
X-Gm-Gg: ASbGnctXY3SayoYaEkEsP8gKUrHqbhqGVGHDshAvD1YoOJYtm2wT9gjHMj+TNikqBDm
	8nyx6cEW1wBKJiE2fDq8wJtZ43jdrCbw5BHiMtFhW9xpOcd8EC1fgjIqhHjgEfMJZ4SPxNInYy9
	gJHjNUGafRjrayw22Gaznh1f6B68gL8FkL+Zx4+v74TEJ01eCnqy7AxR3A45VbfT6Gj5Jbtr8hz
	P+FpCfSu+RIpFJJH7McvFbDYPZCvW6SK1IIFz5W/N9xE4Y4dw48Y0PlYqRqmViacI4EAPTL5dPq
	3ysEvV4fDzU/muN04UrmSVLTqAcTNPH6onPslMdz1eGfIGjFyIafFFEgRGt9JpyW8qYKcQ==
X-Received: by 2002:a05:622a:91:b0:4b0:799c:14a8 with SMTP id d75a77b69052e-4b0799c15f4mr9055631cf.48.1754306123150;
        Mon, 04 Aug 2025 04:15:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqIXmJ2D9AVE3K0rmg2b6xzkn4wYQT4O3dPGfpm20inAFLC64DHI0V56Q6QLRVEJIOBskO7w==
X-Received: by 2002:a05:622a:91:b0:4b0:799c:14a8 with SMTP id d75a77b69052e-4b0799c15f4mr9054801cf.48.1754306122368;
        Mon, 04 Aug 2025 04:15:22 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e009e465sm5634589f8f.43.2025.08.04.04.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 04:15:21 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 4 Aug 2025 13:15:20 +0200
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, krzk+dt@kernel.org, konradybcio@kernel.org,
        mchehab@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/7] media: venus: Add support for AR50_LITE video core
Message-ID: <aJCWSAfxBzLYqlQL@trex>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-4-jorge.ramirez@oss.qualcomm.com>
 <4734edd5-8224-4caa-8844-c38dabc6b6c0@linaro.org>
 <aHij+NHG5xbM1paO@trex>
 <8ac6f365-205a-4140-98b1-847f54ce08af@linaro.org>
 <aHjtgHT2Nxmm5nEf@trex>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHjtgHT2Nxmm5nEf@trex>
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=6890964c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=p0WdMEafAAAA:8 a=SliKETZjkfTHB_9U9w0A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: f6PfAJJGQfOVQj1yqd01hBe7h_sHhpVu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2MSBTYWx0ZWRfXx1FrV8da09a6
 V4dZO/vttaMw6AcnW4QewS34qZvHN5Q0F0G7k9CMIiw5dpJyAw5JFBZ1dImfmDYarU6aVeXOFuC
 jszaEMxaGRyo/mTZfJouwYSu2oFQRSV1Wgy8fpiRIySz0jVaY3D7zG1CM6F6wOIS3geRQmKSHjr
 wVCkG2sJYgAyq9rIqxwrAxTXCbRZAs6eBi4WMVpkyPpSjRnqR8kQryYZoLojARt/GvDJGuto2tA
 MuWxxNiiO9gzz0DDmX8NtZafhRh7foAGQJu8EchZhvx9ZP6K8ywW/NofX/Eh2UsHHkObpDWsoCr
 WlmfdIVLA0dhuIy//ho9yb+26XErGfE7YSISdu5h9n+jGBWj1RsE9u+1b8brbbNKFeMB9wC8Y+Y
 mVc5QJHwMcQKaGTXEweCPoVgBi/aAtaGvEBJD/Ba8Bl5PYBlGM5BH3dtAUwr9tzMJSQM/61C
X-Proofpoint-GUID: f6PfAJJGQfOVQj1yqd01hBe7h_sHhpVu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040061

On 17/07/25 14:33:04, Jorge Ramirez wrote:
> On 17/07/25 10:29:44, Bryan O'Donoghue wrote:
> > On 17/07/2025 08:19, Jorge Ramirez wrote:
> > > > > --- a/drivers/media/platform/qcom/venus/helpers.c
> > > > > +++ b/drivers/media/platform/qcom/venus/helpers.c
> > > > > @@ -230,6 +230,24 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
> > > > >    }
> > > > >    EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
> > > > > +void venus_helper_prepare_eos_data(struct venus_inst *inst,
> > > > > +				   struct hfi_frame_data *data)
> > > > > +{
> > > > > +	struct venus_core *core = inst->core;
> > > > > +
> > > > > +	data->buffer_type = HFI_BUFFER_INPUT;
> > > > > +	data->flags = HFI_BUFFERFLAG_EOS;
> > > > > +
> > > > > +	if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
> > > > > +		return;
> > > > > +
> > > > > +	if (IS_V4(core) && is_lite(core) && is_fw_rev_or_older(core, 6, 0, 53))
> > > > > +		data->alloc_len = 1;
> > > > > +
> > > > > +	data->device_addr = 0xdeadb000;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(venus_helper_prepare_eos_data);
> > > > This function doesn't appear to have alot to do with AR50_LITE as it
> > > > pertains to IS_V6() and IS_V4().
> > > > 
> > > > This I think should be a separate patch with its own commit log to describe
> > > > the quite complex logic of version numbers going on here.
> > > Let me give it some background:
> > > 
> > > According to the HFI specification, EOS (End-of-Stream) buffers must
> > > have 'valid' addresses. While the firmware currently appears to make no
> > > use of the EOS buffer contents, allocating and mapping them would have
> > > been a better driver choice IMO. Hoever this one has better performance
> > > which is probably the reason why it has stayed.
> > > 
> > > The firmware then does perform operations involving the buffer's size
> > > and length fields, and enforces boundary checks accordingly. On the
> > > AR50_LITE platform, an earlier firmware version lacked a check on
> > > alloc_len, leading to a division-by-zero scenario.
> > > 
> > > This has been addressed, and we plan to release firmware version 6.0.54,
> > > which includes the necessary boundary check for alloc_len.
> > > 
> > > I should probaly replace IS_V4(core) && is_lite(core) with
> > > IS_AR50_LITE() instead of trying to give it the appearence of a design
> > > feature.
> > > 
> > > seems the sensible thing to do, right?
> > 
> > I'll stipulate to all of that.
> > 
> > I know I'm being pedantic but, the title and subject of this patch is
> > "AR50_LITE" does stuff.
> > 
> > As traveler from a mirror-universe - I would read the commit log here, look
> > at this function and be none the wiser what was going on.
> 
> right this is because I think you saw through my inconsistency.
> 
> The truth is I should have written the function as below; and I think
> now there is a case for it being in this patch since it is addressing a
> firmware issue on the firmware release supporting this core which the
> patch is adding the functionality for.
> 
> void venus_helper_prepare_eos_data(struct venus_inst *inst,
> 				   struct hfi_frame_data *data)
> {
> 	struct venus_core *core = inst->core;
> 
> 	data->buffer_type = HFI_BUFFER_INPUT;
> 	data->flags = HFI_BUFFERFLAG_EOS;
> 
> 	if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
> 		return;
> 
> 	if (IS_AR50_LITE(core) && is_fw_rev_or_older(core, 6, 0, 53))
> 		data->alloc_len = 1;
> 
> 	data->device_addr = 0xdeadb000;
> }
> EXPORT_SYMBOL_GPL(venus_helper_prepare_eos_data);
> 
> what do you think? this is really just adding a the AR50_LITE line to
> the existing implementation.
> 
> > 
> > The EOS check is a fundamental HFI capability which is why I again reiterate
> > it deserves its own commit log with the above explanation - word-for-word
> > would be fine from my POV, to explain what is going on.
> >
> 
> umm not sure yet but if the above does not make you change your mind
> I'll do it.
> 
> > Long live the Empire!
> 
> :)
> 
> > 
> > ---
> > bod

will drop this - not needed since the decoder will not work except with
the incoming 6.0.55 release (see below)

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/630

This firmware - on top of supporting the encoding functionality- removes
the need for the dummy length.

