Return-Path: <linux-media+bounces-63698-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /2kjMoLAIGok7gAAu9opvQ
	(envelope-from <linux-media+bounces-63698-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 02:02:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A5263BF56
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 02:02:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=AEHtQGbs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63698-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63698-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAA4C304725F
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 23:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2433B4DC547;
	Wed,  3 Jun 2026 23:58:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E55B4DC549
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 23:58:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780531135; cv=none; b=ZcKMdbQPB7qfnQuMMhtLD0b6cN0DapkKrd67T8k44fJU6vYmDRfwMVMm9N4Jj72spamRzwcjRc56ZCxiJGrzPeZrXl1oClXdQkJ5RJ0Zbk25cjyxcP60zC4kYrMQkElgW3muxRg11V7KLHYKr8KT6P29+7L+3zoBekNGJmHk2gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780531135; c=relaxed/simple;
	bh=kWMiMYyYTblMdxaqUykMu540IEbsJMH91t9UFLHf35E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iUy+xolPp6AXd719NF3wfbmCUqjCgRwhg6DVCaPJjpxeO9CxxOrdm7g8qzeohaZt5w7eZzPOaQo7YebB9TD16c4yducLe5gX3q1ToZ5w+wcGxiSDCt0NTC6XM+gkleRHNWxPYRytHXsni8+2Al83zMlDBiOQTvpl7S9njphRzsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AEHtQGbs; arc=none smtp.client-ip=209.85.167.53
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa64cbb08fso10249e87.3
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 16:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780531133; x=1781135933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1SCC74DIXhE8DyDejW1+bo9tsnjHROThMMbJp6vt8s=;
        b=AEHtQGbsoAYiTKBciyB26ntjRTa3U/5vlurTZQ6MIivjc6Hd6LFg1VJ68Mpj1eazeG
         DINJTnIyYpFSwLbd2boAPf/73wVDZ/I+7V/c6GUBh8bo9xUsXJb70PWSFzEXwrqKXaRv
         6Ww3A5tTfp3FdRv12Xyjbe187WGD+bhK3tffQxh43xAtWxWqysaJ6CHf8iijuQspl2EW
         a5fmQPW9/W1GHEsFXeIJj+8Z0pvHIKEQHGGwJTNBecV7laCHgGsGvhXJNKVWlzHu3oNx
         SBQk9yAnFuy8QWjpOopiIZ0QFpjMl9HtYGKGFNBwdtvgEffZIOJFtaYsf8isGt+7NsE5
         X1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780531133; x=1781135933;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+1SCC74DIXhE8DyDejW1+bo9tsnjHROThMMbJp6vt8s=;
        b=LfWxYDzd+n9FYYtw8lotI4e80SwV4Kq6COhhyVRTZYY46ihuUyy+BEteuak75uwXF1
         7mb24W+F68msmVh4cAo71ra1ZIgLIO8kz89Ds0Abf0cFRs3zy2TrjHVoqWluXMAS9ydm
         TuXh/3lQm1PHwHrSzWpeH8/ORmAPX+SK1qWlXrDyPY8L3io1l1wYerkg4vvmB/u3mG5z
         T1eDVBJLlvXyPXgw++CJtXnrQLwFo9aBz0QtPhn17oL0vkNb23x/UUqXTn5ZOlzIdzcR
         U0exxT4s06bERqdHCg8gs80NUQReKb3wSM76ANwu5cmotq0PSUBTGxalbtFebruVA1Vv
         FQ1w==
X-Forwarded-Encrypted: i=1; AFNElJ9pLNV/ns6pSRsoL9/ftBAPqsBt5U9fFSru0gln5bw+Tkai8xJJuSU2lfSGzLCGeivYQatthh/UbTpUQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4foq9dG0TBWA2TM2uFdrpAafiAw6B4DVQpjLdviLk3m2GROXS
	Re2IehfuIZQnteU5E5DBPSK4EKRKttfk6KbbVv05JkffCKFd8qfhUzV8s5nyj/v+9E8=
X-Gm-Gg: Acq92OF6tWgO+Nsovr8divJ4bzeEu/BO92MKz6ry5ueMnmrnyaPTuHiosQ8EhyAvvOg
	hdRXKibSU70Ou5Gi7pVuFLXCb4HoiqJwzovd+cnMSd+bD/7PqmwhoH0vvgCdo0hy0PK4z7JQuv0
	dxMCEY7+wCSjC+mRsbezFoy8VERRgr0zFcbM+8+JlTuO7sJTSHPXQ0TUvvLNNpGCVzenZwx5A8u
	Ezafra/VLJZc5h3jqU0yI8unz/51UiNgC9jQYDVW7f0WA5z5I/hqi1Bre4VjCj2t4CjMaSb2K3/
	zMMsv6MEvHAlrWpRihGmkZXfdXXwd0tOJfXz/eSCkNOb0X+Tj8sA3iGW53k9tOyJ+3If/DYzuTW
	LPZAs3k8t39iIImWBdDllkcgdQhvARV/YI26YvsjT3ZQSDmqQc2TkvFZvY2b9EH3sWzC6VmcFa3
	IMyY1YQsO/Va3Idhtwg6AtK1a4bJl8X0RsujiG1rtMztkQZIP/6idjMBENatgK9sZ1Uhqky6yG2
	0it5VT4yKpEG6iK
X-Received: by 2002:a05:6512:6404:b0:5aa:635f:7c08 with SMTP id 2adb3069b0e04-5aa7bf5279dmr878301e87.7.1780531132531;
        Wed, 03 Jun 2026 16:58:52 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed659sm899338e87.12.2026.06.03.16.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 16:58:51 -0700 (PDT)
Message-ID: <374f17c6-f08e-4f4b-a6c1-ef2cd1b87631@linaro.org>
Date: Thu, 4 Jun 2026 02:58:50 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bod@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
 <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
 <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
 <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
 <4QKRXnKlt962x7eipKO1dLr9tzEF6a3M65FZXI8PNsXwx_RhKzJtEfQKOOwI8synBSe0GtUZxWVFFeD1qVlGnA==@protonmail.internalid>
 <6e962010-8097-4b52-9369-0727c0d5a31a@linaro.org>
 <41ab1685-3d0a-4c8b-b7a9-6e9299c48400@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <41ab1685-3d0a-4c8b-b7a9-6e9299c48400@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63698-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:bryan.odonoghue@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22A5263BF56

On 6/4/26 00:12, Bryan O'Donoghue wrote:
> On 03/06/2026 21:42, Vladimir Zapolskiy wrote:
>>>> Split configurations explicitly use other lanes for clocks. E.g. check
>>>> the RB5 Navigation schematics, CAM0B connector.
>>> Can you please check:
>>>
>>> CSI_3PHASE_COMMON.CSI_COMMON_CTRL5
>>>
>>> 0 LN0_PWRDN_B Lane 0
>>> ...
>>> 7 LNCK_PWRDN_B Clock Lane
>> Please note that media devices have a numeration scheme of lanes starting
>> from 1 (it'd be easy to check/confirm it), for instance today CAMSS has
>> lane numeration starting from 0 is out of the accepted scheme, and here
>> it'd be better to correct it and not enter the same pit.
> 
> Yes fair point CAMSS has done this wrong since forever. data-lanes = <1
> 2 3 4> => LN0, LN1, LN2, LN3>
>> I don't have access to the IP spec, anyway I do not grasp it, where are
>> 8 lanes on the CSIPHY found? Each CSIPHY IP has 4+1 D-PHY lanes, not 8.
> 
> Max CSI2 data-lanes is 8
> 
> #define V4L2_MBUS_CSI2_MAX_DATA_LANES          8
> 

Judging by the name that's something V4L2 or in other words software
specific, while I do reference to the actual pads of Qualcomm SoCs,
and I do not see 8 differential pairs per a CSIPHY, but only 5 lanes.

If that's correct, the data/clock lane numbers should lay in 1 to 5 range.

> That doesn't really explain why this register has seven data-lanes and
> one-clock lane.
> 
> It just is what it is.
> 

-- 
Best wishes,
Vladimir

