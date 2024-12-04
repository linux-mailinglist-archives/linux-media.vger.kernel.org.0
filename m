Return-Path: <linux-media+bounces-22623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 236369E3C2D
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 15:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CB8FB33D09
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 13:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AEB1F131A;
	Wed,  4 Dec 2024 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BbhAeE/0"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCA31E1A3B
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733319989; cv=none; b=Kmf4VUjUoGHPIXQBNKfwvIWbshel54an1cuwW5zIQKsaeocgL5TspB4A+EAlkTfVYfGck+oBUXKxDmFUrf65ZTqnqd8K3+z+plnowA/FqAastELsQAm6zJa5wArtl0I5iEKlT3vSuEXb1y/J1DD9sl9nI7ThZ8nQlhuY/QNQfBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733319989; c=relaxed/simple;
	bh=Cbw6URr7BpchOgGvOsnvOBm3jM/gD4ppQ0a/dAj4D/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a2hYtmLobj/L/7Lun9gKFskemEBSKwKI2hMj2dC0MO2mnr56nRuQtbHyD8oQ0aZ7auWQRuJsGLCjcckgXCYZfbvTey/2rNr/FoDbwp7C9pIO7tHkn4nuSuIIGrof3LEgJ9tCP55z8GroNDDQsN3fWbaUR6X2vwUQ+Tgov4yXcsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BbhAeE/0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733319986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WBQV+/reYDzQHVW2bMORUzTYkYet838A4ueVXpJ2mu0=;
	b=BbhAeE/0ashp5iFMkmIabxGvjloM2WRStsCP241H7p4yEw8ZCjK9HwXVZbpL/tG4ygCmGd
	B0DEB/ImOX2lkYkfSZnjVBC141OVzqG554V5E88Pg1bhFNPoICO/4stmHRXVgRc5ak9F5A
	+P0jqxiTPVkJgpFmXeFVNiegm1p0vx4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-FCoNhlCMOmiIKzfVVrjQJw-1; Wed, 04 Dec 2024 08:46:25 -0500
X-MC-Unique: FCoNhlCMOmiIKzfVVrjQJw-1
X-Mimecast-MFC-AGG-ID: FCoNhlCMOmiIKzfVVrjQJw
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa5a0a35384so389340166b.2
        for <linux-media@vger.kernel.org>; Wed, 04 Dec 2024 05:46:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733319984; x=1733924784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WBQV+/reYDzQHVW2bMORUzTYkYet838A4ueVXpJ2mu0=;
        b=k4QlZp/9Yr8BOmNE8l6N72cNXqrHcWXAD66qheMgt0jy8duVgSidxUeiaeHtVweVF9
         ipRZSylFKliwxgBNN2MV4J0C7F+0bwhmyh6uBMgQNDdynROZPziYoC0Ma7cln0j2X6ee
         LeEX2zvrr4PDv3oWe4+MEX9AyDd/R74UO9b8o9JP8tasHeg2jFl1lqzh/Y/KkGBeRAib
         1zQ5uPET7A0vezUigR1UCIVzMsHtgIoOYVg2Zc8jshvKZBKx+YyxSXZyNMKSEHPQGZOB
         JzUZNjijnBCuGa6gZW8R74g+tgqQN3APJDi1aoSMeyX2SIwjQRRqWhuvdGaaNTJYO3/O
         G2/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjfyR9UvgeDW71FnxrvFGZiGtlmyqZumdcMTJ5vMKN58FOEj4yC0QNqG8iAlEl9EJAyAII+2DXlcqIqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBWiXhQazp4E8HT3PtuaX/ZwVxkM8hNcqdU50DhRMoVpbsi7+A
	ZepiPAUsPGpLDJHqzF1rVtEM9X509LN7XLpCslylmsIX8O18z6xxeSpyT1twdZc08O8kVI4CxYZ
	BeFse5D6yDNLXjj9SCjT+whQL/0iFSknVgJuhmAfmqCvX1LP3fN76HSZC84v2
X-Gm-Gg: ASbGncseqmKf2w10q7PUkFJ9l1h4qcRePehi3lMuLWaVqrY6csAbdGcJQnVs1sqeXWQ
	wxDr2G2u7eY/xdnOmgDPrnioGrfhKlckB5pRwPwmC4jv65oHi1hYdBTpDpCNIndvuG/x35qwY1j
	A8V3EL1nfwyMXgLCFv1FIwBbaWOt7NxdLtK8n76ccqTVNKo6OCq8lRy025m6iYHSpBln+F81N5g
	O8+/BqAIJfCArYaTBBnYvzN/08VgaTlC84LaqXrDBhGC1iytPFqDGeewE/VYSWnmHGcFqsvql3P
	eaLteja2rCTFReY9DVZ7iqi2qc7y8iDtH4mxfbfEsfs3k+r6TNdhHo3GTujwBGooDt22Ke0iZ3K
	oJ2SZzD533mZEADY305vT9y9M
X-Received: by 2002:a17:907:7842:b0:aa5:14b3:a040 with SMTP id a640c23a62f3a-aa5f7cc2e89mr671378266b.5.1733319984319;
        Wed, 04 Dec 2024 05:46:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJSFHFdnQSI6RXejuptvZDyxZwz+jBIMo7QA5Sw245xohyQAA0QRuXSgUOrjTafewvvQXSsA==
X-Received: by 2002:a17:907:7842:b0:aa5:14b3:a040 with SMTP id a640c23a62f3a-aa5f7cc2e89mr671262266b.5.1733319973080;
        Wed, 04 Dec 2024 05:46:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997d56eesm733692966b.81.2024.12.04.05.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 05:46:12 -0800 (PST)
Message-ID: <76c867e3-f13f-4afd-93be-639616dc9458@redhat.com>
Date: Wed, 4 Dec 2024 14:46:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control owned
 by other fh
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241129220339.GD2652@pendragon.ideasonboard.com>
 <CANiDSCsXi-WQLpbeXMat5FoM8AnYoJ0nVeCkTDMvEus8pXCC3w@mail.gmail.com>
 <20241202001846.GD6105@pendragon.ideasonboard.com>
 <fb321ade-40e7-4b1e-8fcd-c6475767239d@xs4all.nl>
 <20241202081157.GB16635@pendragon.ideasonboard.com>
 <445e551c-c527-443c-8913-6999455bd366@xs4all.nl>
 <633ca07b-6795-429f-874d-474a68396f45@redhat.com>
 <CANiDSCvmRrf1vT3g9Mzkc790RUo3GuQaFzu5+_G66b3_62RuXw@mail.gmail.com>
 <839446b3-1d16-4af8-997a-f2a37eb4711e@redhat.com>
 <CANiDSCszkv=YQPJOSE8EarXWPhZxkk-KR9enLScUOV_P0nzTCg@mail.gmail.com>
 <20241203193251.GA4242@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241203193251.GA4242@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3-Dec-24 8:32 PM, Laurent Pinchart wrote:
> On Mon, Dec 02, 2024 at 02:29:24PM +0100, Ricardo Ribalda wrote:
>> On Mon, 2 Dec 2024 at 13:19, Hans de Goede wrote:
>>> On 2-Dec-24 11:50 AM, Ricardo Ribalda wrote:
>>>> On Mon, 2 Dec 2024 at 11:27, Hans de Goede wrote:

<snip>

>>>>> Note that if we simply return -EBUSY on set until acked by a status
>>>>> event we also avoid the issue of ctrl->handle getting overwritten,
>>>>> but that relies on reliable status events; or requires timeout handling.
>>>>>
>>>>> 3. I agree with Ricardo that a timeout based approach for cameras which
>>>>> to not properly send status events for async ctrls is going to be
>>>>> problematic. Things like pan/tilt homing can take multiple seconds which
>>>>> is really long to use as a timeout if we plan to return -EBUSY until
>>>>> the timeout triggers. I think it would be better to just rely on
>>>>> the hardware sending a stall, or it accepting and correctly handling
>>>>> a new CUR_SET command while the previous one is still being processed.
>>>>>
>>>>> I guess we can track if the hw does send status events when async ctrls
>>>>> complete and then do the -EBUSY thing without going out to the hw after
>>>>> the first time an async ctrl has been acked by a status event.
> 
> That sounds quite complex, and wouldn't guard against the status event
> being occasionally lost. I'm more concerned about devices that only
> occasionally mess up sending the status event, not devices that never
> send it.

I did wonder if we would see devices where the status event is
occasionally lost.

I think that patches 1-4 of "[PATCH v6 0/5] media: uvcvideo: Two +1 fixes for
async controls" solves the issue at hand nicely, so lets go with that.

And I hereby withdraw my proposal for a per ctrl flag to track if
we get status events for that control, because as you say that will
not work in the case where the status events are missing some of
the time (rather then the status events simply being never send).

Regards,

Hans



