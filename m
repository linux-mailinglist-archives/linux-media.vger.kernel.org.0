Return-Path: <linux-media+bounces-54286-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDydGfCvpmn9SgAAu9opvQ
	(envelope-from <linux-media+bounces-54286-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:54:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB081EC25E
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E896530D0272
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 09:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810BE38CFE2;
	Tue,  3 Mar 2026 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kXYm5B5N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B163938E130
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 09:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531590; cv=none; b=r8FgMd7kDVwG0Hv/nltQA17o5da7+T5Uht/K4Eh8TAClLxyJ/ocllneRZNcAeEwL2TG04bbOZB3j72N+2mWc/OZaZn+uXrrbQ48YaGag68x66kmebmLb5faCE8jxn2bWCCLz9/rPNmj3Ict6PWNDojcIIHzUOJmWlL3ubiScFvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531590; c=relaxed/simple;
	bh=IUoIPHZUV2R9A+Mx4Btcjsw5YBqWJfm9lzBZp+H74IY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VyLpnZoVyVfkJmzcvBTdir5bNQ7s8+/n4HhilMt+MwuWkj373kOMQVu5joTdpxcsiwy/uVERwsCkWpmVs/Gui4/pm647dVr2iRqORaOMDa5UBRcuUd7T2at1Aj5hIwVanzQGDljAai5JgDE8IweK19AfOkIr0HB0U3ZrJQTvwW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kXYm5B5N; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4807068eacbso44782895e9.2
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 01:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531587; x=1773136387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OtvdeG7knrqNuYWeOBqbghOe0MSRWj5nZRbFtfFtwLg=;
        b=kXYm5B5NpkUwI2XY6iv6fkKNvYKqx5OaSg90cAa+15SBPzwIdkNXytXNyzIKs5TQam
         AKFTKibCPE+UaIu4ubQVozfFhuZZz2jYXh8eSJGiEdPZrLFS3uwDItBe0+SLxN5P73z+
         LOBNCYCoEYHB6zaXgwDzZOZIV+2jV8LSpw4I0TyQp79Fl47CLXzBRJeoRaDB1Pb02TqK
         UnlFvUlF4l+GsXGeJAHomFu1qmpRQJGwblvoLDAWr1xkuGQQ0/HDg2ZTZd63lgeqhyQ5
         PXXMT80WS2iI90Jjbt03/Q8shkdGIp5Q32HJYkhZxKxiNW4mgNCEHXJQDxoQQvjx1EyO
         dyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531587; x=1773136387;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OtvdeG7knrqNuYWeOBqbghOe0MSRWj5nZRbFtfFtwLg=;
        b=S948XpAaUjBBbX9Fh159ulgmaZ8wqyHIvCsvCNyNiNcymUcs6ElIZJ+2J8hIh7/i2z
         ld7bDFPVMBdtpzH5CFh4z+mZ8o0FbwXklYbOZbvXCrN/uiyzBESt6WN1/oNT64GSi8iD
         SIeOi3hv6t86YhqaaX0rbAxv6to9BanxHlFqd1ug2bEQOoGBjTDs5DICPg+vflkTsajq
         HDacOMVaEmWo1qYnxAmWxTjz3NR6kCDkeL81Zrt1WDpfoexDr9IItd4xSWQJ1WLHsiSV
         S1CSZYV3lo+8Zx68KjNDb0TeZAt4tlUfz70tujl6h1XEhDEsJaIvpcCOyWGo2M0boQL6
         73vw==
X-Forwarded-Encrypted: i=1; AJvYcCWKn2GjNITd34zSTB0j+ksLKqcTmrz+wt5TVVU7cPmr2CIAQ+yL87gH2oTNJlTfzOqvGbTfLI9jBuHnvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSxeZL1zpM2QeIbzhWTH8WuRMlO/CZkBLbIsGdfVziP6Q3/2uL
	Sa5O7jsKQAHvguoZwg/KAL3hyE15Ta+uwn7oUAbrsV6tvT3ZBLRCu8vPFkLYrDD/hSc=
X-Gm-Gg: ATEYQzwZHGuRGnQqiOdicao9u8j+fDLymd3vlMzmLflijevVNTuneyArZSWXOgD8W8j
	MbPoe7I7LM4azCcQpRiMvOEbX4J7U2eglg9z9sed5BommrqJ7T/E+P/25IYjjygLOvfn5KASp+n
	JxRDU6Bc9fpn626WgYmpZjY+mxQGNZMdMeFeyBZ8G4QSF1MjJ7M5/cMJVVXXQJGO5XDI4p/1YlY
	n0X8kJKJG0XyY6HWAQV/qeP91MlFLltfTDOxb3pXdFzuKHR576IDxcqkrvIkhEplqg1Bsala3J6
	JQHDXk15k9ggoZgVC10i6XCY2HzkVyMRqlQmiRo7r/X4Caq+06aSwN519g1epeQortQ7ecqfHuE
	vk6g0NGkdewyQbj2BhD1SUSgbYCUt6eGdw5H2Pu3pebFHSYdx8xWCtzQGgTHMUkKSqSAEVwwObv
	b8zy8LrMsMIDLyssER4FlucShAH5qwdYnm9UKXWzSh+c2uTSVWb7HHdBxzgrG2Jj1y
X-Received: by 2002:a05:600c:8b11:b0:483:6f7c:19f4 with SMTP id 5b1f17b1804b1-483c9c0b6c4mr264389115e9.30.1772531587016;
        Tue, 03 Mar 2026 01:53:07 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b7713csm308367735e9.11.2026.03.03.01.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:53:06 -0800 (PST)
Message-ID: <3834ecc4-02d4-42ab-9a4c-075874d27b17@linaro.org>
Date: Tue, 3 Mar 2026 09:53:04 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 3/9] media: qcom: camss: Prepare CSID for C-PHY
 support
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-3-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-3-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: BDB081EC25E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54286-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
> +	bool cphy;

Same comment as before, you should have an enum not a bool.

---
bod

