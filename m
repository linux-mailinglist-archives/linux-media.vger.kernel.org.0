Return-Path: <linux-media+bounces-52865-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oG4cEaELk2nw1AEAu9opvQ
	(envelope-from <linux-media+bounces-52865-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 13:20:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 971431434C8
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 13:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 317723037884
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 12:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA4630DD3F;
	Mon, 16 Feb 2026 12:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3L3PgF3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZWvC1pa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58D030DD30
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 12:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771244401; cv=none; b=dDv96iUVbgAdhO88SaJqZAnAqiw5zPdNXkntHi0rsVTeC35UX5WeuHg/Y1vmT+zJQefLgsS9D1X5BB1Ej8Kfc+hYNEo/wg82UmP2LmpmZer0dw/rO8CQ64VYNispnaJZategGLJKZAzTyrhG6jg36WZzpjG5sPIzmH+Z+9EU+Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771244401; c=relaxed/simple;
	bh=bQ29euY3AJddYFkuKMoTQW6xLf4EdKCiK3Zh9bC3av0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dw4JocwniIvw05XWo6YHtrPwaab0q+JWGaE/L/n5lnSLpv9fSd+KkLCz7z2SRke8uVFvmWvI8B/pbSiE4tnRTICYAK6+d/fWFY0v+LbmYXgq1FQ6HGYhdoPBd8lC9Fywuc5FIml6MxuoZ2U+b6+J0PJFa5i4SMdwChCudtWR6So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3L3PgF3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZWvC1pa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G6vKnu859995
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 12:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x6N0E6hOSw8f1cNvuCw7tWTIqNVqMuL997oacnZwX1g=; b=h3L3PgF31HMd9WO7
	eKAGGqfNzXntaTx57ebQrBetGGlw49qBWR4A1ET2f92byEs+2M/RFOzTrD2rVLFd
	BaE0cZ7ETsKbJH8ko2K5nM3qdQXb9taAD3QUXLw0zvsfESKReXiRlf2TMXdAlw0i
	gfsSfOTFxqhRsEAaEbkw03AIDRewxCkubFA5iOMgbPePtfPfqWJBdYHu9WIm8Ptd
	UcG1h2eSYPIb394G9PefU8vPMkGOpk04YuIcw5JwPaW/HkP1wEX1HW2LizYQUCoF
	Bt6tyHRwYFUrcycyrcacY2XEDhPyrkGJ4GRkFSggxXevsXSYSoy9+GP/X7zaFWaq
	KBsvpQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagcf4hcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 12:19:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89547ddf32bso22671026d6.2
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 04:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771244399; x=1771849199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x6N0E6hOSw8f1cNvuCw7tWTIqNVqMuL997oacnZwX1g=;
        b=DZWvC1paSfsvP9KDwovEST+y0Y8NM4QQ854kc9So7dTUxsTs5ZXv7ggNNyNzO2b2hY
         IF6HJn7e9Pv5qu2ZahC7ie5IzWHo6j1lM/mHFIAOgfU+Um6TkvXdyES9Dl0VqNez0wX/
         ZWogjyIZ5hQ1uFH2vQv/VMFs6QwDcjloFSKtU5yE2KLLWcwh5WVpvbuDXjlT7OFUgyI/
         8VozqSIE9Ez55+DzNKEMQrpF+33ZbVo3LXU4XSmZ3/bRUQM7wo7hPQ+J9l0X3dcSOAgg
         +rhey5Wn4whztXSYB99aoEBd7D/yN/+lrtqBAn0VHzFgCW5tDYPdo14P4u1AQzvAhn9A
         9Oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771244399; x=1771849199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x6N0E6hOSw8f1cNvuCw7tWTIqNVqMuL997oacnZwX1g=;
        b=gzTDUGLMEnOOZyTk6KNOZ7RmvDkmYg2d87hXzXyEb2AthbBSODhWI90ZQfuetXqkVs
         nZ/i+Rl63ahAJPKjOB/Lsl2NXHsGuzu939LmbvQOiM9NJT2SRHlN3L0KC84cl8raFUAR
         Jp3Prcy1yIXB9fRDIA9xaouHjhL+HEyLadHOluOpUjWDhedh6XOgHZ6/Zh7giVKTl+P3
         NPoBv5lOQd9wK/GIk9opA4Oz1ewyjxifN6YnLBTvw3INiWWlG3c05dGAFDY7fWSYPcBh
         2TpuENLopXwFwAFW57G0P8pBBqcNDR2mCNUtyEPdha3g/wLxneDEnjK1lSMR0Wr7vVJk
         zdBg==
X-Forwarded-Encrypted: i=1; AJvYcCVm/Yp44suiboSAf9Ov/WtibcxoloqNY0gW9zdwXA6ecva6FaWTdUogBTQ6LVFMdAYscp9ufgbEmK6Uvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpM7vyuqM0r1dypjaYPkU9jskXRpZ4EBaE+EplosPXwT8Py00G
	DVnBgB7I8q1NNxrXKu5DFam0Zhewr94oVir11aNxhTwOpXVMt1gaw/qtyQaa/r2yBBQxeyyp5nn
	hvVzftiQuv5Ot1XNZvOC3IuWSr/GJPdLXXSCrK1ewA1XxzdeJVnE6OR/pIbs6bCRKiA==
X-Gm-Gg: AZuq6aLj81JV3RIAGbUesIsYXjpczxUnp9KfUnie06hrsXjLBqE3AsPnxxZ2jxegizg
	QWsB4FHwSYGCI0Ty+R7DVEqxpXgEm4EmAJsHvj2LiP4it+a9GgY6k8dfbLM/pPIiJzWwIDj0Mlt
	VBDeJyIzmhk4A1LNmxeU0XbMeipxG6I+pEoMJMrennFvyOibKZegDCzh7kuTZKALxkZAMLgamzz
	RIWSc6PApeDda5haaC05LIMuAmaSdM/DdiohkdlkPn6KFU0p7CVgZBCsxgkUyddBhxmDCXWkCNz
	/EPlAb900/RRcGY4sqsKuhTTOxnk+yeZAKhtHonQ1oQ/seDQ7z1q/2dCCockA94N87falWFVvb6
	MIteSRXAikPaNgh//8qQJyHUVYdmbmbEN3SFH6cqQmOsRtVSUUj/yGD5Vy295nHC6MEAntDwb3t
	53Z/4=
X-Received: by 2002:a05:6214:800a:b0:894:9309:a2b with SMTP id 6a1803df08f44-897347065cemr119529626d6.1.1771244399111;
        Mon, 16 Feb 2026 04:19:59 -0800 (PST)
X-Received: by 2002:a05:6214:800a:b0:894:9309:a2b with SMTP id 6a1803df08f44-897347065cemr119529426d6.1.1771244398649;
        Mon, 16 Feb 2026 04:19:58 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7627f98sm251339266b.34.2026.02.16.04.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 04:19:58 -0800 (PST)
Message-ID: <c3d2badb-f382-4da7-9c33-05719a191be1@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 13:19:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: fix QCOM_MDT_LOADER dependency
To: Arnd Bergmann <arnd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
        Robert Foss <rfoss@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260216121525.2311140-1-arnd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216121525.2311140-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8vU2N6_cL24yYUAhF94IXP3_LX-t01Hj
X-Proofpoint-ORIG-GUID: 8vU2N6_cL24yYUAhF94IXP3_LX-t01Hj
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=69930b6f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=mmGK4Bp0C8nQ5bixmkEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEwNCBTYWx0ZWRfXyj7cb3MBuGuS
 SaW7hSpjE6YEqc5+nmnaYZ+bWrwGGDNBD5XNcfAemOhJFUoBe2SxbkWEkBOU9ALFvTM0jOczyAm
 5Lf3Zk+q415P0cwOd4xeAtu1Uo0Rs6lbQJK9j42l/pcccE+SdqDRF6QHb7WBckpeW7vv/wrvoRx
 yhMs9Ny3KMM06VcLpteXmNmrGQ3eGySUQgYtbLSi4ay6Daa4i8JqVlqBIYQSgCox4XhuDI8sg5I
 aOzm1lawJyj/uowiSAmWV8SVwGT4Qfh+GJtTCNYDCMTCEN1ofLesM3Jyz/sPS7QGpRWGtnQZrp8
 zkBwWkI3Nk8vDGpWI0KOVAz+WNWOKX4iLo71YqCb/UOObLEObzW832xBvFx5KZ9L1FTs61c9guw
 tDBENJSOhqbHfMSnm68XifdfHZZSf9wED1R7rrsFdOqznLy7D2Xk6NRAXycewTAzGg4di2TCRJW
 FRwZKnjh5IkZZJvCVGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52865-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 971431434C8
X-Rspamd-Action: no action

On 2/16/26 1:15 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When build-testined with CONFIG_QCOM_MDT_LOADER=m and VIDEO_QCOM_VENUS=y,
> the kernel fails to link:
> 
> x86_64-linux-ld: drivers/media/platform/qcom/venus/firmware.o: in function `venus_boot':
> firmware.c:(.text+0x1e3): undefined reference to `qcom_mdt_get_size'
> firmware.c:(.text+0x25a): undefined reference to `qcom_mdt_load'
> firmware.c:(.text+0x272): undefined reference to `qcom_mdt_load_no_init'
> 
> The problem is the conditional 'select' statement. Change this to
> make the driver built-in here regardless of CONFIG_ARCH_QCOM,
> same as for the similar IRIS driver.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

