Return-Path: <linux-media+bounces-6571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C6F873686
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 13:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D969289A01
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 12:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD0F130E41;
	Wed,  6 Mar 2024 12:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3msKupl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C19130E29
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 12:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709728379; cv=none; b=E5ssFe8pbCbSsE6J90gRax11hoopltZGzuhzHUiQUg18n6VhKe+DBsM4EYuN4KP2cq+3chLRL8cjraQIbkSMk9y0A2In0wdsqsrZX48qpo3NSekmDlYBBXJ4TRGAcDp0hElBUmdBmp0TbK9kBLYAdxVK+rDElDmyoLDlR7VI3KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709728379; c=relaxed/simple;
	bh=8wvd3gt3M/oXf0kj888CTRPdhQLqnel9BUfji3e//qY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5s24ZxVRDkWXiEubAdW0GgToeSfECRxa5jmatwE8f27rLxgk76ePBQXBZesqcjns97NYyG+8gjF4ALEYiyRcQ/+MpfO2WHl1cmZTbJDeHeKADs7UOcAVmppnoIHB/VzCW0WIcgo5HoO5P6b1j05E276n1ZuHFULunWXPHuI8WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b3msKupl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-412ffd96107so680585e9.0
        for <linux-media@vger.kernel.org>; Wed, 06 Mar 2024 04:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709728376; x=1710333176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3P65RJ0ScisBLyG1I2ooEc4j5/yHla4aIpipvPFtxpw=;
        b=b3msKuplfiimQt57VzIso0Zet0BT3pj79PPsftWyS2E7vejPkWIA8kRH1hHxu0AZkW
         1yJ75Gj/R5bCgxlVbXzIfEBaML4+I86LpNwx9rCPXEKHOkj8rgh2ZSso8P8EuXbfUUnR
         i5lmGZFxjJfXj69nHZe0URn/vqebocBeHBj2HXJskcDS6wbBlwdlSwpkrhXZDxMJF20p
         HrN76eOtfo7JkkgErLOUvMHGVpkg1Rh/ReY8ohnNKMoM25NKUfX05TE7XqaV7MWdenup
         Rt+yBfN5+D1kictUecbDAoIqA3MQpaVKiOMcjq+tKFHRFKsRE+oEoaFzQXk/yc6MloYB
         crDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709728376; x=1710333176;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3P65RJ0ScisBLyG1I2ooEc4j5/yHla4aIpipvPFtxpw=;
        b=q2djcXwBwm97eU/DgmvkjbqPscy3Sye+ozWP6JDBipYPgYwlUzrSm1y/j6HUwzw5ml
         CoefpLChZzR2m6PqfshW5mdEPPu18F469Vn/rHAHUYXaUU1g0sR7SCwuW/zU9vIcR0iK
         FgvQ4iLZ95dX/kr5YYIJrqd0MBC+uDYmUMOLAKAf3qA4gQ2zART6pi7kJd2uhpzJI6BH
         o4ac9b5uwmmI9s0HroZ9IGwub9/Glf4RHmwUi+25oOhvI/gnR1dSPfVensmGMr1HhYyB
         qCMrHTD3InpG7VtT6tF8EMX5vacJ25MtiQVlBvM4flzMYbkmkX7Ir1CahpeTIo5kFzlH
         9k4g==
X-Forwarded-Encrypted: i=1; AJvYcCULbhJ7hbMHBkRfSW5Jat4amiUQwQwLYSIvwrAbWG7xdJc4/Nnrco4Lp8FQFXoj7KGxPIHPMwvyfQlpmhs0hWlbNzEqbc69bsm35u8=
X-Gm-Message-State: AOJu0Yz0K1g8rIREhn0vV3T/6NUmX5tzC6gujDR1x9pmmUwHz40G9mFI
	dgHprJL6ZyBAgYHK/p0+F/0qwG8/P4jNvPaLssDBEXLUxM7Yd+Yi7t51fy9NU00=
X-Google-Smtp-Source: AGHT+IERkLljOFqEG/0zM4LPhgeyclm7KvDT1K/I2YSz6yw0l4JvHTg8n1dNAx0KmP7Lx5Rt0FoGeg==
X-Received: by 2002:a05:600c:4f4d:b0:412:eb6e:1fdb with SMTP id m13-20020a05600c4f4d00b00412eb6e1fdbmr3309269wmq.40.1709728375902;
        Wed, 06 Mar 2024 04:32:55 -0800 (PST)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b00412f02bff2csm3466711wmq.37.2024.03.06.04.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 04:32:55 -0800 (PST)
Message-ID: <da824ab8-a9a6-4f07-a5c5-8cd38e01844b@linaro.org>
Date: Wed, 6 Mar 2024 12:32:54 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/20] media: venus: core: Drop cache properties in
 resource struct
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
 <20230911-topic-mars-v2-10-3dac84b88c4b@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-10-3dac84b88c4b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2024 21:09, Konrad Dybcio wrote:
> Currently VMEM/OCMEM/LLCC is disabled on all platforms.
> 
> Make it unconditional to save on space.
> 
> These caches will not be enabled until the Venus driver can reference
> them as chunks of SRAM (they're modelled as separate devices) to avoid
> hardcoding magic addresses and rougely accessing the hardware,
> bypassing the normal accessors.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Agreed, this is dead code.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


