Return-Path: <linux-media+bounces-34785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A38BAD9219
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 17:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32D581E681F
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 15:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B021FECBA;
	Fri, 13 Jun 2025 15:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eVSUBYiu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD002E11B6
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 15:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830098; cv=none; b=Eq65Jm19pssIVGFf1b6t4KDqOWk13DInqBAK9cO8JUtiJnc6vOCEVjnyINOytE6uUTOMJyZrGmXKVwbwRxYZQ2ePUq49ANlfUM5qJxxlJFH+JwTGZTtP0FiohBDBMZqaT4AnNBP4I0Xd+FG7qddNCGNE2EgWkKBLoB6hVh/+/4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830098; c=relaxed/simple;
	bh=LlVD9KrH3xGpv6ug3UfE4cxBBYTg4D6iYOLrCNyIWDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VYV8tyCuVcX2tuXMS3E0GGIYsD9OY7zLAyqlOWPDOuggEDgtvECzNXWZNwcS6vVu5ZYMpXmnSTE5b8rxtpoVJYu/eeDJ6TxijooF8FjSRezTtQZVd4xoQ7kn4DQERxI7krtQe4cwEKWRmwlUoCObGNj28fyikgcI/2bd5gQhC4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eVSUBYiu; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553b3953a89so32379e87.1
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 08:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749830095; x=1750434895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N970D+3TWVdFNN6dsaEAVQw86o2ZV5k5a3iFxFajZPo=;
        b=eVSUBYiuTcL8NsJLoJj1FudgvlFkrGBdSE2WpkkrdxotFq5GGISArKJLUaDfaZBhul
         F+Vl2OygSTaAst93eMp+y3wyJ6lsBtGvH8o+wYzh1NRe/a5pq5RU2azfNZJyw4KVDPMt
         r1iM5i2nSxFlZ/PnG2BKVFqu4LCZVCRBoSS5LF6CWnvoCE4Dl76eWAuCbxWEm6Rese3b
         CD/+0iq3r4OruaMJKv+7LOydOWnExnMmJD5jUmbVRM6QtT6lP9l5iWjbECgc2tC3s8Yz
         ML6qqTzdbacs+GtaEKuG1uCmKTAHDWG1ys75js8WKSJo9bnDOq8b69QAl8QUeQXicyVM
         RkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749830095; x=1750434895;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N970D+3TWVdFNN6dsaEAVQw86o2ZV5k5a3iFxFajZPo=;
        b=TGw933MzVP/Z2nf1dKJ2usFBl+V9KB99tZYRITYheOZI0w9J78YdtTxU+w8QRU5klz
         3a99cQyOsfELAPQUwrE1l3p8GYTwRPivTKmaNuRAn5IxeRMFPYCuYyPhn2MeuDG9wU4f
         6QXT4c0n6FbHltzPvLw0wfB4ob4hKiEoec34s1v4zUVhaZKcKHpbkiQNv3DXI7suvrdC
         tTDjQR2PAY+7s3r7+ePFGjKsgrYtBB5XrQD6sYdcyRsKerWTquC9HHc5ri4mdhJN1ejz
         nR9TUmD7oRGh2IeWOsjWEk/0x2K04olL6IB0JxA42pf8UvBJKj4727oBqarc1kR/SP1k
         vNwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMJSFnjbscCMdw41PmMA8ntYFpHXbrbxATsEUBGWTbw92IrUedN134+JvWi7cdWy0PD4JBhpLxeeA5Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzhKNsNsSZX2Ys68WC4FeE0ZSiwooRAVxEDhT2O9ii4zqiC2gS
	kg7kZpQllZ+c9iOkcnJBCs1qxoI5oLwwFdN8Wwy86yjWA+hOGlYXhJ8ATboucIqYJOk=
X-Gm-Gg: ASbGnctB36Q3DEa6ZnsIqGPam3z5U3MV4t3qDfzCqF6Fa6366l6PHtsm3kcXVUgWtrZ
	4y5Kr7m+SOq7sUUx6NZqGpH8DWAcVd3YOoRt4z0tER5Lwfld3QjytGtRw0vkvNjdIvo4s92s0/6
	+gMvTLuwKiwXQ2H5wrEfW6CG8Y+9wgZG8whYUfQkawVHGo/TmhnxEuQijWNaIYSou67Py805UUv
	lmpOSxbJC8rlfZahK6ZgB9mT5gQTz0bLMaAQ1fXo0A1sQQKpRG8lMhmG5OOkuR5ISI44SbQC4kD
	6HHXHvJ5w/+8Dhgr0Qu1yJ0dT75ZzuIp2KmirAuO9SqcIkWWyU7O3nrzRhqZ9tGIvGywNi1LtaT
	Y1zpIk2ExinC1BpLQpsWM4UXkvTAukDQW0P9y1DrX
X-Google-Smtp-Source: AGHT+IGgSAzTvcHYxv6mwQqkfGzUItooKxtagJreytvxb+kfOanDqHK73QctYtSBcRHOnp032MnZ8Q==
X-Received: by 2002:a05:6512:108d:b0:553:35e6:af10 with SMTP id 2adb3069b0e04-553af95cb08mr320535e87.7.1749830094777;
        Fri, 13 Jun 2025 08:54:54 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1aadd4sm485930e87.105.2025.06.13.08.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 08:54:54 -0700 (PDT)
Message-ID: <a89091f8-756b-49c2-b608-670119af1b50@linaro.org>
Date: Fri, 13 Jun 2025 18:54:53 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Power pipeline only when streaming
Content-Language: ru-RU
To: Richard Acayan <mailingradian@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250526232837.686822-3-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250526232837.686822-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/25 02:28, Richard Acayan wrote:
> The libcamera plugin for Pipewire may keep an open file descriptor to
> the video device, even while streaming. This simplifies its operation,
> as it only needs to keep track of a number instead of a file path. When
> the video device is open but not streaming, the pipeline can be powered
> off. Move the pipeline power management to the prepare_streaming and
> unprepare_streaming functions.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

