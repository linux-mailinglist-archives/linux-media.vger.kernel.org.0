Return-Path: <linux-media+bounces-1161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF6B7FA769
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 18:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEE0E2815C1
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CF236AE9;
	Mon, 27 Nov 2023 17:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YKgN8udR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD929034
	for <linux-media@vger.kernel.org>; Mon, 27 Nov 2023 09:00:08 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-35b0b36716fso3787975ab.0
        for <linux-media@vger.kernel.org>; Mon, 27 Nov 2023 09:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701104407; x=1701709207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tKCN+Wf00+ELxyn14a5AA+VFdBSorCTvXlpC+FYzc7E=;
        b=YKgN8udRyuEbVyB7dPh6j4lJQzWBo/LQn2fSk5KVtr1nDP0LoGNjlcRnTicOUqUFBB
         tmN+Iw6WzeUSfBVANjjIv6eX+C6xIdEAoFIH1QUR2Sqqn+vdObpuA9lhfzkMNSHwkzr9
         l9BBLvr+K+z3iz/FdOwiZeoWvPj+YuP2yLM6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701104407; x=1701709207;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tKCN+Wf00+ELxyn14a5AA+VFdBSorCTvXlpC+FYzc7E=;
        b=T8bEciAeyLUFahb7lbbUOuf/Qo6WzAA2h7sHGTX4YCP1ZIkdctH1pKRwb2nXaxFd/E
         E/tMBoICbTQJ/hJHxXOGmW1GWp0SyQJbj4oeKN0IVbRCzTLcgIL6RNTKgmNBxUvEAgDH
         YOrLVaSGyji/7iE+tEzEOLk3MRKmaTCfQAVpXYUvbpyRlXp5Kel/TkKgfsHLMxvFQD4B
         V6F+FltmA9PV0cqnlFnu/qcgV7jE7jxKDfG2CBUPOpQVur7nJpNuTBdPZwocw85V33wB
         tEpYMol9S6Qc4gYtrkJSXqvxE5jn3JEj8pJQHDCZ2QRg3WxwVlvGP/pnvXOfSudx+EZk
         7N5g==
X-Gm-Message-State: AOJu0YwlIATPOmsqaLsvAXOnH9LFXtyi+xAUjZIpRGQ/j1YtszIh6hq9
	xSUAqXB4fhM8lmWkkHajbTkJOg==
X-Google-Smtp-Source: AGHT+IEgVIvuW6fPNcvSD/7qD/x0se9Ajddb7fAiQdaYCd034lTW0DvylFz7ZRhdEG5jqFwqODpHsA==
X-Received: by 2002:a5e:9512:0:b0:7b0:75a7:6606 with SMTP id r18-20020a5e9512000000b007b075a76606mr11826362ioj.0.1701104407163;
        Mon, 27 Nov 2023 09:00:07 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id h2-20020a056602130200b007a67dd75d32sm2516233iov.4.2023.11.27.09.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 09:00:06 -0800 (PST)
Message-ID: <dd6739ca-72b1-4eb6-9fd6-e18dc974de50@linuxfoundation.org>
Date: Mon, 27 Nov 2023 10:00:05 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/55] media: test-drivers: Stop abusing of
 min_buffers_needed field
Content-Language: en-US
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, hverkuil@xs4all.nl,
 mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
 matt.ranostay@konsulko.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
 <20231127165454.166373-3-benjamin.gaignard@collabora.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231127165454.166373-3-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/23 09:54, Benjamin Gaignard wrote:
> 'min_buffers_needed' is suppose to be used to indicate the number
> of buffers needed by DMA engine to start streaming.
> Obvious test-drivers don't use DMA engine and just want to specify
> the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
> That 'min_reqbufs_allocation' field purpose so use it.
> While at it rename function parameter.
> 

So how ate the test-drivers currently abusing this field
and how does this change benefit?

I don't have objections to this change, I want to understand
it a bit more. I would like to see more details on why this
change is needed.

thanks,
-- Shuah

