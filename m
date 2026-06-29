Return-Path: <linux-media+bounces-65975-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vTWpIM2BQmol8wkAu9opvQ
	(envelope-from <linux-media+bounces-65975-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:31:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB496DC130
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:31:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NNkQ5ZFN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="FGy8KJ/7";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65975-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65975-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C755300C305
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0657F416D0F;
	Mon, 29 Jun 2026 14:31:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAB63EBF2F
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 14:31:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743495; cv=none; b=GxiA2rMvVZzQdTJJPaS2Qkkh55xyYivPXdboqt3lhtAd4omCImgvcWg82LrB8jJUF+ttckxo+BuOLFf9WfQVe8g6c/b1RyBmoOe0SYkFnqePfLIt9G3KX8csXf0QN/GEmQfNKW5o58ZNPP6T4pesdff1TMtQLRCZCdXmQH/LpUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743495; c=relaxed/simple;
	bh=OF9snRn31X6SmMDY51AcTh4zJejisfuf2S1w2Lwkwb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqNCl49UHvJiD86pcHGqZdO5zdAXOhpFqg13S/FHvEgGLlRpXlvSB6s+2k6sTarC7Kp0MpGPtfR22Huqyp+J40N3/7NgnInQxgc/shAPJbqTh51Pfp/F8w0hhQw/zNB/Sfcx817Ua27Ct6sVMnU31nV6wSpx3ZjbS39r3MO7/xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNkQ5ZFN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGy8KJ/7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT4eJ2641438
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 14:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILMGERo87mZLBWnpMSdXvTEPn9IRdnOnAq56ed7EjMQ=; b=NNkQ5ZFN1afV8iYj
	RCTq21Vqme0yI5XrN0ItxKFWnpZAzzUnLLJfa1r8ZI50Z1ctP11PgiyQA/QeQl/n
	6ZNYFOtQNb8JVr8018QV3PhNXZ2gDLJh4d3Ps2f/ICSU/8sQyMpf9zjo/gViz0FC
	HavK9AI+IW5gpJOxJDQoBzHCPZtLJI4OeruldFD850pGshpptnOKwBgfAKXBh9vd
	xdVZi283+kjZFJVdPrfLpzu2fDEaop/YOYjKly9PI2RsD1/eQoMp7zuIUuzhZBqD
	R1R/NJt9qLZLvNJr6J4HJeF7mhHsZHxKhjDDsqXa8iG7Mc1/rwcpq8EMkpNvY/tv
	3CYMfA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s1f67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 14:31:33 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-734f7d8bb37so283081137.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782743493; x=1783348293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ILMGERo87mZLBWnpMSdXvTEPn9IRdnOnAq56ed7EjMQ=;
        b=FGy8KJ/7Y/atIhqubjCIE20d1azikb+pYXjTf5amxOoxNN1ZrNCrcERf8QYv4GLzsW
         aTJweSmMiz3/OpCAu8A4SAVIWciaUr8zasat1/h3alq2aweVjSxPpif8ZRk5kdwFt96U
         eabpU1OgQYUQLF71lzmUO0m7Nux3CXnZDQKvJ5cZ0DtAcrfp2XCGQONW64g6iF37eyH0
         1DtetvlV/c8UlmElEf95JXA8OZQWhTFJYdwe8yCD3XVGLbSnjeZNkA6lDKownNj1f9x2
         UVGgA+xjvPdeRflQoHBji8jl+48vnnIAqhhEGUsRGNlPwABZw7UpspAiKPe6w0oszbUk
         m9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743493; x=1783348293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILMGERo87mZLBWnpMSdXvTEPn9IRdnOnAq56ed7EjMQ=;
        b=La7Z0KvZs3ccS/4kcKLn6bPmedX5PT2N7k9lru8qKDZ2A8B4ywFB8hnsN3Vyh8Dxb2
         a/3NjM2/wLWyvtNYq0890Fb+K7ovngJMyDH5N1ShYdifySY/zS7mfhJJ6He7mIwqcfFb
         wtc6H46jnZUlKqTP83PF8HIf3mFHJXe+dHWtfJuBB1An8Bw5It3Ij0AzS8kTg7q5UA9l
         7ObR4ISbc4WFX+q/pfZN+2p1QU78ZBrfjoIwzEwbrRc4AKeTR722sNMybErPO6aWlR8Q
         MyNtDvuabc2tQYalUh7eS2xqwWGk8xJccYleoGWTpMEL+cx3/3RkH9c8fgpSGzxFUSej
         J9/A==
X-Forwarded-Encrypted: i=1; AHgh+Rr8urfaHjFr7pfOH1T7n0sHrBz5OCWCuAHAIBRK1HA339TCni3I0vo1Re0vLBMYsH4rTnZdZ9+ehZS46A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuaBplFY5e6c3NxV+DWDOzbbvHuTUf/BNSbS768hqSDqI5EHgd
	BuQF44h5kqvBznW5lx5vPs4Uw6Zozwz+zvcDpiBJgR6b6JjLZ79ANQfknJSjy6NxgW9kq2Ic+Su
	GgOl26svKm8VfX7jhIuC67xAVduO8IEMSrc0NPLf2leKs/2dNf4RntxJmBiyiMtVwOfbz+T5Msw
	==
X-Gm-Gg: AfdE7cki1etZf2zVFvpuB/aZ66oNxRaH3Tz0ebRiZeZq/J1/nm53rzN4EMtM8kuebOQ
	spXt2ohBIDZeoHxCLmPvvEiriRXqtCp/PuUyaPMKLrwiwZUDVP2Cw/M0jPRamBkTiotPx5qwm8W
	wJPm23bw+rb9WNCzfcExzPBdlyKyA2ZcUFFGEGIWkn0Re7gstNXCz6Ccok8IjHgnN+yHgefyeTQ
	YInQFBlNISx7ihqhclavDgFnqm1AweBFZNPVX18Mr6/PcbeFzoUhmFwt4sRkfk6ctgDAE/2UqFm
	+ubMhZ6MTrlRS/SfeFXcXrv9fVwq97XxaGQM5BQaFp+bih1FxuSuJ3/R3V3y9bsRt0huOg/UdZb
	ivx/nNgYdpjAgtKmT2J4nGYREm4D5b3cJ4LI=
X-Received: by 2002:a05:6102:1607:b0:739:b6bf:bc9e with SMTP id ada2fe7eead31-739b6bfbe2bmr287676137.3.1782743492737;
        Mon, 29 Jun 2026 07:31:32 -0700 (PDT)
X-Received: by 2002:a05:6102:1607:b0:739:b6bf:bc9e with SMTP id ada2fe7eead31-739b6bfbe2bmr287559137.3.1782743491515;
        Mon, 29 Jun 2026 07:31:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12678c8863sm194348866b.20.2026.06.29.07.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:31:30 -0700 (PDT)
Message-ID: <1a5232f9-9d28-4870-8600-da221b88e4ab@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:31:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] media: qcom: iris: use disable_irq() during power-off
To: Hungyu Lin <dennylin0707@gmail.com>, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610141511.92352-1-dennylin0707@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610141511.92352-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMCBTYWx0ZWRfXxTwefej4q7Er
 pQQNuk+OSV1SZgh3Aguic3rFIGPiosLujLhXTUcWi2Es9gAzWm3WhecMSJHFxCJl8Kv/KLd6m6E
 07hI+Jkv2Oy+aRN3rpUfhCI4Eo31wa0=
X-Proofpoint-ORIG-GUID: t-rKJWYcEoD701d-5iB7dsh72y-t9_IO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMCBTYWx0ZWRfX9Lzm/MKfQNDP
 wT3PYwO5ZC7snYava6qLXRIxakglLN4uHVzshdjhL6HksR/I0g+53HTPjJEBrVrWAzDp+wNq5gh
 sAvloisPgOq96av4tfzQcJaFeTwIrwzNMPx/E8cf1E78vOqb5k3iv5SeZL1PoCDwWCDSCfB1hgX
 7gSwB+ZFpUpsl3wluficzcnIRCIoU/3Z4TPhwjNBAqXpwIWF52sq1sV09g8tEKe/+WJSMsAodKY
 7726XOrs65HZXGXH/ox1maggFcj88K0q2xHvqofxAXfJ9heWjizXJsYeeD5uLDbUMl2UpdpTboW
 XYtbtlSSQAbmv3DMj5/KVafFiUU72mIhtJbaC8Af5+X+n3yHFCsqHt6F8LK1nk7lbf3aCyJH2pH
 2pKhS4kryA3oqrRj8ZnlVXzBtO7WXKfFnBPSB21tTd6NMb77li0RcPmbJUmyXijeU4TaSYXE/FJ
 lRwAFwNgYzdMIWx06Dw==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a4281c5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=zWOnxM58HoCMSUmL7UMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: t-rKJWYcEoD701d-5iB7dsh72y-t9_IO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65975-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EB496DC130

On 6/10/26 4:15 PM, Hungyu Lin wrote:
> The IRQ is registered as a threaded IRQ.
> 
> Using disable_irq_nosync() in iris_vpu_power_off() does not wait
> for an already queued threaded IRQ handler to complete before
> returning.
> 
> Replace it with disable_irq() so the power-off path waits for any
> in-flight threaded handler before returning.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

