Return-Path: <linux-media+bounces-11444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6848C58E1
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 17:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 862D7B21A47
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 15:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399A717EBAA;
	Tue, 14 May 2024 15:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HDXcR84n"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1DA1E480
	for <linux-media@vger.kernel.org>; Tue, 14 May 2024 15:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715701146; cv=none; b=MU7P8Qiai+o6b/PIWJBmP2oONUjHa46Q+AdGwoXB7V6Vx6N1U5evMAE6F0RSstiF8zM5c5rIA3CayhqP0a5SYZOdn3LOxbl4fhcpdCpmJbLmmUtihoq2hkAiZ8kgoy/KkYnU+V+uHi6qvz7DYuFnthCy7df9bbcQ3DN/7KoYuEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715701146; c=relaxed/simple;
	bh=iAbHNd7mgRq7oUO67Du6wjpeeQPoT8tIG4U0JNdY+v8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r8T+l4sPVTd/wdXomxf2/YWhH/W1BV9vZJ/aEQoHJ8sYidsdTUAFrS5mLrW9Wbftd7F/1WNyKvBGDg3HaWSPGLL9uOld1gtsQtPWqgioHfdYQxfhAgvTxPOJ4f5+URl/rcuGgf/tcH21nbUwuYRwVtmh9ZdBs3c9WoP9Ut2Dpts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HDXcR84n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715701144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rbW4AqFrMaISOC2LX0H+2PlSbMomBOm3GeVdMfM6+Gc=;
	b=HDXcR84n96di2IvP6v7EiFNh+3w4wRwtDsF+hye6mCVolJen/G10axtvjMWRm8YwMX1o0j
	OK+9G+3i6DIm6MkkncXw2wQoJtHwLxiMq5wy0EGrfhlz6M3vdPXODE5eTwd6Vk85qnQz+E
	/oNmAaCYOYcmL8HtE4LHqlnGqSsztq8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591--y0tBb2GMjq4I2ZnHd8mlA-1; Tue, 14 May 2024 11:38:47 -0400
X-MC-Unique: -y0tBb2GMjq4I2ZnHd8mlA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a59ad2436f8so359990366b.2
        for <linux-media@vger.kernel.org>; Tue, 14 May 2024 08:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715701126; x=1716305926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbW4AqFrMaISOC2LX0H+2PlSbMomBOm3GeVdMfM6+Gc=;
        b=KaeahzZTr/m4DAGg3g9w/pDndYJp7nmi1y82x4j+5Jl+xG2RgT6vYWzDc44MAWfvKE
         2MzI3TvYtCwGA6QgcpHdjmpfUj2WF2A0rSGoeaeNn4GLnvUckeV4VDFnifuF/0ZP+V/n
         V+mLQu7RtnDDBG3fZ7E+9i36TZJew3drkMCcPlg6ByhyKpYA7E/cWNT92+/D+jgenge+
         FKlzpAzg4l6wTkdQDr8lPXbUPS2ov4jJLz6o8YxA5IqOna5EeLLdHj5IKR765aKnrmJ7
         1t7luW4Nt8WxTDRs9evtd6/fzQbp1sGJuR5HjghW3QcK0Edfo4uCQf/EL1Fwd5GWrYf8
         Er4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUMTN7ORWgDL11Sg8EV4TR6m+bPzubrxQjeRQLFWxIxDP1B2Hb+SS+cncZKiidxGeoQBXglqgbfBNJSqKBc5mokZ5UjqUF0Aqp3is=
X-Gm-Message-State: AOJu0YyD9cPftdyb4fkDlNlcD7G/noCtYw2pwuas5pLhM4TGcNaYWfXD
	79+pyG7qICZcVRTkuwHAxAdFegTppLiJ35oFr6muhS7Syp0riQgMyM9LQy/TnJDftidCzZwsyHd
	+kkMHMuPGa56o/0cPps2AcqFAYBdwbgS6w7QdcGZQu2UI46AGZtcE2KQ5l3pv
X-Received: by 2002:a17:906:8315:b0:a5a:d6c:a30b with SMTP id a640c23a62f3a-a5a2d65f265mr915834266b.58.1715701126594;
        Tue, 14 May 2024 08:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpzNVie/tGXiTgKB6/FpHbCOQeaspSL5sLUiSvss9/S6ulsnG3niwPgLtjnNrjiabiLgi7TA==
X-Received: by 2002:a17:906:8315:b0:a5a:d6c:a30b with SMTP id a640c23a62f3a-a5a2d65f265mr915833766b.58.1715701126281;
        Tue, 14 May 2024 08:38:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c80f4sm743539866b.142.2024.05.14.08.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 08:38:45 -0700 (PDT)
Message-ID: <d2d71851-691f-45cf-9d52-1d16ede09b2b@redhat.com>
Date: Tue, 14 May 2024 17:38:45 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: ipu-bridge: fix error code in ipu_bridge_init()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Bingbu Cao <bingbu.cao@intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <f468c4ac-0629-41b5-b5d1-e26f70e44800@moroto.mountain>
 <ZkN2Ow6hASmKvHlz@kekkonen.localdomain> <ZkOBaUW1uLw6ildS@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZkOBaUW1uLw6ildS@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/14/24 5:21 PM, Andy Shevchenko wrote:
> On Tue, May 14, 2024 at 02:33:31PM +0000, Sakari Ailus wrote:
>> On Fri, May 10, 2024 at 06:43:31PM +0300, Dan Carpenter wrote:
> 
> ...
> 
>> Neither IPU3-CIO2 or IPU6 ISYS drivers should be of any functional use
>> without sensors. But the power states of the devices could be affected by
>> this: the drivers should power off these devices but without drivers they
>> maybe left powered on. I haven't made any measurements though.
> 
> FWIW, Hans mentioned AtomISPv2 case with somewhat 7W consumption on top of
> the idling machine. That's why we have a stub driver in PDx86 exactly for
> the purpose of turning it off when not used.

I'm not sure if I ever mentioned the 7W, that seems a lot. But in
the atomisp case the SoC will never reach S0i3 when the ISP is not
properly turned off. And in this case the ISP is special and just letting
PCI / ACPI put it in D3 is not enough it needs some special writes on
the IO-Sideband-Fabric to be turned off.

I don't know if something similar applies to the IPU3 / IPU6, but
the bridge code is used by the atomisp code now too. So at a minimum
if an error gets returned when there are no sensors then this must be unique
enough that the atomisp code can check for it. Maybe -ENODEV ?

Regards,

Hans



