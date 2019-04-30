Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF6CEE09
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 02:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729671AbfD3Ar3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 20:47:29 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:40753 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729507AbfD3Ar3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 20:47:29 -0400
Received: by mail-qt1-f193.google.com with SMTP id y49so8580531qta.7
        for <linux-media@vger.kernel.org>; Mon, 29 Apr 2019 17:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=JsAzde18G844oUFsP84w7alrwOBHCnuavwt/AS7sS2k=;
        b=lUhDjsVD1HvmTZzSlmnmNS8+KHK7lhpF4/MdTE1Sll4f4/Abxpr9EZf43vY3nUv4gc
         SByYo4fESpwSj2ehkg5CBnkPoMig7wo7c3MER30cWOsyZa3X18dZ4H5sK3vFWmHAcLHQ
         DFc22NY0N8ybP2uMrhr1x1d8eXorCas+FecmuHqxCft2nD3aprG04jfX3EMKbOPBu95b
         xL1dCW9l8KBp+333PBmln1HIjhsfpEuyhbI7MHMD+ZS04jijenSMAeJUEHqvtxMygai4
         EDp7AXbiLhODKY2dC2v1KhUw2AbeCzyLub3PH5P0Asj5RCVj8r8ESN7yBQ3Mx+g8xirX
         85zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JsAzde18G844oUFsP84w7alrwOBHCnuavwt/AS7sS2k=;
        b=oGtH977N4LW3s62X4ycSLcdf6VsMIegp7k6JuDCoVBffgl8mstYg/3F8dP4N8CCLb8
         6wWT/SDzDB7bUe/WiwGFO9/bQXbiJ8hPRgr/N+1HfcQgC85XW9FOW05UDCZ3JRs7Sj4A
         TR2dbvT5F6snmJGj5hoJ4glWxFkkkOwXyfrydehT+aM9LK27hm2wNChgkB5aCe+3AXGM
         2adc1pwibl1B7Rb7nlaS+rgJQCIFV1ivLZ7BE3wtLAvEImo4f6vhQzs4HprkanSZG2Qp
         W4nqCUpTCIEmUDqJRpXw5LIucOUIVgvmeIUR/AFptEfD1vaGYOe7KgN+OWAZV0aVX8tN
         AA/g==
X-Gm-Message-State: APjAAAX+6gANpQuV7yeFpsNeCG25io/nLjcDZdRv//Js8rwEj4dm35GR
        rjzQtkBgEHVgGpOfKeJ0ioKJdg==
X-Google-Smtp-Source: APXvYqwJSGNUVuDa2FUM0o3OME5qMP0cGWBbqP2LXOcKpqiPUnnprVDe23XmndJihocMHghRo62FSA==
X-Received: by 2002:aed:2196:: with SMTP id l22mr52293656qtc.226.1556585247694;
        Mon, 29 Apr 2019 17:47:27 -0700 (PDT)
Received: from skullcanyon ([2002:c0de:c115:0:481e:e17e:2f68:43f8])
        by smtp.gmail.com with ESMTPSA id 46sm22813618qtz.87.2019.04.29.17.47.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Apr 2019 17:47:26 -0700 (PDT)
Message-ID: <8bfacddaf6c8a94bccbae5c6a83688d42bbf63a9.camel@ndufresne.ca>
Subject: Re: [PATCH v4] media: docs-rst: Document m2m stateless video
 decoder interface
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel mailing list <kernel@lists.collabora.co.uk>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Mon, 29 Apr 2019 20:47:23 -0400
In-Reply-To: <0c8d534cf1ad262ab790f4ccfe9c2900e8a50aba.camel@bootlin.com>
References: <20190306080019.159676-1-acourbot@chromium.org>
         <371df0e4ec9e38d83d11171cbd98f19954cbf787.camel@ndufresne.ca>
         <da5aa9ab957923a72e30b169a3c242c4fe6260f1.camel@bootlin.com>
         <c07703459c7e48904bd7fd83be1e675c70eee83c.camel@ndufresne.ca>
         <d81d0112b99feba0a1899f3722077a4aeec9860c.camel@bootlin.com>
         <439b7f57aa3ba2b2ed5b043f961ef87cb83912af.camel@ndufresne.ca>
         <59e23c5ca5bfbadf9441ea06da2e9b9b5898c6d7.camel@bootlin.com>
         <0b495143bb260cf9f8927ee541e7f001842ac5c3.camel@ndufresne.ca>
         <CAPBb6MVG+3jQcw3AuhYDYCZ0YJ0aX=TmEuM5izh12GLw9V6B8Q@mail.gmail.com>
         <793af82c-6b37-6f69-648e-2cd2a2e87645@xs4all.nl>
         <f30f69af184cc80d5c56853b517943f45c90d9d9.camel@ndufresne.ca>
         <0a39c613-440d-c7a9-a078-b4688874f9e6@xs4all.nl>
         <16a3a61fe354dc545e99aef36aa58c7d4943de26.camel@bootlin.com>
         <d656119e73d491fe307045639ccc2102cb8a8722.camel@ndufresne.ca>
         <0c8d534cf1ad262ab790f4ccfe9c2900e8a50aba.camel@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 (3.32.1-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 29 avril 2019 à 22:32 +0200, Paul Kocialkowski a écrit :
> > Adding Boris in CC. Boris, do you think that could possibly fit into
> > your todo while working on the H264 accelerator on RK ? If needed I can
> > generate test streams, there is couple of lines of code to remove / add
> > in FFMPEG backend if you want to test this properly, though I'm not
> > able to run this code atm (it requires a working DRM, and I'm having
> > issues with my board in this regard).
> 
> Well, that seems like a task that requires in-depth knowledge about how
> the v4l2 m2m core and the request API work and some familiary with
> it. My feeling is that Boris is pretty new to all of this, so perhaps
> it would be best for him to focus on the rockchip driver alone, which
> is already a significant piece of work on its own.
> 
> It looks like Hans has proposed to come up with something soon, so
> things are looking good for us. Once we have that, I think the next
> area we need to look into is how we need to rework and refine the
> controls. I think it would be good to define common guidelines for
> adapting bitstream descriptions into controls with what the hardware
> needs to know about precisely.
> 
> In spite of that, I would be very interested in knowing what the
> rockchip MPEG-2 and H.264 decoders expect precisely. I'm also

We are still working on that. For now, we believe that the list (and
traces from real stream matches) are according to the standard
"Initialization process" section 8.2.4.2. But they run both P and B
initialization regardless of the type, hence the 3 lists. But the
modification (section 8.4.2.3) are not applied. They also program the 3
lists regardless of the current picture type. This is quite strange.
Tomorrow I'll mark all b0/b1 value as invalid on P slice and the
opposite for B slice to see if that still decodes fine. If that was the
case, it would mean that the current list are complete, but not in the
expected order.

What I'm wondering is if it would be fine to add more information to
the DPB entry so that we could simply implement 8.2.4.2 to re-create
the pre-modification order. It's more doable then trying to reverse the
modifications and would offer a better uAPI in exchange for a very
small overhead.

> interested in learning about Tegra decoders and there are also docs
> about the Hantro G1 (MPEG-2 to H.264) and Hantro G2 (H.265) which are
> well documented in the i.MX8M docs. It's also used on some Atmel
> platforms apparently. So feedback regarding the current controls that
> Maxime and I came up with would be welcome.

