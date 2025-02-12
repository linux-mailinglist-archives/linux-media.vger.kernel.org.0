Return-Path: <linux-media+bounces-26027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1836A31A6F
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 01:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A6943A57BE
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 00:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDFE95680;
	Wed, 12 Feb 2025 00:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WMoxpFTI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A95B65C
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 00:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739319842; cv=none; b=PySiGz8qwPp++4j5WXGt1Wljq1c0p7YgR2RGdptlXXy3PEo8jETrpdvTwzG0tDXlJt6qmApSLDFS7N8ZKLKuZn/UmtyV5m7H7I154dK73RfwBY64FPJb0r2b/OWgIMQMwwhuayQpt4cbsA8mKF4JFsRyTvrer0wKInqObI2Jm9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739319842; c=relaxed/simple;
	bh=MMNIfstKpT3Xv+vjrM+xLax3j160hMjGDMFsgx2aZZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKlwq7g9YpnkGSmyGUhDpujTZrqP5WaUvll8DLEeXYuIeDpNqOKbT3e4iOBDJyHfdB77uXA8MVytAzdh8O5yhsteUizRyrTiJoaF8twwgEcaAvvTZOxDRL5yDZH9bWz48JQ/HZhDuDwWvAK+ICEOFxdnNucmY62ZazOTOqvHlHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WMoxpFTI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38dcf8009f0so2295977f8f.2
        for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 16:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739319839; x=1739924639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pfGDmNVScHcIIXsQGynSfUjulJw6pyhwlJ38vLwzZWk=;
        b=WMoxpFTIr73AN2BB4dxNfqAYPuDXPgwIoKsUoQlE7yqaKEcwWyYWw6QSFK7DKwc3ub
         pnoa5I/kJUxdjrSj13jEfJrrE8eDbryizcfhPjsplswbje5dA4G+ShvRo2vf2tIz5DQq
         tMQRyE4iibPNhyQygG3cINM+ynyvrhSvvaKgkh9s7NHmyJyYDmKXQBMLcUjB+cgajm3X
         sLCO4J1mR2rmgC/bGWK9sxYTbtfI872QFEUbEC37096AeqCYe3Y5SNjvbjlymOmp+GGL
         IAebTvxfG7qppsOO9i/CmEbH5xvlld44vsJ6ai8lHoyRCBO/JO2y/7uGAeOtBt51GxvS
         ziMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739319839; x=1739924639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfGDmNVScHcIIXsQGynSfUjulJw6pyhwlJ38vLwzZWk=;
        b=Bb1/sYAHZq43R8JOWySs6r2sot+KS5rcJWGQ4oKC3Chl08D6PB3r7axHZ+vA6sEMTW
         l5KRvVvDT2/b0Kq+u5IZXf3A5oU5M/YG+UpLH+ZGsiWRWjW92ED9IIMJXfksLkeOH+lW
         Ne4KH+0BQb1K6MHQZjb7jAIVUa0mCp/fP99QMl0beQf+yMI/un5FNyWiPwozeas+lYnH
         bcWQ/aSem4YfPdQ/aA2c69QHFSzJWhGiG9HkdgETdHQMVcpJF5q6kirL/XqSJQvJ+nh1
         uCB/LOoF6BWFcvm9mzLmxtl0op+loBV08hVYpz65V1brjnRXmNzvBohwFhqBrww3BgKx
         JKXw==
X-Forwarded-Encrypted: i=1; AJvYcCXhKAjK1lxLXvKGa720Fz1cYZs+B93qDE8vT4oTUQk+iyc0hYkM8LIsam0rKGk0EIzS68GL8RiDlMaqoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YysU7zROq2wsWW+SdgrvrOX9RWbkbZRjmDHffOkeaCEI+9Wh9qD
	oihB50l0EySdh5FNpvFNVQuhWc2XP6GL3B7oegazLU5a5QoydNRO4TS8C/pDAss=
X-Gm-Gg: ASbGnctFQinicFoK8TmCQ3H8AcsmrK7NewxIAsbOnp1g/tDOfNLgZsuURqRJ6eWzVlp
	GFQmYWfeT0RAZFqb62oWMFnB6zZ6cl/hCz+qWRvmfWIoQUx5QetnqW/VwefKg7EaoQCVzznamhs
	hf1QQDasOt73P0t1syS8hDV3t+EYxt6M5RWG+nPVtg9qYGfT9ZZ6ZMEBCnxfc9DE1HLUAjpfEnl
	nSUSWTNfgrIHTQH0HUd1RO/1P3NbuaZ+qqHuzuCY0w0vq03tePx5fTwA5GP4x/tEIqooq3REoHg
	kQQQ4gHrL16VcPoEf5tBSgVjPwvGDPU679JKeKsaFTUHhC0afI2wKO1w6w==
X-Google-Smtp-Source: AGHT+IFu89sJVtv0ICMn6U0AgL7LBis+tuWkq5wW4VledUbDa+V9LIa1AQ9mV/LDKZLoabTxS2lvoA==
X-Received: by 2002:a5d:5f50:0:b0:38d:cbc2:29c3 with SMTP id ffacd0b85a97d-38dea28d03bmr739530f8f.33.1739319838684;
        Tue, 11 Feb 2025 16:23:58 -0800 (PST)
Received: from [192.168.0.156] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcf35b15bsm12517006f8f.64.2025.02.11.16.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 16:23:58 -0800 (PST)
Message-ID: <8d05999a-b623-4a3e-b611-3f917cb46b82@linaro.org>
Date: Wed, 12 Feb 2025 00:23:56 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Venus driver fixes to avoid possible OOB accesses
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250207-venus_oob_2-v4-0-522da0b68b22@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250207-venus_oob_2-v4-0-522da0b68b22@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2025 08:24, Vikash Garodia wrote:
> This series primarily adds check at relevant places in venus driver
> where there are possible OOB accesses due to unexpected payload from
> venus firmware. The patches describes the specific OOB possibility.
> 
> Please review and share your feedback.
> 
> Validated on sc7180(v4), rb5(v6) and db410c(v1).
> 
> Changes in v4:
> - fix an uninitialize variable(media ci)
> - Link to v3: https://lore.kernel.org/r/20250128-venus_oob_2-v3-0-0144ecee68d8@quicinc.com
> 
> Changes in v3:
> - update the packet parsing logic in hfi_parser. The utility parsing api
>    now returns the size of data parsed, accordingly the parser adjust the
>    remaining bytes, taking care of OOB scenario as well (Bryan)
> - Link to v2:
>    https://lore.kernel.org/r/20241128-venus_oob_2-v2-0-483ae0a464b8@quicinc.com
> 
> Changes in v2:
> - init_codec to always update with latest payload from firmware
>    (Dmitry/Bryan)
> - Rewrite the logic of packet parsing to consider payload size for
>    different packet type (Bryan)
> - Consider reading sfr data till available space (Dmitry)
> - Add reviewed-by tags
> - Link to v1:
>    https://lore.kernel.org/all/20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com/
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
> Vikash Garodia (4):
>        media: venus: hfi_parser: add check to avoid out of bound access
>        media: venus: hfi_parser: refactor hfi packet parsing logic
>        media: venus: hfi: add check to handle incorrect queue size
>        media: venus: hfi: add a check to handle OOB in sfr region
> 
>   drivers/media/platform/qcom/venus/hfi_parser.c | 96 +++++++++++++++++++-------
>   drivers/media/platform/qcom/venus/hfi_venus.c  | 15 +++-
>   2 files changed, 83 insertions(+), 28 deletions(-)
> ---
> base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
> change-id: 20241115-venus_oob_2-21708239176a
> 
> Best regards,

I think this series is ready for merge.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

