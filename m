Return-Path: <linux-media+bounces-61210-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBOlOpjRAmoNxgEAu9opvQ
	(envelope-from <linux-media+bounces-61210-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 09:07:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B86151B793
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 09:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A329130234F2
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 07:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8BE47A0A7;
	Tue, 12 May 2026 07:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BK0C75Yv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2AC441024
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 07:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569537; cv=none; b=KLa6plCa+NJj74r3IuolooUQRdCZdwuW255LyjqaeSFtqAmKzd1+T5lKhG+9jOvXD+WRn8b4vH0j2NwwkovJdrX6rc78zzrfXuG2IhcIh0s5UoH2p2NFabcfGUB6lcMZi0zQX8C/mtqjvPP47wuPPEJw0T0umf8sjH8tclvHXTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569537; c=relaxed/simple;
	bh=S1y/611h5F1yDCLY2MwHHiifJrIn907EP4/nio92UgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pCWX/szQ8b0LOAGWHBBeEZzu+c188pfdFFPqvBTEuxIUDB1Xg/ONA2OA65/HZqRR6M+sqWdU+FyX93dy8pBD9CPeQWur0R0VLm37lL5k1CXKAF0Z/vdQ6t8/jEZgd+buFgPDB2S7MGn8TzyLzONRV5nmK8X3z0p0QfpsZxuXqYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BK0C75Yv; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bd22b2abaa4so127337266b.0
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 00:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778569530; x=1779174330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+au2wZMjR4hSPfSatgV6boyFWtlvztIAKTjtpXaCIFs=;
        b=BK0C75YvBPrANr+ri1CVo6P8WvyLhqIh/Y8/a0IL6DEoVektjOYyfz7oy7+8++me+/
         wbTTyApThqtCx2Cmgo/qca4BBMIWVbILm9OTbHkQtnoV5zKbe1c2mSpbAQhNLJSb3+UZ
         t48MvJb/QbnP0pTt0MVfCq2bYMDsOtOwcwZpWENRVtAhCpyDKp0qviirwqWltOh/c9Ld
         F7wyLcNcyThyVFqc8QiUQJjWShddmJLDMbdi3e2ZIp+GREcuT5WXkHoCjXqULz1zr4Qy
         VziaOY5j8TvaMu/nAQtf/9+T2DYkrsgIJEYDk/jNo/4MwEgT9Tcbn6EORGPS/N6UNYpY
         4pRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569530; x=1779174330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+au2wZMjR4hSPfSatgV6boyFWtlvztIAKTjtpXaCIFs=;
        b=lLLzN/BCyzGHMPiEsJtkV/eSWTx8NBG6zL5LODtFNw/y/+OyHrU2rDUfpnl4P/w+Mr
         kGedpIRnUklobNfhjp9fQpem4ZmxZ8b4OVoO+EmvZMErJ6zRfIVGpUQzrBbUDk0uS9Cr
         L84EvNpPj0LAEoeO4AEHJ96BpdEi4SeloPCncMEEtmxWPAy92oHQNSvZzWOIK1UJrn1a
         fNmeW5BJxJp6TAW0I/ee9UBcOQiPBp5l2gf4Sfg3Ajc0xbDivmGlEDdXVLciZgJKJTxR
         DyrS7AWWXHzxgp0E1on8+hD9FDaLPNtnAXLhB9MXMxC6K5GLuGwy04S7VAMedpQas0c2
         AOzg==
X-Gm-Message-State: AOJu0YzgE8TrWOlH0ZwfjYp4ReJzVp6oA4A9iHk+D9tIHOZIrD0RvUSi
	xapqVP/UZWFey2ia47vmxyp1OxmqTseBx9JbG7vYEOmBKmb9DMv7MPkv
X-Gm-Gg: Acq92OFOr7A9Chqb8GimGaFRuVrpn6ux1GfLXvqQ4/0aEOsl0XsPBPV6EOZ4FdtBe+A
	kNxHLuQgtGaCkMLlES6b6xafw5HQt/T/mgsVTbPw6AuO/+z55SXeH0KC1xy3eLG/gzvSF9hp9MU
	Zcj3Q2Rv6Sfhfeh8h29+1nSyr2D7Y5vSpTJNjVapcYBVduPBpJ+XLaooq+sDakYl62CG28K5x3T
	UxAWKewI/tKBzJ1AyAHK408WuCoeNU3jdxeChlGn3R2LUFDJ2iE4/jdjhzBzWsrbVKbN7GRMpoO
	rKttHWJf/0DdL5Wfd6U4jni0BdEaGOynGYuO55gWTXmvInSK3s2GfGBYA6ssvN6tvFvZVB0nStS
	JszGN1vnql24NsYnHkHLykEIxiPuhccRUtkfvFnjR8IpupG8g+KtP3jX/FzBBBtX5/KZAz4oV01
	q6fAZbNnbb19nNqmYvV/D5aRudITsRwhZ5aytvcrLdUhcwI6BwwUXEmLYkGE8aIeh06dYE
X-Received: by 2002:a17:907:e113:b0:bd2:27c4:f453 with SMTP id a640c23a62f3a-bd227c4f500mr115768566b.9.1778569529638;
        Tue, 12 May 2026 00:05:29 -0700 (PDT)
Received: from ?IPV6:2a00:f502:160:4e2:a099:cad9:2ecd:93de? ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e2c317sm4646281a12.31.2026.05.12.00.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 00:05:29 -0700 (PDT)
Message-ID: <c99d1b63-b304-4440-9bd5-b119dd0042e5@gmail.com>
Date: Tue, 12 May 2026 10:05:26 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] media: qcom: venus: Add msm8939 resource struct
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
 phone-devel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
 <0TaxINYCitQd2DsGsbhRviwmrQkaaVMaE9vABS3gSsSPNfrgS3JPTIo_kvTzyEhGOAZuMVq-k-5T8mqDM7dnIw==@protonmail.internalid>
 <20260506-msm8939-venus-rfc-v4-3-994f5eb22acb@gmail.com>
 <108401cb-040a-441c-b463-b69df195378e@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <108401cb-040a-441c-b463-b69df195378e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6B86151B793
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61210-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action



On 5/6/26 2:33 AM, Bryan O'Donoghue wrote:
> On 05/05/2026 22:44, Erikas Bitovtas wrote:
>> +    .vcodec_clks = { "core0", "core1" },
>> +    .vcodec_clks_num = 2,
> 
> This smells a bit dodgy to me.
> 
> You already have
> 
> struct clk *vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
> struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
> 
> so why add vcodec_clks and put core0 and core1 into a new array.
> vcodec0_clks and vcodec1_clks seem like a very natural place for core0
> and core1 clocks to live ?
> 
Sashiko found some power management issues in my code, so I'm coming
back to this.
The idea is to call vcodec_clks_get only once for inline cores, thus
avoiding duplicate clock assignment. Attaching to vcodec{0,1}_clks
instead would mean we're adding the same clocks twice. I dropped it in
later revisions, but now I want to re-introduce this, then add them in
core_get_v1 instead of {vdec,venc}_get_v1.> ---
> bod


