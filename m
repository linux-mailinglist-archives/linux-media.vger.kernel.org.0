Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE889456298
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 19:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233677AbhKRSnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 13:43:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54222 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233625AbhKRSnR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 13:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637260816;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vru2W1BeVpnwxOEZvAFt7zBwoQOzWpReS0Uqf8DJZdg=;
        b=SoV05SnhFpTHjrQ7NWLAlfVk85sEoOTbJew/5jO4VsMYipir5A6GHFh0VnGF52qo2xAh3L
        jAtRXXzlLO1qKhOb5GrhMvQzROA1ZQ8i8G2QGx/fHkchQPFzeaEg9nlgsJWjr42wjj6f5S
        CzwL9zYi6bjvNQE8wyUsKUcJA4nZz4Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-JYoC7q2qOzSSSGoVmMVAHQ-1; Thu, 18 Nov 2021 13:40:15 -0500
X-MC-Unique: JYoC7q2qOzSSSGoVmMVAHQ-1
Received: by mail-ed1-f71.google.com with SMTP id k7-20020aa7c387000000b003e7ed87fb31so6163643edq.3
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 10:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vru2W1BeVpnwxOEZvAFt7zBwoQOzWpReS0Uqf8DJZdg=;
        b=zL6uZ9IlVSh/a9mojP1FCrXEmDOOur48bxq3UHPvUuATfXigmBL1+DAre2xOQoJkx1
         r1Zh86ZlfXPaqRDfJz1Guq/GIpBVpiATVNtCzJ8fJkHB8a33bx/v/LpTtE436PabvYxI
         TxBr/9Xamah/4JQirJLsX5KXXR/UuLTVmMxRYFIl3eM36kRmtyDoKTWMg68MQHj8CY7H
         0CkdSL9GlPAS1Q2t12XQGamJHxTGX5/qf9ftormvW2DZgb2udMvaqivdysNitR/cq1TD
         ysMoMARK4gIG9Q+RJYZ01znKxmQ/StSfcaAi43RvQa9p3Q/5JkmOwvGNI9kMdV7nVhXs
         HeFw==
X-Gm-Message-State: AOAM531DMA0eRAsqliEWB1r3Ejyg2lpZs+DBtX1dlIGQb2EiQ4UHQCNw
        z9Y3qvbflDadqgtQ/rTG5sOk8qGt8YjNpHXCrzJrM28XlecKX/AUUGiUdNZLONwf/5NzOIHcoo1
        KEWoi8XPvgiMERgm/IbEWG8k=
X-Received: by 2002:a05:6402:354e:: with SMTP id f14mr14101482edd.245.1637260813943;
        Thu, 18 Nov 2021 10:40:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSVDlRWa6fp3A4EfHiAXVYnY82/YpRv+CLMpIQWhz2fRWiIjbGbuaFa0BBwfvzv4UUj7EfLg==
X-Received: by 2002:a05:6402:354e:: with SMTP id f14mr14101446edd.245.1637260813743;
        Thu, 18 Nov 2021 10:40:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b11sm385014edz.50.2021.11.18.10.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 10:40:13 -0800 (PST)
Message-ID: <976c645e-42ec-d29c-5a50-446d4be908a4@redhat.com>
Date:   Thu, 18 Nov 2021 19:40:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [libcamera-devel] [RFC] media: Auto exposure/gain support for
 atomisp / libcamera integration ?
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        andrey.i.trufanov@gmail.com, linux-staging@lists.linux.dev,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        libcamera-devel@lists.libcamera.org,
        Nable <nable.maininbox@googlemail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        linux-media@vger.kernel.org
References: <20211107175013.355188-1-hdegoede@redhat.com>
 <a13e1ed6-3050-3adf-fa6d-8506da66d9fa@ideasonboard.com>
 <YZYv+owv3agp/lOD@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YZYv+owv3agp/lOD@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/18/21 11:50, Laurent Pinchart wrote:
> Hi Umang,
> 
> On Thu, Nov 18, 2021 at 03:43:53PM +0530, Umang Jain wrote:
>> On 11/7/21 11:20 PM, Hans de Goede wrote:
>>> Hi All,
>>>
>>> Now that we have the atomisp2 driver running on some devices like
>>> the Asus T101HA; and with the exposure + gain controls for the ov2680
>>> sensor found on that laptop fixed:
>>>
>>> https://lore.kernel.org/linux-media/20211107171549.267583-1-hdegoede@redhat.com/
>>>
>>> I believe we need to start thinking about various userspace API
>>> concerns. Thanks to Mauro's great work on various V4L2 API things
>>> are starting to work (somewhat) with regular V4L2 apps, but we really
>>> also need some processing / 3A stuff to make the cameras really
>>> usable.
>>>
>>> The most important thing needed is automatic exposure + gain control,
>>> ATM this relies on a custom ATOMISP ioctl, but I believe that we can
>>> just export the controls as regular v4l2 controls on the sensor subdev,
>>> at least for the ov2680 the exposure is already exported this way
>>> but it is read-only. Does anyone see any problems with just making
>>> these normal v4l2 controls on the sensor subdev ?
>>>
>>> We can then simulate the custom ATOMISP ioctl through the subdevs,
>>> or we can just remove it alltogether.
>>>
>>> Once we have the controls available this way I think we should write
>>> a libcamera plugin, which like the older versions of the Rasberry Pi
>>> plugin (if I've understood things correctly) won't use the MC framework
>>> for now. I believe we first need to understand the atomisp code better
>>> before we add MC support (*). But I still believe that an (experimental)
>>> plugin would be good, both to get something usable so that we can get
>>> more testers / more people interested in contributing.
>>
>> I am trying to understand what 'plugin' here means? Is it a wrapper 
>> pertaining to use libcamera (fined tuned for atomisp) that apps can use?
> 
> I think it means pipeline handler (and IPA module).

Right, I'm still getting used to the libcamera naming of things :)

Regards,

Hans

