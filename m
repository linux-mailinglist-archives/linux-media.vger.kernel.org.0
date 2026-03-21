Return-Path: <linux-media+bounces-56604-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEXDDenRvmlEeAMAu9opvQ
	(envelope-from <linux-media+bounces-56604-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 18:14:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F602E6773
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 18:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45A6C301D310
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 17:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0100334C31;
	Sat, 21 Mar 2026 17:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGSzzgAQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LG1u+LrG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165AF2BE7DD
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 17:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774113209; cv=none; b=O3wocRYIcTfUN8rGNk4M8204KvEPievRuOudgr/Ot0EzGrSFR+CWBU/MwuhZ96z9wLr0dmXt1xE4nFYLO9I02AZtpzm6n9mEBKmuwQhbpInV3zZvn9AZ7QvEyliRQuM3WOV4VOeo8VpodglotP0Otgxio6G+5HpDaBD65bzKEnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774113209; c=relaxed/simple;
	bh=cEpeK/EQp8Ga6cicqBJKqpm6GXMGqpApCOqIQcDfjKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZM15tFABFKwArlePeKaSajfQbJzZ5bfYOEzjpNIvtOnlnqFTTX0pS+GIDOhvlffPtKk5PIIM9P9Vm+Ce0lvbq54JXrX3vGSJyQxG76iS/HFt6QV0JEdlXKDewgCMuVwEmOQIGZ6scXFgR21qV8gpQc/xD/6ivQOlNBht3onH1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGSzzgAQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LG1u+LrG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L5FHbS4072170
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 17:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QFf7aXwCd58nYJo9hHkhjmLhGi/IQ+sjJ88oicm+khs=; b=XGSzzgAQIUIsl4y3
	4NMSUDU9lhahsw8T83hP3QZ7CjU2mdN/0sJAoO8N2uWU5EUlKfI9ppmCxpmHZge1
	YZpX1aYUmDPwpiKydZqqA8uVfny5i9kBgxj8Xxw0TXdIIICaDns8GWDNTWlxfSay
	wvwp2xLTEFyZpufSl4M+daK8PCPk8ldCqFCmjL6GZlj4Gqx7BN61Xnaos1YgRzvp
	Zz8w62PDGr7ZmjBk6oPA0f7bfWC+zZYktX0sTLHjRLV5pXFnyZVZhyrPijKc79ZQ
	uf0W5ynA5yGR+aLSpOyFb1ylvUbSgrUHey8HKZej++JVP0ziEhnJGi95TfDZBnqF
	Othokw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvh3bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 17:13:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50939597b85so118156771cf.2
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 10:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774113205; x=1774718005; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QFf7aXwCd58nYJo9hHkhjmLhGi/IQ+sjJ88oicm+khs=;
        b=LG1u+LrGVWrzrr1EslQfRluXXK4B/Pj1upO+9g9V1XvvK8CnMBZmppwdfI2xU8BCEf
         lSAHBiBW2kDEpOzVrUeCIxgd9Gf5mIBruxwg4pPiXf3an4VYGpSv8zFu4zrsPyIOlSz3
         R2furPvAWyLoE4wenmR08QUvd4rq8dFi2ntc1w6iROz0cHK+F/REl2eLEPcQp0ll5whx
         hVW/sp6DMlKDiP1rOBc9TgHBJ1DRTPX0fVji9vByZWvmrmpoi/AUPghgipBdcvdorDtQ
         AM/RCHzrP1YHLM5kXhagfopNf4rAne1jbF/PfwvW1SRVOQZdUzC23um4OykM+PSs8JQe
         /c+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774113205; x=1774718005;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QFf7aXwCd58nYJo9hHkhjmLhGi/IQ+sjJ88oicm+khs=;
        b=jkdTOBmjNyQtNGrNpuq+fSxZe0tFFqauWpf7t6TeHMYXqEBTP80VI0A+xtNvv2u7h8
         tk+aL5kD7d273hrO8MUnhjQl0hv68HGISYBjPp55XdAdykH0/WKd624IIxcxSo3xFl5f
         OClPr2zAHuZpAFpQwmlm+Dvz4MGUmUNSivPVuSvmBnBP1hjfBot7amcdxepkpiUub2pK
         g5ate1GvR37SnepZ6DdV9TOaeDbDbni0gBOVNDpaP+atuZ411d40xpNmBmGpoBqkdYao
         eBxkcvHKjSsyispMG6J8500RQzCcUalAQDgHs2S1ZUr0VVK12xhVo/VIxa9DDzbMv9PG
         ep/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5J9lLPqCbFfD32fkWObc8VcGiD/RrobZ0miZ/RkaEwWYMNLH+88kbRz89uQJhDYAuVORC4orRPjZiqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZYxG43UuryusxC+4kW1vX93QuW4EP3XRt4LRYlp4Y83OqS5zT
	rgZrHI00krD/nUDAqNhnkHJA477fIWcj84V0uLI1SpJHVP3HY8VXRetdSdODYqG3Pg7Azo5x1jf
	7fICfHmymuHxjTLwQWrR99PYDm/+VuVJgjg+Q5VLKeIrKgJ6bG9lZvLrYndgisXn4FQ==
X-Gm-Gg: ATEYQzwJbYdmlAmHW+3kK8XTBrWT42K84k/yjvwW0Dr6TuHOMgZw/EXRvfZIL232vk/
	ofmkIhvkiR6lWa6O7ljPvEbrwvjL+z+QLc2tSqX+MQy/64GGJB09Or46zkQOX3EaYqMmxx/vFZw
	VDnnVKcPELs9ojaXJm0tKp+uq8Y0380seKj3M9zkAVP/Qeu6PG/GZTqe3Crq5SnL27G1j9RB7Zg
	YcFzdUYhFM5Df3/YOYBsx5K4Fj8Wm1YsL3kPDiqCB1fMPGJw7urY8emVKWtl/33/lPpuumqH+5l
	WzApRdff08dcYa/0K037BiRyDjiELCTBbldLvVvhZeg3vHUGWE7M/N9Q3JijswWXo+vXi5fGk6+
	kJjjeFqXIKvRD1ARPTemw5w5933bEs41vv0SiQjEYVJuGCMJaPYbdO9on8fj+D3XVxzA5YxXjZ6
	UFJeEMgusY9j2dniucPmxJ4u46k2CgwBlxYLU=
X-Received: by 2002:a05:622a:156:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-50b4e60a658mr23830291cf.43.1774113205396;
        Sat, 21 Mar 2026 10:13:25 -0700 (PDT)
X-Received: by 2002:a05:622a:156:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-50b4e60a658mr23829911cf.43.1774113204955;
        Sat, 21 Mar 2026 10:13:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530cf9esm1214568e87.82.2026.03.21.10.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 10:13:23 -0700 (PDT)
Date: Sat, 21 Mar 2026 19:13:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 10/11] media: qcom: iris: use new firmware name for
 SM8250
Message-ID: <23y6nehk5z6z6lyclrmtllirzz47igbav3lep47xyomfnuqdo5@77nfhlqeyph3>
References: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
 <20260320-iris-platform-data-v9-10-3939967f4752@oss.qualcomm.com>
 <CACSVV00Es3dGirfe9aHKwvaZog=DtEx9-ZPz1YeuStKobcpT7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00Es3dGirfe9aHKwvaZog=DtEx9-ZPz1YeuStKobcpT7A@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDE0NiBTYWx0ZWRfX/LuE+f57wbVC
 OhGBMRGLrzgu8oziMku9e/keC9OgAyRzTVyohRdpNWlALzyBL3pNpgfOG0qLNYt+v4pFzwwESwy
 +Cf6kqiLvwEFUEOKEZUDM6X0zkURJanvmFRTEhsbJo02Kf+T32C+r41DzV6GozkGoZa/yVcnVu0
 WYWYwfCeohTOH8HHtDyZFQzwGZ8fwaMcK4SYT6d5jsPK+uIsWbhB5IQSuNXBvxXb5uXBPWjniB/
 0QniDUbj+P0AjX42HbC7GE4HHBtMEyIkKX2pWilx3wbSqjx0DUtX14ww6AMc8w1tBzrXuHe8xK+
 NxCwIhCOCNkyXj+vm3kJB57rFOGkNcApOwBTxtGhDVr+R3Ukwth62GJHGR9rKsIVyRdlXzifA1s
 CZsC6dmGd6fypKE53lsZC9F865LhMhD2/UB+TJa4YZc++ItXS+PcJ4EBs2oeqWnwYzUk+etrZX2
 CH71b2Qd+E5p2rsUpHA==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69bed1b6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=cQr6lTdKrn-CZv5RVjkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: J4PfRt87E2Ys56JD7wtXzD-AMFk72XSE
X-Proofpoint-GUID: J4PfRt87E2Ys56JD7wtXzD-AMFk72XSE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210146
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56604-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 23F602E6773
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 07:56:47AM -0700, Rob Clark wrote:
> On Sat, Mar 21, 2026 at 7:45 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > The linux-firmware is providing the vpuNN_pM.mbn firmware for SM8250
> > since August of 2024. Stop using the legacy firmware name
> > (vpu-1.0/venus.mbn) and switch to the standard firmware name schema
> > (vpu/vpu20_p4.mbn).
> 
> drive-by... how useful is it at all to list signed fw name in the
> driver, when it's going to have to be overridden by dts for basically
> everyone that isnt' a qc employee?  On the GPU side, we stopped
> listing zap fw names for this reason.

True, that would be a good idea for the next platforms. Fot the existing
ones we have to support existing DTs, which don't list the firmware
name.

> 
> BR,
> -R
> 
> > Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_platform_vpu2.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> > index ab2a19aa9c36..692fbc2aab56 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> > @@ -111,7 +111,7 @@ const struct iris_platform_data sm8250_data = {
> >         .opp_clk_tbl = sm8250_opp_clk_table,
> >         /* Upper bound of DMA address range */
> >         .dma_mask = 0xe0000000 - 1,
> > -       .fwname = "qcom/vpu-1.0/venus.mbn",
> > +       .fwname = "qcom/vpu/vpu20_p4.mbn",
> >         .inst_iris_fmts = iris_fmts_vpu2_dec,
> >         .inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
> >         .inst_caps = &platform_inst_cap_vpu2,
> >
> > --
> > 2.47.3
> >
> >

-- 
With best wishes
Dmitry

