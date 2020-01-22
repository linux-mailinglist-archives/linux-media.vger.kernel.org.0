Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0811452B4
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 11:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729148AbgAVKgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 05:36:13 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:46420 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729110AbgAVKgN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 05:36:13 -0500
Received: by mail-qv1-f68.google.com with SMTP id u1so2945588qvk.13
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2020 02:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H5Q/enJnAE03WTWBi8/aJYWnHF9Q/si1wZbqxm7qIMY=;
        b=fqBPtiCQCcZp2HC/nOiTouELonf4sqDNI/IBFXf7075Q64Gm5fRAt6cuuTd5TkHAFn
         ACm/H1jSYCz30slLh+dprH8A2pFlIaRdDyMPXPN6E09TTSNRwGlX7As7Rbui+WKHxqf5
         KG9+ELa5YuiFfGc/so0Wr4FwcTv4j8k2ErWvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H5Q/enJnAE03WTWBi8/aJYWnHF9Q/si1wZbqxm7qIMY=;
        b=dPtCPpFV6eH36MYkjd+yW4yWrARDZ3KBIk8QI1VTeXjEaadqk1LBICsvUbhZo0uX2t
         w1O8jh6A9HIrAUoYBuHqkm8b1Kg8BD1RcqQ83r4L6GjB5CvVeBUBMOmaO5Ki5pNz2oac
         D64vgtuJo/Fh+aIIjAWMcEiT4VAzB3C43jELmWrMCsvwD0VRhONyGp28pX/Ci3x410KW
         f3tcZA/rKwc86mYpmKAN/WntGSISnWNaPXT/JvGc9adezkXct0pCxqDI9nlReSRmeuUa
         h7w9oTkcyNvIZ7/Ps+lL78YzZhXKLAD251YeMWT7sCWb3afKbh8ZPjPJ9/T3td2ST5LW
         nvYQ==
X-Gm-Message-State: APjAAAU9DZhOmF8Q8jAg2ByxvT3fXnoHTs9LxTUV8iwWug2sCAxGSeK3
        ZG6m1OxMSMryTxxqWP4ykP/0W/PC/pTXhG+880cGjg==
X-Google-Smtp-Source: APXvYqyRYf1MLrUGY5LDFuW9isDnVb669Ork06kqaKh8XkIeXpMX9ZNprssj+aBOVO/q6kR+u1z7exc/TSUW6p0S454=
X-Received: by 2002:a05:6214:287:: with SMTP id l7mr9831933qvv.142.1579689372249;
 Wed, 22 Jan 2020 02:36:12 -0800 (PST)
MIME-Version: 1.0
References: <CAD=HUj7N8dpEvf0Be8fg-qpFFTQOqzZX_kVoFB=BWp8S4uEFvg@mail.gmail.com>
 <20200122032433-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200122032433-mutt-send-email-mst@kernel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Wed, 22 Jan 2020 19:36:01 +0900
Message-ID: <CAD=HUj7cXK65Hj1rrL9KKoa6oWzBBwf8J_kSU2beJwzD4q06Fw@mail.gmail.com>
Subject: Re: [virtio-dev][RFC PATCH v1 2/2] virtio-gpu: add the ability to
 export resources
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     virtio-dev@lists.oasis-open.org, Gerd Hoffmann <kraxel@redhat.com>,
        Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> ok but how is this then used? will there be more commands to pass
> this uuid to another device?

This is intended to be used with the virtio video device being
discussed here https://markmail.org/thread/ingyqlps4rbcuazh. I don't
have a specific patch for how that will work, but it will likely be an
extension to VIRTIO_VIDEO_T_RESOURCE_CREATE.

> > +The response contains a uuid which identifies the exported object created from
> > +the host private resource.
>
> Are the uuids as specified in rfc-4122? I guess we need to link to that spec then

I don't think it's terribly important to specify how the uuids are
generated, as long as they're actually unique. That being said, I'm
not opposed to defining them as rfc-4122 version 4 uuids. Although if
we do that, it should go in the patch that defines what exported
objects and uuids are in the context of virtio, not in the virtio-gpu
section.

> > Note that if the resource has an attached backing,
> > +modifications made to the host private resource through the exported object by
> > +other devices are not visible in the attached backing until they are
> > transferred
> > +into the backing.
> > +
>
> s/host/device/?

The virtio-gpu is based around "resources private to the host", to
quote the existing specification. I think consistency with that
language is important.

-David
