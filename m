Return-Path: <linux-media+bounces-6570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 140B087365A
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 13:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46A711C23956
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 12:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0918005E;
	Wed,  6 Mar 2024 12:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AbVnHnTb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D8880026
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709728184; cv=none; b=OaS34sFis3zNb6TE34N1p8FIFjAY4iRRbH2c+aIBjxQZgaPo83eH6hRXxVlgExEExTpObgLdXjgm9TP1n66146vPXmdpwtGhHMjHq9riUmJUHWfZiBu2r6daXW/6C+8cBGLmyBI2A2PLtno91TEXZxWnHPobUefcsSclhphBW6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709728184; c=relaxed/simple;
	bh=ObV6wJD1dGgKfM/SEje+rpocSBnWnBjqtC7LP1pKvA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u/rVijJofgvIUtcgJW+Xz6b7SnqsIS39tpcJ2GbO0CkED4lhXXVRivxDBikTOpB07lZA0bOx8w9BwyM+Ho/3qJfNIf4v8t3m7g1gFSp3uq0tnrrC/yUEjoi8aBphoCxctSbxvXeVX8KCeiSrpGFQjHteUpvJ4Xrqqu0DKD5mGzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AbVnHnTb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33e162b1b71so1518945f8f.1
        for <linux-media@vger.kernel.org>; Wed, 06 Mar 2024 04:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709728181; x=1710332981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1WArnjLr/e7a7LyRrU5MGJmZcAQ87pJ72IgQ8oXzK1E=;
        b=AbVnHnTbD3uI9KsmUiL8paCc6W3k6B7rjOy9UYooYpI6qfRDEuJF9IokCGHiGL7X8O
         Dj5dnX8M/o2wukcpC5kvwYzR/dh67mko/x1Ty+PhNhlyv147FVHM7Jehq9uoxnjuKTjz
         /Kt0FIttmVKOJMpIfn4jUOd8jPO75XBMxN5pEz1erVtxw3nNMEo8z9Te9VQBOR9F0cXQ
         kfHmr5tYcjsjrbyBF7DfMWpVp9U0Rrk6yGMNKulN4TS9El+5KHp/0S7oaureBknvS9UV
         kmdUEQPGv+8b54eL5yd4VhpLgeEDdzZ+YRToJ+ybq5Ql2MsZiQ2Iy7cYknnTc0NzyNXd
         f9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709728181; x=1710332981;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1WArnjLr/e7a7LyRrU5MGJmZcAQ87pJ72IgQ8oXzK1E=;
        b=Bv7GXHXUZ2xRxlyuqHgJk+smIF4hMEEeCpN1s+tPWbnRthZE+qn6dafn4uh/ksG/ed
         2ERytASHugY1LzWkNTTlS09O5dUEpOCnoEO0UH6w0hXPRlhlSB6hcJNvuJbasiM7UC7p
         yTaqjwn/cmq/96cgaEhxe6elyYgZQvue8EF9xoC5LVBurfRcatL2KhYq1JLqkkOHq/mG
         auO2+FXrcLjwaXY567aWmkh70zoIwP0/fvlsqRopBAzusMekAWaQNGXkS6vyw+KFfCaJ
         u5pWAZRgqcfmv71cTcOWA3JpSMEbyeFVZRddU8gzID+vLjX6vgc6Ja1a1aEkexnaocgH
         AP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZ3xNuKosh7XWkkbmHFQYTNfZeFPOUtEdNl4WFACo6RJhd7p6kH9XWVnICWqE4E8u/zPWZDeNTY+ubB+Ij8EdX+eLLv9O5VG0mzow=
X-Gm-Message-State: AOJu0YzmEU4tCeyBRFD4y1NPrqx0txG8LP61z3nd4ttvWrmL8xQVM8DM
	zQZvVoqK6cDFeeD/zvBjpYrSspnjg5pAzmqC1rd468UQr8aQQC7uQQJc9vKfTJ8=
X-Google-Smtp-Source: AGHT+IHGdd1EPcqo84bI26AwHBzuTmTNGE0sealqhVdj3w5L0TRy0WhbbcD1LSh1so/dlV5uuizfVw==
X-Received: by 2002:adf:e641:0:b0:33e:469c:8afa with SMTP id b1-20020adfe641000000b0033e469c8afamr4385548wrn.22.1709728181164;
        Wed, 06 Mar 2024 04:29:41 -0800 (PST)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id bn20-20020a056000061400b0033e43756d11sm6811932wrb.85.2024.03.06.04.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 04:29:40 -0800 (PST)
Message-ID: <4034004c-a017-4384-9086-6e0d6c154b9b@linaro.org>
Date: Wed, 6 Mar 2024 12:29:40 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/20] media: venus: core: Get rid of vcodec_num
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
 <20230911-topic-mars-v2-9-3dac84b88c4b@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-9-3dac84b88c4b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2024 21:09, Konrad Dybcio wrote:
> That field was only introduced to differentiate between the legacy and
> non-legacy SDM845 binding. Get rid of it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


