Return-Path: <linux-media+bounces-20583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9CD9B6140
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 12:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45A871F23894
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 11:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836BC1E766D;
	Wed, 30 Oct 2024 11:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HTEIxt0r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE97E1E3DD8
	for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287062; cv=none; b=IhclbQVdhuDeSflttUzH22jgOh1PminOrS9KPy7mz95E3eArjFSZHS3+hTbbBdr1rA6VzI1V65hFhE++DcuqtmJHkTvhoCAXoeQt0W1dKL9LWNOgKqrqYT8l2kfMZcNMcqokEKUy039v/3gGPzrp0crFPrhGKVOTmx9dvJvo2UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287062; c=relaxed/simple;
	bh=0+ANpT2OwyxJuotxxojjjQEkhl3iqGOnYjPNdkQvZcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1daY3rmWC4eCAeD41mQHAanURNHWbemQw5ZHtbrb8ZBjcca7PtVWyk8e6KiZa/iLScrpRFdNU09PStF90q6hjIcQeKqZkBd/GCapkc/6mptPjQ6A46aAG8at1oKXw1JwRIUFcGwxZWs+MbOl/PTVNlihp42WEWER+/RlZM4+Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HTEIxt0r; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e151d73fso867164e87.1
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 04:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730287059; x=1730891859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=356ISyJwQrslqNkIAE5HnlpLPQYYjpzgyFzJpPVwQPo=;
        b=HTEIxt0r9BXBs5d/AUM6yTcC/3Im3SZEnrBDMg2oCOeMdotCzLZQWpeC+WE2qGcspH
         yadIowxjNkPX6hoffaivkBECYNsMn10UiSzxsyvZFi4lNAMFP5bA4Kc2VddZKcDauv9b
         yxBhRdvPh4CzVfH9CMbEdIZa+/bG9GTiiRfPZYZp13v5MW7kim2lNpulsgYz5cvVIbiE
         TQhRCbzFTrEfJosECQkyDeXS6UR3EE0wUi7yvVKQ2qOBJI++OtOGtREG31Lz1RrsPZXW
         UqMcds5o+VqY5jIX1ZzR5TgzXUExkpVYcMLwMfYOkk+nO1dAAwYHFftrNdn9SD5hWNLT
         4rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730287059; x=1730891859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=356ISyJwQrslqNkIAE5HnlpLPQYYjpzgyFzJpPVwQPo=;
        b=qUPFiSgmb28yp4lwq4d28oB5m8dDxUJN3bai7OpGSFsXUjQJT95kcW2nCZSM3kWs2+
         TaiVk8D1g3xBvjSniC2sLIX5h4tS0/qnrTrDreuv+1z5VOIpe32tPvYakwc+uLLDgjNy
         YEZphqVB8MpO+Qjt/A64hsajKao8HGGVQrjysaarVCvhkyWshLdHSgQZifZyz+gisSkW
         mluPj3jsZP5np4KBJ5M0PR0CYofgmA5BlzMYUy07b+63jnmrSRe0du+pXCDEiQvK9n7+
         Wki+coaGwycY4gv4tKMJB6mmhQJ1PwTYX5xyIBdSaES02mv0DNeg89u7wH9X03zBIWvq
         vKPg==
X-Forwarded-Encrypted: i=1; AJvYcCWjhFna+Vk9wnb5IMqu4iJ50eFfvJmCNe0gWThCLKAlC2/rIPoLdYPZ54xoykDH0eusfUhum0fI0e8Mdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJg8d9CLHEGRWT1LGil4pdBjDDNf9jnbnIAoaxlodM8opn4U2F
	kzoSd3+3Dbyb5a6VtHJ9/5C0ZZgLK44E5k9fwKjipJGX6jaOFz3yGIFMh4s+728=
X-Google-Smtp-Source: AGHT+IGnM+oSnQStBfWKHreFs9i4FFNZc119m+7yiPhy6glNaO5Ho0YNgrbESTHVYDwlQmgkL1c1/w==
X-Received: by 2002:a05:6512:2255:b0:53b:1369:fcf6 with SMTP id 2adb3069b0e04-53b348b955dmr2386293e87.1.1730287058996;
        Wed, 30 Oct 2024 04:17:38 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bb819070bsm223221e87.5.2024.10.30.04.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 04:17:38 -0700 (PDT)
Message-ID: <78f6bfc4-69f6-4a1f-a47d-6347910dfb46@linaro.org>
Date: Wed, 30 Oct 2024 13:17:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] media: qcom: camss: Restructure
 camss_link_entities
Content-Language: en-US
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
 <20241030105347.2117034-5-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241030105347.2117034-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/24 12:53, Vikram Sharma wrote:
> Refactor the camss_link_entities function by breaking it down into
> three distinct functions. Each function will handle the linking of
> a specific entity separately, enhancing readability.

I kindly ask to exclude this change from the series, it is unrelated to
the support of a new platform in CAMSS driver.

Please send it separately and rebased on the current state of CAMSS
source code.

> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 159 ++++++++++++++--------
>   1 file changed, 105 insertions(+), 54 deletions(-)

--
Best wishes,
Vladimir

