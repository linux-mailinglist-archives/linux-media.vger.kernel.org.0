Return-Path: <linux-media+bounces-59974-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBQBHVoN8mkynQEAu9opvQ
	(envelope-from <linux-media+bounces-59974-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 15:53:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2AE4952BA
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 15:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 731F0300516C
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 13:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16AC2350A18;
	Wed, 29 Apr 2026 13:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="opyL4EBS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTh7nciP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403BF30BBBF
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 13:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777470796; cv=none; b=ded0b9BeTw+QvmYHObsLgwDF+5OYFZ7t5y8DW/BaNswJAsj73MRseTc9OZnWmLHimQhalDvvbZyT8axDyiLJ5CVShDYBZrrMlMN/dJv2n4pPTwTFfCq5J4Bslmtner57eAkhOxTqXSclYqf5+UDXxNaDPx8iFCq5EnmRSldWEtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777470796; c=relaxed/simple;
	bh=GTPA2YcB/zw30wy+DRHalzb/HWpk1KhTEVzAqq0pRq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TaZU3RLgW9+eHv9/K+In1ebu35wzUuO2xfDcneANFav2HkeNEzmmvo/snTpvINMbDDVDKf+XJ29U6GGTkBhDwrYBWwVIjTUjAChR5ieq6CDmNtBe13RzxOgK7PwRDTi+dP93Unbsy+thaBvcYD19Ux2e2RLUal8mEV3gBmOgPTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opyL4EBS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTh7nciP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCM4Ac2485297
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 13:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N9U0SUgWF2lcmbEYf0NBfn0l
	dEy8tcMY+YE7XgOzUV8=; b=opyL4EBS6uDORxigC+UcE9nHJcnx30GM4XkEiaKJ
	+EKqtzXUpLkVEyXvFEr+OwuSno+GiOYRHQD21jvxb2FquWGStamzVGChieH0Vz/Z
	tkD9WFYveNCeJLXqD89niR3bF1KWvJJqWDGIHTsM5zL2vgXim8F1CXJNrPLdIyE5
	jF+wZ40Obr0A7V0abVcLlwzHgr2W3AGwMYaPBKyX6wVizsjyIZA+knAKDfv8Pf9C
	Q+NWs/qQ2X+nP+ibrFzo9BzC8zWR2BbWcKjjxOek36vixHMAuF/9v8oCmSvRxohY
	wK0l9GILTkz0aGEXhyH5u9yBWIC+BbMaklBh3ow7gNashQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duhx909ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 13:53:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7982224a54so11643574a12.3
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 06:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777470794; x=1778075594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N9U0SUgWF2lcmbEYf0NBfn0ldEy8tcMY+YE7XgOzUV8=;
        b=ZTh7nciPFVfeCQjahrKfG9mxnwFJ296a8aQ6UbT4+TbX3/XUuQN4sh9qZnjt3ITgEi
         wzZICVzToKcPsT4z9BaAuyxlVR/V/D010bmOk/rqKyxrNMmhyEEDl7oKnxcBysFLBZW6
         Wyvt4RjVV4sREIveNFIvE0I4lCPWTl3DM8yKw/a5qFDIEuHlJ2U7+H2hioHOb3M+dhxz
         /mLg9F1VPnUzKnGBG7coG0+D6TXp47Q11Kg7utN2cFjwmvIVOGYs7KEkkFUH2l+nmbyl
         2AdPiiWAicVCzEEz8+fzRvgxjGxwU3mxsNJDiYu3tMHqg6ngTWNHJjyfcUwAnqT07x+B
         Q1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777470794; x=1778075594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9U0SUgWF2lcmbEYf0NBfn0ldEy8tcMY+YE7XgOzUV8=;
        b=dwqkjW1R1LEg0NW5InywkRXUWgr7HcAIfdRsVJ0sveMEbj1rvrzHhaRSAwrDO5lOOr
         yv85DVML+4c5OTHFIGqIrUWGdWYLSYcTmNlUGFc7Of2EB72VGh/PnzcM+reR/e6CJF7/
         hgCF5LbW/1A4XqgE/v8F5Vjoc96zsHpmYzK9c9TccoucaP6uJsW1Ur9rMEehkQSzuk0h
         cfEfk9hr//+skxI9eYpRATxZD+V4yQbN2/KMtUnHddyTZ5fL04NOY6BNhtbmCM49s28Q
         YkBa+TNcc86c3zJKxS5bdqE9NhQAFIilrx7kwFPcwPwpB4Y6QyBg/QbZHUil8wvF2z5t
         Shhw==
X-Forwarded-Encrypted: i=1; AFNElJ99rt6gtwlCEkylcKwfM1o4lZtZESb6wjuCMk2f3JOO5cL6tmk2IuQzXcCFy46LjO6bPQu3kAlsDRmCHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnfrPRUGPUfSyMBO9YTR+eq0gs6rYjJVq6N5joRod2Jpu/kyoU
	B8nZpnBdoUtEQNPQAPerEOc57nEQZaQGS+Viu2OMqDSQHQc17sD1U9/DMpllyMYOP+2SL0VdGb8
	YvzkyTIMcLtGbA7nmxRppV6XsbV4b0RWszP5nLs39KmBYNDOjXE2Hd/dvz/Mf7jYJzg==
X-Gm-Gg: AeBDiesf+EmSYZ53qXU2gKerYpwW2TdcdtwCBbyoAQYaIcghIG9ITdlpE97CoRX/iPw
	LQU8GfaSJoqz+S9fdf2aY4IUEbjkDJsy7P9HvRQNNnoByr0Sr/pexgnsxZ6KRv78NmdpDPIDLec
	nXs/q0X6O6zUifPJ8kA2RcfOS0VSA6ehhFPNoZOKh3tmuz3jQZ4uhQW/gagHFI3XNZii8aVoN7p
	7ABMT6KmRnEf4UG/ba01TsKU4NgJ8o4LedaPSYvI1kNAGqMCoItoPOjUh3DuyOi7qppcKERM02a
	GPi5qNlgRkxYI96r/u9iiev0ftb6/h3uaRpKEmlYXfZ075qFR+pw1nWIaPHlZHHDeZNsMHzrgPp
	iLZ0QzBgzj6H0XZF6xzP/uqfo/sryQ0yBSFGOFz0H4Kjza0TYspKHjHe496I=
X-Received: by 2002:a05:6a00:bd0d:b0:82f:4628:4198 with SMTP id d2e1a72fcca58-834ddc2db4fmr7647851b3a.31.1777470793670;
        Wed, 29 Apr 2026 06:53:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd0d:b0:82f:4628:4198 with SMTP id d2e1a72fcca58-834ddc2db4fmr7647813b3a.31.1777470793036;
        Wed, 29 Apr 2026 06:53:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5cccc4sm2190396b3a.14.2026.04.29.06.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:53:12 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:22:57 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v4 09/15] remoteproc: qcom: Select QCOM_PAS generic
 service
Message-ID: <20260429135257.utgighzczrbnl6cp@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-10-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-10-sumit.garg@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0MSBTYWx0ZWRfX9hzfuJItfKpp
 PVN4Oy/lTYvfmIoQNrsruwGQVCgvXg7kdW4Zb78BeMpIxrZd8m3nNTH16l6i6FQvo7NueFuZ8pe
 cKLfZ9NUrbJ0bJNCcQ3+4ufYa9PP0hPllhne7DHtMLh8jqNoxfXi2MCbhG/MWtkHLLXP8t/AqEq
 yer3JCLAz3jEjw5hRZxou0WAO1jo572Si9zZM6Vla+WfcupsSdCfd7lagtnDVWFGHb+P9wTQQhr
 MnyKEd06+vkP35vz11r3iff4qMxk7aLNPLoJJaYJc99O932JDguOENGyylpXalkjAg3Zn3UCN5/
 e749Zrs7e+bQH+DSksBJs3qZRuF5H6eveJ4jKiVJKQN4FiAAKFqdOMscYhzVlEwrqcKRSgMe9E7
 SqYoEyiujxhv0NFdmNov4+T+lm5Txf6JmhhCyk/h/WwdsUw/hpCwukIZBcyLQWb8W3jC+x0PDsQ
 zJkU3HuSku+7f40wksQ==
X-Proofpoint-ORIG-GUID: fBkbLzbr-6zrCw-I0JA0xnkb0sEccLBv
X-Authority-Analysis: v=2.4 cv=O5oJeh9W c=1 sm=1 tr=0 ts=69f20d4a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=L7XPiZuQ2t1DW7kJCHQA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: fBkbLzbr-6zrCw-I0JA0xnkb0sEccLBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290141
X-Rspamd-Queue-Id: 9C2AE4952BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59974-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, Apr 27, 2026 at 03:25:57PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Select PAS generic service driver to enable support for multiple PAS
> backends like OP-TEE in addition to SCM.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/remoteproc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index ee54436fea5a..da3c5d9562ea 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -230,6 +230,7 @@ config QCOM_Q6V5_PAS
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM

Check do we really need SCM now ?
Why not the change for WCNSS, MSS ?

> +	select QCOM_PAS
>  	help
>  	  Say y here to support the TrustZone based Peripheral Image Loader for
>  	  the Qualcomm remote processors. This is commonly used to control


> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha

