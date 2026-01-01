Return-Path: <linux-media+bounces-49829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 686E7CED511
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 20:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C48F93000B3B
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 19:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C3F2F3C12;
	Thu,  1 Jan 2026 19:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZNzDM3K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LgjPg69h"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C7125A354
	for <linux-media@vger.kernel.org>; Thu,  1 Jan 2026 19:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767296864; cv=none; b=KFasJiXuZ1TOXKjpGQOttDD6M2e4NcTzc1gLpJdFIizSb494Gwt4pIYM6vdpsEGm2g1mngFvzOn37OAmihD76bcIgguWin25gpCZJV8QAoP5+b3C+dmSmGCvJlEv+Kbom+Q+v8vg0laJuFFWCMTR9EuAPivZGE5lumGLZJ5DTk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767296864; c=relaxed/simple;
	bh=wPz6/A7Ye5l/a54roj0Woc9lHGdEkaFnDIW3yhQ3GqY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6JKD1+DSKOKh0Efn/29QJJ+ikkfW8+D7Tp/V9xUAnQNvvO1mxD7Tv5ruq8V8CZOy4SA4QJwtnwH2tBrXlURkB2c+WGZxU27TwBrb1kqeR/TeU1oQ1X3UZ4kQrHpIxZk4xPFNkaNJFq5nxf6foYOyjm5PkCONst6Limbmkddye8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZNzDM3K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LgjPg69h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601JEePn2807378
	for <linux-media@vger.kernel.org>; Thu, 1 Jan 2026 19:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WmEa8sTsuONOQC5mcK4WwQNA
	371bg3byPjHRzHnsmp0=; b=KZNzDM3KBpqIgpcawvfWw/zjmU5Um2XfO8FQMGBW
	rNF6fhTJS133Hv50joenXXTGHPUwef0wfvPcdiW1W6GZFRtucmoxh7bCSBlpISvu
	3ibNd5bzDJwF61tqh5GE5MH7+HYdn6H0FfPLMhPkJ/ZBrPnj84+sG+7R+3BTmetS
	P0NyeJKrnTz/XdhY13bE6ukAg7oG/Ch0Lw6pQTFY/MOlaEftmZzQC/GzuALSpQSM
	TbO1zyj9ddSEk9m3uUg4HkGMksBeVi5DUWmxSiq5XUYaaQwH+WGOoqB81aXz/u63
	jXcZnjyypjf6rCGD+6eUSVfP82iyJx4sfJ8E8s3lxzTNyQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vthwy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 01 Jan 2026 19:47:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed782d4c7dso207883741cf.2
        for <linux-media@vger.kernel.org>; Thu, 01 Jan 2026 11:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767296860; x=1767901660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WmEa8sTsuONOQC5mcK4WwQNA371bg3byPjHRzHnsmp0=;
        b=LgjPg69hxYP9btKcVDdqbonllEg7zbjArNjCTp7O+6awzNMdpXlGIU3MKdK9Tm4jU/
         0ZzJyLvdlSWIyE1pNJxJheInsuasSTp3ZMoPlAVJEFOnODHcNjGpYs/GzPT2vXOAk6pW
         fOCspixePMYL0LpqAE68MfmHkk5MgEId2kRoKAeesCH/Hs5jbtJUwGwbOwn11ydivPq/
         qcqLdyrf1iwFhTDnQexaGaFURu4h6c0xeRp+CLDUpGwhSfpmJPElQDHMAZZUCKJI7ccK
         xJN06q7d15KAdaif8evlPDsMIteByG9GYDJD1e76UE6pZprq4q5DmNsbxjmASv7GLtcD
         6ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767296860; x=1767901660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmEa8sTsuONOQC5mcK4WwQNA371bg3byPjHRzHnsmp0=;
        b=M8L+0Q6B382KD1b2dS9GSkbuN4Dapw/xv7uky2EbKibMzBJFFb1cgHIpnUI7qG9+hQ
         TE+2tN1K9nfwirOKKFaKKypWXWN5CsTHl1ciM38A+rS9nP058D8Hto58pMSJ4r74BWOb
         GbpBRxjCQDdQmTYLu9qy1nLKaYcElJRxm9gqcw9wn7W8rti6ZfqE8YnHcI2q0SxqMHx+
         BGrPML1VEKQ8Mag5gJXRXe1XHLV8t2X7OSDPYBmx/5MobLwiz0G0m1tSxfAwGcDKqDqa
         XGxNZLolVChpNjD9tPLn70LijloYmPEqZwSv/It9rMk+60wShGIbM2Y3Xcv6ExavUG+V
         iJbg==
X-Forwarded-Encrypted: i=1; AJvYcCWVpMD6A2YDYEAucMFN9hdBK96SgIawMiAzRhud704gqKdYU/N3yJbNrcJZ4sP82j7/c4T4+Cy5YkXjLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKR2nmBaw0djK+9JUw60BB3HHVTtGouvIXPLvvnegr2L4dfVYG
	ZnAlzl5zHlX0GWxdyIL4rn4mrJcSSEcOcr8sBAvyGIPu+/mOtEd6aIJw8+ZsmBeaL8Wg9a2GBMn
	dSNTpIWrSBPREJFRFa6mQPB8wmusheoAlRiJPdleN9bGba1NTPXy1JjM59Bsrs96bSw==
X-Gm-Gg: AY/fxX4vqxuakmWHLai68d+03pA6LN7Dmzs8ppnj4v8tqMudW2MeBQ/wmn0xtuelOgk
	6hfgF59tdKk98hA4HeMFwwzjFelgnQWvJ9IQ0QvcGDgE5899VSsyTIAQ7KqWFYNwLAdHBBOcGQw
	w0gYRZlWLT4EWeBhxnAtSxdFEf4hyQWGtXm+JDktosYzL6ogcSu264NVuGqUxz9vHcmVeJJaXtx
	9Wzj2oGHe+Rxt0H6FGsHa56q3k3czk1F8D7kzpP8Q4vLN7ExETRHoGT/ZTBo4KG+3m+MauusuI1
	W+oIR+Z3g0wYszFQsuclIr9KRiAcR7UkuSIF9qk/z5/kf/Ci8KzQlD5IeDWdMSbshpa6KhFmpgB
	nE5lHIFgUaOvCKEtCotkkkfUSd/98ILJuZXHFFU96YPsp
X-Received: by 2002:a05:622a:344:b0:4f3:4ec0:9032 with SMTP id d75a77b69052e-4f4abdd5bb4mr587273821cf.72.1767296860401;
        Thu, 01 Jan 2026 11:47:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEabtzU2q2HPDpVEB8UPSt94tcsqv57u9yIYbx0KjUeGxp18xsypq11MCYSVw2DcQCDo4P+ug==
X-Received: by 2002:a05:622a:344:b0:4f3:4ec0:9032 with SMTP id d75a77b69052e-4f4abdd5bb4mr587273541cf.72.1767296859899;
        Thu, 01 Jan 2026 11:47:39 -0800 (PST)
Received: from trex (198.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346d33sm720111565e9.3.2026.01.01.11.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 11:47:39 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 1 Jan 2026 20:47:35 +0100
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: venus: assign unique bus_info strings for
 encoder and decoder
Message-ID: <aVbPVwlJHWY60VAd@trex>
References: <20251126140041.754071-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126140041.754071-1-jorge.ramirez@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=6956cf5d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=5kMdAn2P/uOieV37Se86+Q==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Ru27C6mqnJDUFzEZ51EA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1nNFeCzEfVz3MCCfTGMmnchoLsZfJWIe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE3OSBTYWx0ZWRfX3MklGn6a1g0n
 7um5BtbRn7GF4XBHF1sWAyxV41iEddy1YCYTYhticMyyzfNX/V9QMF+p2UM2tvZ7SEf4E9f9QJU
 LoyGHwPbBEVesrsA5lwBJ8Jt0Ep2OaXccrMoCABVidVjwj6mRaq0CeA3SuPvseRKbdZUFr4zFzR
 R5/dUO1aoIBDfwy5YzHmInwEFtZyrAb9uAoEMjKe6OJszqtps6QyOOFXXxEvzUtDDIXRTPwmWfe
 skbJKtbO2VYXI/N1emrI8VypoRc6bYfvZo54WaM8gLOgAAVxXbgBOrCIqVGmHvCamcrz3UBLu3M
 LJVZSlo/LK2BEZP1hmmV4lt7TvuCcSn1vR130BOgBTInIWthYhbpDWZT0fUciOHVITDIP3v3dF6
 94OhyXBItZ08bFAItp/qGVt46cLzG3sUoNvdgBjTsxhBWVIWklj8hm1ioVjsCAjmFsKzVBuoW+D
 +qR6JwDiLbzG4pGlRtQ==
X-Proofpoint-GUID: 1nNFeCzEfVz3MCCfTGMmnchoLsZfJWIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010179

On 26/11/25 15:00:24, Jorge Ramirez-Ortiz wrote:
> The Venus encoder and decoder video devices currently report the same
> bus_info string ("platform:qcom-venus").
> 
> Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
> parent device name. With this change v4l2-ctl will display two separate
> logical devices
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 6 +++++-
>  drivers/media/platform/qcom/venus/venc.c | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 4a6641fdffcf..16587767e597 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -433,9 +433,13 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
>  static int
>  vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>  {
> +	struct venus_inst *inst = to_inst(file);
> +	struct venus_core *core = inst->core;
> +
>  	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
>  	strscpy(cap->card, "Qualcomm Venus video decoder", sizeof(cap->card));
> -	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "plat:%s:dec", dev_name(core->dev));
>  
>  	return 0;
>  }
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index b478b982a80d..0b5843ba536f 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -144,9 +144,13 @@ static int venc_v4l2_to_hfi(int id, int value)
>  static int
>  venc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>  {
> +	struct venus_inst *inst = to_inst(file);
> +	struct venus_core *core = inst->core;
> +
>  	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
>  	strscpy(cap->card, "Qualcomm Venus video encoder", sizeof(cap->card));
> -	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "plat:%s:enc", dev_name(core->dev));
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 

just following up in case this one fell through the cracks (cant find it in media-commiters).
happy to resend if needed


