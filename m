Return-Path: <linux-media+bounces-32122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF45AB103C
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 12:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 148F67B277B
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6D028FFD5;
	Fri,  9 May 2025 10:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K+qGMvhQ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C9E274674
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785645; cv=none; b=OzcLRos1aTZM5whZ5RQRZT71l5SafQuqZXNaPsqAFe5wrR4IB+FgTeyf8MSxNTZXzRFCnF5FL2Q5b9VulTaNyWFXs1e0FlnpenR5ckMeCI/TndtKButA+3LuSVE51sIFPPoUPzL8Mkb0nFh/n2paSsFtiqpTnSmYruEx7kHWjIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785645; c=relaxed/simple;
	bh=jIFULH29n9ohDpIg7B5mktnW4yj7q0CcKNXk6QR88Rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EYNyOd+DQ97mVWiXczVFzsNSRVYBEpaD8cXxZgyR059LdSb1fxC+QOvIMYH61JiQuxMKk0kY29mBXv1QgT62ruLxvgIWTJChc0JI76Wm5WDpktQpL13TCVO81e6nIvPqU17tlKaN9/YVaPRFnepmGmyR2DaeiHBxSkmBhMe2jp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K+qGMvhQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746785642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GM2KWriALW+W9HfotpcpJD1T2peJnzHoZks3LlUgcpg=;
	b=K+qGMvhQJhdlDsKNkQKJR7yZ+yvIOJ/XBVYRkZiM03uCuZXK1JMVQjbpkyshF9/+/Wpeug
	E7B9A79Weqk4dgmBx3bqQX0GHMfaAVUE7K78LK4K7K5yjcpRlZOHiIfdOpv4e5LmJd+N/B
	PCSSD1LB6G5u4BMcro+9kM0zNJVS0k4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-RrJ2CqSeP5ih_7kiccn7ww-1; Fri, 09 May 2025 06:14:00 -0400
X-MC-Unique: RrJ2CqSeP5ih_7kiccn7ww-1
X-Mimecast-MFC-AGG-ID: RrJ2CqSeP5ih_7kiccn7ww_1746785639
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-acbbb000796so156957566b.2
        for <linux-media@vger.kernel.org>; Fri, 09 May 2025 03:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746785639; x=1747390439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GM2KWriALW+W9HfotpcpJD1T2peJnzHoZks3LlUgcpg=;
        b=xLBwZxZ/NJcrNKxAh6Gc4s7pbXEwFDSCn71m+eTGjCbZnYbEAz/C2M8kN1w3XObCw/
         pLsOAWPPD6h+sTzQfBYe27NyUDhdJdVp+zPqO3uqsFhHB661oxc5EEYq1+St/MKz4aia
         Qoi7yOS24FNwWZG7jmsjtegLMysDPvHNWS9PIpb9D6sERnvrQkl0OOt/hXPFu+G8wFyu
         2luIZy+08pcIUh/ySj8eKWWHMNp4c4GoPBsjOpd3Ney79F73ED8WdJwtBVl3HHfSI4tj
         oK7BVr5/XETtYQO7iW3Ka2ZKwOjflA3bXz/VsRshjCBR9N94q3FtVxjdej9Fuz+ssFBF
         t8ww==
X-Forwarded-Encrypted: i=1; AJvYcCXOjdw/X8s+FDp6R85EBZRvYqlxt+523jVjMGp+G02Q83zbZf7vS/TKy0KDIip/vZaOuyxs11GEh5oFtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6eG3D/8vVgBtyPHdVggQlxAK8ts1l5E6RYJK5JBJDDrE57Yow
	XgwWV1YSt9xNmXOnfjtNcP9kLdAP//Gnu+hxQFWcTOym1e0j4wXMDI/4Sv9k5f4Tx2ahFrsWPjm
	/udZesS/4tJj0IL6o5RCkmON3wN5dgSFmlycJXndqNLnRLEmhf8QTQbK6PetN
X-Gm-Gg: ASbGncuS++5CWo7jn5fl8ImSBzITvIOEEZjI7ZT8P04TPcqBzBPKn/Gk1DuCdReRdzV
	YtIAMSurN7b1NZXd6n0ZJ9Tab3iQKafGnh3tOXvuihZC672Y4h6gyw07wf8CFhh5nQ2JRjvn0Fe
	MmOXaxpvKBUizLoIIbvhjcKXdU8MoWOWt90uFkuvxBxzF3eCx2jrVq3YWHVoUQb/C8MpFUSAJ/c
	jg1Tp8qQMS9YQk22MBn2ae2z7uWrDfMi2HdPd1DAK5oS4MHIXnGnHQrMZrYquv1B0/ZBLuVFLm1
	b+2h0jI9RJp5XAVEteAIaeKdxpmw3Ta1qbhMwFsfgysgoMg4/hH174gJKxRV7kHoHd0E//+Ru0S
	fwnuPJaRf9tTYgdBIJMn9JHvz0zZgLlyhJYCJsyvVeIvy3NfnUBnlMGnj5t6OtA==
X-Received: by 2002:a17:906:bf46:b0:ad1:8e78:3d79 with SMTP id a640c23a62f3a-ad218e74716mr274070966b.1.1746785639222;
        Fri, 09 May 2025 03:13:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsp4BhbDz9mA6jOTGQzDEG3h8r/qbviEyrVh2Em1urIyarrCynyQZY5bw0q2/wqav4cdbwyQ==
X-Received: by 2002:a17:906:bf46:b0:ad1:8e78:3d79 with SMTP id a640c23a62f3a-ad218e74716mr274067766b.1.1746785638749;
        Fri, 09 May 2025 03:13:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21985342dsm125832766b.169.2025.05.09.03.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 03:13:58 -0700 (PDT)
Message-ID: <7c4d419a-613c-420e-8885-01ebb006f345@redhat.com>
Date: Fri, 9 May 2025 12:13:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v4)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa
 <tfiga@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Steve Cho <stevecho@chromium.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>,
 Maxime Ripard <mripard@kernel.org>,
 Stefan Klug <stefan.klug@ideasonboard.com>
References: <f6d44024-a78e-42b8-971a-797ed8fbb1ff@jjverkuil.nl>
 <aBjYnrvg-_T-7xRi@kekkonen.localdomain>
 <20250509094005.GA30047@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250509094005.GA30047@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-May-25 11:40 AM, Laurent Pinchart wrote:
> On Mon, May 05, 2025 at 03:26:22PM +0000, Sakari Ailus wrote:
>> Hans, Laurent, others,
>>
>> On Fri, May 02, 2025 at 10:15:27AM +0200, Hans Verkuil wrote:
>>> 16:35-17:30: Hans Verkuil: Status of Media CI/Multi-committers
>>>
>>> Please reply with corrections, questions, etc. to the agenda.
>>
>> As it seems we might have a little bit of time left, I'd like to propose a
>> keysigning party we haven't done for a few years now. We have some new
>> people here and the folks who have been around for longer have new keys,
>> too.
>>
>> This is what we did the previous time
>> <URL:https://lore.kernel.org/linux-media/YxhplLKtRAQzlSK/@pendragon.ideasonboard.com/>.
>>
>> I wonder if Laurent would like to do the same this time around. I can also
>> help with the arrangements.
> 
> I don't mind signing keys, but I won't have time to organize it. Feel
> free to take the lead :-)

Embeddedrecipes will also have a key-signing event, see:

https://embedded-recipes.org/2025/attend/

So it might be best if people who want to have their keys signed
just join that ?

Regards,

Hans



