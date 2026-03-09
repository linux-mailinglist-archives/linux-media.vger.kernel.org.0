Return-Path: <linux-media+bounces-55021-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC0ZIAdCr2mYSwIAu9opvQ
	(envelope-from <linux-media+bounces-55021-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 22:56:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CC3241F77
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 22:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40E90306222B
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 21:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49EE436D4E7;
	Mon,  9 Mar 2026 21:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XSdfnt8L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD7336B06D
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 21:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093376; cv=none; b=jQWMrUEF86T9lkBTc/ypCHJkEvURiSQjB8wRJuRDeXyW/y/QCYJZ5FbXL6+gCDSm9hPPZqAXQTuYMjSBGScW/nkorFBYjYIhcUt396i5tPjEhE7Ok3CtgeMD3DlMLXg0HSXzyjAXCBpGeOWNBWp8jTfeepBiO53bvLMe+HEORgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093376; c=relaxed/simple;
	bh=epzv3CtU0gmjj908Hm64tFwvLI0AWLlIUvZbQZQ8G3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AEOhT5ryfmWChxM3R14g3S25HzokZWFrRhj3YsfgTgKess/JW69aeIyX1PuPsuR26EK3zfvBayLffzWPK/JvVi1m9PVXBcNk1mnNanRTkoArdJXO5cGaJtVTJv9kQvsuIMG9Bh+l//rSAaj6hGT+fal6DMy9dhzOqfAf+wXDoq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XSdfnt8L; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59e58404f28so12368e87.2
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 14:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773093374; x=1773698174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0Jmm2xN/V86qggSG1t1r8Ot8sfuJ5PP8pssEN7b8n4=;
        b=XSdfnt8LORBgHGwJq/d0fj43j/AU5OrnAhGLVn0ghgDYT3jQTONA4/0vYvosmP8cUM
         840sZhRQfoNd5oYzC14eKFEg4I0qgsbcVUF4Nlnh1xdaMunD6iuLn+LLVdWJXC6jrusS
         I4rikCJVQClC1C0oOxjY1TAZ0SkYxddHUTWAW8FrRUPF8naRBgNRsvY2dUTaUx5t2bdf
         c72AdfP4pjiwbp9PuRbdcxtFZ1DKknY9fmUg7zhtHvqtbYLlDbxZDvFvnql3rBq78nID
         pxuPrWdFkN/yJ5sXebpc5SrntAC0LdCp4SHZ7VwGuthwpDfM4YxN3QLr9Th/6ji5dV9Y
         brqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773093374; x=1773698174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0Jmm2xN/V86qggSG1t1r8Ot8sfuJ5PP8pssEN7b8n4=;
        b=RZK+biR/srIK4xnn01IVVTH2OKh9lVFb/2IHQzQWb09NpR68ehMPCIXiTdvlVVXn8d
         D/QP8sQUgbEcrLgnm6ujTnIzBe4WDeizUnFzeXQ0aQtLpduup/ucc6J7S/VZ/bEyHIFZ
         3qdHUIeqkpNd6U6FnGcR+p3M40rBHFl2MvIL9QLoUNOkG5YqaneEY2i0U62ShjrD1IBo
         Cu1bKqnAEsicC2jY5FXE7U7luMU95Cua8bNt9SBwILOmuGj0Q4MMZgxh1uGLqvVS8Ei+
         3uHlvVdE5F9zm/xDxHKeLcS4cM/xTu1yPtcOAp4UnP7l6xaHzFz4VpNareXioXOQvDqL
         pNTg==
X-Forwarded-Encrypted: i=1; AJvYcCXnC/P/8i1YHoS1Ct+5CXewAAFBAila+J+rKvBpC+pw9iRLkSz0KgAogLUwVf3jPP/IM30F2E0C1jyvug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpQZoY637vKhjKWwXe533CSesBWIDEymFsPzoPJsvfHChyhP24
	/stpYfIGkLqSYjqp+cTyo0qp/2fDqS23jVbbKaEBi+bkYxExYN/ltv1wJE22wViKY7Y=
X-Gm-Gg: ATEYQzyAynCyahd88CjluRHL3e2eZBbgCXBaO9Hrya9dNAbAnQr16kO1dPNPxOf88ri
	Vd7A6QHik5j60EhsSlNANKNuXFGxqlISvZ022iTjbE1yXnDu2sLv0JnGGW3ctF32TE3cV1vbQJn
	A9xT58+dOMWUqst4EX6Q5v1F+4m32/yx4SrrR0himLDbLloD0u7NwDa0N8urx+FaNGjQ0GmQTj4
	DO0RBZx+qTXN8v/AelIeP3S0ddGFIo4iAWFvZUh1/OkB3of3uIIZ2RinmZUGTuZBirUUWi0iGEj
	QKTXxoX0/POhJlID1XdpeHl6HzKDpwFlBZTjl3JEaIimI4yeQ7ekNrqqiFMp3a0nbyyVP/Y1IOe
	dw2gA70kFgW6RsNO3YS5rX5Y/+RVR1B/mz4dVLYV/MFO8F0D2IhsCZdgvqKtPJHW4gelVhLLXl3
	Z2i+QivQtIXAJvw5CwIQkhN0/eAKcpz2x4foT0hNb4W8guaxEKLmnKi+47QKpJ9lM0VZAej79fp
	XmUNtv9eDFoojqV
X-Received: by 2002:a05:6512:3ba3:b0:5a1:1329:5ae5 with SMTP id 2adb3069b0e04-5a13cab34d5mr2539754e87.1.1773093373603;
        Mon, 09 Mar 2026 14:56:13 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d02b184sm2397343e87.23.2026.03.09.14.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 14:56:12 -0700 (PDT)
Message-ID: <aaea7acb-87d9-4cfc-8af2-fe630c3c0095@linaro.org>
Date: Mon, 9 Mar 2026 23:56:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] media: i2c: og01a1b: Add support of 8-bit media bus
 format
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Shawn Tu <shawnx.tu@intel.com>,
 linux-media@vger.kernel.org
References: <20260226133739.4050870-1-vladimir.zapolskiy@linaro.org>
 <20260226133739.4050870-7-vladimir.zapolskiy@linaro.org>
 <aa61R5mcCE1zu125@kekkonen.localdomain>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aa61R5mcCE1zu125@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D0CC3241F77
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-55021-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Action: no action

Hi Sakari,

thank you for your review.

On 3/9/26 13:55, Sakari Ailus wrote:
> Hi Vladimir,
> 
> Thanks for the set.
> 
> On Thu, Feb 26, 2026 at 03:37:39PM +0200, Vladimir Zapolskiy wrote:
>> @@ -627,6 +632,14 @@ static int og01a1b_enable_streams(struct v4l2_subdev *sd,
>>   		return ret;
>>   	}
>>   
>> +	ret = cci_write(og01a1b->regmap, CCI_REG8(0x3662),
>> +			(og01a1b->code == MEDIA_BUS_FMT_Y10_1X10 ? 0x4 : 0x6),
> 
> Does this configuration have a human-readable name? It'd be nice to use
> that instead of a plain numerical value.
> 

If it has, it's not known to me, unfortunately, I cannot add a meaningful
symbol name here...

The 0x3662 register is one of many analog control registers, the upstream
OmniVision OV9282 sensor driver shares a hint that BIT(1) of the register
changes the media bus mode from Y10 to Y8, and due to my tests it's right
the same for this one OmniVision OG01A1B sensor, thus it allows me to add
Y8 support to the driver.

>> +			NULL);
>> +	if (ret) {
>> +		dev_err(og01a1b->dev, "failed to set output format: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>>   	ret = __v4l2_ctrl_handler_setup(og01a1b->sd.ctrl_handler);
>>   	if (ret)
>>   		goto error;
> 

-- 
Best wishes,
Vladimir

