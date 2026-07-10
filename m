Return-Path: <linux-media+bounces-67236-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /ipMDZetUGpN3QIAu9opvQ
	(envelope-from <linux-media+bounces-67236-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 10:30:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8427387BF
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 10:30:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KluTD8RJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JWA9BgUC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67236-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67236-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51278302FD53
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 08:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E2C3F0A9E;
	Fri, 10 Jul 2026 08:28:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815F03EFD15
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 08:28:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672112; cv=none; b=OitnIcKFcfUO8JertZvOofeu7SqKYo6yo7Ih//0zlnsViAo2zH1eBkFYTY+AqahewNxNzhg4tzAWlQMRPNyZfT0pEsJ0z0pIdgGmqxY1wPenQ87hpNYiVQG9zW/xSRzXmUNQKvcAABc+NUofNeM75ENiHiFd3JXtmSuGsZJOY/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672112; c=relaxed/simple;
	bh=vr3J4Ah6TFyjmNOt7bQrHjkTvfkgZCWxs+iaTw5TBhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F3QBzRhmZpfp7cjMMDcsNTbDxgrKxVJ6QF/Wto5105YM6z7y3LfC89v94EGv0VDk6s6VbrzYkjp7WxU8nchkEgnEeXkC1oP31CZNdIKnFtz2BOdI6cBgC48ohRxqstkTkYcOJ7syMkA+5NR/PvR9sCRzrOENHDVj+IXh+ZVgtp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KluTD8RJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWA9BgUC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7eesT092354
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 08:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cA+3fVMURMQV7pN3n2WY+GcSkJAyciW1cmPl1kI+vaE=; b=KluTD8RJxNfUx5G8
	TkpEu9xIr6p85PRKtw/iz+oe6muBssXSK+AQi6RcYEAwvZdK1khlaEbcxdVnovQb
	Nqln0uimfviWbaEXXYsftLuTcChFX32/k1SDm2jSGFaOpGFuDNI4DLnkWczbRFP2
	2xUR3DD5lzS5ETB8N7NEfvH/ytnjr4mokcbl/FD0Xz83BTbmB0GbQea47t+mE8Em
	8MoNVr94uTSV2HS+Yzgkmh1+wSwD41dvE87wd6jIMECWhoUG0sqUizuGj4HPiFsL
	925ov0D7qIYnufpMZzVq3U4Fepo+l5kpEqt8e49fiSYOBSIqPUz7U0VFOqRB728r
	GQ7aTw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjbrba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 08:28:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07f25de2so4950691cf.3
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 01:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783672107; x=1784276907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cA+3fVMURMQV7pN3n2WY+GcSkJAyciW1cmPl1kI+vaE=;
        b=JWA9BgUCO6D/h/yFgdG3O4MaHC0rdLrofDGxxXVjoncDwnZgIq9CNnqb7Y1Ipa4xb7
         HJzoE4/BJ9Gus7slpDBuXvetU2qcPK9mgrUeBZhG4rHsQWU5PEnnPi2VUq1BwP6zR74u
         o0G2+XYy13Hvp/zmjr6qznk2D3qdzlYTULMTjXRDZvm2EpKhVPp5T7lQ4qCbK5TSP5E/
         AhJgR4v39E27bR+CdZRafIZIb/SeRmTPoVsK4lNFW/vmlKt8J8O/LDj1nLUkNQ6Pckgs
         o5CUP1rX3af48NiI24O2p6/Hnvy3cs1P7rKgTDKI7IvpbGVaO99Z5N7xNtFM4F6A6YDt
         CcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783672107; x=1784276907;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cA+3fVMURMQV7pN3n2WY+GcSkJAyciW1cmPl1kI+vaE=;
        b=lP0Jxkm31OI8l23z/v3ZeU0E6A6lmN1nvhUgQ1lAsXfDxkobwQh4LMI9lnYjJeckff
         2R5pxC5vz/HJ/kZCWNpKcePssMIbSR6zaoDDITgQwSa4UhqfWh76u96F8J4QJ1DnN5Ap
         IupQ7Sv/ZXToEZASvcDY4/cTlcXlSJprClXk0x4LYxVHq2WNvy57jnYSsksfF8yFEUfs
         nx0MPheElPzO650vdilFhwqpiSWx4kEoFHbGRYr3o304iuVUCXnf8L7Tj3NvBKkoE7dq
         59iK+jainUdDHIRPEyU0CCgu7QwcBNlflp5cQ2i9ArSrDSriRlgYAdXA5jNJaEu20syE
         An5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrpA+0V5ZU+JeDyDiapZG9YpKjQLhEu7DyhZotqRJ0VarKQK2nWFtV8AJXNTZTPPKEtwYt10n6/RmQcnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCS+35D0UhzXFOnh27L+gg9UMz89URUETAWm/xqg2+LSChgJj9
	H8PiVg+XiMkzhPoKgmo1VZhQi8XClzY+R9A0Mr4mbYfhx71ZFGdmiYW+SgN9pHDJERWcDU68dQw
	z1vWuT8rqf/cfKKlHYtG2FWv/6gw3Xjv3mEQ2Ln+hQeED7QWVtd74W05ZqjVRIydB4Q==
X-Gm-Gg: AfdE7ckcpR2IxZINgES88RVuqu1m0coj+devn3YRMYw7nKQLqZSJUrwE4MJPvrNz/bI
	F3tdADECdF0/2sv8P6VhfBNb0YpHgtSJXokxur5glJ/I4HWDcITlOtK9faahMJmSS+461prsd14
	yrCPyJVWM+mYmzkwGXDvWH6A6z3rLBOR2TcoCzwYAKGuKipsmEYVwbEfWrHCzK981bHINp03r5U
	hxb4w9oP0ZRt3zIWaCkDwwmcE/ASRZiwVlyQdDo5p5tGI3cfpkTB4IJEjRcY+a3iJPwAOQH2ffT
	tEoo46acgWrVeG09ysyRzPrBglsz+sDoKZveDqmqIKty9wrdrcAvELc2jkaUkfYRrWfiTQxoDaD
	l8WyjqmajKWRgIydP5OYPydE8xdSKKb5+DfoFg1odgXnaTw==
X-Received: by 2002:a05:622a:4d05:b0:51c:7d0:7ed7 with SMTP id d75a77b69052e-51c8b31e045mr122859121cf.39.1783672107581;
        Fri, 10 Jul 2026 01:28:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4d05:b0:51c:7d0:7ed7 with SMTP id d75a77b69052e-51c8b31e045mr122858921cf.39.1783672107193;
        Fri, 10 Jul 2026 01:28:27 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.253.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c6bd0d72sm405268566b.7.2026.07.10.01.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 01:28:26 -0700 (PDT)
Message-ID: <6e955b2d-3889-4387-9f85-2b000a9599b2@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 13:58:18 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: iris: disable time-delta-based rate control
 for VBR
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gourav Kumar <gouravk@qti.qualcomm.com>
References: <20260710-qc10c_fix_and_disable_time_delta_based_rc-v2-0-701d6dfd1ac1@oss.qualcomm.com>
 <20260710-qc10c_fix_and_disable_time_delta_based_rc-v2-2-701d6dfd1ac1@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260710-qc10c_fix_and_disable_time_delta_based_rc-v2-2-701d6dfd1ac1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4MSBTYWx0ZWRfX90760Co+fxnp
 QGW9aWlseBKpVbSMBJMyOKe8Y1Bf36PyCwQm28Jjy3e70le1AXEoz4vXLs76boti2xxM0fGgHkQ
 fACZx8P5Mr/BUanSV3dGCn58PASnZghOJbCoVWEFBIkMdMp1NTK0cbmHDLDR8gBzaymJqtJ0MwC
 ATVFz1wggeufNkPrajJbXzCGlJEaRMB2Fus5um2iAcigZ/9/ZnIX/hvNWe0irepn5B6mwCEH5mh
 G8sRzQoJWDsa0fT3CmlJvhgQAU6sFCPouQOtzbGkDAUVhIhv7uNgGyLntwr8Zsoze+wLNuOR2zX
 xUOehULrrF4K7M+91M0eoAtOkxu6s8DtGDMoFpxj1vHxTEzJhC0nEgqLx3Fpqw1gzEZoahH+Xs8
 r6hILfvgl1PoR08dENgnId/Gv+BYsD5/3u0QAOTwSmdNV4S+v3Zts0hAloKhB029GDGwzuP4U9n
 3isuLFqvNGmf8cXy1dA==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a50ad2c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=MoCqpHF70WjPNMFBpltNPQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kaZPDjHNpzmdL6TKSoIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: HKkY4d33wyzECYJLpO0JQ0Irw1mvsFey
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4MSBTYWx0ZWRfX6/XIk+gAPR7V
 mIqZkNRQPFU5LWjeus7rS44tlIfSrunzC5N1IdGCCyhJ0gH1Wvlk/YWeSM6HEaPC0M0nf52vgTC
 FZbrUcC/85qTFJAaUOfxKw1ZLT7n4yk=
X-Proofpoint-ORIG-GUID: HKkY4d33wyzECYJLpO0JQ0Irw1mvsFey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67236-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gouravk@qti.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF8427387BF


On 7/10/2026 8:24 AM, Vishnu Reddy wrote:
> From: Gourav Kumar<gouravk@qti.qualcomm.com>
> 
> The iris encoder driver was not sending
> HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL to the firmware during encoder
> initialization. Without this property, the firmware defaults to
> time-delta-based rate control (enabled), which calculates the output
> bitrate from actual frame timing rather than following the configured
> bitrate target.
> This caused variable bitrate (VBR) encoding to produce ~5x configured
> bitrate. For example, with video_bitrate=896000 (896 Kbps), the output
> is ~4.4 Mbps instead of the expected ~896 Kbps.
> Time-delta-based rate control is designed for variable frame rate (VFR)
> scenarios where the encoder adapts to actual frame timing. However, when
> an application explicitly configures a bitrate target, the firmware must
> follow that target regardless of frame timing.
> Fix this by adding the TIME_DELTA_BASED_RC capability with a default value
> of 0 (disabled) and sending HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL = 0 to
> the firmware during stream-on, allowing the firmware to use the configured
> bitrate as the target.
> 
> Signed-off-by: Gourav Kumar<gouravk@qti.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c         | 19 +++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h         |  1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c      | 10 ++++++++++
>   .../media/platform/qcom/iris/iris_hfi_gen2_defines.h  |  1 +
>   .../media/platform/qcom/iris/iris_platform_common.h   |  1 +
>   5 files changed, 32 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

