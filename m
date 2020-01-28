Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA45914AEBE
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 05:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgA1Epo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jan 2020 23:45:44 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33965 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgA1Epo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jan 2020 23:45:44 -0500
Received: by mail-ed1-f66.google.com with SMTP id r18so13289990edl.1
        for <linux-media@vger.kernel.org>; Mon, 27 Jan 2020 20:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7NOtAZALkjd5QbjFJRxMPx1vlO1G2Wo6On/UllTEVNo=;
        b=a4Cvs9dW0bcj4NM2LAg0XrILeNdVJT9IysZqJmQvIZAhIeR7qotkPNAJJ30eUHkkxo
         V9TxlGttgaQY3lYc6oa4XPNhG/3nGSbP6DLllvd7mrJe+N23uLaA3DDkRincOKO/NX0q
         nh9B8qGw2mhdSk+rjEegrnnjFli0eoKY54c+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7NOtAZALkjd5QbjFJRxMPx1vlO1G2Wo6On/UllTEVNo=;
        b=GO46oqGR6orrO6Fv7CG7kIyXZKvy17YFqzIJoYNotJ3T03I/t/m8nwg1PdS+8gQcI8
         qO9tEV9g+fN3hDXnhUfL2yHAL8QN/lq0tz0TVGXk2Hic8Pn5W/uBu0ESX5KU7mEjLaBv
         g8cwKFRUFu32xSeD9E+8Z+nmaCNVJv6I/hwxvDvSAyeYPvqz1l2pmCuqGWNzabM1/37Y
         ud0ZLxEbXIeIwo/3RIMTse3p19m6sR3oKWJz3DULnrIPaYsEgRT8b0QJ3TnFGsPwBzgM
         DY492Fl4D6xpEjZzXDMc6gtqHAGL0QqrYn6RXKZRCsA9sRENLq8F1Lb6oG53Ntw80oiX
         nX/Q==
X-Gm-Message-State: APjAAAUj2pHafBGdEeaZHqKFOeU9l1K2fuleTw2oiKSlrkQzf6lSZoJE
        /qOkVu4/pa2dum57So+Tu/rIeDNRDNVpXA==
X-Google-Smtp-Source: APXvYqx1JwQlaQJ8ipUm+wBO+DCpfwMA4yWZ/hhAufrwuRrq8aoE7VkCqYbhTetb8QuwjZ9DURwdsQ==
X-Received: by 2002:a17:906:31c6:: with SMTP id f6mr1647469ejf.17.1580186742176;
        Mon, 27 Jan 2020 20:45:42 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id j15sm426053ejy.55.2020.01.27.20.45.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 20:45:41 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id t14so1012776wmi.5
        for <linux-media@vger.kernel.org>; Mon, 27 Jan 2020 20:45:41 -0800 (PST)
X-Received: by 2002:a1c:3803:: with SMTP id f3mr2479329wma.134.1580186740766;
 Mon, 27 Jan 2020 20:45:40 -0800 (PST)
MIME-Version: 1.0
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-6-senozhatsky@chromium.org> <8d0c95c3-64a2-ec14-0ac2-204b0430b2b4@xs4all.nl>
 <20200122021805.GE149602@google.com> <20200122034826.GA49953@google.com> <7c4accc6-56f2-ecd0-1549-a4114b339ce8@xs4all.nl>
In-Reply-To: <7c4accc6-56f2-ecd0-1549-a4114b339ce8@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 28 Jan 2020 13:45:29 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C=Zj7h5Xe1w=0czX5ge1Kh=2cj6yEkN6binPgmmpj6Wg@mail.gmail.com>
Message-ID: <CAAFQd5C=Zj7h5Xe1w=0czX5ge1Kh=2cj6yEkN6binPgmmpj6Wg@mail.gmail.com>
Subject: Re: [RFC][PATCH 05/15] videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT
 in REQBUFS
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 23, 2020 at 8:08 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 1/22/20 4:48 AM, Sergey Senozhatsky wrote:
> > On (20/01/22 11:18), Sergey Senozhatsky wrote:
> > [..]
> >>>> +    * -
> >>>> +      - __u32
> >>>>        - ``reserved``\ [1]
> >>>>        - A place holder for future extensions. Drivers and applications
> >>>> -  must set the array to zero.
> >>>> +  must set the array to zero, unless application wants to specify
> >>>> +        buffer management ``flags``.
> >>>
> >>> I think support for this flag should be signaled as a V4L2_BUF_CAP capability.
> >>> If the capability is not set, then vb2 should set 'flags' to 0 to preserve the
> >>> old 'Drivers and applications must set the array to zero' behavior.
> >>
> >> The patch set adds V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS towards the end of the
> >> series, I guess I can shuffle the patches and change the wording here.
> >
> > Or I can add separate queue flag and V4L2_BUF_CAP:
> >
> > struct vb2_queue {
> > ...
> >       allow_cache_hints:1
> > +     allow_consistency_hints:1
> > ...
> > }
> >
> > and then have CAP_SUPPORTS_CACHE_HINTS/CAP_SUPPORTS_CONSISTENCY_HINTS.
>
> Don't these two go hand-in-hand? I.e. either neither are supported, or
> both are supported? If so, then one queue flag is sufficient.

Cache sync hints are already part of the standard UAPI, so I think
there isn't any capability bit needed for them. That said, they aren't
really tied to non-consistent MMAP buffers. Userspace using USERPTR
can also use them.

MMAP buffer consistency hint deserves a capability bit indeed.

Best regards,
Tomasz
