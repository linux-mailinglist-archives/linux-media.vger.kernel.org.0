Return-Path: <linux-media+bounces-52514-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LMrN8Imi2mYQQAAu9opvQ
	(envelope-from <linux-media+bounces-52514-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 13:38:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD411AE9B
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 13:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 037B7303CECC
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 12:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CE91B394F;
	Tue, 10 Feb 2026 12:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r8UqmhFv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3E4155389
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 12:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770727102; cv=none; b=Qbq4ohhs+OKAOjZJ74+n1xB6eIIfNs4Xn5EMr4X1XHe6kkXWZ5jkgX/OjzbiETCU0lpfmtBTnJHv1AC24zgmCvfhj1mkmYgR81aU+R2P5vxegFIIUBxuS7rpGZosQv74Clv7MBfx+5YUPfpvAZe5pJfuq4vfm7Pg5wGySaIMQhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770727102; c=relaxed/simple;
	bh=QU31hIANM2iKsUCoSFU71RTnMz2RvL9BIjntvMtSLGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UbUHtLOY1khBY/o7ZfFcn0W9mf8O5s4EOAxR+joVle77YTxhQPXaU09krxPZdWz7BlZD3VGyqRtBepJ1LeZ1mJzBMXNA0Y2MRPqj9dKXQR+N6beJE7+HjEU0F/ddrS6JXsXrNh304yY3ImE4s/0HOq7ja77Xmjs3RGxjKDGvJ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r8UqmhFv; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-382f6ca9fbcso2144711fa.3
        for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 04:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770727099; x=1771331899; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3D31YqYK8CuEtFXmlILPkuZg/ugm6z1QAeaPoW6EMo=;
        b=r8UqmhFvwutFls7L8q4VYmfFHmCbxMK0eeXh15QSflrwrd0aeHVX4r8uMkgsdObnGt
         oDPhpdJwEA/EjSXKD/uAzLWK8X856DYD4tm8WKvhrRyVB1OfXY4zbke6IhRvNEjbndNW
         jwFKCgPZVgjqugF8zQYNA+XMcklTR7OJdOpbAPqLmhoc4mSbIxtrmLRRcw970UHsA8bo
         3hIhudmwSg4IdLyErievLcpUiWE0qnjH76/aReEhHNKpQjZP1IAka0Evm+fwsVrJQZkj
         y97mTxZ8e2QpXQbbaiA58zgzgCE5n3jl+KVbEFN1avAOnNwx7ndo2x0mFM5upC77YNDc
         xpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770727099; x=1771331899;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x3D31YqYK8CuEtFXmlILPkuZg/ugm6z1QAeaPoW6EMo=;
        b=QM8XV/gRanr7LGY5coMZiFfbUD0FzRwuahS76q77rdKpIng9PNkT48n+eT/+Lx4Mdj
         RRaFqsUz8NMfX6YVgtCZmF63b83pIsn1+k8sxDA2KtECdWDZ8z9GhahRVSIdIwbGkzsB
         medleUNeJbXVXJQJC1EuzTcpbJ2ju/lIx/xlyiXwZVJUATGc+HqbAZSmtxwYsB0JV12s
         Fmd3XdF+60AKPWiq6JHvbgOhNYgzmyyf8YEgiVjlFY78UtmgBukeFFUhSfgpDzYw42VB
         ljt5WJ4WVkn0rm0pIfr+K4P4puTrWx0qPVvHd02FEa2SnfbqFZpAWyIzOZs8TJDQWu4J
         ubsA==
X-Forwarded-Encrypted: i=1; AJvYcCV16T1H9l6vV1FEM/7y99CV4vvRew0nYRoqmodYiXOvvXqGXLSjBiGU1BSujLwf5h3F8Wm4hRbgXsu0lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQGX3uCP63TLa9L09lw2DsmyPFKol+NKYOrqv+LqC3yfAQzhe
	c6W9z5Y7+wFhvIwNu67g6b3Ek/R4rqvqmjLIvxThh9ce271fQUljz/qHQzLiW5RKnqg=
X-Gm-Gg: AZuq6aLxMLyPIjcMPNXOtzD5vE3aV0QvFh2/1d/5UZrYFVy6Ij05vOrlV+lHyKuR7QP
	iV9e2gsIkkWiBHGWMEaUmtyWu4LUvmBD1+2H7hzdA9Vfm0aAikWGh+QtkyE4GizOyOIo5FOP+Bw
	qyMdeA7WDVq0vls6m5Y+cPq1UYX8T5V9etsohu7OW0Fun8jJfFPzX7Q3M6xcLvuMJR1ouxwGoLc
	dzD8N8TWzzVblQxtdp1Cm72SxWS+wBM8jUbNQzhpgGQCUIw9D6wVQwpyRA/K0eCPpS/kvTaE0Wp
	Bj6qhZ7+LL5mA21o6EFyNIin2j39X6PVGI4/5G1E4Fu2EYvdXCeyqRqKQoqiry55iIIBS0H11cp
	mqRrXXtFOpjdH1JOjb0glRbnWouL99lT7+w70hehdAVPnARJ9JHJeDpPILBpqYdyUrrqCYO4xye
	Ywk/I1oAUJuFuWGUTgHA2saCHKx2XKDo20d97use+6pTyBQjboQtKJk5tvuUVE/dpN5DScXfSI/
	9jDTQ==
X-Received: by 2002:a05:651c:f06:b0:386:ec29:372f with SMTP id 38308e7fff4ca-386effdb4cemr3801691fa.2.1770727099335;
        Tue, 10 Feb 2026 04:38:19 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b62363e9sm33183741fa.1.2026.02.10.04.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 04:38:18 -0800 (PST)
Message-ID: <51da29cc-7881-4d45-9233-f7b1c4f6e14f@linaro.org>
Date: Tue, 10 Feb 2026 14:38:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/7] dt-bindings: media: qcom,sdm670-camss: Remove
 clock-lanes property
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260210020207.10246-1-mailingradian@gmail.com>
 <20260210020207.10246-2-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260210020207.10246-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52514-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 60BD411AE9B
X-Rspamd-Action: no action

On 2/10/26 04:02, Richard Acayan wrote:
> The clock-lanes property has no effect on the hardware configuration, as
> of 336136e197e2 ("media: dt-bindings: media: camss: Remove clock-lane
> property"). Remove the clock-lanes property.
> 
> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Remove this unauthrized tag from me.

I asked to remove CAMSS 'clock-lanes' property from .dtsi file, and this
displayed change very is different one.

> Link: https://lore.kernel.org/r/bbf0dcd9-d0f2-49a6-a2f2-6ec9376f2f59@linaro.org

Remove this given irrelevant link also.

> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

-- 
Best wishes,
Vladimir

