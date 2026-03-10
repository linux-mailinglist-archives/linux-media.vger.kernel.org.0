Return-Path: <linux-media+bounces-55171-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GZaAuAksGnYgQIAu9opvQ
	(envelope-from <linux-media+bounces-55171-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 15:04:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 913B5251487
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 15:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C98732F849E
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 13:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA3A3B47C1;
	Tue, 10 Mar 2026 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k23SZrOX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5413B27E1
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148339; cv=none; b=nxgmRIv8YbIFWfNCGOvOua+TS8acmEdYwnytCZdVaP++BLy6/bXk1ZH71E3dS4OS04pWu8wW0Uy1J6b3XcxBTgSGfw1mFver/Y9PWrN86Y1hHHD1xv30tbNZIlLKeStoqBjW2OLGtr0iNdN4i40kWXZfRC/9y3c8DslimAGsfs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148339; c=relaxed/simple;
	bh=LqDUHcYZyFe8bkUx87G2TZCF8T7n9v7L9997lsbFJro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVDvCQz/I6GwDeUHyEQULhk4vnmVJymtob9MvRUPGsR9FIU4g0KTsCWR2i63hITjDq4wy5ANvHrXvG2osQf8R8Iwxs6X7bzq/ovT/na6SjtdcjU73NcHXGER9mcqtKahOlkhwfpbAzrlOSXs5l9boNpOUesuQQJWsEOBSPN9mIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k23SZrOX; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38a33933e99so370581fa.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773148336; x=1773753136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3akDRAR2brhfnBsbjRKrIVTGfck1UhkOdMlFX3g66Ro=;
        b=k23SZrOXCSNdKWiRc2AX9T/VJJeF3uPI/dpHA7uxp6aOqaJQG70zCLB/7I1tvRObMq
         7H+yK5RgKvX12CdEJ9Ik9rC2QAr5bLs9Tx4yHpzS+YD5wALQu4W4EO7/gKqZGBp/No6W
         uCdo30bB1EiW7OfYVio7YaHVDKUuDeOBaFToR4l3drRJxFyaboiAiNPicPpMUI9V5xH/
         a5ZW8i2+nEZIzWowAQx6ZilgiDwry7BN14MZc+cVOlxNfxR731oFb/hpCW0TbNKknTlU
         3CzJQRTLb4SXm/qw8SweY1W8KU1oHQnNQ93ujCHuzDDtn8f5IlSHs9q1mwZpxdb8Ocb3
         2U2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148336; x=1773753136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3akDRAR2brhfnBsbjRKrIVTGfck1UhkOdMlFX3g66Ro=;
        b=qvSMOBgXs+SoDSVBZ0lQWCog+6PuaEjQFDv5zUMMWIbDcMARyOXRuYaP/6vKwSmSIR
         2PEUBR3SaWbnbUIjx/9t5n0k7GvxXHw+vClXtdn7/UH4H4UchsW+PrmV3OpQcoLfbwyD
         I2LbH4T6TeaTtLb5seZj3eiRHW6pVY0Pn/xoVyLTxUPcp/AiPFMjmSF9Bfx/krQcmFhL
         TT9zytO9Isn75wTKFRbZAJL990jzqVw7rYpTxsgaDuxBPw056mR34TTkMG5gQczx4OPL
         VeiEL3HjD653BsqZox16dZyAhBcEFYSFNiJMCgYq/Ujb+KaXECI5G0CKjccIjRZ4CgOl
         JzuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCsNN+Tt8Dp020E6uHHxboehvJ/BvJA6oOPbPLny8mrvc9wWKvS88arkuj9R8/SFh2YiBteL0zGnDSAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8RmdAxbXq8gVlPFinnHz9GOezNZ5TubNxpUAyw0wJZKTaHRda
	af9VejIHNOfC26ks0B11/n6u7scVN3HAadLZA+CIyR1vYUgwdCjas1/Auh3pi/5eX6Y=
X-Gm-Gg: ATEYQzxT7A2koYL8EbW4eik4mn3uKSYbnqin2H9QUx/l24RXh6bEmOvu0aexwWooAD2
	qXNrW+1p+iTb4EFqGcBcNKt9N5dnCVKu9Jfry9F5K6Dg7W3HAN6iutQzdCqsree4SMea4dusY8j
	nH9sIRKk5QmygTXEdTYFuEIAnrXZfzvpMUFbfX5ZgtFmQjBANcz6cecicbzYjRCz24y2hiyIaLr
	8IwesNb8db9l9YlyRapY3HrSiwc8cveHSHCzdYyA10S16br3xNFSD1nb64yULHkH4qcc0iMAKH9
	IIYPRFeoyy24cEQHIeGXkNSYcFSvbjU7HlSfqQAYzAh2fVLyBv2tULrYhwLDyNvIn/YNoUzZGMo
	OnK2MRtfQpSYjTQ2/25VPyCRGlpEDjQ+0eaAJTQj8R4WV5U6I9m79KOd/yxwQe9gQyS74lpP5oV
	Ub+xeS4netoeLXHgoHHAd5mZWP7m7Ign2e3SR682SGoIM7UjQIbdfxVmYUBZ2FJTFhMQrYA8Ar3
	qPKog==
X-Received: by 2002:a05:651c:41cc:b0:38a:2e66:c9f6 with SMTP id 38308e7fff4ca-38a40b560efmr21641361fa.4.1773148336222;
        Tue, 10 Mar 2026 06:12:16 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfa196csm4679511fa.2.2026.03.10.06.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:12:15 -0700 (PDT)
Message-ID: <b7bc1053-68f6-4af0-b4fd-fce3ad42c615@linaro.org>
Date: Tue, 10 Mar 2026 15:12:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] media: i2c: og01a1b: Add support of 8-bit media bus
 format
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Shawn Tu <shawnx.tu@intel.com>,
 linux-media@vger.kernel.org
References: <20260226133739.4050870-1-vladimir.zapolskiy@linaro.org>
 <20260226133739.4050870-7-vladimir.zapolskiy@linaro.org>
 <aa61R5mcCE1zu125@kekkonen.localdomain>
 <aaea7acb-87d9-4cfc-8af2-fe630c3c0095@linaro.org>
 <aa_7tBqp9Qk_yvdg@kekkonen.localdomain>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aa_7tBqp9Qk_yvdg@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 913B5251487
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-55171-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Action: no action

Hi Sakari,

On 3/10/26 13:08, Sakari Ailus wrote:
> On Mon, Mar 09, 2026 at 11:56:03PM +0200, Vladimir Zapolskiy wrote:
>> Hi Sakari,
>>
>> thank you for your review.
> 
> I fixed a few issues on error path of enable_streams callback while
> applying the set , no need to resend.
> 

I appreciate the review and improvements, thank you so much!

-- 
Best wishes,
Vladimir

