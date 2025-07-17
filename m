Return-Path: <linux-media+bounces-38000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E24B08CF7
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5FC21C25B3C
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54C62C1588;
	Thu, 17 Jul 2025 12:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XuuTTMCs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964E827281F
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752755591; cv=none; b=LL1WCoM8YHBqbMiaP8PY3xUMN+4wSzrXivjDtOGXY8IO5Ek/8cE1i42Y3ljL9UZke2tE7otqui+E0wOQH0HGkJxa05LalqMRmlA3qptrcnCV5vQBJr68dSfpJjFJhuZK7D+0YJ91u6oS9j/HwkP4PN5gg2DjwlSzkNlqwc7sSns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752755591; c=relaxed/simple;
	bh=9aNoDhtWXXT/OFJv10vt3bZs0Gso06rmEsgWtftDDYY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9lSpaPL/Jx6y3SrneNZKq380UHGx9JfAA0/5uweh+QGkHr/S0bvtNi9KDkC2Do00HTlbsLwo2s9SSAY5GLOwaL9Z6inOHCagvDWnExrgCIZSIdHCiW1mpO9qZVTycagNefNsqpgZzf6HEJECduNttLQryLmQ021WyvNjdcAWQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XuuTTMCs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCTgkE022222
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GIVsyeStEGhaDBPkM6OOtZkb
	Tex+ECjJnep7/hnb8qs=; b=XuuTTMCssnwfC8qfjdUclhu4y3iIJdbxsjMLqotu
	BDCVWvny9tIDIjNuCf4auesoOnWMxqRwP5hXkDjBowWgBt15KmTu4CWVdubkPGk/
	F7nCv6KaoQ81DUSSv5la3A3kmFkp48ao9ZpC9u5WlrHkXR33aUy+xHRQooneAERc
	I2lZg/r8mdI+35pae9qa1AF4/bbf2oBcu8kJhYKMxJ6heOYfyoCRmy4nB2yV9njI
	8SRsw4JzFqip42INVgfW9BA8VLtErIIiDK3op9fz1A8jTeUEKJq664H6mm23sw0c
	W04NnnfMlqRhfll/+0YOW6bx7JkPoi9Izv+xBeMmWgOYnQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy7hn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:33:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab76d734acso32441531cf.0
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 05:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752755587; x=1753360387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIVsyeStEGhaDBPkM6OOtZkbTex+ECjJnep7/hnb8qs=;
        b=eQE80QcOQDFr9hMBrAEckaunsEhF+i8TdpxbhsnCAzOtZmF8jvUbvW1N5MJNzl1Kvc
         OEbxOavWBCKS0m+EmMcKDBaVDGPWFn1fOdm8omkh1vTkeahQJ1zAALFx8cjsIHyx8uF1
         /am0xlNl5hRoUL6EFoDBVuDsQXGb2kgfmKYBajkyn3J3+koIpD8yBn5LL8b09TUQHhNL
         aOwWD3qf8hhtbrSnXmnBr5Jbg6EjCzHO+o9Jt+cNF744AnqlasdjkghTEBI5xlqXy3fQ
         EPhdWp9uEJSiDIUHZHIhmfgqcHNdcXNlzP1JTaSNZNu6TaPCs+z+i3q23oCJGTmR5koX
         Y0Tg==
X-Forwarded-Encrypted: i=1; AJvYcCULdvgUv+RAJ8OfaHSRzqKJqdBvbVIOC+Z894qFHPnN1j83Z0iksS0sz+fMm2lGxfUe7C6Ne5B6tzn+rA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5FgCKIgDdB7aN5bIvgqARnewJfiIAV4XovBLWhA/m6v0ChUn5
	f+/3nwl3UjywIR1UnxY/DXejw5VIrj39i8d0ov/nH3znD1Loh5wqN2/DmbLT4lsg79vaIbxR6U1
	USTdzOhvvxYMsRRuJC8ddV6OK8ILAJ/Gmc5sjgNTc5x/07dVUxXO0bsIDwIcqmd9Tag==
X-Gm-Gg: ASbGncuTOkudsMFRUts+Pa8WXO9DH9igARcpii5z50QUY7jOACR0MgH4ChYOR5hvpwP
	QkalpbWvSXliFgkUBtxKqap0YXPYklDeist+GX7mgxX3I9rIrh380eDtV5SYUvJKEDz2PzdXmWT
	stL86p1Cna4Qj3y/25in++O3B7b/eRrICZzmSXV3gZ2lMVqW3wjV9gdo4JyiwIgixTzZoGru+Le
	ld8IC/NtpKPiZ+TdqKPo+kYGzClFg7ZDGMtBE2kIHtMaUdD2dUvQ5I97gW1bijjW8m95x2oDY5K
	NQL2CVWAK1V90K/oqzYN4JbITmJ4r5z9vSHmUQbz/PxFfP87P2Hv1hgcewC9JBTxED38E84s4Pg
	=
X-Received: by 2002:a05:622a:5a14:b0:4ab:7a27:ec59 with SMTP id d75a77b69052e-4aba21cbddcmr52769831cf.19.1752755587192;
        Thu, 17 Jul 2025 05:33:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH13R+H0nJcCxdj6hXz6KQmbV5pAVw+a+dWl5Nx+JoOZKLJKJi6Tv2w/rMQVHUiySpA5Ct0BQ==
X-Received: by 2002:a05:622a:5a14:b0:4ab:7a27:ec59 with SMTP id d75a77b69052e-4aba21cbddcmr52769151cf.19.1752755586619;
        Thu, 17 Jul 2025 05:33:06 -0700 (PDT)
Received: from trex (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f4289sm50118185e9.7.2025.07.17.05.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:33:06 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 17 Jul 2025 14:33:04 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, krzk+dt@kernel.org, konradybcio@kernel.org,
        mchehab@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/7] media: venus: Add support for AR50_LITE video core
Message-ID: <aHjtgHT2Nxmm5nEf@trex>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-4-jorge.ramirez@oss.qualcomm.com>
 <4734edd5-8224-4caa-8844-c38dabc6b6c0@linaro.org>
 <aHij+NHG5xbM1paO@trex>
 <8ac6f365-205a-4140-98b1-847f54ce08af@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ac6f365-205a-4140-98b1-847f54ce08af@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEwOSBTYWx0ZWRfXywtk8tybN1F3
 5rKDbpNi0zz+33rl5KGfL289ff8LWWac8HFwPvyjXylQ3MdRZekEzQWjYB/qNEbDE7wSs2FY9So
 KdqpGokT4Pby2YKWhjgsK8PG5OGG6S0yOHIr2GM8HxazO1ZM4zRUwjISax0HP+CpjtbUHgxq2MJ
 l/KsgVQXeH5h2bxj0KPWSHDi8wMbdKPAbhHg1qbmDBCWj/BMtxS7R06jzRC+Qt0QDFrlMvtbGHN
 Iyv/PMc8+L5pyPif4ZXNlUMIP6KrmPXEqcFx15f/VZkrGW7Pg2utPZh7Xo9hVJ1Uo5AAICNcP2L
 p2hEsMdr98Tkd6bq8RZCLoaCNMX4MsiuqS7PCgIWukf+MWO1ehE3NliZnGMQD+jJXkfJsQ7dQjy
 sQGpr3bcUez//3tOu10el/1oLJJ0bgVghctEACNkLjtFSs0r00YQUFLlnC7eKI/P7q0EVRTM
X-Proofpoint-GUID: tXMHrc9cXXoNsZMLZ-grnYWKdUuQdM70
X-Proofpoint-ORIG-GUID: tXMHrc9cXXoNsZMLZ-grnYWKdUuQdM70
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=6878ed84 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=YkcGIdIuY8UmMje9j0IA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170109

On 17/07/25 10:29:44, Bryan O'Donoghue wrote:
> On 17/07/2025 08:19, Jorge Ramirez wrote:
> > > > --- a/drivers/media/platform/qcom/venus/helpers.c
> > > > +++ b/drivers/media/platform/qcom/venus/helpers.c
> > > > @@ -230,6 +230,24 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
> > > >    }
> > > >    EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
> > > > +void venus_helper_prepare_eos_data(struct venus_inst *inst,
> > > > +				   struct hfi_frame_data *data)
> > > > +{
> > > > +	struct venus_core *core = inst->core;
> > > > +
> > > > +	data->buffer_type = HFI_BUFFER_INPUT;
> > > > +	data->flags = HFI_BUFFERFLAG_EOS;
> > > > +
> > > > +	if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
> > > > +		return;
> > > > +
> > > > +	if (IS_V4(core) && is_lite(core) && is_fw_rev_or_older(core, 6, 0, 53))
> > > > +		data->alloc_len = 1;
> > > > +
> > > > +	data->device_addr = 0xdeadb000;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(venus_helper_prepare_eos_data);
> > > This function doesn't appear to have alot to do with AR50_LITE as it
> > > pertains to IS_V6() and IS_V4().
> > > 
> > > This I think should be a separate patch with its own commit log to describe
> > > the quite complex logic of version numbers going on here.
> > Let me give it some background:
> > 
> > According to the HFI specification, EOS (End-of-Stream) buffers must
> > have 'valid' addresses. While the firmware currently appears to make no
> > use of the EOS buffer contents, allocating and mapping them would have
> > been a better driver choice IMO. Hoever this one has better performance
> > which is probably the reason why it has stayed.
> > 
> > The firmware then does perform operations involving the buffer's size
> > and length fields, and enforces boundary checks accordingly. On the
> > AR50_LITE platform, an earlier firmware version lacked a check on
> > alloc_len, leading to a division-by-zero scenario.
> > 
> > This has been addressed, and we plan to release firmware version 6.0.54,
> > which includes the necessary boundary check for alloc_len.
> > 
> > I should probaly replace IS_V4(core) && is_lite(core) with
> > IS_AR50_LITE() instead of trying to give it the appearence of a design
> > feature.
> > 
> > seems the sensible thing to do, right?
> 
> I'll stipulate to all of that.
> 
> I know I'm being pedantic but, the title and subject of this patch is
> "AR50_LITE" does stuff.
> 
> As traveler from a mirror-universe - I would read the commit log here, look
> at this function and be none the wiser what was going on.

right this is because I think you saw through my inconsistency.

The truth is I should have written the function as below; and I think
now there is a case for it being in this patch since it is addressing a
firmware issue on the firmware release supporting this core which the
patch is adding the functionality for.

void venus_helper_prepare_eos_data(struct venus_inst *inst,
				   struct hfi_frame_data *data)
{
	struct venus_core *core = inst->core;

	data->buffer_type = HFI_BUFFER_INPUT;
	data->flags = HFI_BUFFERFLAG_EOS;

	if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
		return;

	if (IS_AR50_LITE(core) && is_fw_rev_or_older(core, 6, 0, 53))
		data->alloc_len = 1;

	data->device_addr = 0xdeadb000;
}
EXPORT_SYMBOL_GPL(venus_helper_prepare_eos_data);

what do you think? this is really just adding a the AR50_LITE line to
the existing implementation.

> 
> The EOS check is a fundamental HFI capability which is why I again reiterate
> it deserves its own commit log with the above explanation - word-for-word
> would be fine from my POV, to explain what is going on.
>

umm not sure yet but if the above does not make you change your mind
I'll do it.

> Long live the Empire!

:)

> 
> ---
> bod

