Return-Path: <linux-media+bounces-62046-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F1SDt1IC2o7FQUAu9opvQ
	(envelope-from <linux-media+bounces-62046-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 19:14:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C065717D6
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 19:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C799B300EC42
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 17:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79104480DC6;
	Mon, 18 May 2026 17:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kv3vdsee";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HkIxv38U"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F9D382F31
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 17:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779124374; cv=none; b=uGAf9YYuZe6UoPhBPD5PfRvgecP30LyglfffQKHCnJqfRZNLfeWt2wIr7U5pCAGHvs+nkel2ZYGU6+2h89cP0/x5PZTENGEryHPSXiqNi4ZHutnWA7yngtlT56MFqRNrM876C6DJpLlBDQXAIV7gQvkxpFg/ylSJ4G63wQmfFWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779124374; c=relaxed/simple;
	bh=dv6fMZD/2crqlVa85sMQK/Osw1NdqzJ3DyQehrECUzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSU+Oj0OoxOrn10eIw3/loxHLO74YPXVFm9Piy2EzMyFxSIhfA9fGvIzfRh8EXn9bDC/yk+LEOfpvMkcnN+xPW5RVBdRVik03J3R35ux1dONyp7xgQGh3k4vL5vCM+GuTb692TFjn7XQ5M7yHz2kfuJIhDUJ3Wj8TPZIaPi+zZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kv3vdsee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkIxv38U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IGcXKA2090999
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 17:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zd7Inw/SsIvtc/OfX+j4exDj
	HNsLgroQh/6miIUvMNY=; b=kv3vdseewZX4tr930IKkfxEq6nOVcWhelcjJ2S2W
	x3gP7OhNFrbtkYdsIMLTqBhY4J1rky5aFG/kZ9ds8xYbswuC9bWOLWee4B0z/C6f
	rBIoA6oks4P6HeIGwCU80At8cCJOaED5lDrDedk61LOOBmvm3Nm4FrU40/SnaOtT
	vLaBANcx2i4VJHIZxHJby/dja0RXjvf3arW29qUQB8liiinSmXJjah65NWN9T52R
	uBV9ipUWyDqAhp5F754+dnHmB6r2N+UNHCF7vR68j8b+Zty1mWSTG6/tWfC7GfYR
	M/ZxYOrG8NXLwiACdhlkMvHoKS8cSD0/imJiUeMgPpGcxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rphp7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 17:12:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516879bf1a7so54434731cf.1
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 10:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779124369; x=1779729169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zd7Inw/SsIvtc/OfX+j4exDjHNsLgroQh/6miIUvMNY=;
        b=HkIxv38UNGE709XsH7xZnxfu/VkqIs0bp5NqZZ8ShShtvqTsKkFvlPdwmvR12+Aq0c
         fXy7lZAi08Pi/M4e2CWOAm7FEYCfcan4aPaFDEn/hOEvWxGiv8dG0viK2/5KEFzWOk6k
         XuEkWrNkIYZnh4l0gs2Vh376A3g/t4WJ1rRPfV9rBp25xUNAp84jrdBv7DzNGWy6qZsp
         XN/87BwuEOXXVcFnk3l1HNNeXD6Umr6E5OV0eZrc8m0Ub5O6Nx49sTTA3BidjvJt5sLs
         UPidxSEpNhgHa48RmW58pKx+OR7dJB3LqNVmWDqamXr9S17KjQQpBKeSvq0inNU0EwBq
         9I9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779124369; x=1779729169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zd7Inw/SsIvtc/OfX+j4exDjHNsLgroQh/6miIUvMNY=;
        b=QPdBogfjY4OoFCoRNZoyNqQwpoXosU1FgK+vhmci2TE/CTSqp5wX9mVKRI/gUnV7IL
         2L/pZnbz23Vx7lolpK9y7vyeVvryqlQf4ptKznk9g51un6xzhduCe5Pi4GSsBsVCnhH/
         iB5+oqVbE410fwvZBrhXGIST3W1/s+rlk/Z4IfsxzYEtH4ju4noa2GhYEYdVLNXXANf+
         /49EOUumCYDMkFHDn+7ZSTgSk0zdw9r0BQ7TrRzng0QSjcDFgVKVuDQm3KxBoZVeFr8f
         sTTAO1uJpi+o5phtoxI1GyXpgxeHK+1ZhhmGD6q4s2DNiThw2J+4NYCdvGp+6cQJxGuu
         oQ2g==
X-Forwarded-Encrypted: i=1; AFNElJ9lm1mudZ3dF0Z6+AkNzFXjrWe3Irws4AHK1uXiEc8o6+7k2dgeXK0ATI385YyAWTpD4JbXPe5Q+f874g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo4xZ+B8j3wCHP18HDfBZoFBAfsQUJ4M9qGfdNtSFd6EVk7fP4
	sGyIUZJO7oc5vUIq5Qsasu/15tQNhIpIhzi1Rb8NuHs2lA9wd1dDn+OBCDxXQfc+Xj6i+mLQzX6
	8Fjtpa5eOuTxocB6k11X3tX8kjSydoBfgat797sVh4x6l1/9mlDpNLBagO33NMeBJbQ==
X-Gm-Gg: Acq92OGTQDC41wuCbkQwiR0vsMCrD8PBOU08N3kyJcv2xLyDyQ7SFXiQeNXNrNPrC4a
	5ZgNRlb6CaMKp+65D0aPsZOrm8e0PqUMkXmJEgDohYNdR/DV5K95HoW+49XxvWPABdTJA2xb2ut
	esYuyKZdU912HSQc6lJVWR5r659fonnBduGupHNaOfoL0s/nIIVuNkhytUyJo/qs0V8c7qrxeB6
	b1tZHOO6gNOq9NEU4uVZ/Oq+Mmm+tAp9a0K5+17XylwqaQXL4QWJS0CSHzeNag87RCUL14dRsnG
	IaXdftQQN6lyAJq7SM4KvFD/t5S6PWwa7Qu/fUzqyoF0x439TqIJb8mK7QXq75gz+s8v/OYEWNU
	rTO/1gHSSLXNAgxHkSnKkZxgpmLqmYiuTKjYZW5ZgRERlaTDe6KVHO29liAV5x7cpFW5Yl6mibv
	A4zqhegnRXg4W7InjZGlbb2wWk/vDFTnGhs4c=
X-Received: by 2002:a05:622a:15d4:b0:50d:9cfd:b01f with SMTP id d75a77b69052e-516418bd5abmr236440011cf.32.1779124369517;
        Mon, 18 May 2026 10:12:49 -0700 (PDT)
X-Received: by 2002:a05:622a:15d4:b0:50d:9cfd:b01f with SMTP id d75a77b69052e-516418bd5abmr236439461cf.32.1779124368945;
        Mon, 18 May 2026 10:12:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm3450356e87.18.2026.05.18.10.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 10:12:47 -0700 (PDT)
Date: Mon, 18 May 2026 20:12:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: iris: avoid double free on video register
 failure
Message-ID: <voc7mqvhim4gfaar4n6v3b3xkttzij7uaqs7lh7jriatyonoi4@tle3syly3hbi>
References: <20260518105755.988961-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518105755.988961-1-lgs201920130244@gmail.com>
X-Proofpoint-GUID: JGCWIbRE26o3DYEJ4joOMiAAq0S8zQF_
X-Proofpoint-ORIG-GUID: JGCWIbRE26o3DYEJ4joOMiAAq0S8zQF_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2OSBTYWx0ZWRfX0/vKzgVES4pQ
 U9rnMgMS1SnD4dVFzuBSatuWjqr2s0XPLGKn/01UseS9YlQrY2QxaNdoO6hGwOxdGjZufMnS7JW
 FVItsz/vgZ+fArTr5nkvKBWj/5vgY5Xt3fTMWcXs5vButkMG1IAS9Bpn6QgIj0SrmSNIGHT1ubD
 rTC2S5p/neBgJNKfc2IDY14VtczZ2sLechh/qh7s3dhd3mmA0BKhvjtQ3PF9xFlevT9KxgEaE/U
 OBD8DZKgTpo3UQprKyLzcfHY0tcOgMeV2hxresc44rgAznmNFBVPYBtA3clKzC68JjL9Kyhorcd
 8lULUAd9m5e227pwdFuGg1mHSmntPm4auNE3c8jDOL83UjnaeL30OwXFoQ7JOj2eQb6MdJDWuN5
 8Ww76n3mJhAE3xDihg9GWExgiS+XFxnPWv8D+Xq25Fyah/6zqw5fw4TORanx/FhHopI1Anz/GjF
 GYGK12TkgdsoMWySkbw==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0b4892 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=aPtAEAeG9Eil_ih03L0A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180169
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62046-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53C065717D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 06:57:55PM +0800, Guangshuo Li wrote:
> iris_register_video_device() allocates a video_device with
> video_device_alloc() and releases it from the err_vdev_release error path
> if video_register_device() fails.
> 
> This can double free the video_device when __video_register_device()
> reaches device_register() and that call fails:
> 
>   video_register_device()
>     -> __video_register_device()
>        -> device_register() fails
>           -> put_device(&vdev->dev)
>              -> v4l2_device_release()
>                 -> vdev->release(vdev)
>                    -> video_device_release(vdev)
> 
>   iris_register_video_device()
>     -> err_vdev_release
>        -> video_device_release(vdev)
> 
> Use video_device_release_empty() while registering the device so that
> registration failure paths do not free vdev through vdev->release().
> iris_register_video_device() then releases vdev exactly once from
> err_vdev_release. Restore video_device_release() after successful
> registration so the registered device keeps its normal lifetime handling.

This is definitely not the correct way to handle the issue. Fix the
error path instead.

> 
> Clear the cached decoder or encoder video_device pointer on failure since
> it is assigned before video_register_device().
> 
> This issue was found by a static analysis tool I am developing.
> 
> Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/media/platform/qcom/iris/iris_probe.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

