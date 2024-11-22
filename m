Return-Path: <linux-media+bounces-21839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D52799D5F46
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 13:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C1762821AF
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 12:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1477679FE;
	Fri, 22 Nov 2024 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="euAhNgAx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEED21DEFC8
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 12:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279861; cv=none; b=IcFVzDmZWwjca572yKcHaoz34YHA7aZKQeYpTBvbx6/4SQGLth/PKUWfMjuG+5M8tjrolhpFhPVQTI1RyjYrD+SOqkKZPt4PO0Li7QMYtqtCgGZpArrwLc1P/RA9t2uKgjW6HC/7YK1+Y4rnQA592O+n8w7aU19FdP9/oBBs+pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279861; c=relaxed/simple;
	bh=JBHOh4rUnLADzXtOwvC84g7/JrNLMPYtlQhDKTzIkJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGmyTGr5AyZRQwqsOBkzr7CzjWzCcYtzaTcwz6+QnDp635/jtqyBMUmpDN8NZ6oRIc0gOFsxv2bbEYVpV1G5ga9G3GURovJ6ESZo5lGKwJ7D11v86UwRm7HFVTS0q+uDnysTmV4wlFtJZImW0THhFyigl3jIlZ1TarQ4gz23HhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=euAhNgAx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38232c6311fso1433229f8f.3
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 04:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732279858; x=1732884658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KISqflzqP4C+qpQH2POLD8D91UlEquq5DIx6lhdqv9U=;
        b=euAhNgAxorUVFsIASQSjJa5dVhdxz+PiPyB5faPqRuOSn+aKWBG1XSpIl/VtWkKuwE
         Bdw8vLDl8bK7tPpnovrsliIbLi8LnW5uodLlL6Ul+gIPrxi20foUl4G/ZRXgxjxbtsD7
         7op1n9gMyGQZ6g90HwJtVnu6jY4nwcm8pwBCKDc+rjqtMWkiC2kydcTeujeEJaMfI1d3
         cE5/bvgkjCBEnpRWhLXxRvIaIpqb1xBpj2606A0HQ/fdtTyjBsgvLE7FSmoopUN4Ja+M
         VJiE3BjevBK1/LfB4qbqdh9scSHNJgwzqRnD3RJOQY1evJ8MzW/Vj2po8Kk+FK4enI4E
         SyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732279858; x=1732884658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KISqflzqP4C+qpQH2POLD8D91UlEquq5DIx6lhdqv9U=;
        b=bNcL9g9oxrbNC1ZRfmJfJxRqwQ4ssDNznTRZ/9OhJ/5x+RvS+qalPqm8Viws3DVh0f
         kVysbVIL6tQCeE8ZzqiWQJ5Nk5ZTWFSL4tg4fvn5HLqoApr2X7IugnMUkEmzTUGnk/Qw
         9oujNFulu107iZNwZMfdCtgdncpgcHv1/NYl7+uSoy0pb1YQQ1SDMPNRItmpwKQCNI7v
         1qwOphpClZLbSCM9apH2628YMnE3Bwz1Msu0xItR7gBaRzfBTQgTurY+BcLVfwEWXIH6
         oHNVIQ+sNui77r5JTcgZytkBgzeQsw5P6g5feJlALLQD4l8XK9VU9+h+FsBZM+h3EUiQ
         E/zA==
X-Forwarded-Encrypted: i=1; AJvYcCX020tcNt77Drv9FpF9vUhxeC9rGi8E32Sn4xYJzy/tttT/R6d2R60jigIqC8MUgNTJv/1Ww3oAXScO7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdl+qQ5eM2d0iLpls3eTHiHAWgXmNhtLXy75izz6p0sslInNJ+
	v2bGRI/RI4lGQ3Ep4AjhHwNPSyJlg9J7usq+/W3Ex+fM7OLLGry+foPo74RJ2M4=
X-Gm-Gg: ASbGncvO87CSdwF/FwJJbQQBnYjpM432lDcKvh8+K14dqKwXC2YvbaGMu17ioOmKiN3
	lAmL8ht4MlZFoKhHI9HoE1pZkMaEO3Lq5Z81Ve3jIyMzDx5DXJeumnbVSD0lolJ/VEWVok1TDh1
	SY6SfwJ0UgamZSnlXzNegLtTDHg9CLfAVxMcLTOag/YQC3xdVLTw5wR4tzp0sL4GReycR2wg3LQ
	5zwxbxXCVp3gGk0jhlLq3YvvJDmhu4dlKlCjJDPArotpBnz2IPH39KW0BwVaOw=
X-Google-Smtp-Source: AGHT+IH8paRTgv6TgTv/fMTI/UYofpz859HmfaEoTHqkrdKZAJ6nGDUeZc0w5K8HyhUYuBIakIZLDQ==
X-Received: by 2002:a05:6000:186b:b0:381:cffc:d40b with SMTP id ffacd0b85a97d-38260bcd023mr2225909f8f.39.1732279858025;
        Fri, 22 Nov 2024 04:50:58 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedf63sm2333104f8f.102.2024.11.22.04.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 04:50:57 -0800 (PST)
Message-ID: <2299ec8f-4b80-48ea-96ed-d1eb40998e55@linaro.org>
Date: Fri, 22 Nov 2024 12:50:56 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode on V4
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
 <20241122-switch_gdsc_mode-v1-2-365f097ecbb0@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241122-switch_gdsc_mode-v1-2-365f097ecbb0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2024 10:31, Renjiang Han wrote:
> -	if (IS_V6(core))
> +	if (IS_V6(core) || IS_V4(core))

sdm845 IS_V4()

The GDSCs for the clock OTOH are


static struct gdsc vcodec0_gdsc = {
         .gdscr = 0x874,
         .pd = {
                 .name = "vcodec0_gdsc",
         },
         .cxcs = (unsigned int []){ 0x890, 0x930 },
         .cxc_count = 2,
         .flags = HW_CTRL | POLL_CFG_GDSCR,
         .pwrsts = PWRSTS_OFF_ON,
};

static struct gdsc vcodec1_gdsc = {
         .gdscr = 0x8b4,
         .pd = {
                 .name = "vcodec1_gdsc",
         },
         .cxcs = (unsigned int []){ 0x8d0, 0x950 },
         .cxc_count = 2,
         .flags = HW_CTRL | POLL_CFG_GDSCR,
         .pwrsts = PWRSTS_OFF_ON,
};

I can't see how this series will work on 845.

---
bod

