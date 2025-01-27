Return-Path: <linux-media+bounces-25309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EBCA1D522
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 12:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D6E11887218
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 11:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68BE1FE449;
	Mon, 27 Jan 2025 11:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eN9etYbv"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51523596D
	for <linux-media@vger.kernel.org>; Mon, 27 Jan 2025 11:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737976499; cv=none; b=jOwMTWHglEzEQK/KOO5JWgVIbhQbXneHNnH8fhsoIz+8aSXaByPNpkY0scU9QwgjZ9wYWTXPPyh3fZyOhNHmqx+a7/3OmLYYQPWRTEEsnGaGIYaft00Zmn1HhK7Oy8KyEu+hRHlrvVMFD3dn6dSmvXJjz2xDXHDoRiFHnD+gndU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737976499; c=relaxed/simple;
	bh=qz4Y6M8k/U5Ub450sbypyBS3kAa+jazrbx7jVEbhtyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uChIxaoNhS/0E0V3itSoBvHe0nm1BMMrs8VhqQAu5sAsXKAsV6YPAE/0hELWGrdQeF5nQ7Bwt+urC08EB1ybVegB1ZCsfpQrHxZVcp7ZqnZr/yw0R496+4RyueWgtLb0zllk0cuMzu4moVRKGX04ueGEcwdh8TreWJicX/Vhl3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eN9etYbv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737976496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KPj7DqxSz3qAQiSjojneQloLcPEtaRdLn5oCZjX4I4I=;
	b=eN9etYbvvqrrz5bxDkXvQcgmulgWB52hGOylNpWi++rNaeXPGda/pgDxKcKsPAD71i8sE0
	HzK4LS7Hdi1nX3/4AVei3SoT5fQ7SZkpi/u4iggiIRJiIWneAlpte5UywIlAwC1kGGbn4v
	jrVDKhC1oIbrMCb33g20yzMg/yJucHs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-5YyInz6uNDegTSqmbE16cw-1; Mon, 27 Jan 2025 06:14:54 -0500
X-MC-Unique: 5YyInz6uNDegTSqmbE16cw-1
X-Mimecast-MFC-AGG-ID: 5YyInz6uNDegTSqmbE16cw
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aafc90962ffso378890366b.0
        for <linux-media@vger.kernel.org>; Mon, 27 Jan 2025 03:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737976494; x=1738581294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KPj7DqxSz3qAQiSjojneQloLcPEtaRdLn5oCZjX4I4I=;
        b=jC9OjO4Tjo/QXK+NU9pFXUiJkBr36J3alJJ+cIjv3+xQTX+iRGvmWWfQF62twFsBgK
         /4VZjMtYe5K3OJwDtNxMESzsMc6fKFNQQ9C+T0DYGkpoGA1iPH4UHve4tlVU+52eF/+7
         esZUgjLK0Cdewjh9z+GMp5bsQS9mKF7qtIBLMd6f+NA/1elrAEpdoyRmLRf2W432se2c
         u2VSsGZpHU9gO4qSA0SL5CPcFfKcpCOt5fDmUG1fld8axMHXLJw94I1gUzspjrLh6Wgd
         ydwxWZeAM4RFCFw2iGzHazjcCRSbrQ93ZiarjnOKnhORpxYhDxE2UGmhrdEsk3Nby2ef
         qw8A==
X-Forwarded-Encrypted: i=1; AJvYcCVjOPDcmrYV2Hy6W05mEnwEFA1qA5AyGWrurUJrXxhMrsVzXKgVPPSUyP1/XFf94rsm3AI5+ZVUnzm4iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfuJvoDgtQ4Mr7CGmBSzG/Xh65PPx/ew+SIX4M+mtRcdS8SS7a
	+dgg64nFE6Gv87d0SPZwFVtgyT9dC7soUzI8GOtiBPrNQMbrhmJHcbO6orYkFiW7MTd0YIzDeKd
	3vE1WY1Fsh5siQ6CKTXarbiJNdKTrpNmd1Zoj0QX110kurYgJ6tAb5FQvQpxz
X-Gm-Gg: ASbGncvaUJi5tVH1+NaVav9ERCbrdEKB8fNdwyGjFsjC/UqVQEoR7mCBBIEC8ogx1LF
	bHBG9A0CGma0h5brYEVphGTD6gXMNhnSdN21svDecnqFIm2CRKv2K1B7QNiQsRZ137raUs4USOZ
	16jbioEc1HR7/oorqte1cZRmh8izy33NW0ZU/78bjDcYlpKSzazbo8yA0ZB7oJApTk4k3Pzlx3c
	oIiOlm3+HddyaMsGUSs3T5gUnUX3Y1ySui7mn2xOuUy2E2e8qFdveB9vQmPbmWlyjwP7EINZa6q
	AAl+WKsg
X-Received: by 2002:a17:907:7b9c:b0:aae:ce4c:ca40 with SMTP id a640c23a62f3a-ab38b2e737cmr3845864066b.32.1737976492148;
        Mon, 27 Jan 2025 03:14:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4oOGCgFD0awa5phNG4kUv3MgccwjqZbkrtGEn+w8U5U5YsB0EEItgnjRfKCgj8YZHorcnww==
X-Received: by 2002:a17:907:7b9c:b0:aae:ce4c:ca40 with SMTP id a640c23a62f3a-ab38b2e737cmr3845850366b.32.1737976490266;
        Mon, 27 Jan 2025 03:14:50 -0800 (PST)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760fc2f4sm571936266b.149.2025.01.27.03.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 03:14:49 -0800 (PST)
Message-ID: <15b667d1-3dd8-41fb-8ac0-908ba9ef6782@redhat.com>
Date: Mon, 27 Jan 2025 12:14:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] media: i2c: Add Omnivision OV02C10 sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: hao.yao@intel.com, mchehab@kernel.org, linux-media@vger.kernel.org,
 joachim.reichel@posteo.de,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Ingvar Hagelund <ingvar@redpill-linpro.com>
References: <20250116232207.217402-1-heimir.sverrisson@gmail.com>
 <Z5CtMaPUlNs8xhBa@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z5CtMaPUlNs8xhBa@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

Thank you for the review.

<snip>

On 22-Jan-25 9:32 AM, Sakari Ailus wrote:
>> +static int ov02c10_power_off(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>> +	int ret = 0;
>> +
>> +	gpiod_set_value_cansleep(ov02c10->reset, 1);
>> +	gpiod_set_value_cansleep(ov02c10->handshake, 0);
> 
> What's the handshake GPIO for? The sensor datasheet does not document it.

This is the same handshake GPIO as for which I started a discussion here:

https://lore.kernel.org/linux-media/59f672c3-6d87-4ec7-9b7f-f44fe2cce934@redhat.com/

Since the Dell XPS 9x40 devices on which this sensor is use the iVSC chip
I do not believe that handshake GPIO support is necessary in this driver,
so the code to get the handshake GPIO and to set its value can simply be
dropped for the next verison of this patch.


<snip>

>> +	 * after handshake triggered. We set 25ms as a safe value and wait
>> +	 * for a stable version FW.
>> +	 */
>> +	msleep_interruptible(25);
> 
> How is this related to a lattice MIPI aggregator btw.? This driver is for
> an Omnivision sensor.

Again, see:

https://lore.kernel.org/linux-media/59f672c3-6d87-4ec7-9b7f-f44fe2cce934@redhat.com/

For this driver this can simply be changed to:

	usleep_range(1000, 1100);

Regards,

Hans


