Return-Path: <linux-media+bounces-55723-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLUwINwwtGmuigAAu9opvQ
	(envelope-from <linux-media+bounces-55723-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:44:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F28F9286430
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 839333043AC1
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E2B3AF64C;
	Fri, 13 Mar 2026 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKoaJeyJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AR8pQkiK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA9D399368
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416298; cv=none; b=Iv0GkGAutro+mn0+L0+MaRFwW7sPNTyHlSdvWoLOSPrJaNQKd0bwQ1NGFVR16/Fq2ZamzLgWXg2ebt8iZ48KbyQcMOiuyCcHXe7imnRNQyVtBBtokMmyF2R+CQmwku+XfxtDUxmCRlYpR5EDSnLe8rsmc/XYoH78O17YJR90JfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416298; c=relaxed/simple;
	bh=DzV86dVTBkJFl+81gRHZySlu5Hs7Tg3y7UcFrJIGUqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Icnw7/Li24IHKqud+561rXwGtaM8MwdLUU21Gu+WxGZXUEClcELD8hjizYwnIXFfsWl4g6zOsePmMMm3lQoTjE8nW+MbUbTUt57mQjLUk/wuFG7tDclF8j2uBg9Nvy4mxbafu0xLW4a/3woL8Krc6vkQ0d9JSt2T018N4zm6Mwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKoaJeyJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AR8pQkiK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DEbdWo2262702
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HfoqBgtFBPOG18HFwuX3p4vU
	62ysi71nghWsY8TsAl8=; b=WKoaJeyJOc1oLoSS9CiFqw5SciMt9ESBcfV6DMfK
	32DM1n/hxoga7Zl95jydi75qyeNNcrPxb8y3Wb6ZSc4ZnOdHmPaGfk9PQvMcWRAQ
	jlbvSFNl+ffSy3Mba3tNbOB4LVktOuQ915luix6M9Lr/io2+u/VEcZ0TeZwPR68f
	eB639YikvY67ztSG1FVpx6OUoKvRg9XgAvgwo2c+eV2LXzUUDFo0QQR+nqvHyiLg
	w/v4URjzR4keJ6O8YyjzAjQlkImBrIkAjrJSC2Ilb0bLMTYnW/Ha7HQ2kEViNfAF
	qipje3K9Qan20VVki8AoxuBWhbJ34dUbXeXP9NI97MMZaQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4smu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:38:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81be6f05so1323553385a.2
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 08:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773416295; x=1774021095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HfoqBgtFBPOG18HFwuX3p4vU62ysi71nghWsY8TsAl8=;
        b=AR8pQkiKAv3n3DSVSmGk+jA5B1mLUIpqBuG9VSULSdj4zKOGAADXXluwRUV3BW9u9M
         JduvdV8hpTCEw0W1idXceKYSLZbXFqWGKIBHP+c0oMfFptKjG9Ke22sscrE7wbugorKp
         vx4mte5kpFsPHUkoZDyhrIISsSbx6C/o3Ijzi7Bq2r15ZTe5NPY5fd/YxN8nF0nVX4OQ
         llKk3d0jnTTy/qFD/LeXXapN5OgGDY8AS0apgyCNUK34WKXzI2aIM3mTu09NdBF1omGy
         buGSxB7dqYrFbZw1bNWr+G3RrK5AiKwBU+rLYxc3Wvbus97l5sHMQhxuV9hNSkHg5qGq
         zR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773416295; x=1774021095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfoqBgtFBPOG18HFwuX3p4vU62ysi71nghWsY8TsAl8=;
        b=tKLq1JpPwUB4jbKrqI35CNr6R0gEhEXKuKkiDOs6tyAhOZDoFOe108AHRTFpXH32Tn
         OwTOznw5A/ODJopDeg8mM3tqB3bMA75m0cwSxK0wEq0Fu8BUtxj/EG63XSUQSNyPSSY9
         fiGGV/51wTXp1k0uMOEHgIYaxMnkpV8/XzcjCHT9/HtEXXqE/jT56iB5b1OG4UJanNPt
         3D8uKehr4zAO8T6u48hU+9bttJDwvmEsGYKf/qWD3VqxEiu7zWBJ96URm6uwGICTrI8l
         onO/bdNeTrdsq/I5SCHHmteuVf8DO0shq5SFCbClHmYPzqPAOtPWHYj6QY3JMXo26jPB
         Owaw==
X-Forwarded-Encrypted: i=1; AJvYcCXxe40vKJuA29OLwAVmWERZZJws9ZB4u8ndp/jMp5cV1lwIRqjBJTs3MHhu4BbVXGa6YvtEDqeM7gkVAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNDUMcSmQ+sE/6EclU258maG48DYtmCsoDtCUgbEEoAU589kR7
	cBsorS3lYqoaSoQRF10o+vtk5M+UURlfTygoPswhUHccCVq0AxgtmTN86gnheiF+6eF0oTwaPP2
	2LXi7C7o/VSgnn2ykDPy3lt1BWK30CUIdOqz2ygGFxn3P+SdaKsh7LkGs3HN0t1LtFg==
X-Gm-Gg: ATEYQzwE/TXKROI8jmEkXO5KB9KJz69Ir3Z486YARV+Ex03vWjDqvlokNJNCNtzhtL3
	ueSL+vm7ZLSV+QDfnvpDTGuBQqxEcGg8akc/4iisQLfrbsNzin06IsXusSc6LFHX85mVWqOnJYr
	ZQummgpeOvYKKURtcyroIxkyGu1FguyOjTWfxG9JqoS7MU44yVJiY0ZjmdZYg9wC2q5Hucoxrkq
	tTaC4SmK8cGwzuV4RDg3MDkLafthrJD86efAJmAPJzialIIcN3opK6DF1Ncurlkx8AJiF5Z2wzQ
	nnsdmMGFBiBXR0qSiK2KP8ggSuZW5X5rcmeH2A4BzVp/JNlmA3ca9MpO/06I1uzQtESYLThtQJU
	vAFWXE5/+60Rkwq4X+/NlUNaAc+XrcSIFP3U7wNe5wyPZe5Yyjwcs9xD/KqndPujHo+Moc/S7e0
	O/DuMogXlA4MgIaMhKnfqjT6scEmzB3yW0XxU=
X-Received: by 2002:a05:620a:44c3:b0:8a2:234a:17be with SMTP id af79cd13be357-8cdb5a1c13amr525244085a.7.1773416295417;
        Fri, 13 Mar 2026 08:38:15 -0700 (PDT)
X-Received: by 2002:a05:620a:44c3:b0:8a2:234a:17be with SMTP id af79cd13be357-8cdb5a1c13amr525238085a.7.1773416294908;
        Fri, 13 Mar 2026 08:38:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162b08sm1560840e87.53.2026.03.13.08.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:38:13 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:38:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 2/7] media: iris: switch to hardware mode after
 firmware boot
Message-ID: <6hz4rxfxhllulc5o47rwltcjdif3ocqvubfvsh2qnygmnacpyk@hirsszuwi3so>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-2-9c0d1a67af4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-kaanapali-iris-v3-2-9c0d1a67af4b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: N61JHRZTimfopwvyP4eZrCFOSNrqFIyy
X-Proofpoint-GUID: N61JHRZTimfopwvyP4eZrCFOSNrqFIyy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNSBTYWx0ZWRfX/j9Ud/h6Yf5Q
 rCtkSHWTjfsaL/XSxDd/BJzZD/Nbhu0govyN/3yw+bm66yN8sEdi4ZmmAbWs+iwJjynS+imAkTu
 m5/+KJAekUjaNfteN+cAHG8B9DYaWnACNpHrwyMYvbfB46uGIWFv/kUeShuY64jsPO1/jAREWmO
 KEInnd50JZ9dg7atEH5Xn0YQvQHPkk7fCv1Vh5gu0piFdS2Q1XFe9FlXi3JTarsxSKm6+/pwpbT
 NT8fekvwVbgpj0obYQNrm1qbVyf3vH8n19+2kb/ZiL8edS4jTMP7YV1GAx+TTATDijBEG/elrJC
 mDbtSB37n9IUi4IFm5btDrPfQI/RDP77EBPNzMH7GtZtTAOPfX+s1HAIljtmsnYZ2/umcs11AUj
 IDpCD33dBLjvmhuy12QxpzPjVE6myF+9c0jK0WueeUbeLpu4i76JXl+RD6cfUiICJz1CumrM+CL
 Ir8fD4a6Hem2m0v57eQ==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b42f68 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=dE1MpONsbtOZy1RxgbwA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130125
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55723-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F28F9286430
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 06:49:36PM +0530, Vikash Garodia wrote:
> Currently the driver switches the vcodec GDSC to hardware (HW) mode
> before firmware load and boot sequence. GDSC can be powered off, keeping
> in hw mode, thereby the vcodec registers programmed in TrustZone (TZ)
> carry default (reset) values.
> Move the transition to HW mode after firmware load and boot sequence.
> 
> The bug was exposed with driver configuring different stream ids to
> different devices via iommu-map. With registers carrying reset values,
> VPU would not generate desired stream-id, thereby leading to SMMU fault.
> 
> For vpu4, when GDSC is switched to HW mode, there is a need to perform
> the reset operation. Without reset, there are occassional issues of
> register corruption observed. Hence the vpu GDSC switch also involves
> the reset.
> 
> Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with necessary hooks")
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.c       |  4 ++++
>  drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++++
>  drivers/media/platform/qcom/iris/iris_vpu2.c       |  1 +
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      |  9 +++-----
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 24 ++++++++++++----------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 16 +++++++++------
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |  3 +++
>  7 files changed, 38 insertions(+), 23 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

