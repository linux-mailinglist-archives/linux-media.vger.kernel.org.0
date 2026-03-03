Return-Path: <linux-media+bounces-54287-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDjlG9+vpmn9SgAAu9opvQ
	(envelope-from <linux-media+bounces-54287-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:54:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA4C1EC238
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C121E3028E8D
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 09:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50FE38D00F;
	Tue,  3 Mar 2026 09:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zCqrT36t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF3B38D01F
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531671; cv=none; b=jm20QQW5JalF65tJSQdZTMKQShs8r6dL5990PHgoqncPvSdGKU+mJ2OdK141oV/hz6iz3vGmucdwm7eLim2Bv+jGLcC2Ut8eKx5e/MYzWOLWrE/QKbr+LpNvtUQ/s4MHNEe+ZKfJxJNlPuG8O+FuVEzdVEf+IZFdYawjvFOfJhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531671; c=relaxed/simple;
	bh=leDnw+mECy7vi94Aqd8LcK/T7CGiXLcANMo2LYyAIEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u8jO5XGaOZBb7sTyuWJzsRVCLT6YeKyrsdhJcm7B6WTIxSvZpP67GDF6/NPK7vN1PQOzolKfH9eceSWXQ+T8lcf9QNbNEasNfgjd9EskzZ6eI4J1Ss50KW+XfGp8vu6+TPsVS6LnDYq0AH2+5sHFob1Rttgr/Q3lSBYU/tigKvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zCqrT36t; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65fb991d7eeso7465566a12.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 01:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531668; x=1773136468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=27oC09m77hNLsnkhv1Pbx9jiMQy5tTJyTeXXhi6YTpc=;
        b=zCqrT36tL/fjCY1BXYwzIAAWClzk9SDYJGcYC9fV5tewRQcbIsYpqlLE52NQCYE6xL
         qhEvd4+pXYkNT/ByToBfa7tLq0L9asCuCuApovXMmxvBXijenTBmoaQ8E04kDrrJf7qp
         efxtVUdnj2D3rfcpDzZANVdo4frl3jhoBYAbYSgsHAn3uQuiDgXU6u+TdXr2s4bwx4zx
         Re/p/WUO2xWzxUmpAaUZASGFFzVccTZAEDOvPg9lzQcJB3iKS5kF8yjkuE4PgJ/tEkvq
         U6zRtRhrBTRQWajb+iKGf46tIyk7eiLCiat3ozTZbOGuMj1zx2jwoGZMe2JXnQhakrls
         No2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531668; x=1773136468;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27oC09m77hNLsnkhv1Pbx9jiMQy5tTJyTeXXhi6YTpc=;
        b=V6TRKCdVfIUAvOtqY6MnU8dPreaRP+e0hNVFNmynEfw+0yosdtNPMVlnfvrgtbE0xs
         CrCVCR94x2YgFJrdQlH3MTwnaRvxm99VzLf3gWaf1m9r4zbX/97eEjWuvg5WG5CmsXKS
         Q1/Pli2nCDogs9Sj/me3x5Ab0Kpz2Aev0chIyZuiKOf8Yu0viopZPrjOFYZq1tiOfvSW
         YPBlV7U29mL2JrCvzzaukyoCjYmW211Bc5+L6yKtrTxP8UY/8F5O97pMh/3WMzWHuset
         UdWOXzlZ2u7l7keyEFwHUaLvhYYsl0Lc6foodUoEix0GXoBpEaPn/57REJz7CU9dQ3av
         4TUg==
X-Forwarded-Encrypted: i=1; AJvYcCX6JOfmhsATm8qs5dZm4M7oeMWJsMufMfi1hUgy+3QSka2oN7N0EQi0PFDWMxHB29wmfp4XnREOzGvBaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIIm6bzHEKMIum93IPXz2abOHxpfo8kSJgbFhJ4nQbLolxMMk7
	Mii6l4BgCiiigiFe8TgleB5lwHnseYTMIsSU6vDofssJRyVpKg+77aqCP/0uPed1IRc=
X-Gm-Gg: ATEYQzwczsCbPl2N7z6ndPMqGATJVh4Dcko7YltL4S5so+zAQSkjsCW8kQ0mBsdiVaQ
	LeSr5VfrNjdUJVQH1+Ac5Ns5amp+ukOxuHvNHbE0vB+aSnU0BCzA+g1aO2RTTALrKNC81FUycc/
	Y1ZzrnlNoP+KV7+HbqK+r53VgLevCDxVqPp/YKkHRcRrfZ1a8gtxf2Voq/fDxfAepzl6QQpq2Ok
	LBsGCJwiaM/T81a1DMDCp/eVX1G51zQMKG5OiOdscTfweXdgGxxG2B1AUKrzcxygqyrtI4i4q08
	Og0UbojF9loZdbPqjoBWJZNXGftZnXgHXEBrTTnp48CNQ+2GibwTrpp6JckCTJpyV1yHWjNwN2s
	pP+8LyitgDDiKQWWixz3ZgHltiPpSy7QMOlcY6KrcRF7VR4v9eFN5B5r/KYUNOxqAi6QE4EF8cH
	ynkM6LhTl1H3E0ibKjKhOp+yGO0IiB97jz6Dx28gSoWpIxqr2Owgt1Sgmo2+jwZQhd
X-Received: by 2002:a17:906:9fc8:b0:b88:4c99:bc0e with SMTP id a640c23a62f3a-b93763d2329mr1003398866b.26.1772531668056;
        Tue, 03 Mar 2026 01:54:28 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae94441sm570860966b.50.2026.03.03.01.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:54:27 -0800 (PST)
Message-ID: <200485c3-6f6b-4c92-a631-b5fcf3dfe1b8@linaro.org>
Date: Tue, 3 Mar 2026 09:54:25 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 4/9] media: qcom: camss: Initialize lanes after
 lane configuration is available
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
 <20260301-qcom-cphy-v4-4-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-4-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5EA4C1EC238
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54287-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Action: no action

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
>   Move the lane initialization to a later stage where the
> configuration structures are available.

You should specify which later phase in the commit log @ next rev.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

