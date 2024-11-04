Return-Path: <linux-media+bounces-20787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDE89BB2E9
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 12:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E3912847CE
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 11:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBBF1C2432;
	Mon,  4 Nov 2024 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dh/gZDSy"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1621D2200
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 11:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718423; cv=none; b=PYZXwMtrvcKIteHiVo17NYSyEpRpWEoX0/3bbWo7WCFyBnpuS6W2xB3DbBQcbwK4vPdZVrJGgjRcunKXOwi9SBwMU1gXLMmTZ0qyAd5DMvxOfI+IkO/oJZcSM9C9jewK/6vcAtCMUfJze0Tr6kxWP1IiPNdC2VL1RIObOSKYl5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718423; c=relaxed/simple;
	bh=iWEcRni2Nz57qu3SIoY4cH7ciaJ7ffC2NUZRr3pjvBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GRw8z2e5a5LBagH4vCCOsl7FWDWIESuMBUk9o9xcm42tktlk93dAZawihoQf5vJw5AEewZWBOo6ZNWoNu3l0QhVLxM2NFFXelSUZq1dZGFl/wz70PrlV68az8eYxcOaMKwR22b7WfGiX5+V6xQS7G6r8owbOokZh7Dgja8v6kqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dh/gZDSy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730718419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aqiu7oURVUgREvheU0sljhA5Rj0o+9UF1lmo7768lR8=;
	b=Dh/gZDSyd0btM3N58qlI0Yb3t2NVB0QeTrRovkGp5Nv8zqnzsYXASjemZEzlG4YxmJaDlz
	xEj0g3grsJGhthYo5oYtOy5FsroEtYZ76/uFwYPmEz3SljRjVjKonKZpqpDrHBabiLyKac
	Zr8NE51F5sjjdzTM0jNJ+vFZAuVU/e0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-Lz-o8OyTNL-SzYfXHvSHdg-1; Mon, 04 Nov 2024 06:06:58 -0500
X-MC-Unique: Lz-o8OyTNL-SzYfXHvSHdg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9a1af73615so312324766b.0
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 03:06:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718417; x=1731323217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aqiu7oURVUgREvheU0sljhA5Rj0o+9UF1lmo7768lR8=;
        b=JP8Eq2DvxOIPJKptm0tDYWK+Dz5NYX7d1CW4I62mQN7WG0CCxec6ucfsg+xUCqhFBs
         0V1WKiBIY1k8tq4jFL+l9rMOOtWeba5hiLCPsLY9OXwDm8k1Im7EIVIySJrjmnzMc00x
         dLxgjYhachGuewH8ONz5kenYCuS4WxUhsSSmosYnOBg2+630m6778yg/+7hOi3w4lRaG
         dwlH14P31EWKifzZzAo0C3j74RhxEU3nnpg5V6+B+g/TRGHLcClHYsxCG7YvUYTj1ray
         mNwX+7DlasmVzbspY7z5vAo8fdVtFix3XSSNG9sNmYKaOGG/WB7nOKq1JlneJdcfoorj
         YXFA==
X-Forwarded-Encrypted: i=1; AJvYcCUN5U1yurUpoajk89Vd/91z57l9a8qGYwhka0BqLURkSoT12yYy+kLHLcpIwBfwzKFUeSpVSk3UoLvv0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZKhBZKQaOk2Da938mJdbzT2suwvUYMhLW61Lp6MhEyBP/ihN0
	69H0owvE0YsejA/5jhMcfrPl04xYIDPRL+YkuI/0eSi9OQrKt5BsuVn7HVx7AS+r8TCbrirAxo2
	/OC9mczGHOvo05ArFzantoAgbtNeWmRU1ijlmtUKmhDv/gNxCyn5OP6fSqx1DTK7bSrCZ
X-Received: by 2002:a17:906:fd42:b0:a9e:211f:7dc6 with SMTP id a640c23a62f3a-a9e211f7ebemr1452830266b.8.1730718416978;
        Mon, 04 Nov 2024 03:06:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEG8/C1gs96jiTZYAtiRvsfoTzByztC2AqrZZ9D66KqXv3ZXWhuOotsEYjq0Pl8VfNhDEd1zw==
X-Received: by 2002:a17:906:fd42:b0:a9e:211f:7dc6 with SMTP id a640c23a62f3a-a9e211f7ebemr1452828066b.8.1730718416361;
        Mon, 04 Nov 2024 03:06:56 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564cc5e4sm537362466b.89.2024.11.04.03.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 03:06:55 -0800 (PST)
Message-ID: <8204d2bd-50ee-473d-849e-77115fc5adcf@redhat.com>
Date: Mon, 4 Nov 2024 12:06:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] media: atomisp: mt9m114: Make it work on Asus T100TA
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Robert Mast <rn.mast@zonnet.nl>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20241013154056.12532-1-hdegoede@redhat.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241013154056.12532-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 13-Oct-24 5:40 PM, Hans de Goede wrote:
> Hi All,
> 
> Since there is some interest in getting the mt9m114 camera to work on
> the Asus T100TA:
> 
> https://github.com/jfwells/linux-asus-t100ta/issues/4
> https://lore.kernel.org/platform-driver-x86/e0c8c98f-64ec-4297-bbc8-de489414515c@zonnet.nl/
> 
> I have spend some time this weekend poking at this resulting in this
> series which makes things work somewhat.
> 
> Note that for now this will only work if you modify the BIOS settings
> to change the ISP to be listed as a PCI device in lspci:
> 
> 00:03.0 Multimedia controller: Intel Corporation Atom Processor Z36xxx/Z37xxx Series Camera ISP (rev 09)
> 
> If you do not have this in lspci then things will not work. The BIOS
> does not allow changing this setting from its menu, so we need to
> use the grub setup_var_3 command form a patched grub.
> 
> Note this requires your Asus T100TA to be at the latest v314 BIOS version,
> this has not been tested with other versions!
> 
> Download grubia32.efi from here:
> 
> https://fedorapeople.org/~jwrdegoede/grub-efi-setup_var/grubia32.efi
> 
> Boot this once and then run:
> 
> setup_var_3 6f
> 
> If the ISP is not visible in lspci this should show 01 as value
> for the 0x6f offset.
> 
> Now change this to 2:
> 
> setup_var_3 6f 02
> 
> and then reboot. After this the ISP should be visible in lspci.
> 
> For more details on how this works see:
> https://hansdegoede.dreamwidth.org/25589.html
> 
> Note this series is just a quick hack, the proper fix would be to get
> the new drivers/media/i2c/mt9m114 standard v4l2 driver to work and
> atomisp does support standard v4l2 drivers for a while now.
> 
> I plan to take a shot at this as time permits, hopefully sometime
> within a month but no promises.

Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans



