Return-Path: <linux-media+bounces-58787-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBsHJvFD32nzRAAAu9opvQ
	(envelope-from <linux-media+bounces-58787-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:53:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D79A740190E
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9285C307E2B6
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 07:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EFB3B27D4;
	Wed, 15 Apr 2026 07:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OD72VWRk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF683A2570
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239586; cv=none; b=UGKEJhRPhb1dOnU0s9q6PtmP1+hEaKDjPOfygqg992mJi/K67CnVvWx3paJ9K5y9mc9zTQCQirFKmkFMKaw5sTZus+smWTRIVYLVCfFMC0isI7ggLgzWshGwT6j+oBb2xKCoKx4yapJBnodTWLmPnnCz3cX7vb2SLyvE6HE6Nzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239586; c=relaxed/simple;
	bh=Yw0xvrjfP36/t+KznQRBwYmPmQJN/XbQWjsIlxYZ24I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AhYN6u7C9OOrgdtctvJHjdH2sezq0MyPcwiu53KDBuGzqy4qCvoK2yXUK+J9a9cWW/uqZQ10n2K6bt/MJ/xqNX+j+GK7VKweSonGqVhVByKiA7liVAYT4orC7k7uI1WJLURujM8ngfqOHPTSFrKm0WYdn+AGBDCPRJmfaCu1bwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OD72VWRk; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d77f6092eso2155418f8f.2
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 00:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776239584; x=1776844384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3J2ARVheakhszJOb8gf8ZQoX9WgE4eZSMjt1YLdpUqY=;
        b=OD72VWRk1IpmodDBxmX/+AFOkvlLBWGKSwAmZuk6ud1vSu1bjni2GcOnlwwaaubFSH
         42bFAJIVMaIuFAzhJxGuS1PPYIP7INfrodBwpNb+TieNqWMT+Z23rChXksfMttJpFbEt
         N0Hz7v/Yhh5SkESUYFxdBDHc9PnCfxy6jIv2kj1KGu5pjwAE0+lJwXy1DVh5hOFrp6X3
         S7JmBlRFILBzeNIsKe02Iq/AwH/kf1s8HG/TL6vnOl1FyIdxhj2WvgQWDg0UyAFG9tSL
         c/B8OiThcukp8CqjB3CKGufmDB9HT8gLbwhe/HBIenakz0vVfi3euVc9y0/Hi53hFsQO
         Jqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776239584; x=1776844384;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3J2ARVheakhszJOb8gf8ZQoX9WgE4eZSMjt1YLdpUqY=;
        b=FqBDojfpJPaZqfqLxUdLz2FuNssjO3QnaD3WsmfT9AhK+694+/Z+vEGxXLrd7dJIXL
         ObmAVbdwJ16BkQk3HQ1pKG29JGT51fbXVq9L+fbZzHXOitntNqNG85BvN1QCA7aTHds6
         G1NU6isOIjG2yhipPvrzWobe2Jabse/Hgju+Ibfr+OrbMkTjDvYmrYj3Fhl8A8+jcfGB
         CnrB8AB7bDz4QBnJ3yUFBa9lLrl+6rpPheSUQiGM6v/CxVV2mwg4Cs32oDj26nxEVoap
         ReWB4k+aUVdeem/sg2O9fWbmd1xXJ7o073kgE4AAv0hkFZGN5+RVzwBaxKPC24d5I6g4
         cQLw==
X-Gm-Message-State: AOJu0YyBBbSIo3oNcPZ+IQZX935SxH9CtZwbW8j5afd8hhvUJyUbps6W
	MX4mv6DV4F8QaDru1Y8Ho0L0yq5gMGnrgrzih0Mbkrou2vSB30z52+lOJqef211WuhY=
X-Gm-Gg: AeBDieuIrJnLhDzS3UC5hWMtYwFLp/a5c/b7XffHDoY4TBhPCcKb0hBRaOv2QpQWLKR
	YEnjQxQgCyRgVJgevqzjjPV7HAxOF9tdM5RguQLlctZs7adKYb+ptfFRNiJhSNygWZDd32kTcjY
	6jVnisWCt6ZVBiPryO29F1OfnqdGrkWjPLdXib+upgduD/P2I8JGCoR+2jxxag/GdRYmiiumBeW
	M8GtBgasdTvSQmpopWUBG+hiB1nC5Joxhaio1ZqXZytfHNvm6D7bqA0KLWWeaktFc7M3U2f725X
	LCH1osqofLkKCjp7HOM6JmNocSP4oqExUK4noPl9trdLD/sBQGh/9GCOaRUCHgb8U/imPSw9h+y
	SOMnca2F3evR+U4ylGnANcBoh+tnALkZxEtGL26X1Tx4upVkNS6yLwBKmjf9Z69K78oCFNV402X
	2EUoUXFIHo65bFVgs1aT0KwkMFjjDD5ud9fROjOKgBnB/Lgpp7FWkGFuQ=
X-Received: by 2002:a05:6000:26cf:b0:43d:7633:2665 with SMTP id ffacd0b85a97d-43d7633283amr17691558f8f.44.1776239583858;
        Wed, 15 Apr 2026 00:53:03 -0700 (PDT)
Received: from [192.168.0.167] ([93.107.73.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead33d6d3sm3139103f8f.8.2026.04.15.00.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 00:53:03 -0700 (PDT)
Message-ID: <bd91c686-f713-4a48-b440-bdb292083d92@linaro.org>
Date: Wed, 15 Apr 2026 08:52:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] media: qcom: camss: Add PIX support for
 CSID/VFE-340
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com
References: <20260414185202.2714019-1-loic.poulain@oss.qualcomm.com>
 <CAFEp6-1+TeEDodfMM+ZmvGOwxr2sQa5pJ9vuk+h2WWPtkMvVXA@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEp6-1+TeEDodfMM+ZmvGOwxr2sQa5pJ9vuk+h2WWPtkMvVXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58787-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: D79A740190E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14/04/2026 20:31, Loic Poulain wrote:
> Hi Bryan,
> 
> On Tue, Apr 14, 2026 at 8:52 PM Loic Poulain
> <loic.poulain@oss.qualcomm.com> wrote:
>>
>> Add PIX-path support to the CAMSS pipeline on CSID-340 and VFE-340,
>> allowing frames to be routed to the VFE PIX interface and exposed
>> through PIX output devices such as msm_vfe0_pix.
>>
>> On CM2290/TFE, the PIX interface includes a minimal inline processing
>> engine, which we will be able to leverage later to export statistics
>> needed for proper 3A frame processing. This also fixes the PIX path
>> not being usable on this platform, as PIX routing was previously
>> unsupported, causing frame capture hangs.
> 
> I forgot to mention this series now depends on your CSID/port series:
> https://lore.kernel.org/all/20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org/
Thanks for clarifying, I was trying to work out if the indexing was 
still included.

---
bod

