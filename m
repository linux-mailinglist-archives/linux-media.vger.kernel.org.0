Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 796A22CF05D
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 16:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730286AbgLDPHd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 10:07:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbgLDPHd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 10:07:33 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5AEC0613D1
        for <linux-media@vger.kernel.org>; Fri,  4 Dec 2020 07:06:53 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id x16so9117347ejj.7
        for <linux-media@vger.kernel.org>; Fri, 04 Dec 2020 07:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L6vZEyUmmn6nDr7rYJVjLNnnSsjLXcVIVfnqcWnvcoc=;
        b=rVNn92OB0kBNJL0w9c/J7LaBJ+SMtVeO5pDa3Ke2At1tIrOX6x6t2wTuPjzY92AEUX
         zY7HNvGT+tawzeRmLvKJGfN4H/KsL47fZVzE2sqHBDN+tconD+XcUpKUWjfV7iIt91LQ
         O/gwhBWYAiq4fR7ACpKt7ewEhOkFKksVOMtb7FMmNvCz1F8pvADw9zKoKR0n8qzbTNT/
         Cla/sqgd1tMKfz+tC8CZPacwTaGjQP7mikHU1mdbTL8iXM7iFJ1Uj8OBhIm3iVkKxfmz
         XeWveiAnAFwqg4IKgHzH0BqSwsi0RpLto4hTzW+dMWZOH0ML7RAaf7XXDcMicPfywYs+
         igbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L6vZEyUmmn6nDr7rYJVjLNnnSsjLXcVIVfnqcWnvcoc=;
        b=g5Vxv5GPZoIf8WU54/pw0RIZjF/6+JqTgCNetsbk+pHprpJpZdGN6hMYJ20LEdRVYo
         +nwBJg/a7xaxsESUtNf2ejGtfjIx6KvpVIq6+6QFoehuJswmBMV/JW+XFP/rrbDHB5Zw
         MKFtH3Sz/rLOLkpkDAwZzu2LbFhBTvrcAL6uUiRwJSlZKlERBuaJWrgv3xZkAqUksFOr
         rypYuTMqyL5ZOQ8++v6pavDT3tdw93wUigCaOdMQvl927rgVAB750W9UNPIErRCIXirv
         E0Ej/E0dMQKq+kk2jTIT5KUNj3W6qp2qdDTecZWHVuD26Nc7Wdf6oO5JW76jv0jYllpg
         Eu3Q==
X-Gm-Message-State: AOAM533wzh18goxYNRl5WFmfxWtS+9vBBc6rp6lB3nzSXEOPr/Qcj1P+
        Lv4al7OGkCWCmwn6kXdVgqiZnNy+Rko=
X-Google-Smtp-Source: ABdhPJwrJvr+Am2jGKKio0W/LcLbNli/wmkHJx2rC9+jxw+eR8rI4aN59sQg+ZPRiddf5JnmHC2qUA==
X-Received: by 2002:a17:906:ce21:: with SMTP id sd1mr2868341ejb.396.1607094411988;
        Fri, 04 Dec 2020 07:06:51 -0800 (PST)
Received: from localhost (p200300db7f1e2524d75265c321685989.dip0.t-ipconnect.de. [2003:db:7f1e:2524:d752:65c3:2168:5989])
        by smtp.gmail.com with ESMTPSA id p91sm3663887edp.9.2020.12.04.07.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 07:06:51 -0800 (PST)
Date:   Fri, 4 Dec 2020 16:06:48 +0100
From:   Sebastian Fricke <sebastian.fricke.linux@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, martinax.krasteva@linux.intel.com
Subject: Re: [PATCH 2/2] Documentation: v4l: Document that link_validate op
 is valid for sink only
Message-ID: <20201204150648.gf5dwuda636p427b@basti.Speedport_W_724V_Typ_A_05011603_06_001>
References: <20201202181955.18165-1-sakari.ailus@linux.intel.com>
 <20201202181955.18165-3-sakari.ailus@linux.intel.com>
 <20201203050040.godctaxtvafpvaw3@basti.Speedport_W_724V_Typ_A_05011603_06_001>
 <20201204122054.GU852@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20201204122054.GU852@paasikivi.fi.intel.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04.12.2020 14:20, Sakari Ailus wrote:
>Hi Sebastian,
>
>On Thu, Dec 03, 2020 at 06:00:40AM +0100, Sebastian Fricke wrote:
>> Thank you.
>>
>> On 02.12.2020 20:19, Sakari Ailus wrote:
>> > The link_validate pad op will only be called on sink pads. Document this.
>> >
>> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> > ---
>> > Documentation/driver-api/media/v4l2-subdev.rst | 11 ++++++-----
>> > 1 file changed, 6 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
>> > index d4cba0d6c4ca..6d5c799c49fe 100644
>> > --- a/Documentation/driver-api/media/v4l2-subdev.rst
>> > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
>> > @@ -122,11 +122,12 @@ Don't forget to cleanup the media entity before the sub-device is destroyed:
>> >
>> > 	media_entity_cleanup(&sd->entity);
>> >
>> > -In that case, the subdev driver may set the link_validate field to provide
>> > -its own link validation function. The link validation function is called for
>> > -every link in the pipeline where both of the ends of the links are V4L2
>> > -sub-devices. The driver is still responsible for validating the correctness
>> > -of the format configuration between sub-devices and video nodes.
>> > +If a sub-device driver implements sink pads, the subdev driver may set the
>> > +link_validate field in :c:type:`v4l2_subdev_pad_ops`to provide its own link
>> > +validation function. For every link in the pipeline, the link_validate pad
>> > +operation of the sink end of the link is called. In both cases the driver is
>>
>> s/In both cases the driver/In both cases, the driver/
>
>Is there any particular reason for this change? I think it's fine as it
>was. :-)

I was just proof reading the change and thought that a comma would fit
here quite well. It really isn't anything important, so if you
don't agree, that is totally fine for me.

>
>>
>> > +still responsible for validating the correctness of the format configuration
>> > +between sub-devices and video nodes.
>> >
>> > If link_validate op is not set, the default function
>> > :c:func:`v4l2_subdev_link_validate_default` is used instead. This function
>
>-- 
>Regards,
>
>Sakari Ailus
