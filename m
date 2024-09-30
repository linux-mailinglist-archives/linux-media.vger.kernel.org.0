Return-Path: <linux-media+bounces-18779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CC1989E09
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 11:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 228241F236C0
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 09:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386ED18B46E;
	Mon, 30 Sep 2024 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y9kD6YMC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C192418A6A3
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 09:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727688189; cv=none; b=OTCZkI730foPKqSz4hneDWuo8+8fapzYDjxDfA/e60gzfVGkf9n8LIX+TN+KAVS4Q+g3SAevR27rZ9AVCqunrQ8J8V6G3CyFnqqUxIkLeUk7t1Cvu3pbImGnLbXLzrXIav51j3Ezk0kMci08WYwfgyG0K5quWoeQiwqZUpUUUmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727688189; c=relaxed/simple;
	bh=uqEiOLQf+09k0PDPr/f0mwknVrseMs6izw2Nm759oZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=avhv4YJuZH7IhcKYPc8bqFU26ndLOToDVLDUPx9HIAugsuc3uNlL80Oi70MMGrGXu0Y89jegmi/OwiWG2gdzz02yDAHEv5F+NJChHJFMH0Dp2g5j7qYBDL6R1Lz0Y3bI7VLkhh+fjyfd8PQuk+DmZNyr/KaT7m7wxYbFBV5VNbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y9kD6YMC; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5389e536198so453010e87.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 02:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727688186; x=1728292986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ltQXeep9oOQ6pKlzxhqMlffD/6AO/c7iqrOiK81Hlg=;
        b=Y9kD6YMCLrUVlPusj4aVg60B89ndtBRKliSUKEWTxrNDuPGg6zxclBt7NruT9swREb
         NYwMztBTccKhSL8eNPI52OzTBZ/aGtxAP3PcoIGKM/IsY9+NIx3MlFzRcKlmz1Wos0sA
         +51wNT89MnYkpKwgzWH6uIprD0VQ9keQ4t/LR0ihmiqRQsfR3Qhu5KmEVLNT3Lgx8duC
         Vpf2WpTtdNWRF33AKKST0zS0i2flXCnI/+/QAKwOL2qd0+LNGbPFcIT/B72jCBQPoPnY
         l7MtYgTRTCw24VjRv9l7S5wM8+67pZ8MnDBPLz58Rc1gviGiIayHP9w1dy+SSSTOyiQz
         1How==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727688186; x=1728292986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ltQXeep9oOQ6pKlzxhqMlffD/6AO/c7iqrOiK81Hlg=;
        b=NSRiOVpSmziyszUEZchxebTJTeiIRX6rrlEI/a1e59xq0LulsjXTKbADDKrAfNwrzF
         KFyDptk/ucD7BtUz8cHALO4J7Ag8InjxrENgrTcDb4WnpI7iGb41N08AG0MM1/2NrkZ2
         jzbCQ0mvPhDE0/+w0QRo5+UJHVvHg9PMSb/62dFxaWJKsmmXVkyAdgK+p5i30gf7IUWi
         Y/eF8xsBVBBCz92/l6cZspK/bOiOaE9Zdzl483Potqc7IV2W6z8JF0ExPSMpo/0245Wr
         Pa4/qZots7ykODrugkMShHuRTgTizuG7xF717tJNhEmIP564ldNVC7poe+5uws61isp/
         Gp2A==
X-Forwarded-Encrypted: i=1; AJvYcCXv8stOI0lUsc0RsAfEzGrh7TMbQTPyLzq2D2pg2GeOZkYRGO3wN5FMxRRibBTHADxqfQJkuHn3bqohBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh2k+1qWobahKMp9EkJFFluiljxozeWOPBVJ7Eu41oVNywDanA
	TdEoMU496WngvIIrJz1Ax5c8w/NmvyQfx8mC751QgvirrE+ZFIvwW46EJMKMuoU=
X-Google-Smtp-Source: AGHT+IE3+ypVYjUVsYiHlugoMY0nBT/CElPSzYpL7ESBRrsMF4wUgGAelWlIYyIpEd1EJdtkH3K3Ig==
X-Received: by 2002:a05:6512:1188:b0:52e:ccf4:c5e2 with SMTP id 2adb3069b0e04-5398c31100dmr870735e87.8.1727688185764;
        Mon, 30 Sep 2024 02:23:05 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd54e80sm1186432e87.43.2024.09.30.02.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 02:23:04 -0700 (PDT)
Message-ID: <83b46dcc-c69e-430b-946e-ce9d299a27c8@linaro.org>
Date: Mon, 30 Sep 2024 12:23:02 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] media: qcom: camss: Add CSID Gen3 support for
 sm8550
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-13-quic_depengs@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240812144131.369378-13-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Depeng.

On 8/12/24 17:41, Depeng Shao wrote:
> The CSID in sm8550 is gen3, it has new register offset and new
> functionality. The buf done irq,register update and reset are
> moved to CSID gen3.
> 
> The sm8550 also has a new block is named as CSID top, CSID can
> connect to VFE or SFE(Sensor Front End), the connection is controlled
> by CSID top.
> 
> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>

<snip>

> @@ -1049,7 +1050,10 @@ static int csid_set_test_pattern(struct csid_device *csid, s32 value)
>   
>   	tg->enabled = !!value;
>   
> -	return csid->res->hw_ops->configure_testgen_pattern(csid, value);
> +	if (hw_ops->configure_testgen_pattern)
> +		return -EOPNOTSUPP;
> +	else
> +		return hw_ops->configure_testgen_pattern(csid, value);
>   }
>   
>   /*

Here you accedentally break the TPG on all platforms and introduce a NULL
pointer dereference, please fix it.

Any generic/non-sm8550 support related changes like the part of this
one shall be split into a stand-alone generic change aside of the added
SM8550 platform support, it will simplify patch reviews and hunting bugs
like the one above.

--
Best wishes,
Vladimir

