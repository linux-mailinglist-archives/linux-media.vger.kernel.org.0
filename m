Return-Path: <linux-media+bounces-2648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E06818766
	for <lists+linux-media@lfdr.de>; Tue, 19 Dec 2023 13:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFC4B1F24AC6
	for <lists+linux-media@lfdr.de>; Tue, 19 Dec 2023 12:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3826E179AB;
	Tue, 19 Dec 2023 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OdTvuASG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3378D18627
	for <linux-media@vger.kernel.org>; Tue, 19 Dec 2023 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55361b7f38eso2706917a12.0
        for <linux-media@vger.kernel.org>; Tue, 19 Dec 2023 04:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702988690; x=1703593490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rvLCqo7bdZdnfP7p/4dwIXgu4AQj05T2b8CjjUUC3mA=;
        b=OdTvuASG5mPBCXjLknCpSC+fINiRQzWaPItEz2pHM0JJW5f2ofWn83YCGlFoSu53q7
         9Aci9gvgxBSr1gayWTW5Wd1xgBL7uzd8duDO4PeuBGGBc6M33tSMqJU79Yn0szkKgk0D
         auXhBG0mQs1Evzl2XQ4Vl6jKrCrctVRZdb/OC3Khd96vaxNHkH/JOZDoN5U6KXhoblUW
         wdMDiyazRwDZWH3O2XBCref7a5GSI3pHvedGU5ME/UTF2pdGOpttz0NQwjl1M2wspWNm
         oxu/srIjICrLBOYzCpz8h7BK+XU/Fewy8IlwWNSyqFZjUkNWb1lqlepgq7ZDgULWB5Ls
         j5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702988690; x=1703593490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rvLCqo7bdZdnfP7p/4dwIXgu4AQj05T2b8CjjUUC3mA=;
        b=iYPQxx9DfEJv6fp6qZUlnUm/zN1w9VsMG8y8r4L87W9qyjg8m2FE4CnrJIcsAI+HwZ
         d4YmS9ftd+kqDobycSDGXdhzMAeqwuqzw8Rcz1l+IL7u9Q4HiFdqTmYkycMEx6UlB7mK
         7STRLiluAHJp83adjlcfz/9FxipvBVGwsojfZ/ZG2d1LHCbuE3yfR+XQmAo/7+iyMUWk
         sXZMI0BCyrk9jMSDqmO2ksFXmaY3C0F/r9lDjFE22gCdHUT9FELxaLXwJKnVmLrhzm8W
         5dAlLWpt/oSYk8AYyrnWu1h1pQy8t7HOxogorSpstQ0w2BBNbK5PQLDnMOgMXz0pP1g2
         qhdA==
X-Gm-Message-State: AOJu0YyPlNhWyXDXWxOO85FbH+s+ury49s+OBfYATHZ9/1yJ713UYZF9
	Y9RrKF8b79FgW81cLo81cEpiww==
X-Google-Smtp-Source: AGHT+IGU5VSHX4FU8WK0/RNr2P8msvvwytwe5oxzI0QLcR75dc8GJfOHw/VXjjgzA5TWz4fzHJExYA==
X-Received: by 2002:a50:9f21:0:b0:553:828d:3f21 with SMTP id b30-20020a509f21000000b00553828d3f21mr576374edf.35.1702988690551;
        Tue, 19 Dec 2023 04:24:50 -0800 (PST)
Received: from [192.168.199.59] (178235179206.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.206])
        by smtp.gmail.com with ESMTPSA id er25-20020a056402449900b005536476bd56sm1654226edb.83.2023.12.19.04.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 04:24:49 -0800 (PST)
Message-ID: <20690d50-5f76-4371-97e6-dcee717ba935@linaro.org>
Date: Tue, 19 Dec 2023 13:24:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/34] media: iris: implement power management
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com, agross@kernel.org,
 andersson@kernel.org, mchehab@kernel.org, bryan.odonoghue@linaro.org
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com
References: <1702899149-21321-1-git-send-email-quic_dikshita@quicinc.com>
 <1702899149-21321-30-git-send-email-quic_dikshita@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <1702899149-21321-30-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2023 12:32, Dikshita Agarwal wrote:
> From: Vikash Garodia <quic_vgarodia@quicinc.com>
> 
> Hardware specific power sequence include programming specific
> sequence of registers. Implements this sequence for iris3.
> 
> Introduce video device suspend and resume using runtime PM.
> 
> Also, implement iris3 specific calculation for clock and
> bus bandwidth which depends on hardware configuration,
> codec format, resolution and frame rate.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
[...]

> @@ -97,6 +103,7 @@ static int iris_probe(struct platform_device *pdev)
return dev_err_probe, drop __func__

[...]

> +	ret = readl_relaxed_poll_timeout(base_addr + reg, val, ((val & mask) == exp_val),
> +					 sleep_us, timeout_us);
> +	/*
> +	 * Memory barrier to make sure value is read correctly from the
> +	 * register.
> +	 */
> +	rmb();
just drop _relaxed and return directly

> +
> +	return ret;
> +}
[...]

> +	ret = read_register_with_poll_timeout(core, AON_WRAPPER_MVP_NOC_RESET_ACK,
> +					      0x3, 0x3, 200, 2000);
that looks like a lot of bits/bitfields that deserve #defining in this
and some other functions

Konrad

