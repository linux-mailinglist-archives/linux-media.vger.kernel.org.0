Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5B7A45E1BA
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 21:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242854AbhKYUmd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 15:42:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59190 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1357047AbhKYUkc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 15:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637872640;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R0QvVC2IIMY5PbaOv5SdBLVIbLE2ZoCH/v6HbLoaEI8=;
        b=VP1Zuds82c2+gOa5D4wPNfiBPzYJv54u/gj0lFg8wtqAYD7mhB8HEKl9MBgutBZc1RR9Iv
        5cYHeaaBU0KsSuYj4EVkN27zcEgzeJJ1cwclkR17OpGGluyEKhV5EljAVXIkgLb9Ez+9aO
        jcR7mYgzXNr81fPnsjkRRY4WLYUjKMg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-CGgXaGuHOnC6TWzqGYUk4A-1; Thu, 25 Nov 2021 15:37:18 -0500
X-MC-Unique: CGgXaGuHOnC6TWzqGYUk4A-1
Received: by mail-ed1-f72.google.com with SMTP id a3-20020a05640213c300b003e7d12bb925so6262176edx.9
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 12:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=R0QvVC2IIMY5PbaOv5SdBLVIbLE2ZoCH/v6HbLoaEI8=;
        b=HYwHXuu8mor9R6XAtAycRIGuNUZFw94nw7RAC6Pcfd/jMciMjxD3OFOOz4/aERz+3J
         DmYp/FbZk4yVYmrfNfPy3T2KK/ywQFzMzknQ5kHH1RToyBLSaMkvBYC9M0XVU6LSAZj6
         hIMkpGyJq0Aj0l0uJaRaHDP2CLa9Y96l/hJK2Gr7y1RNfY2yevEG92Nqh5xojoc/eD0f
         CqHcfBjup1B+OZyioG/KZ1yFRSVcY1pGe3deyw+ZgjzrayZ04opzyboY7Ocjb1p0XMLV
         6XbWQne7elrPDuO+vW6YvOVoWx8xgpR6mrrlLs5TFE1RTSi3AFoEos+YEkAGVvZpUDlm
         6b1A==
X-Gm-Message-State: AOAM531XKwprty6tE1CVpNC+gAWxqKCku2wVY9/6rNXO6onoCVgVJP28
        hXrqLqCIFJZBe4Bb6ZvWaqdp0HHMxzZfIVxLiP2iwf8b+9Xl6qIVSsz6VGLaS/tFhVLYea76n4K
        nZPxi2MILSkW309ynzG0MwWM=
X-Received: by 2002:a05:6402:2d9:: with SMTP id b25mr43535421edx.383.1637872637679;
        Thu, 25 Nov 2021 12:37:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmnkB/9t8U6qdtKlCRi8ZzFThYcU0fe68N56QaBrfNygCop03ayG48/X1YmPuEKAdRCLwBew==
X-Received: by 2002:a05:6402:2d9:: with SMTP id b25mr43535391edx.383.1637872637494;
        Thu, 25 Nov 2021 12:37:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id 29sm2685911edw.42.2021.11.25.12.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 12:37:17 -0800 (PST)
Message-ID: <bf26f90d-6676-3477-a6b4-6c86186a9f71@redhat.com>
Date:   Thu, 25 Nov 2021 21:37:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 0/3] Add support for OV5693 sensor
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20211122235613.41682-1-djrscally@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211122235613.41682-1-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/23/21 00:56, Daniel Scally wrote:
> Hello all
> 
> This series adds support for the OV5693 sensor found as the front camera in
> many Microsoft Surface devices, along with a number of similar style laptops.
> It is a heavily adapted derivative of the atomisp-ov5693 driver in staging,
> which retains most of the global register settings and some of the other
> functions from that driver, but otherwise uses the "normal" v4l2
> infrastructure.
> 
> Series level changes since V5:
> 
> 	- Squashed the patches from Hans, and this time didn't screw up their
> 	application.
> 
> Daniel Scally (3):
>   media: ipu3-cio2: Toggle sensor streaming in pm runtime ops
>   media: i2c: Add support for ov5693 sensor
>   media: ipu3-cio2: Add link freq for INT33BE entry

Thank you.

The patches look good to me and I've tested this series on a Microsoft Surface
Go (version 1) and everything works as it should:

Acked-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

