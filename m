Return-Path: <linux-media+bounces-60775-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMECNUBi/GkZPgAAu9opvQ
	(envelope-from <linux-media+bounces-60775-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 11:58:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8824E65BF
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 11:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6A7D305A242
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 09:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787763CBE84;
	Thu,  7 May 2026 09:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pj9woii6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DC131A81C
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 09:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147612; cv=none; b=LCfDvBixttyqvbxiiCT+aZAOF8EIKWp2ZQuukCPvYysCQM6UGF9J+hQoKWTu7vnYymvAUHuyK6rii86eoPEbs40jZ/Cu6kwcp+KQSUSU3tzACzyVvRHQSsBBVooQk+tmPMASFRk8A2S2HAwkMF4wEwc1yoDsNZOylJl1WpnAMOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147612; c=relaxed/simple;
	bh=esOQNYyk4S+1vRyuW54BvvEdRBVJYjf+jiRBNIb46VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lB3fFShwQIs3O1yq7QbjMTK9S9rdaWearREdpiP6rSIOOBnpjh7uTrvV4mfhvutp5BpuabstjS4BrwDN/EtVzJ/ivl7e+f3YgHRNH8QPTpHpGBkbgP9SJXyDPwLMLLakRBOVlXRJ6geB0XrbcsJWS0PbFsnSadKyPOLUIVfeKlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pj9woii6; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7bd6f65c781so5695407b3.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 02:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778147610; x=1778752410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u67GhOwi0lZemgHuDxTmq2QqkO8Lp6ag0DvuYlZNi8c=;
        b=pj9woii65iLNLmKkAWR0E9QTnZAQFuYEjZM15452wL+5/pcj6YkY1cdTEz8UprUL95
         h7CmtDoKjDVN7nGQ575jfba+hcGXDQRyy8+RU84ohz9xEdQljvCRLGv837ILKipL+dQK
         maRBwGfrVpOg3ZnXyEjqBHaPifBywSn0PIUXcFTYLT8CIWEmV+pWobphA9LWW7uFMMGq
         S26D4alltH6q+35f9/3cpBm1YJ9Lsc5PuwUk6Ak0uwV+asODDM62EGVuysHjfJhA1tfR
         6Y+jEUiT6wW721iCQjv5uMOgXRqVu5pR7rp04vhq8Yvylc6pnb/v+QjwBxNTLyRjP5HG
         8DdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147610; x=1778752410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u67GhOwi0lZemgHuDxTmq2QqkO8Lp6ag0DvuYlZNi8c=;
        b=fvIVP0LqOjiygKuzCdTecYJp7SY/68u0dn7RACOjKR+/2z3B9Lvhv7xpWtH/rz69bx
         ljQfqNu64bTrPWe8pqLNVYGLKReHTI6Ky9FrrzH93VZo2B3i+G2iDw6rddZKRxEoUR1S
         v6MhXSUB/Q782wEE/ga90i4wDEGCpoyGD5Xw6eTND+7vjxqyGqA0iGfOS2yoAbOsNVNL
         8M1unpeBtO2Y8D90svVPvq4YWCMNY3+F/7HAiq+y27B3gnrp4sE3H1vchW7DTQ8iB1rQ
         hcNLso755arF+u67orTNVi0UVDDj4Leu7LXv4jXzT8K86ZG/b0WSILLmT08dFqUxcwhR
         LUgg==
X-Gm-Message-State: AOJu0YwhdVerHndWC08OGeB8IiHyl8DkmbKQdUCEmRgw2xVQezzXPcK0
	N7SiiXvbyF1WCAF5Y6EK7F6LQGZUH0Ltb11mHkEt2UGvxjpF9fbuU4Qp
X-Gm-Gg: Acq92OFLJG3E8UqBd3gff1M/h57BzDfoK39zmrs1WOF1trHJiHkkb+ufLnQbrolARiG
	b83lxwPycQh3crN3hZEqjccoW7hTOgz+OITc4dqrvlBT1ReSD0+4LV/OjFnSoiwWgvPXY52ZWzL
	UtX3k6bYHXcFRhdwqRmZXN7KBK98q9Tmaf5i2fEOf4Wut/jwhMa/xLesI+T1qtVkIrAT0AoKIaG
	lhQKDDGeETnx2cPr3zgeyO7+9WYSJ5CwxRL/t06Ki22cQH2BS7zrEQBEGrEYwvt9o1rpnafRUGS
	dP3bJPryBRG8cToBlZoX+CiYqsBg6xFenLVdNo2/YkUrNpSCZjoOYpMbUsMa1636+23/ibOmJ07
	nK0BOLb0dwXUkdTSE27+AaPZCCrB7zcosS2h/x1E1eENyfMsCw23MjHf2oS6TDUKqyib3/baRmT
	kdDb9sCda6VRzdvEXcCeYO7eUiU/ANriJGJcOh
X-Received: by 2002:a05:690c:d90:b0:7bf:b4a:179b with SMTP id 00721157ae682-7bf0b4a1951mr7423237b3.18.1778147609957;
        Thu, 07 May 2026 02:53:29 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66837872sm90497647b3.30.2026.05.07.02.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:53:28 -0700 (PDT)
Message-ID: <4f1ab5b8-3bfe-43a6-8b91-317456188544@gmail.com>
Date: Thu, 7 May 2026 12:53:22 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
 <f5TsKnC12rLsH63vAi01aN4oXUFLrfgIhn14IQFDb9gcac6anLzzhJdkGNdQ2dRs4vYbFKUptfEgWuKdgIgGsQ==@protonmail.internalid>
 <20260507-msm8939-venus-rfc-v5-5-d7b5ea2ce591@gmail.com>
 <17c4626e-8926-4cad-842d-a1b171d1e962@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <17c4626e-8926-4cad-842d-a1b171d1e962@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3E8824E65BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60775-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action



On 5/7/26 11:59 AM, Bryan O'Donoghue wrote:
> On 07/05/2026 09:32, Erikas Bitovtas wrote:
>> Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
>> device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
>> to these GDSCs to indicate that they are hardware controlled.
> 
> This is a misreading/misunderstanding - supports-hw-trigger means the
> GDSC is capable of being configured this way - not that it _must_ be
> configured this way.
> 
> Which leads me back to my previous point/feedback to you in the previous
> cycle.
> 
> If you _don't_ apply this patch, do you get different behaviour when
> trying to switch on the encoder ?
> 
Running the following ffmpeg command:
ffmpeg -i Videos/big_buck_bunny_1080p_H264_AAC_25fps_7200K.mp4
-input_format h264 -c:v vp8_v4l2m2m -pix_fmt nv12
big_buck_bunny_1080p_H264_AAC_25fps_7200K.vp8.mp4

Fails with:
[vp8_v4l2m2m @ 0xffffb0386870] Using device /dev/video1
[vp8_v4l2m2m @ 0xffffb0386870] driver 'qcom-venus' on card 'Qualcomm
Venus video encoder' in mplane mode
[vp8_v4l2m2m @ 0xffffb0386870] requesting formats: output=NV12/nv12
capture=VP80/none
[mp4 @ 0xffffb4b3b7e0] Could not find tag for codec vp8 in stream #0,
codec not currently supported in container
[out#0/mp4 @ 0xffffb4265e70] Could not write header (incorrect codec
parameters ?): Invalid argument
[vf#0:0 @ 0xffffb72105b0] Error sending frames to consumers: Invalid
argument
[vf#0:0 @ 0xffffb72105b0] Task finished with error code: -22 (Invalid
argument)
[vf#0:0 @ 0xffffb72105b0] Terminating thread with return code -22
(Invalid argument)

If I revert the patch, both decoder and encoder fail. This time, encoder
fails with the following error:
[vp8_v4l2m2m @ 0xffff8d356870] Could not find a valid device
[vp8_v4l2m2m @ 0xffff8d356870] can't configure encoder
[vost#0:0/vp8_v4l2m2m @ 0xffff91b3ba80] [enc:vp8_v4l2m2m @
0xffff8eb78f40] Error while opening encoder - maybe incorrect parameters
such as bit_rate, rate, width or height.
[vf#0:0 @ 0xffff941f25b0] Error sending frames to consumers: Invalid
argument
[vf#0:0 @ 0xffff941f25b0] Task finished with error code: -22 (Invalid
argument)
[vf#0:0 @ 0xffff941f25b0] Terminating thread with return code -22
(Invalid argument)
[vost#0:0/vp8_v4l2m2m @ 0xffff91b3ba80] [enc:vp8_v4l2m2m @
0xffff8eb78f40] Could not open encoder before EOF
[vost#0:0/vp8_v4l2m2m @ 0xffff91b3ba80] Task finished with error code:
-22 (Invalid argument)
[vost#0:0/vp8_v4l2m2m @ 0xffff91b3ba80] Terminating thread with return
code -22 (Invalid argument)
[out#0/mp4 @ 0xffff91265e70] Nothing was written into output file,
because at least one of its streams received no packets.
>> Venus core clock cannot be enabled if Venus core GDSCs are switched off.
> 
> True.
> 
>> But since they are hardware controlled
> 
> False. Your patch makes it so.
> 
> The question is, is that change actually required and/or beneficial here ?
> 
>  they can be switched off at
>> any moment. Vote for the Venus core clock to enable it later when GDSCs
>> get turned on.

