Return-Path: <linux-media+bounces-64144-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oQjOAkx1JmoOWwIAu9opvQ
	(envelope-from <linux-media+bounces-64144-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 09:54:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72513653B7F
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 09:54:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="AQt5/WWq";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FpWzVMz8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64144-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64144-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C58C3300EC8C
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 07:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638F63C1F;
	Mon,  8 Jun 2026 07:54:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95AA38F922
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 07:54:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905288; cv=none; b=P20JVl4qyk22IzZFzQZCLl56OO+N0VeNhmnHsIl2McBW5FpmlLPaIJZe/WANCsg59cL7zQ6XxwK4Y/QHmZRU/R9nCZC8eZWbYjvcJ9j4Cz04LEfL+gLnMQteNKUAz4900Rx+HaJQqNIH7x22of2aK9ljIVhZ9WiaK/wOX+cBVNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905288; c=relaxed/simple;
	bh=7L0sReKd1AffnTy/iUYPVQXP/Wy7hvlpi5gYLmCH/4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kq35U6H0vtKiMyW/WxRylZm0aOtmHLN2aVR9t8kfNRAQ1ctELXF+I1VWc//sVke/aLTMRYcw+PGPdePwEHFm5PnXzVLdlb+JF3e3fV3ZXXykDeye94BpTqGW1nMd99GOFP04L29Q8K7wChcocZLWd4cxZRUqp8lpRjNVvhrhSdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQt5/WWq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FpWzVMz8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Okeo2382843
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 07:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	msbjmP9rM3cSjosteke+EMkxKuVcldwydJL9S0p2bME=; b=AQt5/WWqHbxo3G1A
	/ADRaq7eDD2uq1/5/0ZukPZr71cGEeEWWaNZ32b6iGhBRzhaLk/LY87AC5IzViXb
	N7oNTQfLRIX4jWFDG6bgTdmC2jXgOffGHZeQ5Jx3vjikttdCSGjbslyUIUUafmgp
	6ldij3hHfXYj2lpfm9keoJTy1+Qpl1viS1sgmW+ZQJpId8gFSOHsO43X6KfH9dSw
	2tfUZjR7dip+dsZvcJZ0UdUscSflqew02vjZZLindgzzSTJGJbj4NnRRe/D4dPA4
	fxlQ1VpHynuVam+vBzrHZHaR00ziW4KB7K6czZ3uWE+IgdVq100GhQtvoMHuYQqM
	RsiejQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cy4yk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 07:54:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51759082206so12311571cf.3
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 00:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780905285; x=1781510085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=msbjmP9rM3cSjosteke+EMkxKuVcldwydJL9S0p2bME=;
        b=FpWzVMz8K1ivGLwPOIbME2ue62TTkf/ZzAL8ST3rsffDHYLtNoXqIgOQVo6KsOxVcL
         QuiRZdFf3RYmdxJSIYdoyZrJqM8VdQ9EtB+oSfXT/IguAFl582efc0LMvCQwzLADm7C+
         bv0ozUoKFPe92dScu3ioFS/OUykKKucs87/UaUEy41uuwuL1LHqzzmZKLaLcF7T77Jdy
         Z6Tcj5Glm0JCWZsI4Lb8crxDtx55xk70WAXaZK+ZQ3x29pK4k2/ptgH82BGReJHychjD
         liDzH3gc2gDUlgYs4DfUssiwF0+qC61azQuX7YtMwFzc+WffyhvKu86vKAoCMwAcx8ki
         9bcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780905285; x=1781510085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msbjmP9rM3cSjosteke+EMkxKuVcldwydJL9S0p2bME=;
        b=UlnNDpvfvuIKUt+ajSDFD+ARBGLvnpn9BCPPjDLjsSsjfNZXUuHMTSuWfw8J17YGSc
         T/moi5HGE4lnfpgWOBYuIF67ht3XI+j/Xot0mQ253RknE+PXIUb+BFPPfxXOf/M0ZbLt
         PzYE11UaX0igXodaRHOUYyU494S9R6++zqNobe45+P/dP0tRJF0gjAWke02HZL64GRbF
         DbiJc3EGuJo+YyEq+uvOaAPd4TMoLScia8aq8PZlZLOKt6mgN12mlbThGMXeMVRuVrE6
         oddD3qjoumrm/XSnLknAruZFtB3FjDyhqO67ru4nJdFPYkVN1hFU94cDID9DCWIv9z3i
         Jrcg==
X-Forwarded-Encrypted: i=1; AFNElJ/w0bztXIMwwv6kJ5jztjqqlofMbZN9YLEL3GShVW4HHSoIo44mI1VI+WAPAADS0SUh6s8RCAUb3uy2Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyuTLCvKHnCCK64w9n4S0lvzD/RuAqrcnE5tWuxwoL9jfrW3rF
	Rg+cc0f5k7y5cdMcx5OQQVDI6RnVL3JSlkkuoiQgzgpCQcbrlUXZboXZlcxMzcJnKZSl5d0Iua+
	jt6Sd5kwmqiGu5g/6xOOqKSRd5Cpx9ZiuWCWdgMeGZVgEEl6ITQnOI7i+T8+YgRJosqCzHuDiKQ
	==
X-Gm-Gg: Acq92OEwoNZkMrGBpTRWpquY6qQC+FeKkPhDKStFQ+r4oaPJcOcJdLWFnRxMC7vcZJ7
	7Rr0xUDlW2WxMwNHaAOptkRnOTpLYxnIwOOyrVDvEQorJ5Nox6QF/52ziSH/3qyhfP16bGnXpNt
	ZfdgQvdsgPY5q7rg6WuMHgHMmHe5Zd0D/mJOTFU37DnWNRtH/3Zo0C5jVBE94ds5Rmei1imTnKG
	85gdr+zzrG7kUBsJKRjShXaxmh8mQD7NFJG//dgL0hyIzG8ALMU2RDwJxNTvPgxNCeMZjkJvRKV
	ofnKVegyXa67DoPA3TlfL/ENtnWvvMJWtutx8poiev7yZ0JbzQvBjb9SfiYREPC4BdLscRlc9zo
	pGymCg48nN5ybnqwSwGPCGZlTXsZHi3RSL9VF5q0zSd01N5YvpV2nQdiP
X-Received: by 2002:a05:622a:228e:b0:517:8999:6c4b with SMTP id d75a77b69052e-51795bbf777mr118584991cf.7.1780905285016;
        Mon, 08 Jun 2026 00:54:45 -0700 (PDT)
X-Received: by 2002:a05:622a:228e:b0:517:8999:6c4b with SMTP id d75a77b69052e-51795bbf777mr118584931cf.7.1780905284572;
        Mon, 08 Jun 2026 00:54:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051b8c7efsm817675366b.14.2026.06.08.00.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 00:54:43 -0700 (PDT)
Message-ID: <6ce9188f-aaeb-4ce5-bfc1-28b4f45a9224@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 09:54:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: qcom: iris: guard IRQ handler with runtime PM
 check
To: Hungyu Lin <dennylin0707@gmail.com>, linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260608001128.80090-1-dennylin0707@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608001128.80090-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3MiBTYWx0ZWRfX/ka9OdVyaGqh
 5X5l/dWT5Kf7d327D2sa71LdgW46l1g7DrC71DipKgrcmjVzGMcvzxYYAhkzRVvvoO+EitNRLWA
 ySkijnVvZRPY3CwybBhf/LZpXgMqBavXziOqyWcOYyZjXjVWfsTPeRqABR5e7DzJPJQxSPduean
 VHOImjVP64PLXr/1WPAN+A+x+8yl4BzmlABP3/CY5PHMBroS1BCsWduETxN1812haKMzoDyR7i0
 BT21U0FUHtXa+w0UJKamc9/9Msl0kIQUGoGlcwULtYPOKdoFoD2EnWbvyJRSL+srkZPmJGGEds4
 HFhLwCC8RAmxQanHSs84sI8QNliP49Eu7L5Y6wq0G7CzQ+yD+JlpENG/njXSi7SBFLQHPeeagYz
 QkL1lu3bzhLJcJejrhqU2HrO9JtR2nVcfxvj/24HmptPppis4Z1s5+HxOZhvcG09wQV03rQSbsn
 tgBr6/vxg7xsZvkrewg==
X-Proofpoint-ORIG-GUID: 8pajWmXoYEII0ojhDUOtkNL7ckfTdzAB
X-Proofpoint-GUID: 8pajWmXoYEII0ojhDUOtkNL7ckfTdzAB
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a267545 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=-rh6snQRrsOWgr4pTt0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64144-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72513653B7F

On 6/8/26 2:11 AM, Hungyu Lin wrote:
> Guard hardware register access in the threaded IRQ handler with
> pm_runtime_get_if_active().
> 
> A possible ordering exists where the top-half IRQ handler returns
> IRQ_WAKE_THREAD, runtime PM suspend powers down the VPU, and the
> threaded IRQ handler subsequently runs and accesses hardware
> registers through iris_vpu_clear_interrupt().
> 
> Avoid touching registers when the device is no longer active by
> skipping interrupt processing when runtime PM indicates that the
> device is suspended.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

[...]

> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> @@ -100,10 +100,17 @@ irqreturn_t iris_hfi_isr(int irq, void *data)
>  irqreturn_t iris_hfi_isr_handler(int irq, void *data)
>  {
>  	struct iris_core *core = data;
> +	int ret;
>  
>  	if (!core)
>  		return IRQ_NONE;
>  
> +	if (IS_ENABLED(CONFIG_PM)) {

I'm not sure this driver is much useful without CONFIG_PM

> +		ret = pm_runtime_get_if_active(core->dev);
> +		if (ret <= 0)
> +			return IRQ_NONE;
> +	}

Have you actually hit this issue, or is it purely theoretical? We
shouldn't be receiving interrupts at the tail end of suspend callbacks
(and there's a disable_irq_nosync() right after the HW is disabled)

Konrad

