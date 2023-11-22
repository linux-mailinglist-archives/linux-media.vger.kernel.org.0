Return-Path: <linux-media+bounces-832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 590827F4994
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 16:01:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6A74B210C8
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 15:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B324E1C0;
	Wed, 22 Nov 2023 15:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z5+AE8uS"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9FE1A5
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 07:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700665269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=96/bYOMkckwXGl4daiqikiy0LVZnyim6rmYgibvWgPU=;
	b=Z5+AE8uS36mAj4+13PWaG/g1tqJjEMfWnbI1kUJn8HKGiTrAdMT6efd2QPO2vDG/huvy8q
	SLO85Df16hTfRHhFgTGJBQtmwMzdsKZ5XH0CQD98MygePxqLIoAPHWx3re+pabnuO41BzF
	iSaDlTGOGzY75DMRbaBJn61gFlendcw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-8yp9RzJeOriQQkJj59obXQ-1; Wed, 22 Nov 2023 10:01:02 -0500
X-MC-Unique: 8yp9RzJeOriQQkJj59obXQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9fa63374410so322394366b.1
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 07:01:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700665261; x=1701270061;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=96/bYOMkckwXGl4daiqikiy0LVZnyim6rmYgibvWgPU=;
        b=s2bU6HtXa+Z0bTgrU/7nGh6q7gZwZnMt4b/x2fCLiTnUP+C4LiL0ycYuj04EtsfiEV
         +333RHPCJSEgB79sLyLSitwo3jqtryku7JAWYC5ou5hsOBOPD0MKKhpRr7DmGnUHOs8h
         hpyn7aceJtsp/iNUfxprVPIRlAudES37+SInBTrjEbJzyTOO3qOw3pSDDHsoPuvEsC1l
         PiCsS6WpPryp3qDMT5Jn1ZmI90i+GlBzvibKFl4/JldI7XlzNn4ns7vq12QuUXLB/Ske
         3btu4fswrWbBr5h7kbEDrRkmnUMWZaoqd1Uqd0aIC0/QJLYhNjq5IEIF4honeYM779uC
         27xg==
X-Gm-Message-State: AOJu0YzJJdHxN2BUTxx5mwg05J3jlnLKljETCr8C+Cx0X+Liq37QvKmo
	gwzu3GUjacNnwBAkHYO9eFggqFioegv0GUxT9wNAmXQp8i+956FW1s7lHai5wIyF4cyN/6cvBgx
	1+jqxMMndVwjzw5o4/r0XR8w=
X-Received: by 2002:a17:906:3f45:b0:a01:9985:30d9 with SMTP id f5-20020a1709063f4500b00a01998530d9mr1912172ejj.12.1700665261076;
        Wed, 22 Nov 2023 07:01:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGV/1XAdhyIqoR6ZATKWL5ZoBPhMct4ijUH9PHOwSBvrW2SVpskq9f6fH941020LzsO9REHXg==
X-Received: by 2002:a17:906:3f45:b0:a01:9985:30d9 with SMTP id f5-20020a1709063f4500b00a01998530d9mr1912151ejj.12.1700665260731;
        Wed, 22 Nov 2023 07:01:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y20-20020a170906471400b009db53aa4f7bsm6756771ejq.28.2023.11.22.07.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 07:01:00 -0800 (PST)
Message-ID: <a887888f-3427-415a-a490-141a521e5a7f@redhat.com>
Date: Wed, 22 Nov 2023 16:00:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New v4l-utils release?
Content-Language: en-US, nl
To: Gregor Jasny <gjasny@googlemail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Sean Young <sean@mess.org>,
 Hans Verkuil <hverkuil@xs4all.nl>
References: <12b6687c-2517-4844-abd4-1e64f83c27b6@googlemail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <12b6687c-2517-4844-abd4-1e64f83c27b6@googlemail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/22/23 13:03, Gregor Jasny wrote:
> Hello,
> 
> do you have any objections or blockers for a new v4l-utils release on the upcoming weekend?

No objections from my side.

Regards,

Hans



