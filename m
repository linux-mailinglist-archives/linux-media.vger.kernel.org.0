Return-Path: <linux-media+bounces-28621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D146A6D825
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 11:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20E5218943AC
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 10:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBE125D91A;
	Mon, 24 Mar 2025 10:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dKGWBjRo"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA8E8494
	for <linux-media@vger.kernel.org>; Mon, 24 Mar 2025 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742811505; cv=none; b=sC8vlWrDqmMYgaGsD3Pb1iw1/XzkMbV3s/eMKNRImzeL2o9Xoc0EEhN9zQ0T6KahLqFUL/6ixdQGzR4MCfAc2NcdqMcil442zf6RzY6q3SIKKZkCM4BxqvdN6vS4onHnOVKjNR1R5kLmATPmK87YjQ3u8gTd9s79alPtOrr6e9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742811505; c=relaxed/simple;
	bh=LQk3WJkL0+NxJuujtaCndt2J8jyj7v0vSvkr0xhlrpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tvYF19I5p9K9S3j5zhYx98HN0E7svIz5wNGkU+DJN1jCtz0rY0VDhDT994NHmBt5pzYUameO3TJBK3QhCvCeu/0IoMo5p/LtxlFABwsmirRH8n4TESFcPJpcgSX1/wdOUCqpoGyO69hrrvUlHbOmzFw6uMwTQ6yRdpfsIS+Yvvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dKGWBjRo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742811502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KH5fiplNYA9eYL4Chn2wrvzih4tC4IXyd6V4FZzj7lg=;
	b=dKGWBjRokR1CD2WrPCH90LXDXw3Wz3cvTJcvheJVe35pEyCKRIkGCFICF3KlNfAdcLN2mK
	ceXaejcyQpIXIr4ZKzHCeMVR1s/1gWOm8hFDRggOoinxm4cqvoP9o7yMD0y6Kjq0zWp99j
	4KqahMZfGG8n1HrSD1sDrqG8oGWO6AM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-Uahul_8nMdqLrNLFLUgQyA-1; Mon, 24 Mar 2025 06:18:21 -0400
X-MC-Unique: Uahul_8nMdqLrNLFLUgQyA-1
X-Mimecast-MFC-AGG-ID: Uahul_8nMdqLrNLFLUgQyA_1742811500
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac37ed2b99fso386411366b.3
        for <linux-media@vger.kernel.org>; Mon, 24 Mar 2025 03:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742811500; x=1743416300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KH5fiplNYA9eYL4Chn2wrvzih4tC4IXyd6V4FZzj7lg=;
        b=qKYL2y/JE/xc+gVjfcYoJlGXAL+e0LaX7kbpE5estIM3vlvu0P/yj+NkEO1wFn45PQ
         rOR9dG+8GqlECninf0YEmG/4cwUHsJ3jhvbYeVAvvIUJa0KoCUwkiAKTemEsBYzBwUg9
         4oAjys0wZUaBuDYWTBPCV1bFMqbhjg263tukvgKkjTF8oD3yYFa7PDFtUiSakhgCZhLS
         vNUkrj1lX2oBeud+T7pyH4Wjg9K7By80Mye4XdhS2B3awOMvqaqhUaIoMDLwOu65v4zy
         P0eliTDhWSAqOwZpyc5NK37C6V/XZzdDn2PZjKwL970baX1NCzKwUrZ1vP/6cxhRYnyd
         h1Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWpo3m9U+7kt64ivzX44DEAsOUGoMjdmHJBi8wjUY3kGNTcnFvcRbW4sGl2YXZzKaOJxEIgEhtPne/Plw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7iyAcE+uPKqcrDstmN3+qNoRookJpgMVSXiHDPMR5XHbQ8Rq2
	PzsJEQiKnNr2zb/KBec8gq9LV8WOPTLm0RmVfo3ToUfH3UK1o8go7sD+lR1M6RU7EX6kLtPCsge
	md+Anz7NcZuo3iw/64eO4pIsHulNRcYtlQR7IarhfOAeFu+tBNdwDTzklhhb8
X-Gm-Gg: ASbGnctSofdaXQa3kD2haxzcZlqWiSkk/Km765II36D8X5rogW1VmxoZh8q14q7P6oH
	tc5xeFgEEWSxgHBPiFKyqEavpaTCf2EBsg52SmKZKGd1orzyV3pdmb1AIQ4wQZ8Sig9up4r/QCi
	b90tYzA+qcuMuMzIkze03aNIRnFDnRNMMtk0fio54RE5AUeK2hHCTMiAhn3C1WNoGJ3sOfnX2eZ
	l9Vmqb50qxa/MBaBTsJb3tKdjXEBvTGgE+6E07G2fKALQioPm2f4NiTMIRUMNJ9VKXo1bR8szis
	8KUCpDSQo1qbdF/mKGc=
X-Received: by 2002:a17:907:bac2:b0:ac3:8aad:4d8a with SMTP id a640c23a62f3a-ac3f1e44219mr1214556766b.0.1742811499838;
        Mon, 24 Mar 2025 03:18:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6WPnbZfuWVreYlp7BFNzsf3lxicCoetzcm8t5hzSLBXcW7xcO7VY5N1AgX2w0L9ZM2cHFnQ==
X-Received: by 2002:a17:907:bac2:b0:ac3:8aad:4d8a with SMTP id a640c23a62f3a-ac3f1e44219mr1214553566b.0.1742811499321;
        Mon, 24 Mar 2025 03:18:19 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd45594sm645222666b.160.2025.03.24.03.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 03:18:18 -0700 (PDT)
Message-ID: <2c896b18-9bdc-4257-a78e-8614c572fe1d@redhat.com>
Date: Mon, 24 Mar 2025 11:18:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: Add Omnivision OV02C10 sensor driver
To: Bryan O'Donoghue <bod@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Ingvar Hagelund <ingvar@redpill-linpro.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250319145927.70534-1-hdegoede@redhat.com>
 <4546bbcd-e134-43f2-b301-73006cda12f5@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4546bbcd-e134-43f2-b301-73006cda12f5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 24-Mar-25 00:46, Bryan O'Donoghue wrote:
> On 19/03/2025 14:59, Hans de Goede wrote:
>> From: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
>>
>> Add a new driver for the Omnivision OV02C10 camera sensor. This is based
>> on the out of tree driver by Hao Yao <hao.yao@intel.com> from:
>> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov02c10.c
>>
>> This has been tested on a Dell XPS 9440 together with the IPU6 isys CSI
>> driver and the libcamera software ISP code.
>>
>> Tested-by: Ingvar Hagelund <ingvar@redpill-linpro.com> # Dell XPS 9340
>> Tested-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com> # Dell XPS 9440
>> Signed-off-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
>> Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Co-developed-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---


<snip>

>> +MODULE_AUTHOR("Hao Yao <hao.yao@intel.com>");
>> +MODULE_AUTHOR("Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>");
>> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
>> +MODULE_DESCRIPTION("OmniVision OV02C10 sensor driver");
>> +MODULE_LICENSE("GPL");
> 
> Needs a MAINTAINERS entry, I'd like +R on this to make sure nothing breaks for the Qcom laptops.
> 
> +OMNIVISION OV08C10 SENSOR DRIVER
> +M:     Hans de Goede <hansg@kernel.org>
> +R:     Bryan O'Donoghue <bod@kernel.org>
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +T:     git git://linuxtv.org/media.git
> +F:     drivers/media/i2c/ov08c10.c
> +

Also:

F:	Documentation/devicetree/bindings/media/i2c/ovti,ov02c10.yaml

I guess?

If you agree I'll prepare a v11 series, with your "[PATCH 1/1] media:
dt-bindings: Add OmniVision OV02C10" as 1/2 and then this patch
with the MAINTAINERS entry added as 2/2 .

Regards,

Hans





