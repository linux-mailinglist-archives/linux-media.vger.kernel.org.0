Return-Path: <linux-media+bounces-38969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88293B1C69D
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 15:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7300E17E118
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 13:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2A728C01E;
	Wed,  6 Aug 2025 13:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqzHMc3E"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A3223E358
	for <linux-media@vger.kernel.org>; Wed,  6 Aug 2025 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754485651; cv=none; b=GNN5ZO+/55XntLFBBgx5y+bCMAuDeijbGlV0eBuoJ+nlYt0DyeuLW3L641Vl54vkq7ihv8nJoaWpWTBeWVKjB6hOPP0NBwpihjraybbL6aihK/GwlwPqTrHpUhk1Nc6tP3y46UffwBvJPzVx5gz/qsITTckvn0L836A8bgyIM9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754485651; c=relaxed/simple;
	bh=aYeJJMheOEdjV6tYcETsLaUCoj40eP9v/azCo6hYPzc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V221kjKcfVFHL+mhxXhyt8nZCHrrxsPacsUzZlRqA0o04859/mRD0VX+IZfMfYQwKSVqxoRD+cWezdY8FegAlxOSF4z5XdGE7Xe7HQ7rJ68rT9Uw19l+5dVRp2Zcf06jEdZ1d5siAV/qy4BXQfTgghaVgoGS5XDRMwSmwpemMBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqzHMc3E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576CYGIo020912
	for <linux-media@vger.kernel.org>; Wed, 6 Aug 2025 13:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aUJd/u0P4u2xrS8qlnxXVGpkugZ9tcch8pBOz945UxI=; b=AqzHMc3EeM2kJ7EW
	ilj/eLNuYP6bArxLaakiXHUaD23h59Efb6Ky9bbpfwkl+rKT+SxFNe6nrsvCDkf2
	jDVeAiuZctGdbXx8Laetk+P0PytuDFN0pknhS0Pw8C/hL71VULYd42IyihBwI3T+
	WW63+rDgoH27Fj6HV+WtdXFkPPvrbdYOASj4WfnoKbcgr9Gx5FC1sTRZ4Eb192ks
	FrFqI2/kRtYD/RXzVWvliJNjuMdPgei4nAjAgnaqMX9QlIrPHT7s6h+DlEBu8Tg9
	A/PaTTo0GoPwip0uyjg4YH5nyLj9TZTpn6QhWhB0SigqsmOkQw1bktl4egtKzm1H
	J//CKA==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1at7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 13:07:27 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3e3d0bcd48fso112305475ab.2
        for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 06:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754485646; x=1755090446;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUJd/u0P4u2xrS8qlnxXVGpkugZ9tcch8pBOz945UxI=;
        b=rqgGq5tjYNNjbbG4qxtgwRdADYzBl9V4KHiA9YV+orvJovj7B8oPCzjeV4p5djL704
         kK6Hou3oJNFcJ+ML8FcQ8K+nB7ZEw/nyAYoeIiGmpd2VjpC2a5cCMgu7GF+4WKiC6oB3
         s+ygArUSMV5pF655pMUDD0pKrB6pVXgi5mwizTaqAOXgArXBC9mQuv5JQV5pSjVlluDR
         azO9dgV0Yn1NLJhywAZhELS7KGne7qW4gYwtKABuXrRcDJgw4PMr5a1gutvCIPDnv79U
         6NroMZurlqrqZxYkgQld9BgsLebvpQ1Gf1kq0UFjOYcP/Pue1VSmyPL/zsUdb5bNZGCq
         OgnA==
X-Forwarded-Encrypted: i=1; AJvYcCX5FoCrANuVotfPQZ1IdJ0suEMKZZlttqMJNmN2GKcXtCmYYagExnBg4NWf5b1NRXad+/N8x0U6zrq3vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmUx+vJDRRTF6PFKQ8uQO7w+YIV4GRDYOBfk6ZHtwxctZ2dQka
	5x1nfUiI8dOmknxygTSIaBUkS1zRsSaALcxcEeVpGCCj3FAJlURaHnAyV7YuITzEj1fAub8wtV7
	n0ZOePjcR1jIS4/j4ratjTjrGjBRNmRQHUGnN8PkHOs2TlX12SlBatu4+laCKW0QEaQ==
X-Gm-Gg: ASbGncuDxKUk89aoeRrBeMs5v1GioPYTT2ecJ2hsyBTSxNbpmBj56kOcU+2VTa4vebn
	YGwAINr/13RK42rSNPycvJcSWg8ECi/XMEbd+4C1BHD3WHM+cbqb+mmG/7wMUH0WjUQqmqJlxbN
	Dll+Hudb9oZfjrD48qoKY18RJJEaUgE9Wv0yy44+8g2UQsIXgKgwyyHGpsnmcYiw8IeshRRKKxy
	BOOmKFdr5eWehARBft0cv4QB+6O9sdoBWxbNaeiQ9CPojbnatpQirMaBhELFzmFmlwQvaSeSGu2
	1YrOk1uA6fOhxedTwZ1hwOpTMbiHVdLywyZtPqasfpj3Me1MCTwkR0qa7+qUTAISF1g9bA==
X-Received: by 2002:a05:6e02:148c:b0:3e3:fe5e:9b96 with SMTP id e9e14a558f8ab-3e51b8ec632mr41719865ab.11.1754485646274;
        Wed, 06 Aug 2025 06:07:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWtia5YTXIWsB8teOlyMifK/iGB3a9CpX0BwSJO8pUmmxHJYLjKu71r3Cg4hIyRpYWnfn7Ow==
X-Received: by 2002:a05:6e02:148c:b0:3e3:fe5e:9b96 with SMTP id e9e14a558f8ab-3e51b8ec632mr41719225ab.11.1754485645687;
        Wed, 06 Aug 2025 06:07:25 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5852e28sm48063915e9.9.2025.08.06.06.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 06:07:23 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Wed, 6 Aug 2025 15:07:22 +0200
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        quic_vgarodia@quicinc.com, konradybcio@kernel.org, krzk+dt@kernel.org,
        mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aJNTigOMy1JFOxot@trex>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex>
 <aJHqpiqvulGY2BYH@trex>
 <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
 <aJMMhIqNupwPjCN+@trex>
 <0248afed-b82d-4555-8277-e84aacf153fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0248afed-b82d-4555-8277-e84aacf153fd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX7liOWRZ2tNGK
 kxB70V7+vOb3Vfw/PP2EDDo+sFH1xgDs3YZLP9naYLvEfVJ9YAfLt80Slbi2+V5/0C4pL/vYqYs
 ZhLdClhueVa8fPWtvI0lX/mzKfHdPWk/ZBv+8X5RZo+twKW4gPkr9Dudgj/VN5LtiUkkoKu4BeX
 GPw0ivthBMByrE2uuAxoFJhu3n+/ZmCjKk3O1RdJis3HZtXGDCwucrY/xMpEIEekKe/rsM/0pSx
 ZCMTgL5hgWWgdv7VSZtHnuIYLUFEMBdoLMJnn1/0r5UygycdsiYjmwpJ3FE2psvke7G1JqOYiif
 rdcwV+jNmPyN9EEp5lJCEn4s1tB2Kjl86FFzrbJ2nlP8ZmT3m0pI76mmDn4Pqkmlkd0ZavHJX1q
 D+Q8eeop
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=6893538f cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=ozpgGUE-rs04tbkcxKEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=8vIIu0IPYQVSORyX1RVL:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2DDx2sQw-kcoa8CYDiy08DP-_RHrn7hm
X-Proofpoint-GUID: 2DDx2sQw-kcoa8CYDiy08DP-_RHrn7hm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 06/08/25 11:01:09, Konrad Dybcio wrote:
> On 8/6/25 10:04 AM, Jorge Ramirez wrote:
> > On 06/08/25 04:37:05, Dmitry Baryshkov wrote:
> >> On Tue, Aug 05, 2025 at 01:27:34PM +0200, Jorge Ramirez wrote:
> >>> On 05/08/25 12:44:23, Jorge Ramirez wrote:
> >>>> On 05/08/25 13:04:50, Dmitry Baryshkov wrote:
> >>>>> On Tue, Aug 05, 2025 at 08:44:28AM +0200, Jorge Ramirez-Ortiz wrote:
> >>>>>> Add a qcm2290 compatible binding to the Cenus core.
> >>>>>>
> >>>>>> The maximum concurrency is video decode at 1920x1080 (FullHD) with video
> >>>>>> encode at 1280x720 (HD).
> >>>>>>
> >>>>>> The driver is not available to firmware versions below 6.0.55 due to an
> >>>>>> internal requirement for secure buffers.
> >>>>>>
> >>>>>> The bandwidth tables incorporate a conservative safety margin to ensure
> >>>>>> stability under peak DDR and interconnect load conditions.
> >>>>>>
> >>>>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>>>>> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >>>>>> ---
> >>>>>>  drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
> >>>>>>  1 file changed, 50 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> >>>>>> index adc38fbc9d79..753a16f53622 100644
> >>>>>> --- a/drivers/media/platform/qcom/venus/core.c
> >>>>>> +++ b/drivers/media/platform/qcom/venus/core.c
> >>>>>> @@ -1070,6 +1070,55 @@ static const struct venus_resources sc7280_res = {
> >>>>>>  	.enc_nodename = "video-encoder",
> >>>>>>  };
> >>>>>>  
> >>>>>> +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> >>>>>> +	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
> >>>>>> +	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
> >>>>>> +	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
> >>>>>> +	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
> >>>>>> +};
> >>>>>> +
> >>>>>> +static const struct bw_tbl qcm2290_bw_table_enc[] = {
> >>>>>> +	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
> >>>>>> +	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
> >>>>>> +	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
> >>>>>> +	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
> >>>>>> +};
> >>>>>> +
> >>>>>> +static const struct firmware_version min_fw = {
> >>>>>> +	.major = 6, .minor = 0, .rev = 55,
> >>>>>> +};
> >>>>>
> >>>>> This will make venus driver error out with the firmware which is
> >>>>> available in Debian trixie (and possibly other distributions). If I
> >>>>> remember correctly, the driver can work with that firmware with the
> >>>>> limited functionality. Can we please support that instead of erroring
> >>>>> out completely?
> >>>>
> >>>> yes, in V7 I did implement this functionality plus a fix for EOS
> >>>> handling (broken in pre 6.0.55 firmwares).
> >>>
> >>> just re-reading your note, in case this was not clear, the _current_
> >>> driver upstream will never work with the current firmware if that is
> >>> what you were thinking (it would need v7 of this series to enable video
> >>> decoding).
> >>
> >> I'd really prefer if we could support firmware that is present in Debian
> >> trixie and that has been upstreamed more than a year ago.
> > 
> > 
> > I share your view — which is why I put the effort into v7 — but I also
> > understand that maintaining the extra code and EOS workaround for
> > decoding needs to be justifiable. So I chose to align with the
> > maintainers' perspective on this and removed it on v8 (partially also
> > because I wanted to unblock the current EOS discussion).
> 
> +$0.05
> 
> I thought we were going to eventually relax/drop the fw requirement
> when the driver learns some new cool tricks, but are we now straying
> away from that? (particularly thinking about the EOS part)
> 

um, no not really: the decision was to simply drop support for pre
6.0.55 firmwares for the AR50_LITE.

Pre 6.0.55:

-  has a requirement for secure buffers to support encoding
-  requires a driver workaround for EOS (providing a dummy length)
-  during video encoding.

To support < 6.0.55, v7 of the driver patchset:

- uses the version to disable the encode node
- enables the video decode node
- implements the EOS workaround.

It was agreed that this complexity was not necessary and that we should
just drop <6.0.55 firmware support (which would in any case only include
video decode).

And so on v8, I removed the above.

Now I have v9 ready to post it, but Dmitry is asking why cant we have
the v7 functionality so I am waiting for direction.





