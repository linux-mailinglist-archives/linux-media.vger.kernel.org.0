Return-Path: <linux-media+bounces-5141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 055228549C9
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 13:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37C3D1C237A6
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 12:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA795381A;
	Wed, 14 Feb 2024 12:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gGSZ4C4C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DC452F7C
	for <linux-media@vger.kernel.org>; Wed, 14 Feb 2024 12:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707915395; cv=none; b=Y/HXb2bI2L8RJx/2gmEZseP+lPNqR/2bQuNHHmOButpfEgq54BL/flK6zsBMDyEUXrP75IWFvxR5S5lNZ8ndsD4QtWAPK06AUbUOApUfURc1C0KbdHnMXdnTWttadweKskkuFFicM3JntibPacDOI6ztxj3HMZZu4/ooVfTd7F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707915395; c=relaxed/simple;
	bh=Sa+1BolWChYiZB2NgR3V5OISkN3sIY1zdycmekza9Dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=doJQVkZcDssdSmH2SGWoMuMAKY9Z5S1SE/+DS+795ONSigfjYYOVWbXzs7EwGli5PKUi4ZaDNsztLq1rPxJEODZouXTzGo/UdVWvZJEzIZy7AjjNcFrZmM96cT0B+ROSOYgXMk4WZHcltiOYAIT9bxDdG3mXKE07PIvqq2WYHgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gGSZ4C4C; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-411ee70f688so3123515e9.3
        for <linux-media@vger.kernel.org>; Wed, 14 Feb 2024 04:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707915391; x=1708520191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0CVEfoeXX7i2NsSM9t4AdPWCDJc7K0DfQ2BA7RsZvK8=;
        b=gGSZ4C4CvCYLKvf3/DVknXF7hcOz3/YnVpKpnkDV38+eSlJMlWf3Tsv2cuSJ5ZsdvV
         9mJQXltIyRcDx+JzcBhL86DFf1Oj29R4baDLPtCWUldzCMXy0+KPOmtDE/mnqKHsNZtJ
         9lRUUDOUyscuPTKqXmGcP+dgLjnGGL/nq8avSTcx35hiJPlCKDoc5Y6v+K4UrOCKTJss
         jV2SExkCmCR4b+lSdbhkqZZImmCAbPcOl/siSB8JI5+Ho/FS9KmmmyHD83Zyw6iQWRTe
         ebMfbJsicK4/BOjGrOXB9bndWY07xLKKrCbVxsF0NaQvVqytCdjKXa5hpNasGfdrlTar
         eUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707915391; x=1708520191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0CVEfoeXX7i2NsSM9t4AdPWCDJc7K0DfQ2BA7RsZvK8=;
        b=YoRvDd+sTpY5wJUb5VKyeXJkNmitgZdWZ8LTf0a5NKFWjatBw3AwxBRsRwbh1xc93a
         /PZNgYxYCkV7SX8a/11wFhnQaxtYSd2sDjbI1gODb48hTLhHQ1BPUKoRp8nCLvuWa7Ir
         sivhyojbioWQiV51hjPxNbK2K6hkfhVFddKHaA61dECERVIpZtr+JpSiSBXVX7dOGhs7
         2mU66q2xYpupbv9t8mhik2x+1wESgh2dLiTqk9fgwYFNevZj2XAIOALAqfO1/YWmuGlb
         vypsY9lCE//fIVdIUFafIzAsVv0Ohlegi+kq+MuXOMak9rqo58aH3Mx4nRjZeGJmq/ef
         d1Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUbpF3VMS1eQBzOEaqCPvsHYmHqlRwBXtraQYPnoQ04nFleqDNR6q+H4VFCDqWZdG0rmp/e0B0UeX/W1y+dx/lsR17A8c+eVyqGK3I=
X-Gm-Message-State: AOJu0YyYxlGQAR3A8OV6xE8bh5wN88tW5hlvnBKjbi9BQOf7z7YCjrT1
	98vFtnJE8ngza/77u5WhVe6OzrqlKODmx/kzlhfHjapDwhO9dgymO1gDQ7Xbcrg=
X-Google-Smtp-Source: AGHT+IFVfyk3IYiL2cRlnX2EJ3RxS7YdOGPnx5x8KGnLQ4fcHD6UiYs8VGR1b8IpJGlUasIrJb5/lg==
X-Received: by 2002:a5d:67cf:0:b0:33b:48ee:8a35 with SMTP id n15-20020a5d67cf000000b0033b48ee8a35mr1592835wrw.3.1707915391609;
        Wed, 14 Feb 2024 04:56:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhaAFj95gzjw6GIy3yd6sgKrJFZvsXJq7O0a9v7Ng5Hl2RD8aD0joMjbQNBx8ikZX+cGAgaDjo3Bmt6Lo+jbiG+yXdsSF/xdztgL9WCvJa/o86Rmq2Me4qGljVQgxUaNbnl9TvC0GruhA3+ZSrMqbXU4fms/WSxBTMmWS95kclBmRfa/HPa/ymqaSc2qRKB0kyq5Vt2S0v2Cs/wxSdpfJvC0ROG08D5G5NKs3+viuKdsWGuQr5OeYv+ZneWFr3FU99ogezmwj3/Z31JIItL4+jguHcc3ThzuyrQFIHoA+VXfyD/RXGhhqez14473Tptk5P+w2xZfZQLosw8jYSIr3BTtJjsTH48H4mJeq/ckXoiFGodholkg7BJCJT2N0bA+oHkMtFenpb2jq/s8l1XQ3qGbVePdUBIRBuKVws0WdYOYzpgsYzYXeilEIlLYUW6QTlUKCXpHqU+/IlxNPeJNtBnkZuOwjtpgkCDRQ=
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id bp9-20020a5d5a89000000b0033b4796641asm12557887wrb.22.2024.02.14.04.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 04:56:31 -0800 (PST)
Message-ID: <c12ce98f-d5af-4c54-a453-2416b85b4a5d@linaro.org>
Date: Wed, 14 Feb 2024 12:56:30 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/20] Venus cleanups
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2024 21:09, Konrad Dybcio wrote:
> Definitely needs testing on:
> 
> - SDM845 with old bindings
> - SDM845 with new bindings or 7180

I can do 8916 for you but, I think we have these boards available 
remotely on qc.lab.

Could you test those boards out remotely yourself ?

---
bod

