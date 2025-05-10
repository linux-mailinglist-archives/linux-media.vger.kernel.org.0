Return-Path: <linux-media+bounces-32224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A480EAB241E
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 16:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14D0D1894A3F
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 14:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE57D22A810;
	Sat, 10 May 2025 14:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JjclmTeL"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BEA29A0
	for <linux-media@vger.kernel.org>; Sat, 10 May 2025 14:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746885853; cv=none; b=nbl6slPOpDz/keF8yulDfJS/k1RTbBAMPoOPHcqFHerJOWm8zXA3R63MtEC0lH/qscabzPxiIMYiVr+MXsRuJYcY+FBtqeImE7G0gf4lQulG5EiL3IIPamEPm4G+muemC/EqHH+yY4JeHw7MyUH4rs16i4HIBBEwzmJsJ29AyCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746885853; c=relaxed/simple;
	bh=tfBlFx5UTwLofeVvG+Tq+sluO0N7JCqZT5KSlPgHFkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tm1sn/bs91SP81zOIqN4kvVoWUnkBrCoRLHhMhTCakE/K88d44YGw5XKCc/e06/PiafhLg6zWeN31SF0SLVAbUBmOecAj/EB/AKu+vsDnfGxVSvj4tvufEDLyI8XZu6IeKfqvp2pOVySL4QM+aCjerl/Xq+Zi2UGYHWm+nP8S8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JjclmTeL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746885850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nGXWi5lBfz2luuIFnZqGx+wx3rhbuLqZVC/2MKYQV38=;
	b=JjclmTeL0CBxrEbbnWEr5yCoxMGIcVdecVWseICRWC+GYjagpKRxmbasRPDJU0WqPzrOxi
	aOk6OCcDT3SttK8g9XLg2F5sRDUnlrCM7+yz0AJDNRrc8OfB57xCMBJRKx1PeGr/Y91AVM
	I5sB1DGYE/usJIcTsot9lsJBMGFmaSc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-40KMhGO3OnO0G5snRvt_Bw-1; Sat, 10 May 2025 10:04:07 -0400
X-MC-Unique: 40KMhGO3OnO0G5snRvt_Bw-1
X-Mimecast-MFC-AGG-ID: 40KMhGO3OnO0G5snRvt_Bw_1746885846
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ad222fd3f2cso126722266b.3
        for <linux-media@vger.kernel.org>; Sat, 10 May 2025 07:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746885846; x=1747490646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGXWi5lBfz2luuIFnZqGx+wx3rhbuLqZVC/2MKYQV38=;
        b=BN0MyR7kwCAKX2ah1jAFkK13KvcKJ7cuf+mh8G92pL5Fk/c7kd5d/7vU9Ql1CkIG92
         H++Wl2zEmr/JwtzEgXnaM9Lshmw7IZzBm7M8BoJDrMp2DG6BX/cwLou++upR+/PRnFMz
         +fCAPiMwHMDQDZdUYL8Yy3wm1dg7Df0PktqtEpuEf5bzhZFKpTMz7mejDuCC+BmcMA9R
         mdZXe3oXFixu/aqi9vw7pEYv27eA+YZ0K2LD6oUf+lkLj9UdkyF+pJBUhVb6TkS4D6WT
         /UKege1Xn6SIwMLKth4hSgVwbCQ5Zv92KnCzuVzRAAMj9IV/FeeDDiIjtLPyclElV/ap
         JHYA==
X-Forwarded-Encrypted: i=1; AJvYcCW7w1E1WaRla8UzOisGz6sB7PoU6sPSUEoZo+maJMB9bJGviYbxqrK1fTuaxbSXmGIxgW2aqSM7lMdsPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFt/IhLtixd7MClrsvg9Iqy0mdfNr1CusXbDYbFN1i1slvLCc+
	keJnWoUnOeN3lJGYiPiYh3mFNwxxKN/FQ+eVhPab9gRk6YbnxvkZpsNqIwxE0N+jo69h/jcgEpR
	S1QOk+xVCNIepW9sYBLoSboIYml4mwR9JzQTArno0Iem9XyJrWLBlkNv8e0/xbY8zQ0/U
X-Gm-Gg: ASbGncsbyZ9ubHUcrVCaLsMa3c4v/hPVMh6sPwSuRk4DtER2dq5mg3DNFOH2HOCPoga
	RKbPz3CbVw7Gs7N5VMeHaItyvAfuRt3DRftPJ+qe1bmEDo1T56igoMcYQAVeHMDjzGALTsjVELZ
	Z8cHk2MvAlBDAl94TLn0Y8xWCR0Z+jhb3s84QVcmSbGmCZpv/1BQloCb/jbZv7M7iMw+7ZYzsWv
	nZBV7tFRFm3O9poTNapgpVj46D5TJ6DwCLmMoyVYKc/RfQC2ms9Ezm5lEbuaY7dYXw4D+o1DN5+
	erYt9bDvmcYP9wEZ6YX2QslTLSzu1zmp0dwqpyXUHE62VS5wNBCIxP9OPJyeI5Dms+Bo5RXyu8m
	qdxowVwrPQ+L7o7mphGx9o05/r5QXlgwP5aV2y36VpgZU4XYRw8Mi4dcw7UNeGQ==
X-Received: by 2002:a17:906:2517:b0:ace:50e3:c76c with SMTP id a640c23a62f3a-ad218ed63d4mr499270566b.21.1746885845736;
        Sat, 10 May 2025 07:04:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYTMmBAEAtxTsKau8BdeNwdjJaKLnwsDI1zqP0RtaIwLJoEzq1ZO60yuioX4N/x0nIARu0nQ==
X-Received: by 2002:a17:906:2517:b0:ace:50e3:c76c with SMTP id a640c23a62f3a-ad218ed63d4mr499267766b.21.1746885845305;
        Sat, 10 May 2025 07:04:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21988d43asm321009266b.178.2025.05.10.07.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 May 2025 07:04:04 -0700 (PDT)
Message-ID: <c35ceb0f-167a-47d9-88ff-41837f75762b@redhat.com>
Date: Sat, 10 May 2025 16:04:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] media: mt9m114: Update hblank and vblank defaults
 on pixel-array format changes
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
References: <20250504101336.18748-1-hdegoede@redhat.com>
 <20250504101336.18748-8-hdegoede@redhat.com>
 <20250509223808.GH19001@pendragon.ideasonboard.com>
 <aB9LEZjRdPBpjnKH@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <aB9LEZjRdPBpjnKH@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10-May-25 2:48 PM, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Sat, May 10, 2025 at 12:38:08AM +0200, Laurent Pinchart wrote:
>> Hi Hans,
>>
>> Thank you for the patch.
>>
>> On Sun, May 04, 2025 at 12:13:28PM +0200, Hans de Goede wrote:
>>> Update hblank and vblank defaults when the pixel-array format changes,
>>> to maintain 30 fps on format changes.
>>
>> I don't think this should be the kernel's responsibility to do so.
>> Sakari, any opinion ?
> 
> Generally drivers don't do this indeed. It's the user space's resposibility
> to configure the frame rate. Drivers only guarantee hardware limits are
> respected.

Ok, I'll drop this patch for v2.

Laurent, thank you for all the reviews so far. I agree with
all your remarks and I'll address them for v2.

I notice that you did not review 10/13 - 12/13 yet, I guess
you ran out of time ?  Also I guess 10/13 is possibly a bit
controversial patch, all I can say about that is that this one
is necessary to make things work in raw-bayer mode with the atomisp.

Regards,

Hans




