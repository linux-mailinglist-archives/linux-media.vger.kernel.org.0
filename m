Return-Path: <linux-media+bounces-54826-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNOfH0QWq2nMZwEAu9opvQ
	(envelope-from <linux-media+bounces-54826-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 19:00:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC86226855
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 19:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5AB2D3008CB4
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 18:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32125352C22;
	Fri,  6 Mar 2026 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JffKQ+6e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB9336D51A
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 18:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772820029; cv=none; b=cQzthpMocpX0xtkUcaCCqajWJfC1HycB7BcFTLogB0C9jjkR17vPPns9XtJeYXzk3+d5DZJgCMlCi4UTIYOkqBrmttqmfzcHyJrbR+qW4ERtRE2fp8o6VyUb3wENLds+xQzS3K0X118cymbzVdhvwnMhv6uA/KRqQBhEuzzWvOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772820029; c=relaxed/simple;
	bh=nFu/jPMO0Y+T7Fp90oKXBOnE6P1qus7goa3+wvgHzEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nNRKiXfHOs2SdtFOTLslCFHBTJ7ugJU1tGGVPipwAGdImT3oCVVrYdWNNceF51x1WyE2+SBdULAIf5AkwJ96dfOWobkQ4+H78L6eL7ytXs/0n45BeqZj63gLvSfgU5l+/KAHmgsBkSZfaCFO43HXNV5EvAcKMV+gAT+Hto+Pi/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JffKQ+6e; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so62918225e9.3
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 10:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772820027; x=1773424827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OQP/1gPedcx94rqwFZeBLzMOhFlSjadtYi29kmKkpXk=;
        b=JffKQ+6edSUUmE9ublqTc6uGF11Ew0rEPv/vaywK5WScCgbIvB/cafkUPza+Mz6qHP
         2aK1X4f3Ixll6oCyFYJfYPmXOeB/3RJU0WlpPZhbc6VUArHeBLYH3bNfZS/KwLDen4dy
         Wa87eprkmXDzRqd6O09kuCVhaX+pWzN4rTA7+ZK85iaxMW0MtY4KJnchiL5ZoQhJm8cB
         1Ed+uXyBo61rbI77HOAKbTzB3eepVJ++lPLf0qyeEmM1WgABNcmtzZHyHzW8bZPObsHj
         wlGPUdA1Pf62DCxf/i5ZX6CaZqeyESgzsRl+6VXtBc0QZbDUHbCYWfoVmfNygDDnVfZ5
         s75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772820027; x=1773424827;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQP/1gPedcx94rqwFZeBLzMOhFlSjadtYi29kmKkpXk=;
        b=JXA5Gwdhrg4XcTvoNJiMfqckjtxOWTr4zerWdlc/nMXhHLNDvHjjDAtbAnfVoc00Om
         zuHSr5wBQZOthdLnGi5qlMeLLJBO0k7fvULVsgCS2pugMHr2WxP9soNfXF0CJ9qVuiOY
         bNTHa9YSrQBB5+X3oJuBStVxc46NeIgZVvNP33CIT2Sne5SRDzTTRJm5BrM6AkPRS9hU
         SpV8Ll0rjQ2nYEIzqSMI2+4hw9DHYwPR1SQgF6IXcO6MhQl6PBQfHd2sdce8SL+1wE31
         3KGWO47ExAnCky4uMRm5iRbpeYfhuxmBVETcBTcDfFySbXbO/8tCXOilwzngPdgaHGso
         xEFQ==
X-Gm-Message-State: AOJu0Yz3lLB5bghZ8lZ2GO9prRV/cYJql8bQ/jKIfCI6sNbmGHfU3i15
	halr9MEEZCoUvrEQv0Y6K+jtZElOCCADZXZBdwJMzj5PVXELiqgE0ju3CF52zWEM1fk=
X-Gm-Gg: ATEYQzzQeXsFCAiAaIGQSOnHiJC10cUw/JIrrYO5v4Teigm5pMzv5rqST40YL/oVN28
	zvYiYV3HrXwWfFSqoqn4EzyQ5/js4SfWgsa+cG75lKtTVdtqrEr0VmLhodegQtpfoK1vzBgewdp
	8D7OoJswo03XDDxj948ENEQRhCJXTqXdLwm2IH9W4SHmf1g14RcPr7XQI+Iw6+Z9QsQI01bTVVY
	wPWVV+hXHRZYsDtOz6HENeuwNc9Qb2icnfa6idFrjcODKSFI0r6zm1pEw10M7gBEN99zJLf5hGm
	9ZPCezMcaEAhd8nY1XUSWROh1fXL7TQQgnEI0NhdH3l3PB5m5oDU4/F0yA+6C1zxL1U3Vx0aUsU
	3AYZDYs3dMxMv9eDbqIrLnVpp6ipCZWMPOUK505lh3afeMLXnQ0X0LcZBndzAojXGAycarEgGnc
	08cvENOeXN9Gy1gJnzpoQsvbCruu1vCjauzAI=
X-Received: by 2002:a05:600c:4f0e:b0:477:73e9:dbe7 with SMTP id 5b1f17b1804b1-48526983becmr53304365e9.35.1772820026691;
        Fri, 06 Mar 2026 10:00:26 -0800 (PST)
Received: from [192.168.1.102] ([93.107.81.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fae538bsm170036725e9.7.2026.03.06.10.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 10:00:26 -0800 (PST)
Message-ID: <273f0a36-599f-43f3-ae88-6c332fcec21c@linaro.org>
Date: Fri, 6 Mar 2026 18:00:23 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: camss: Add per-format BPL alignment helper
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
 <20260306160006.1513177-2-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260306160006.1513177-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9FC86226855
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-54826-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.954];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 06/03/2026 16:00, Loic Poulain wrote:
> +	default:
> +		WARN(1, "Unsupported format/bpp (%u)", format->mbus_bpp);
> +	}
> +
> +	return 1;

An error should return an error not a default.

-ENONOTSUPP, -EINVAL, -ENOWAYDUDE something to indicate failure.

---
bod

