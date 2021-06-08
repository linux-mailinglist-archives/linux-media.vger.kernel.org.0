Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57FFC39EF80
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 09:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbhFHH3a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 03:29:30 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:37275 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229507AbhFHH30 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Jun 2021 03:29:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qW8ylrCJ5hg8ZqW93l7CNL; Tue, 08 Jun 2021 09:27:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623137249; bh=Q7hh9gRx3Ux+4QdoF45Yv4KNeVoIs/48lD80JxvEO2s=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FHI8svZ6h5MkTxZ3DfRgv0I3eig0DQmc3dh0WvYoKSz3tjWOg9VPCnmGye4Q6c5bn
         abbT0Z6EkLz7JZcdvPbA2OeHGjl1KHFtIU7Zsky9Brqjx74BFbtMuZKfhJchaFGWC3
         MsqOu3KslnDhpZtGbjgZ8Dfv7Svcx5SzHGm1X+jiRea6rTtRMdIJnnJsb/6EPAQPhO
         toDROQLKdLpIL+CX832WxLvOM5hnnEIHfBhErF372AleLmPDfgPepKQ8R+z1vWeXQJ
         Vt1GAKXm2LpnUETDMsN2REuvizBlPomh5y8FMMpg22N1KbXvNw/pMRM2OEMnX6FDJT
         C6b7H9SyBrChA==
Subject: Re: [PATCH] TDA1997x: enable EDID support
To:     =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <m3sg1uq6xu.fsf@t19.piap.pl>
 <dbb99d7b-18eb-317c-911a-b982486848fa@xs4all.nl> <m3eeddhora.fsf@t19.piap.pl>
 <CAJ+vNU0E_0pB-1T+VpdmjJNVirAwCUNjKVbEV4wEbqHOzURj_A@mail.gmail.com>
 <m3k0n57y72.fsf@t19.piap.pl>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e9acc316-54c4-0387-eaaf-18dfb4dce34e@xs4all.nl>
Date:   Tue, 8 Jun 2021 09:27:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <m3k0n57y72.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJ24cG//JXre495N2nXQjCXFY1+2ufdW66QbEWC8fkXL8mLZNED5sWy1vUK8+Gy6OtrB9vbELVwHRd2LTgDCWglkzqbUULJlAY/KQQfht3PlMtbTKTzl
 QORN8j+0aiqK0M0dn01KKCZgWI+sGkzxvKTS9eU+sZBjfX/deijhkGt8p8m7TJsVdTqvk+Ugz8Nki/7pS1nQUd+bpvH+iGJW9LMtCcuZHzFDye3KvH0v9D1P
 UhYjJVB6DlPZ4zovNArt/QdCMs+UOWKbqpSfjPpucREbbeMP4gG8SX6acNIsBjEM1348PIqaXNyeGee91t2gFFl88rdqPTt+QBERThSLMTQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On 08/06/2021 06:54, Krzysztof Hałasa wrote:
> Tim,
> 
> Tim Harvey <tharvey@gateworks.com> writes:
> 
>>> I'm looking at the previous version of this driver from Gateworks and it
>>> contains:
>>>
>>>      /* Configure EDID
>>>       *
>>>       * EDID_ENABLE bits:
>>>       *  7 - nack_off
>>>       *  6 - edid_only
>>>       *  1 - edid_b_en
>>>       *  0 - edid_a_en
>>>       */
>>>      reg = io_read(REG_EDID_ENABLE);
>>>      if (!tda1997x->internal_edid)
>>>          reg &= ~0x83; /* EDID Nack ON */
>>>      else
>>>          reg |= 0x83;  /* EDID Nack OFF */
>>>      io_write(REG_EDID_ENABLE, reg);
> 
>> Not sure where the source above is from (this was all so long ago) but
> 
> That's your gateworks_fslc_3.14_1.0.x_ga branch (3.14 is the kernel and
> 1.0.x_ga is IIRC some Freescale versioning) :-)
> 
>> my guess is that 'internal_edid' meant an EDID had been provided via
>> software and the else case meant there was no EDID available.
>> There is no support on that chip for an external EEPROM.
> 
> Right. I guess the else meant it was available and &= ~83 meant no
> EDID... Anyway one could simply drop a 24c02 or a similar chip directly
> to SDA/SCL HDMI lines, that's what the monitor makers had been doing for
> a long time. Then, I guess, you would need the internal_edid = 0
> (otherwise the TDA chip would be fighting the EEPROM on the SDA line).
> Not that I know of any such design using this driver, I guess we can
> safely skip this part.
> 

OK, I think the history is clear. Can you post a v2 with a Fixes tag and
comment a bit on why this was not caught before?

Regards,

	Hans
