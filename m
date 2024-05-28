Return-Path: <linux-media+bounces-12110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F558D222C
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 19:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7880E284457
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 17:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E70173354;
	Tue, 28 May 2024 17:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B7UjQLMH"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF98716EBE2
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 17:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716916201; cv=none; b=n8wkqswiolY8PwUrH8TvPU5dI8qnNRGFItobHmDrgfSHfgGobTjSI+ih6C+o3V9sjQiohQ7YrMyymCpVXGzD7d9jF7Tdd18F/2EvSlJOr6BnsSgu3hRGooaOvHUaMF1qhGC3dAa+X4jIpautuD5KBdip1AqUTMXhKG1h1OoFaak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716916201; c=relaxed/simple;
	bh=AR6U/qaELEoqk8nQWg6NpFQNeo717uJTQM3pryiZM2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUFqGWaFykcnEcsWOsDK6mCtCWHmbpq7p79eUycDBHCoEJ3Y94CscmwCYUL/2Vlbwbk+gP0BtgDWT7snNILGJW3ylnhyDcgIbeTrrdMlqVSEGokfVWz5/8sytjY+u2Ukj0sSVeg1khzjLvUrTXIEj5Z1MOGirJ2qJEWdL0/CpHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B7UjQLMH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716916197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=35VQHwWk0//mBlvImqaujEfVCW2jrOIkEafBbzr68rM=;
	b=B7UjQLMH5cK6vFxswavgaURIq0RL9jmzVc7sFLzXChaPWkXwWantJa6hl5vYZdm6tN/aTa
	uCvJXH/pv0GVO7O0MIxk4GleOW5T0zGy21Qonhltb3WX85RzLt2LsdZOp59NYUMryp7F0A
	ABWzfQ32QNvi5JGerqlccBX2iaPK0G8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-JqsPC0Z6MhGUgMbJLWlusA-1; Tue, 28 May 2024 13:09:56 -0400
X-MC-Unique: JqsPC0Z6MhGUgMbJLWlusA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-57837716b64so664171a12.2
        for <linux-media@vger.kernel.org>; Tue, 28 May 2024 10:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716916195; x=1717520995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35VQHwWk0//mBlvImqaujEfVCW2jrOIkEafBbzr68rM=;
        b=NfPYObt2lh3ITb+4jCISc+T0gWkoEyVoH/D/nI1gken4jMg2PcniZ9P2wl/NnqtNmK
         5hggBKI5LVv0gOf8dWaM9a0ux6XqckTMjETct9LQa92VD9PjNUlup3++kRAI5XiEFwwS
         7l3RunOENPWbWnS9Y8LWl8hdZ4OZ09iPb5jzgnIzDsvzY/40AcXx/Q2f3tLL2MbJJadL
         c9CKJjs4fZ5bJ5I62cgen+iJCJ98xhLxJ+pkVa0r73miOrun/lvj+liodKIwk5CS5E4f
         umrWiusbALSTZCiuruKORDvV8Hy1Y8KusdeJFbjpCi7QNahKJM+imbS7q25trFMx5Hrg
         zPyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU9ggEM8WEZqtTcL5nzsL8AGLxjadHhItFmnMC0fpmcph0ZC1qX+fnLtxdjKaE6ih5dz5ovz+ulgUwWq/FMJpc8uLYdeaKY1potlw=
X-Gm-Message-State: AOJu0YxvV8c8PLsCSW6ghgtJ6i0EScI+qbfJ31ufAj/7a+UronQ1UFHj
	3tmcY5Y4YRXSOUYc0qFn2DdLo8ZlBsSXL7TQ1U0xv1xhY/QDTDzJh63u//decG0Zjun8sY8Zc+p
	d8Xh+xK0fUM0AVtLsNuEVyyuciQCwwmsT1PjegutjddAQVI3dRaduI/d7D6eI
X-Received: by 2002:a50:998e:0:b0:572:7bda:1709 with SMTP id 4fb4d7f45d1cf-578518f04ddmr8884728a12.9.1716916195161;
        Tue, 28 May 2024 10:09:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHisjcCOLlmts/18OlmSuIGYLeswwiHjRkyoWnS+26pyPDJbbrZR2whGmmavfsDxJfHysbVGg==
X-Received: by 2002:a50:998e:0:b0:572:7bda:1709 with SMTP id 4fb4d7f45d1cf-578518f04ddmr8884705a12.9.1716916194690;
        Tue, 28 May 2024 10:09:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b? (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579deb8f406sm2324565a12.34.2024.05.28.10.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 10:09:54 -0700 (PDT)
Message-ID: <a05df025-a0be-49cd-84a9-7d7fb2eeb33e@redhat.com>
Date: Tue, 28 May 2024 19:09:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ACPI: scan: Ignore Dell XPS 9320 camera graph port
 nodes
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Genes Lists <lists@sapience.com>
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
 wentong.wu@intel.com, linux-media@vger.kernel.org, linux-acpi@vger.kernel.org
References: <988e48090982c89ce0c906954832fdfb09a1ce34.camel@sapience.com>
 <20240528084413.2624435-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240528084413.2624435-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 5/28/24 10:44 AM, Sakari Ailus wrote:
> Ignore camera related graph port nodes on Dell XPS 9320. They data in BIOS
> is buggy, just like it is for Dell XPS 9315. The corresponding software
> nodes are created by the ipu-bridge.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi,
> 
> Could you test this and see whether it fixes the warning?
> 
> The camera might work with this change, too.

Thank you I just received a Dell XPS 13 plus 9320 myself to use
for VSC testing and I can confirm that with this patch 6.10.0-rc1
works, including giving a picture with the libcamera software ISP +
3 small libcamera patches.

Regards,

Hans




> 
> - Sakari
> 
>  drivers/acpi/mipi-disco-img.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/acpi/mipi-disco-img.c b/drivers/acpi/mipi-disco-img.c
> index d05413a0672a..bf9a5cee32ac 100644
> --- a/drivers/acpi/mipi-disco-img.c
> +++ b/drivers/acpi/mipi-disco-img.c
> @@ -732,6 +732,12 @@ static const struct dmi_system_id dmi_ignore_port_nodes[] = {
>  			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 9315"),
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 9320"),
> +		},
> +	},
>  	{ }
>  };
>  


