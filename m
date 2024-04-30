Return-Path: <linux-media+bounces-10447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F15D8B74E4
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 13:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 994631F228EB
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 11:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4F41311B0;
	Tue, 30 Apr 2024 11:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TWLAD5pb"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B9813C9D6
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 11:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714477896; cv=none; b=fdET3D8FnNkAZOZxHzTQPOmO94EGpe1LRWsrhkQ58TUbko5SUswkSvgYwWb4v8FXuzrsJ6jCvODWVSEVj5n+DHXzQIswe5jpF5nD559bI8KGtCCeM/JA2ZxjFL/TLKvaY5Sw7EiiU1e3zG1iAJGcgg7PD5dizjT3ObtYTG4RXVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714477896; c=relaxed/simple;
	bh=TjL/wOQ68tW1Zas2AZHYmm43crtHIl7dNu5Msz4jQFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUwVsPHShzmTUdWwiJXAeTyO8CQvqa8IMowS6Vyp4Orr3T2+JLmn3yDWaVReYr+MjILvHnthTtzppPg9tE69OymLCF69z3LOtC01b3Lvpk7RKxoeeM5nFCEnOrJzvtlLuxtWmsqiYKDkAdT4qMUfQS633FX5NoiROsWL2Nzbb60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TWLAD5pb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714477893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=unDRZ/H095BgWrGSZDwHh57CtLQ3EbB9RhSsvsR0GQY=;
	b=TWLAD5pb/90np4kr0hknB+pCKSM8qullTKWse6z9nxUP3ukDRJPqQewV6gMBKjSpQKrNtH
	UbNGkvgsMzlYN99W4woNL0k5XdGkovU3q/7jbolTTN51punUkOBMNpkyw3KW1MS4YoeyHw
	HOrJ1tuSm4qxNqHFdzAHuHLKZvYLWQU=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-uq2Wtt-KMRaj3UAfy_w0Fw-1; Tue, 30 Apr 2024 07:51:31 -0400
X-MC-Unique: uq2Wtt-KMRaj3UAfy_w0Fw-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2db6fbc1dedso53769001fa.3
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 04:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714477890; x=1715082690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=unDRZ/H095BgWrGSZDwHh57CtLQ3EbB9RhSsvsR0GQY=;
        b=nlthiIL2BduqwMfaV/57HLIbSCRfYtpHXzU/S2IthpIr44VvX11gKlj00vHPbmPJPq
         sbevRmhXOheVAJw92o0VhoMu0CEY8+0QNL5G66QiHJQi7mZIDE5eIr+6ALleXeyXMwmi
         dtrwMecJqDzG8/rGX2hRpljYMnRQ7ah2ph2UWjeHeppaiJ/EDpr6OR1zsw+mzZ1pkI0m
         QHc5VjyTvhnxntJGbvrlGDuq981Jy3QxKPMV9On2IWy29XuVyVXioMJUIxw6bSS6J2oK
         qx0bkha1bglEFHmQv2IMxJWpJiVEVMzotlRNt088sB21ajyXLyO8gpDzAvNcLxQRbJfc
         YguQ==
X-Forwarded-Encrypted: i=1; AJvYcCXat3RzFoyytHMIFLt7+cSO1HYstN4aFRpI93GF+/DKoHl7IffQ2J3JkH0CbiZ1EXVEW4mmld4XN8sQYAt5sw1n4a3Z5HHrVsDnq9c=
X-Gm-Message-State: AOJu0YxkoVPiWqYWI4vl1i+roFaVZ/QsV2UXQtrqesT7hYuf9kqCftxe
	gRvF2MYYElwZXle4dLh/uUTKP/6Ee+Fq5BwFNQCciH0id/bCHKngEhq5vGbN5P022Dl0G2kuNwQ
	AgMfK91/d3fWqqZmRQ7sRb65E+JgaCJNURHoKryu+V6hk3v5I3QIAx0HkAUv2
X-Received: by 2002:a2e:9008:0:b0:2db:a9c9:4c5e with SMTP id h8-20020a2e9008000000b002dba9c94c5emr11399952ljg.21.1714477890058;
        Tue, 30 Apr 2024 04:51:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeyhj7KHvw3CC5G9UFMQJaaFfHWxZ+LlhMjB+MIcLsHysMu2B4a4Oz0DQJy5ZUcDIIreV1Ew==
X-Received: by 2002:a2e:9008:0:b0:2db:a9c9:4c5e with SMTP id h8-20020a2e9008000000b002dba9c94c5emr11399933ljg.21.1714477889682;
        Tue, 30 Apr 2024 04:51:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dk18-20020a170907941200b00a58ca98bbfbsm5181086ejc.30.2024.04.30.04.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 04:51:29 -0700 (PDT)
Message-ID: <0554aa94-1c72-42f3-bc4c-e4a9d25f4aad@redhat.com>
Date: Tue, 30 Apr 2024 13:51:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] media: atomisp: Add support for v4l2-async sensor
 registration
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, Dan Scally <djrscally@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230525190100.130010-1-hdegoede@redhat.com>
 <5dd589f7-d0a7-f453-6835-227013db09fd@redhat.com>
 <20240430113254.4539f575@sal.lan>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240430113254.4539f575@sal.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/30/24 12:32 PM, Mauro Carvalho Chehab wrote:
> Em Sat, 27 May 2023 17:54:18 +0200
> Hans de Goede <hdegoede@redhat.com> escreveu:
> 
>>> Patch 5 also depends on all the others, so it should also
>>> get merged through my media-atomisp branch. Sakari may I have
>>> your Ack for this ?  Alternatively we could delay the move to
>>> the next kernel cycle and then it could be merged directly
>>> into some other linux-media branch. Either way works for me.  
>>
>> How to merge patch 5/5 moving the gc0310 driver from staging
>> to drivers/media/i2c is still something which needs to be
>> decided...
> 
> Hi Hans,
> 
> Any decision about that? patch 5/5 is still on patchwork,
> marked as New:
> 
>  http://patchwork.linuxtv.org/patch/92153/

Sakari wanted the gc0310 driver to be polished a bit more
(adding link-freq, etc. controls) before moving it.

I have fixing this on my TODO list (but not very high)
and I've dropped the patch to move the driver from my
personal branch for now. So I suggest just dropped this
from the patchwork queue too.

Regards,

Hans



