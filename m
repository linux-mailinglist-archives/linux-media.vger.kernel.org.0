Return-Path: <linux-media+bounces-65969-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cX0eI6Z5Qmpk8AkAu9opvQ
	(envelope-from <linux-media+bounces-65969-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:56:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ED86DB9D5
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:56:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=ufNlTX7B;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65969-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65969-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28DE8305B725
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B78132E757;
	Mon, 29 Jun 2026 13:51:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F422EEE99
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 13:51:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741104; cv=none; b=KJAkWa9rMqxo88Dc41uEGu8gwIqZUs9M09BywWxL/eIzQM2XWiD0WL6KPPpO9bDhqWHdqKATNEI8VzSj1C6OoKPFyFaWaBD9NJQovPM8hrtmhoY5nUezGJ21e3OjARc41Qwi2rRyAV/2dHnx7eGIXQLq2xViCwEmnibE15Czlxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741104; c=relaxed/simple;
	bh=Anf9lqMzdcDn0HxQ9omAPbbmLofJntbIF/EOfhUsnEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t+1bSljiCX1RefwatkchLqpJo5yYbOR1A+0W47+RYtPSL2GUDkDV/2PMWLfS7Q7Ek3ePPB+plMJ+gegEkEXRg1AdgDmAMzP77WVCsY/Jz2l3C5FZYE1ezfKRw++6O7DvMHB8wz2JRMYrBLo64QECPGdMNbSGdqu3g7m9vfTtI8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ufNlTX7B; arc=none smtp.client-ip=209.85.218.46
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c127ec4447cso50040066b.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 06:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782741100; x=1783345900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A8EFC4s909q8I7RU8JVrkHNARL0nFv4eMvLzK4nBUtQ=;
        b=ufNlTX7BfPn4IaANtkEmrGj/YMcyjP6eCUw+REMKX8SVC5agxxrXrMb+kYLaj4uyuY
         vZ9jfjOwUuHKmtENE/J8ihBgqEC93IwCfEgi2OOW4ndahSro4MT+mYknbytq4UC2vjME
         AmbagbAPEVGp0faqO//4x5laQzJUGmQdYL6yUZfmdXUsHWJR/20Lr5R5Z+3u6xUrBJfZ
         Ijsa+JOrplXU89EMhY/2bav+YhXi7ao0QwN0vwRU62tYexB28SV0i/gOxhwf1A9Kr/b2
         A5MA/+3lOl2gEJhNNDNdZrbIxUTExeGRP3Jct72FNpISheheBdJd8JAcsMSJJTWw/r8p
         hxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741100; x=1783345900;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8EFC4s909q8I7RU8JVrkHNARL0nFv4eMvLzK4nBUtQ=;
        b=rIaYNSXa7IKy/JVSNECiTBfoWAtzJaIrRHlGvJiagViUNhoiy+eYynBCkd2gduywHz
         vGojkhkhubiN4eEGGR8Auu+BZTr8t48Z7B3NqhiIMrSLJEvPrud+/gwShFL8qY6mXud+
         B05BGJn6S2OPhYLDtMJc22bY+KiM7arIiciZXFzJWocXD98UoU8aGU7TEq5XV6kfM4cd
         6ZvAVm0BnqN1aTgH+68nr+ges3t2gITuPQzg1awjUtNqkvjZSONZp4K3tzTSU2wtuSX9
         sYEPfIbIGHz+ItG3gVyBN7oMIvvaIZipA6E1CzlsOthjUHhZ/0wU22cjoKrm/sg0zeZc
         KPtA==
X-Gm-Message-State: AOJu0Yxw1jJZ93vfk2bbmnxnOw1q1J1U9ZFSiLBD534qAYFVfcTF5jNq
	mpztMCYQROkRNO6wIO/+fnHEEg+TnRArxwlwTfT1ysNXt2+O1S2/EdC2j1Vu1BFT3X0=
X-Gm-Gg: AfdE7cm+as1gBSqCuj5C7xjbo+tweKByoXb0zRUToz4luRxPNzLTduqo9raDSkAfYVn
	iwYPI/IFZwiAP2INfHozSeSwDJZsshMM3WSPcdSOb5kK79Qgu+P0h74EGpwlUs+8dx95UOPruTL
	1tet6ofX0yE1yP71c5YrrGZXRoI3lh3JM5pX1Cs//YZOY8/uOBreNh3l7PdlKI5maHKkylRpa4K
	AhB376A0yBzNIw48nrgPMD/IYUdt+XWie+t0/iT57xCzZCHeDR8YXWjYtnEL26SDTyOBwF5SUeE
	RFTBk+TormuvSWvJ/ihe78ZN3vQf+biavBgTv6/0foxsUM4JCDG2I33YclJvhXyocyvjYOFRC8c
	BRVt5mQ+IGmBJnPt7dwmAx+k+tVmbgLljGhWEO28XUi7OY0ESFVeo4Q8w1vD1LSgroHuQs142Tf
	rZl6cKqxIO1SHV26hGRG+xXelL
X-Received: by 2002:a17:906:8c4:b0:c12:79aa:8289 with SMTP id a640c23a62f3a-c12816c2116mr28295466b.40.1782741097886;
        Mon, 29 Jun 2026 06:51:37 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.22.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c126ff294b6sm124967466b.21.2026.06.29.06.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:51:37 -0700 (PDT)
Message-ID: <cda4aeef-e4ef-47da-a171-4116ecf79af5@linaro.org>
Date: Mon, 29 Jun 2026 14:51:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] media: iris: Replace ternary conditionals with max()
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Du <bin.du@amd.com>,
 Nirujogi Pratap <pratap.nirujogi@amd.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Abylay Ospan <aospan@amazon.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
 <TdDfHsypRVRNrRrdsuiesZkUCszn-uQvyk0poi10qDu-ML-jfhWu0X2oF6H7k7dIdHKL1ld6k7ramZixK7kPpw==@protonmail.internalid>
 <20260629-cocci-7-2-v1-2-5884c80ee3b6@chromium.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260629-cocci-7-2-v1-2-5884c80ee3b6@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65969-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:skhan@linuxfoundation.org,m:kieran.bingham@ideasonboard.com,m:bin.du@amd.com,m:pratap.nirujogi@amd.com,m:sultan@kerneltoast.com,m:Svetoslav.Stoilov@amd.com,m:sakari.ailus@linux.intel.com,m:aospan@amazon.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64ED86DB9D5

On 29/06/2026 12:30, Ricardo Ribalda wrote:
> The max() macro is simpler to read than the current construction, it
> also makes cocci happier, which currently throws these warnings:
> 
> ./platform/qcom/iris/iris_vpu_buffer.c:703:13-15: WARNING opportunity for max()
> ./platform/qcom/iris/iris_vpu_buffer.c:583:23-25: WARNING opportunity for max()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index fb6f1016415e..faebb5472866 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -580,7 +580,7 @@ static u32 hfi_buffer_line_av1d(u32 frame_width, u32 frame_height,
>   		ALIGN(size_av1d_qp(frame_width, frame_height), DMA_ALIGNMENT);
>   	opbwr8 = size_av1d_lb_opb_wr1_nv12_ubwc(frame_width, frame_height);
>   	opbwr10 = size_av1d_lb_opb_wr1_tp10_ubwc(frame_width, frame_height);
> -	opbwrbufsize = opbwr8 >= opbwr10 ? opbwr8 : opbwr10;
> +	opbwrbufsize = max(opbwr8, opbwr10);
>   	size = ALIGN((size + opbwrbufsize), DMA_ALIGNMENT);
>   	if (is_opb) {
>   		vpss_lb_size = size_vpss_lb(frame_width, frame_height);
> @@ -700,7 +700,7 @@ static u32 hfi_buffer_ibc_av1d(u32 frame_width, u32 frame_height)
> 
>   	ibc8 = size_av1d_ibc_nv12_ubwc(frame_width, frame_height);
>   	ibc10 = size_av1d_ibc_tp10_ubwc(frame_width, frame_height);
> -	size = ibc8 >= ibc10 ? ibc8 : ibc10;
> +	size = max(ibc8, ibc10);
> 
>   	return ALIGN(size, DMA_ALIGNMENT);
>   }
> 
> --
> 2.55.0.rc0.799.gd6f94ed593-goog
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

