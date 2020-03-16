Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB79418719B
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 18:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732181AbgCPRxg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 13:53:36 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:40774 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730437AbgCPRxf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 13:53:35 -0400
Received: by mail-qt1-f194.google.com with SMTP id n5so15006420qtv.7
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2020 10:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VUY3XhQvkgyRIWAbAJy5uAmmekImTEzF/mbKeTLe9p0=;
        b=CgMYHWNtcR/Fn9GdCqAf+azaOLsISz956XogFKumD0kaInz/U7zBYk4asy2N7iONhh
         rxPG/Ph1YKW+uRF5KiL79LfnwhmEqGe9SnSFMuy0N0OGhxHkW9Yps5Cj6CCssTUxb6IC
         Eq7lwsqw/OE62O/VLyXk1ov1UvBRYTFUil+RB0EEnxUgq0pfWIk/QEhYBz1n19Ne6xMD
         7lC1b+5fJdBwlXA70TLKwNQhcaujtO1WTqOORyhXmDCcLIQIskRBD/TaKZ6HMxkLgujq
         i7cv4Y3oqGvdv8QRhwwqQi4VTXH0WSQhzwdnM5TLS5Jg61D+XixlDXjHIGOqVYiAgLuc
         rLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VUY3XhQvkgyRIWAbAJy5uAmmekImTEzF/mbKeTLe9p0=;
        b=I7+dIzT//0SZlk5rzGIIbClX909Fo+4XKvjTT0wtjT/8TBt0YkRSD4anPFioSceNhz
         UXnyYoSycLo6zKZMJ4NYqeIuhSl1fOeCAvmfJCkVrGKlkUYRIlj27J7tHmsJW9qcZdVm
         vbPYEvlzvI4vKuy8TLCIjB45TNstpOXT7zzZzxbUHpoxCXwtfK179AjUxF7oyn5MBYnu
         SYxZiI2K+EjV5LirT10A/KpRrIjYFRw6k/z/O9wetwXPKLsE5BE9qYEjArvNm4qFgWaz
         r1v3XXxScXAONXz5SyowrkwgZu2dkggbY/Qq5DJEwhyNgSAIvcgKCRBG2MOEi/nuLqvL
         8PIw==
X-Gm-Message-State: ANhLgQ35HGaJ99IvZUnGtq0b2o/298uWhIWSgP7/j2pdBQOkjd5e0Co8
        EAyz1nUJ48GyyRgNVHVECIx+ZatJBh4=
X-Google-Smtp-Source: ADFU+vulJXel28+4c/Z1rA5jFy/GtqRDH6ax+MISSNXnrxEWaqjXiF/U9ZeF8ZGdBhceiFLsEv5Xzw==
X-Received: by 2002:aed:200f:: with SMTP id 15mr1331904qta.152.1584381214223;
        Mon, 16 Mar 2020 10:53:34 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id z18sm304991qtz.77.2020.03.16.10.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 10:53:33 -0700 (PDT)
Message-ID: <20f09be5066a1b85a7ef6152ff48d5417c47bac6.camel@ndufresne.ca>
Subject: Re: [RFC PATCH v4l-utils 0/1] Introduce the meson build system
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Sean Young <sean@mess.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Mon, 16 Mar 2020 13:53:32 -0400
In-Reply-To: <ee884af1f7dd5d7c6877a7801f4942cce06d8e61.camel@collabora.com>
References: <20200315205421.28797-1-ezequiel@collabora.com>
         <3479ebe3-1a62-f888-8b11-97ecd5b30cd2@xs4all.nl>
         <ee884af1f7dd5d7c6877a7801f4942cce06d8e61.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 16 mars 2020 à 13:29 -0300, Ezequiel Garcia a écrit :
> Hi Hans,
> 
> On Mon, 2020-03-16 at 10:17 +0100, Hans Verkuil wrote:
> > On 3/15/20 9:54 PM, Ezequiel Garcia wrote:
> > > Here's a first step towards using meson:
> > > 
> > >     https://mesonbuild.com/
> > > 
> > > As you can see, this doesn't include all tools and libraries
> > > (are there any libv4l1 users?),
> > 
> > Probably yes.
> > 
> >  but otherwise tries to cover
> > > as much as possible.
> > 
> > Last week I added options to build 32 bit variants of v4l2-ctl and v4l2-compliance,
> > it will be interesting to see how meson does that.
> > 
> > I'm not opposed to changing over to meson, but then the old system has to be removed
> > either at the same time or in a second patch.
> > 
> 
> I think some projects kept autotools for a while until the
> transition to meson is complete.
> 
> Any reason why we'd have to do the transition atomically?

Having two (or more) build systems is usually of great pain. In
GStreamer we went that route as we had to develop some extra features
into Meson to support our much more complex use case. Today, meson is
mature enough to allow a quick transition. Of course, having patches
merged with few days of delay helps if you have CI and other Bot to
update. An atomic transition would cause downtime in that context.

> 
> Thanks,
> Ezequiel
> 

