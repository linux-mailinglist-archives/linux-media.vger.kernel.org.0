Return-Path: <linux-media+bounces-36170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE04AAECDFA
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 16:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2682D3A52B9
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 14:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACED322F74A;
	Sun, 29 Jun 2025 14:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FbIxGnhO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB9D21CC56
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 14:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751207782; cv=none; b=Vs+0/t8CFpfcGxeXANQ9Nzb9acI5nJsddUPmElLcgmhhFldLkwCpT67oYOUtmSOwxHhs0aeDQMTvikQPAmn3qGLYf+wp8kyK77hcKge8YVPQZlRrpZtODfL1aFwmVJw8rcH0Kv0c7eANUSqMQH2f17oeXLf/O2XBGAQ02H7NSMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751207782; c=relaxed/simple;
	bh=0xdXT3jkbQopuTex6YsVK/Tcunz4MGZYkzMVvbF+kZ0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hCOljMUm0VuOc8fHANmbg7V0bHpjb3OU+ukK1LupeWVIhqAqum4KtAJOE7iaTSgGIW3vLmWHZxCDx0Fb5eFAOw2eBthpKaEIWvRx/PaMklvPbldx57rcpqXjtsNlhxr5Y4r/zrB9csGSUGxLTERmJusZVeiwu9ghuPv8QfoBAoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FbIxGnhO; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a575a988f9so2271014f8f.0
        for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 07:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751207778; x=1751812578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X+z7SRvODNDhYfqBYH5cKF7fnL9B4dDoXgSqd8d9Fk8=;
        b=FbIxGnhOISf7EEqp8SNf6TBezvfUM0rvA95KJloTQkL+TcR+s4J9oG8D0wfopGTc6G
         SKdi9aitA/0uaP617gedyiS8Af7qWkerVJxYYZHhY3ukzAXuQ9z7Qv5iVVShxbi/oqjx
         HREhai7Ok929TQddZQqAi7Eh6tShUzKFkm99YjkEoxxD6I61nYm9YQAvgL0Xs09OBI7/
         LY5C0LH7S0phWfHsiOM3HAWv8Vhz7A1BBB5PEW/2WVoyo7tz64ypuuN5t21pz8twfnF+
         TuO3RrOswwujykOuoJeDBXfMd1bKSheEjN9THkN8lxuWWvxvqtuHBrngCuvraOCeKJFR
         DLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751207778; x=1751812578;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+z7SRvODNDhYfqBYH5cKF7fnL9B4dDoXgSqd8d9Fk8=;
        b=v6otk5Bdi0faC+Enq6sP+997A3v53jey28H3wWvgTPfIAZ7xuCWYwXoQX0cn8+7LqY
         kmzF6mVZWh0t9ML8wotal1B8SRVppX0iZ0HGFwcvTNR+be4V2eePsuLe6mripinQrgG2
         xZSajvcw609NvQ0eqUpiYG7iBYZWqre0KrYvuyyXICJuwgGV0EE1ip8bAWQn9Z0QZu53
         KHdqml1ceRXlNCagH4E9oQrzHUXjonbhSzb6OXq06zKjzaYiaj7zHbtUVju3ix3f1uwi
         6OBNODo9Py/ENLiIiGc1maJYpvFVCppB3d96rTVIDWUNdXlUaArOVjShROrWlcPEUQf2
         qMAw==
X-Gm-Message-State: AOJu0YxFDWcrcR/hGMx2O9WfFc6mIGohKBu4v903uSn9LVYB3Wp5GLUc
	FNK+TF/fnT+0FcLCkaMF9a9ECXGay1roN6VFFSudaX83RcuMzgMwmfo/kqKoEGnz1S0=
X-Gm-Gg: ASbGncvY4YgMvzPFhIotjuJ7Bq7U9AzLmaZR2/mYjA4z1HtX6zxi+YBKufAJ84W/KKb
	0EbWmu4NUFvsH8rgBegcOGndVjg6D7he/66Zc2nOMXtXLCnvXqWCF+EMwouQ6ca9cH2XPk7omhO
	qp1qilPMojImTw+FerLJJlq3Rx7mIX2XVJPrcIjOSYAeJCKfp0rLCEy0bAind2itz2fh6Q4ECkF
	+AKp+6N2WcHTx4oJ8en3tl+GaPFQi+BTwC3osFht/4+IaHC0cZA/H2K+N3/o+CqsuoN50l83tb0
	D6OlCfG+cmCGFRcOI1tL5aUHKLekOMSfiu9itysnHB3eB6IMrFyn5HQeJ1XJsbHEQhPz1qWhk+s
	7n9EPsS5YcOnDUYW5T90ZhycZb6vr+/pNHaMg6g==
X-Google-Smtp-Source: AGHT+IGzkuu9QIhht5yKkfO6ZABYOX72k1x7NScLoULY/v5PtADOn5CdMwya5q4nBdbkWZ4RPjkoHA==
X-Received: by 2002:a5d:4d11:0:b0:3a5:51a3:3a2 with SMTP id ffacd0b85a97d-3a90038ac3dmr7895542f8f.45.1751207778471;
        Sun, 29 Jun 2025 07:36:18 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8e1sm7787506f8f.88.2025.06.29.07.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 07:36:17 -0700 (PDT)
Message-ID: <84e00f99-ee62-4097-a8d9-315d424222cf@linaro.org>
Date: Sun, 29 Jun 2025 15:36:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: vfe: Avoid unnecessary RUP command
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Reply-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250422081436.6535-1-loic.poulain@oss.qualcomm.com>
 <9vnGmNQZ0vBCvWzpeOLQAV3d76Ifgpvy1tlqz3owtoERKCky3asUtT2AuNcTouQYmruK3sVVSotm7aQZtmzkpw==@protonmail.internalid>
 <e81d6d27-908c-45b2-a3b5-fbf743f9aaba@linaro.org>
Content-Language: en-US
In-Reply-To: <e81d6d27-908c-45b2-a3b5-fbf743f9aaba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/04/2025 12:42, Bryan O'Donoghue wrote:
> On 22/04/2025 09:14, Loic Poulain wrote:
>> Today, we submit a RUP command (reg_update) after queuing a new frame
>> buffer using vfe_wm_update. However, vfe_wm_update writes the buffer
>> address to a FIFO register which does not require a subsequent RUP
>> command, as this register is not double-buffered like other config
>> or control shadow registers.
>>
>> This results in the capture process generating twice the expected number
>> of interrupts, with one RUP done and one BUF done interrupt for each frame.
>>
>> We can relax the interrupt pressure and VFE load by removing this extra
>> RUP command, which is only necessary when initializing or reconfiguring
>> the VFE.
>>
>> Note: this has only been tested with vfe-340/qcm2290, the assumption is
>> that the other VFEs behave similarly.
>>
>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> ---
>>    drivers/media/platform/qcom/camss/camss-vfe.c | 5 ++---
>>    1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index c575c9767492..32de1d104fe7 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -481,7 +481,6 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>>    		ops->vfe_wm_update(vfe, output->wm_idx[0],
>>    				   output->buf[index]->addr[0],
>>    				   line);
>> -		ops->reg_update(vfe, line->id);
>>    	} else {
>>    		output->gen2.active_num--;
>>    	}
>> @@ -546,9 +545,10 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>    		output->gen2.active_num++;
>>    		ops->vfe_wm_update(vfe, output->wm_idx[0],
>>    				   output->buf[i]->addr[0], line);
>> -		ops->reg_update(vfe, line->id);
>>    	}
>>
>> +	ops->reg_update(vfe, line->id);
>> +
>>    	spin_unlock_irqrestore(&vfe->output_lock, flags);
>>
>>    	return 0;
>> @@ -582,7 +582,6 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
>>    		output->buf[output->gen2.active_num++] = buf;
>>    		ops->vfe_wm_update(vfe, output->wm_idx[0],
>>    				   buf->addr[0], line);
>> -		ops->reg_update(vfe, line->id);
>>    	} else {
>>    		vfe_buf_add_pending(output, buf);
>>    	}
> 
> This looks good.
> 
> Obviously needs a lot of testing to validate across various other
> platforms to validate.
> 
> ---
> bod
> 

This works fine in sm8250/rb5 however it breaks x1e and I'd guess 8550 
too where the change was originally developed.

Dropped for 6.17, I'm not sure this change can be made valid across the 
range of targets we have.

---
bod

