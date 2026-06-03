Return-Path: <linux-media+bounces-63592-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FLzTCtomIGqcxgAAu9opvQ
	(envelope-from <linux-media+bounces-63592-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:06:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B29D3637DBA
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:06:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=i1VrJ7h8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63592-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63592-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31F7E319CCFB
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 12:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D65D480955;
	Wed,  3 Jun 2026 12:57:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AC847F2FA
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 12:57:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491470; cv=none; b=atpoMfTFTtnMi+4xuDLTnGN4KOwETYSoiEk+attwDn+ptrV06sF8EEGYzSC+UK+MfmNv9l8M8iFyrfxYWRnDLBKeeXviZCMd6CCGVVdziJNXmr9x2h6Jq20Qu+zNDgBYBmDjXxk8uwzc68INKTG2GjtF2s3tlJR5LfWy19JPUbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491470; c=relaxed/simple;
	bh=vUeXSaHLUxfrAP6wWj0TpMgOgk9qoWtX5OmAgms/TCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zxv0+s1RpyPA/zathwzCcwyxSIpkhIixpjzJnITcgT08F0aApe5hE9a3rywk/utV2YX6Bg3Yl8aMsiRQqeVlqV+NBVwETGHsrIhVamrxyPs+HGxxhEwHjKCNRuuO+fHGUHBur15J4GKlc5zmKfmGbPOGJ1ycDAcCxXXsfPmrMHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i1VrJ7h8; arc=none smtp.client-ip=209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68d232ed3f9so5471714a12.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780491467; x=1781096267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AA8bcGrflv3zc6PRP3K/cb0tnkGVq1FBamekCJeKaGA=;
        b=i1VrJ7h80fV7fSOBlXAnfdJuY+2fsGyyf/tJ0+12SfuTR/gMcK17mObitwToDy01fU
         Ei2Omm8OTgi78nLT9S2pkawz7CVhjmQBfknrM4slQC2vGgfjr//yal6FSG/86aOB+Oub
         Gj22c0DfOBfcxv+81899+FcaWybl7jwULfWw0E2ndxzzzHcNF093Ef5sa1Jk9W9p26uC
         D8GGxUuRVUmAaCcc8SzYfo9CneC6prHxoRCTm7Qu+Is1H3mlHN2vA0C3gNHpenuoHuDP
         w4H0NNTWwh0VW3ZjH1R1E+GP91KsOVhAcaXkItkWWQ+KbRidt3GYsRpKufSPgYiGCLpy
         oF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491467; x=1781096267;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AA8bcGrflv3zc6PRP3K/cb0tnkGVq1FBamekCJeKaGA=;
        b=ht42Ek/a0pwunB0JOqaAmlQjQJyvbK9dlixadVLwsWkp3qBl1eDDdpWJOoi4cjXHNa
         +47YmDmUXaxzIHKzWh6a5MnRqAj1QWMhvJ4MK0Lt2Grp/duU2QNyK1VLTHfuofcNOobP
         CSQD+5/b2/deLD2uXqcQQBm20grJ2zB5TQ1rd+TMbrJHBqmyGva45kzKcQ4mKpbgCdVT
         VlTnu2JLC7uhxInWrw86tToZQWJoGVKNBeM0ADimIjp0smn0iZ8mw1RidkOVqDN23Tm4
         V2qYFwGwEC8iYhbaBEXgqmoUM5GeWbb4ZFpF3h4nBRMEOQ7ewr2X1GvinJVkCHwBXFWp
         KQkQ==
X-Forwarded-Encrypted: i=1; AFNElJ93slTzyH8DE/YaK71PhciuDQfIXjF7n3CirYtkSsWkejozuJ4kYrzfq2MzgInf+wuNdeF4/e8944YUjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCun8mlStONBIDddo9t/P9pkgtjN/UZDRX5cE1SHmDq0pyNNZP
	e8Ag+3Tp/P/yUN8UFeuBvzScNT7L9OGRzf9TBuQO31yPqye9BJz3T9qY9iOm67FQm8s=
X-Gm-Gg: Acq92OFVKgceaLibirD9OtJZn/X62Bu3voisg26JQhhqT7NFiRIuiIR7U07QVaYsPfm
	VLzizp/7kEkkDGxUkwSUbho5vranME9tWpLCh7arGBAI/TIwBAaMl9xYCESXBCOI7DefGsJyKnS
	AP4iR9qOLlgrv95dvJzRI79o00G/XA6X7UkCfG0Khg7/3xvBdMwzPPrrayW0f+ZItnhPXewtWtP
	tDSXJZjCPgGX0oQWNUfqsY3CEtkV0Ut0cOLP54bywmudRTqw2+WtIR8naNltOt8qZqbHObvZq6B
	Oy4AzMf5Up5bixpetTS1mXugjwBPdd6jpi5kQvXcGko5gFbatf4Gt35ZDrkGePIzXJA0fyx8Bz/
	Tti7YIrf2I879UgX0u1TnULfvt6g9TZ8GPlSX7wX6NImPh8XamL99uZo3G1KDHnLVUgCpvAnhM/
	eLa5awAimmLOA7sOZwU+IWXCb9bz1vk+6fkUr4XNKr47QO1g==
X-Received: by 2002:a05:6402:5242:b0:684:32ec:2332 with SMTP id 4fb4d7f45d1cf-68e6f4b5a53mr1709091a12.2.1780491467112;
        Wed, 03 Jun 2026 05:57:47 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851786sm1107720a12.17.2026.06.03.05.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:57:46 -0700 (PDT)
Message-ID: <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
Date: Wed, 3 Jun 2026 13:57:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Bryan O'Donoghue
 <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
 <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
 <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63592-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B29D3637DBA

On 03/06/2026 13:40, Dmitry Baryshkov wrote:
>> Are you sure about that ?
> Yes.
> 
>> ipcat I thought designated lane 7 specifically as clk-lane i.e. named it
>> CLK_LN of some description.
> Split configurations explicitly use other lanes for clocks. E.g. check
> the RB5 Navigation schematics, CAM0B connector.

Can you please check:

CSI_3PHASE_COMMON.CSI_COMMON_CTRL5

0 LN0_PWRDN_B Lane 0
...
7 LNCK_PWRDN_B Clock Lane

... just a badly name field

CSI_2PHASE_CTRL10

Bit[2] = IS_CLKLANE

Right so CSI_2PHASE_CTRL10 controls lane mode, indeed. Thanks for checking.

---
bod

