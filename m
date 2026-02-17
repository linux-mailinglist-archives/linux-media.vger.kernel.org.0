Return-Path: <linux-media+bounces-52979-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOL2GM1ylGnVDwIAu9opvQ
	(envelope-from <linux-media+bounces-52979-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 14:53:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ED414CC7A
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 14:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D73D3003BE1
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 13:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7EE36B049;
	Tue, 17 Feb 2026 13:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUUwESn5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMSGiaK7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2453436999D
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 13:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771336391; cv=none; b=FP0cYMmAHvTvDjzpmEj+cNzafIZoBdjLZTZMw/la59BrEmR7I3giqsiy/ZkgimUQJztuIlfe1gh3kwqBz7aMG1vYHrOlOc5rtxHiRlD4e9FmjGgySGFBjXWGqC0+gorWmopFPu8VxtXfcNDJ0jcAie3JbRXrBCznZx4LD9M0YA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771336391; c=relaxed/simple;
	bh=kwV34sp4gxLwO7R53WUnUi6IMKm7Hs6C8QfgbYsm+BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHsB9VoxnobXqH7fQiflGVgC5DglZ0s2+M7K7CJ+wmcihwNL7cPKKZG6nlPIBk/iaR5bOe9J3onrWYH4scGTYWoy87Tybk+7jjRDaGEbaDY9V+9nLAUt6v6LVUL1Ms1yybM0M/D1X4DZoE1/GsXBwpjMhLEdL19YqDlADMrBH1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUUwESn5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMSGiaK7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H54Sjb2111596
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 13:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+SEogjhgZH3z9z4RBK7IBf59YPxzSZpKQYSCFZg3/c=; b=kUUwESn554XwJijF
	I+YJVZXlawtdS3tN3OUfgBlGfR9orsplxTqelOZj0VCnXNtoQaHou5zyPa6r9o56
	g0VV/5dZUHuV2Xp6pWNZAp8+XgtLh8GmvJSXIhiqGDv89VVUYHEsnxfPDkolOQr6
	BmCav23d6Wmo6UAsXGj1eA+i3DbTJWK/iBzY6DWZbhPNiG0+QjdTlIx/+7MJoEAE
	iFInq7tvb3d5OXxI8WvbBj75UzhPt6TaVGEKSAou6NgPXayIAbj4EXncf/koxBiP
	zn1mMAkFE6ukPC89Nioj0lyWanWtk5ggW67AivDZ6YPPzRWNjI5oFg+FwOevZvnM
	9/J13A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4h528-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 13:05:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70e610242so2687459585a.2
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 05:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333533; x=1771938333; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7+SEogjhgZH3z9z4RBK7IBf59YPxzSZpKQYSCFZg3/c=;
        b=AMSGiaK7PJHv48/z1+wGcwjPWy4ShfCyVJ+ZHkU28a8iqFXvvuqeYHNJhp/Ezq24R8
         452ghz2tzuwWL8Uza8/ONLgGynHJGDxyYrVHYKVSZAZmKUOFC4bCfAHVJc/USUD6hj9L
         cMdL0ct0+iXYaKqLGLGyh+z0xAhKcgepj4s/E/uRBWp6S3Ja9u7AKRTMrKcSKkYP/eSN
         TQIWs1EpW1oyjK4OiOiNmMc9mHRgQq1tz6MUzrM4HtqaLf46rg4sLw1Fg5rJ+HAGkvZ5
         SiEYdk8zFHSxb5q/4n0bE0rpXh0JiY5dZGkjBV1VEiNG59CMSQOWK47u73RKNHAlHLYt
         5bOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333533; x=1771938333;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+SEogjhgZH3z9z4RBK7IBf59YPxzSZpKQYSCFZg3/c=;
        b=K2s4sHrmwT2054F06VwuQ1RinRTdxyGIgPrDKxpqkRyzMPCDUm8l0apfFdTECC+Rfn
         1ZBlXt1Llp0u1dUMNU2unnxE0v2PPjOiYeFJj3zfcqNOGVAicJr1ZOoyV5sYBhPSeVx3
         1+4VMGRWAfynxZv4A0BE7wNm6C+ylBV7BkkQB6U5tuen00NJGBVBokAr9ggXlsV3kcC/
         WCx1SzB0OLBwf1rZzM+NeP3equzWQ9/U54cUVO6GWumIeg6aWyvzpotXeoiMoApn9sgK
         dVss156+dCiXUCwf+h9g36rHbfHuhbHYGEGx9d8Xw6ZQ6FVJRGPPOqjB46YMExptg5M/
         Ytkg==
X-Forwarded-Encrypted: i=1; AJvYcCXxlh15uecQ4UbYhHTMchSHFeILtmWIGhMbsl6mqSAbQ9UriEpQtZGsFWsxOY80Piyeas4sDBJg9prykQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyXGbGiiwv27r4ppTUgsiOoI4pWiT5gwRX4qJNQv6yrif/gPYa
	gCdhyJkogvnVFeWu5yLUpqxQBQTgTWAibJB3TuoB3Fq1LOXLjIUQS+1r5fWoHXKtbSEPlQHj2I9
	LhgtzghTBZ26nxP11OzQn8NbEnafquqtsPoVz5fK/Zd8Vo1+Wb9clVzjXAXCB2HggsQ==
X-Gm-Gg: AZuq6aLkfD16LGrI9c8LMO33rv1EXuHmshMtv6bYcFIQqjcSMi4ABx3fm0yWDccBs7u
	Zj46oto122pM3qIzeDmgj3jK6ylMkzLUcHPjQOqToiss0w2mn901NLE/sofVd14WvkC2Bwm0AOp
	bAB8oELDd1L/0qK3ZTA8deCWY0Q6pKYOBck4m/M8Q2OmG8Gu8v2hqLYcYY9cMbxn2SbS+vnYISK
	XeS/r5Ft33S/syZKwz4970OGlAeiDMqkqW23ZLrTsZoRc6YnQ4NhPDF6ND8FbBHrV1dmpp1w/x8
	SPKD2YD5AZng6kvIStOQ3Nl+zgrcMoB3hAmNqgtMoCZzh0xBtxKaYej+t3dj+k7PHuXzFTu1qHM
	n4Dpzaygq8FeWGa/jCqVmclw+6KJ6GmukrczQ5fnALbGSCz6BfZigaksq12FCan8kGYUDVnHX6A
	ucZ5GwYRVUE5YmcTdjlpNANdSRZcwcSQV/NIY=
X-Received: by 2002:a05:620a:454b:b0:8b2:e069:690a with SMTP id af79cd13be357-8cb4248a27cmr1884839685a.68.1771333533122;
        Tue, 17 Feb 2026 05:05:33 -0800 (PST)
X-Received: by 2002:a05:620a:454b:b0:8b2:e069:690a with SMTP id af79cd13be357-8cb4248a27cmr1884832685a.68.1771333532598;
        Tue, 17 Feb 2026 05:05:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068e5a07sm38131921fa.28.2026.02.17.05.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:05:31 -0800 (PST)
Date: Tue, 17 Feb 2026 15:05:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
Message-ID: <fjklyq2basty7smvvjmh3eyp5lf7gtprtm45w47s5r3abvcbco@usk6oyguwkv4>
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
 <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
 <nb576n2risxl5mabotlu3idmoztedrblur4gbvdlk4cu3mtiqq@ecezsux4w7jz>
 <2f85b131-2167-838c-152a-03be689b0b29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f85b131-2167-838c-152a-03be689b0b29@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=6994679e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=N8z6d-Pn7CxZ1ZIEyzkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX8Ec9gIiPrXwQ
 oB99fFWx+aq6FgwcoF+j4iGNlAWDtg4J1oRGRG9YoKjU4l6GpyImnhbQK+2Qu3OTyBr83vURZ0I
 zv+3P7/inVY9UXw5l8IPHLuFIdsGssFFavyziaAU27yRnD1eUIFUyE4gw/dIu1kznj/jMYkLqRT
 7vnJnCEokqs3dYwm6KQ1e1iDQ2iRNif8JaGQKVCUVka76B0ig33n5Nso81tmaXPKuMb+sa8cgBc
 JDCrzkOPxsRLEAIVdvJ9D5mSzT/TWugApW4u1RF+PiceJC7G3Mju5UdexrLxoa8+FEin1CLrvoz
 cjpmze/ZvHguPAitjqlncy+rXMjss90dI2PHIrs1C/FeHWN5n0NMmT65Z7VyYWa7QWF+VIS0Q3Q
 KdzYw7//m51cOhQ5Q1Fr05j21L1F1f1vGtJHJKJZOGA6sqspvhhHkaeBjddEii6420g6J2CXL6r
 WHPq8smQgWb6i/Z9uqw==
X-Proofpoint-GUID: QXw7K0C7E_shpl7Ubh1YW9ZZFVDD7nP7
X-Proofpoint-ORIG-GUID: QXw7K0C7E_shpl7Ubh1YW9ZZFVDD7nP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52979-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85ED414CC7A
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 01:10:21PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 2/13/2026 5:34 PM, Dmitry Baryshkov wrote:
> > On Thu, Feb 12, 2026 at 06:35:19PM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 2/12/2026 5:13 PM, Konrad Dybcio wrote:
> >>> On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
> >>>>
> >>>>
> >>>> On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
> >>>>>>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
> >>>>>>>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
> >>>>>>>> use Gen1 by default, but boards that intend to use Gen2 firmware can
> >>>>>>>> opt‑in by specifying a Gen2 image through the Device Tree
> >>>>>>>> 'firmware-name' property.
> >>>>>>>>
> >>>>>>>> Based on this property and the availability of the referenced
> >>>>>>>> firmware binary, the driver selects the appropriate HFI generation and
> >>>>>>>> updates its platform data accordingly. Boards that do not
> >>>>>>>> specify a Gen2 firmware, or where the firmware is not present,
> >>>>>>>> automatically fall back to Gen1.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >>>>>>>> ---
> >>>
> >>> [...]
> >>>
> >>>>>> To avoid accidental matches, I can switch to an exact filename match
> >>>>>> instead. That way, only the specific Gen2 image (for example
> >>>>>> "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
> >>>>>
> >>>>> How do you detect that for the OEM-signed firmware, which can have
> >>>>> random name?
> >>>>>
> >>>>>> want to use Gen2 can opt in by naming the firmware accordingly.
> >>>>
> >>>> I Explored on suggested alternative approaches and seeing some limitation
> >>>> with the both of them:
> >>>>
> >>>> 1. Detecting Gen1/Gen2 by scanning the firmware blob (fw->data)
> >>>> It is possible to parse QC_IMAGE_VERSION_STRING from the .mbn and  extract
> >>>> the version string. The issues with this approach :
> >>>>
> >>>> - the version string has no explicit marker that identifies Gen1 vs Gen2.
> >>>>
> >>>> - This prefix is not a formal ABI, and it is not consistent across SoCs.
> >>>> Each SoC family uses different naming patterns in the version string.
> >>>>
> >>>> Example : For SC7280 Gen1 we currently see:
> >>>> QC_IMAGE_VERSION_STRING=video-firmware.1.0-<hash> while SM8250 has
> >>>> QC_IMAGE_VERSION_STRING=VIDEO.VPU.1.0-00119-<>
> >>>>
> >>>> So the driver would need SoC‑specific string‑matching rules, which is hard
> >>>> to maintain if we are looking for a design to address all available SOCs.
> >>>
> >>> The only SoC with such distinction today is kodiak. So we can simply check:
> >>>
> >>> if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
> >>> 	hfi = gen2;
> >>
> >> Agree, this works for Kodiak. However, Dmitry was also referring to other
> >> SoCs that may support both Gen1 and Gen2, and at the moment there isn’t a
> >> generic way to handle that check.
> >>
> >> Also, please note that the Kodiak Gen1 firmware uses the string
> >> video-firmware.1.0, whereas Gen2 uses VIDEO.VPU.3.4.
> > 
> > This is not quite true. Kodiak Gen2 uses:
> > 
> > $ strings /lib/firmware/qcom/vpu/vpu20_p1_gen2.mbn | grep VERSION_S
> > QC_IMAGE_VERSION_STRING=video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
> > 
> > A collection of versions quickly captured from what I have here (for
> > different chips, but for the overall picture):
> > 
> > HFI Gen1:
> > 
> > [skipping prehistorical / museum data]
> > VIDEO.VE.5.2-00023-PROD-2
> > VIDEO.VE.5.4-00059-PROD-1
> > VIDEO.VE.6.0-00055-PROD-1
> > VIDEO.IR.1.0-00005-PROD-4
> > VIDEO.VPU.1.0-00119-PROD-2
> > video-firmware.1.0-6804c210603073037fb32640a3dd6a46fe04edd6
> > video-firmware.1.0-7da9db401e417a006ef915d6c4323f00cdbcf40a
> > video-firmware.1.0-ed457c183307eff1737608763ca0f23656c95b53
> > video-firmware.1.1-84a8080bf84fa9ab15b353bf03bea6e548d89d2f
> > 
> > 
> > HFI Gen2:
> > vfw-0:rel0095-d1a9e7c4a274aa13e4136500d19262f87ef2c921
> > vfw-3.1:rel0085-070fa3311d9ef968015fee7fea07198d7eb208a1
> > vfw-3.1:rel0093-7925621ff52ecb7b1565341042c4e5ffd4fc76ce
> > vfw-3.5:rel0040-1ded01d0e6dcaef08b8155fd5a02f5b57248d5ca
> > vfw-4.0:rel0045-25b39e81446baf48716df98dd37099a2103d36ee
> > video-firmware.2.4-48ec04082362ef1922fec5e20e22f7954b11d736
> > video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
> > video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
> > video-firmware.3.4-e299f99ffcd086b43a2ccc7c3279ce5df404d693
> > 
> > It seems we can assume that Gen2 is:
> > - vfw-0
> > - vfw-N.M
> > - video-firmware.N.M where N >= 2
> > 
> > All other binaries are Gen1.
> > 
> > Also, we don't even have to query the binary firmware blob.
> > After the firmware is started, you can read the version string from
> > smem, saving us from strstr over the firmware image.
> 
> AFAIK the video/iris firmware doesn't populates its version string into
> SMEM by default.
> 
> On venus, the version string appears in SMEM only once the driver
> explicitly writes it after receiving the version info from the firmware as
> part of an HFI response.
> https://elixir.bootlin.com/linux/v6.18-rc5/source/drivers/media/platform/qcom/venus/hfi_msgs.c#L289
> 
> 
> Iris does not implement this SMEM population path today, and the firmware
> itself does not publish its version into SMEM automatically. Because of
> that, reading the version from SMEM is not currently possible for iris.
> 
> Also, relying on HFI to retrieve the version is not viable for detection
> because we cannot issue a protocol‑specific HFI command until we already
> know which HFI generation (Gen1 or Gen2) the currently loaded firmware
> supports.
> 
> Due to these constraints, I think, the only possible way is to extract the
> version from the firmware binary blob itself.

Ack. I for some reason thought that the version is populated more
automatically.

> 
> Thanks,
> Dikshita
> > 
> >>
> >>>
> >>>
> >>> Can we agree that VIDEO.VPU.x firmwares are hfigen2? If so, problem also
> >>> solved for <=8450
> >>>
> >>
> >> Nope. that's not true for all, SM8250 uses VIDEO.VPU.1.0 which is gen1.
> >>
> >> Thanks,
> >> Dikshita
> >>
> >>> Konrad
> > 

-- 
With best wishes
Dmitry

