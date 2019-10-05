Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 733AFCCA6B
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2019 16:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbfJEOV1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Oct 2019 10:21:27 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44529 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbfJEOV1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Oct 2019 10:21:27 -0400
Received: by mail-ed1-f68.google.com with SMTP id r16so8464191edq.11
        for <linux-media@vger.kernel.org>; Sat, 05 Oct 2019 07:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FiAx01lzYJ2XijobbFlOzeElfbfliJ6CjwwDo5G0AoU=;
        b=aOmUSWI1+T3TnJOhi1pLrJ4EjvaP6hUtF7ChA82kWbx4mBR3N4wvhV0n0zBWdLT6HB
         GXalNflRrbpaemvxk2Lu7r+yQd5t5/VJ9rRr486qFRrFot06yUCay30P/AKlbD/WCAcq
         3LUo97CXUGU2iO+ZSlVsUeSzqrJZKT49EbYA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FiAx01lzYJ2XijobbFlOzeElfbfliJ6CjwwDo5G0AoU=;
        b=UdZ/Zr6ftsKSZiQx4NldEEkLJtbS/2uD9t56lkvS6c7xiC7MIpEli1FmKa1hLIaS8s
         oRF+4g0fflnbvQfAgt/zE7TpIeyrXDgvYLZDEgqVtHfS7rbyE0Bx/E5fNGaFC2R8bauc
         xC1l6z088vOCXpojfNViIR7Q82aXsNGxNZUOvX+2sJsmqvx/bR3C6cIdGlbnlfc8EMYH
         2ydWOSYQkJ3sMMlMj6vQmESL9pK1sf9ij7zRA7fuTNo+AZTxFoPsUZdkNmMnVTPLr5Sh
         Ca8StPn1Hq0vAL9dEaWmE2Ec1YdVIvBf/NBfwf1FdhjZ3FOiNOuU3KZnnEdp8SOjaCEB
         6V4A==
X-Gm-Message-State: APjAAAW8ytx33kipq22+5mkrLGBELZhv0OiTrB9LZMb5zOS0rbDEyPAt
        3kUbRo1aTtLM93ffpzGBVuJO06SAKSyK2Q==
X-Google-Smtp-Source: APXvYqwjJLyQMQwdIMQBOoShEUbnSOZb5UW2nMgnFUwCsAHSK8I4jeRu+X5z5ZQC1Xr5MsoVpZ8fSA==
X-Received: by 2002:a17:906:4a17:: with SMTP id w23mr8788216eju.324.1570285284403;
        Sat, 05 Oct 2019 07:21:24 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id z39sm1959901edd.46.2019.10.05.07.21.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2019 07:21:23 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id b24so8370398wmj.5
        for <linux-media@vger.kernel.org>; Sat, 05 Oct 2019 07:21:23 -0700 (PDT)
X-Received: by 2002:a1c:a516:: with SMTP id o22mr15342732wme.116.1570285282999;
 Sat, 05 Oct 2019 07:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190905114210.9232-1-p.zabel@pengutronix.de> <20191003211247.GC3927@aptenodytes>
 <CAAFQd5BG5_up_Ov7GU3qcB5NCjWcnP4Da0GKWJTuRzGr-WEa4g@mail.gmail.com>
 <20191005133920.GB19943@aptenodytes> <CAAFQd5AE8=bzQH+i4EoKYpB8RkprnWEAW0=8xS=fCa7Y4Hsfaw@mail.gmail.com>
 <20191005141228.GC19943@aptenodytes>
In-Reply-To: <20191005141228.GC19943@aptenodytes>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 5 Oct 2019 23:21:10 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BTff65TyMbLi+L8ejmC7CchRMt-iZ7mQnBuZn117ARvQ@mail.gmail.com>
Message-ID: <CAAFQd5BTff65TyMbLi+L8ejmC7CchRMt-iZ7mQnBuZn117ARvQ@mail.gmail.com>
Subject: Re: [PATCH] media: uapi: h264: clarify num_ref_idx_l[01]_(default_)active
 fields
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sasha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 5, 2019 at 11:12 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> On Sat 05 Oct 19, 22:54, Tomasz Figa wrote:
> > On Sat, Oct 5, 2019 at 10:39 PM Paul Kocialkowski
> > <paul.kocialkowski@bootlin.com> wrote:
> > >
> > > Hi,
> > >
> > > On Sat 05 Oct 19, 17:22, Tomasz Figa wrote:
> > > > On Fri, Oct 4, 2019 at 6:12 AM Paul Kocialkowski
> > > > <paul.kocialkowski@bootlin.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Thu 05 Sep 19, 13:42, Philipp Zabel wrote:
> > > > > > To explain why num_ref_idx_active_override_flag is not part of the API,
> > > > > > describe how the num_ref_idx_l[01]_active_minus1 fields and the
> > > > > > num_ref_idx_l[01]_default_active_minus1 fields are used, depending on
> > > > > > whether the decoder parses slice headers itself or not.
> > > > >
> > > > > Is there any particular reason why this is preferable to exposing the flag?
> > > > > It feels like having the flag around sticks closer to the bitstream,
> > > > > so it's more straightforward for everyone.
> > > > >
> > > > > In case there's only one set of fields exposed by the hardware (and it doesn't
> > > > > do slice parsing itself), we could always check the flag in the driver and use
> > > > > either the default PPS values or the slice-specific values there.
> > > > >
> > > > > What do you think?
> > > >
> > > > IMHO it would only add further logic to the drivers, because they
> > > > would need to have a conditional block that selects default or
> > > > per-slice value based on the flag. The goal was to be able for the
> > > > driver to just passively write num_ref_idx_l[01]_active_minus1 (or the
> > > > default one for slice-parsing hardware) to corresponding hardware
> > > > registers.
> > >
> > > Well, the Allwinner block has both set of fields and a field for the flag,
> > > so in this case I find that it is cleaner to just copy the values and flag
> > > rather than always setting the flag even when it's the default value used.
> > >
> > > More generally, the two sets + flag are closer to bitstream which feels less
> > > confusing than re-purposing these fields from the slice header to fit the
> > > result of flag ? per-slice : per-picture.
> > >
> > > > We're talking about kernel drivers here and for security reasons any
> > > > logic should be reduced to the strictly necessary minimum.
> > >
> > > I definitely agree that bitstream parsing in the kernel is to be avoided for
> > > security reasons (among other things), but don't see the harm in considering
> > > the flags in-driver if needed. We do it for a number of other flags already
> > > (and strongly need to).
> >
> > If the fields are well documented, does it really matter? I'd suggest
> > just keeping it as is, rather than overpolishing things and preventing
> > the interface from stabilizing.
>
> I just don't see the benefit of changing the purpose of a bitstream element.
> Even with documentation, it adds some unnecessary confusion and I find this to
> be a complicated enough topic without it ;)
>
> Especially for the case of hardware that does slice header parsing itself, it
> feels particularly unsettling to have to take the default PPS values for the
> fields from the slice header control rather than PPS.

num_ref_idx_l[01]_default_active_minus1 are members of v4l2_ctrl_h264_pps.

>
> The bottomline is that we have use cases for each of the two set of fields
> independently, so I feel like this is reason enough to avoid mixing them
> together.

What do you mean by mixing together? Hardware parsing the slices
always uses num_ref_idx_l[01]_default_active_minus1 from the PPS.
Hardware not parsing the slices always sets override to 1 and uses
num_ref_idx_l[01]_active_minus1 from the slice header struct.

>
> We are still in the process of polishing the API anyway, so now feels like a
> good time to change these things.

Hmm, it seemed to me like things already calmed down and we were just
polishing the documentation. I was convinced we were actually about to
destage things. Are you aware of some other changes coming?

Best regards,
Tomasz
