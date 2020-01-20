Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36457142425
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2020 08:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgATHUS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jan 2020 02:20:18 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38877 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbgATHUS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jan 2020 02:20:18 -0500
Received: by mail-lf1-f65.google.com with SMTP id r14so23198637lfm.5
        for <linux-media@vger.kernel.org>; Sun, 19 Jan 2020 23:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yvt1rmGce/1VEo6G6EJG7siE0F1HO1l0rw7xbgdOvxc=;
        b=c658G9XKpYvMasXpniEQjS+S27Oi/4tWg047Q+8jR/nr5k0n0GJAdKg3ab2+SQRiHj
         pFgDmg7xylJLdlWpEsG8kICU95IbIWATfJaB28kqqfEfYrtj4vWICxZ/qk1ypUZh5WMX
         xYdYAs2i4j5iLH/YcOaEt+xFPZmPWJZ49kfAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yvt1rmGce/1VEo6G6EJG7siE0F1HO1l0rw7xbgdOvxc=;
        b=cARDB1PWX44JUqiPKlDsF31pnWtrNsH4IC3toFk416Wo4/6CqOsXAAQksO/pmsOEEd
         m0gwir1vuD1l4vj98IDRNe27fKZKMlGwovbTcuqgMxuujGtX58zP31g+5xeHQViCR3+Q
         Hb4mYU/5XxbtwciUJe2oBmDaaTwTn/EefUZdnr1fjlX501yxDjgAYebzYPcnffu5nO3M
         9w5OpQg6tVvDslUXXjo181BDPVgl1sxjYawlYLvhLSvJU9I8V+jaY+SfVVjazn54uZlH
         7zYPfhTSiG1L/h9w3c0VS502rwCU23tnlQFDCDPsipng6+cO+UXMwyd0jEy0CE819s4u
         1gYg==
X-Gm-Message-State: APjAAAUysC4rwMx22TUCLq4rgUMOInaYPiKV5W0zFUCul+/sQN76UgP2
        gk69mDijHikh3MqVo7YLjoA1OFqknLPN6ZyxFFTCWg==
X-Google-Smtp-Source: APXvYqzn/IYCrYnx6G5lalYOUsF+SfvCRArFZxpsXag1PrIYA5NPUP4ThH6TlISFeo4nZZ6GFU5nsDLOi628M8nBHO8=
X-Received: by 2002:ac2:485c:: with SMTP id 28mr12293616lfy.118.1579504815235;
 Sun, 19 Jan 2020 23:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <7740094.NyiUUSuA9g@os-lin-dmo> <20200113095636.blov62o4gbf27om5@sirius.home.kraxel.org>
 <12433898.dW097sEU6C@os-lin-dmo> <20200113110521.5ogc3fcy4zq32yzg@sirius.home.kraxel.org>
 <CAAFQd5D16G0E85BCZVx1LXd1TauQH8Lbgs5-0gLv7tNpm4sp_A@mail.gmail.com>
 <20200113132654.r4lhspfx2z7zse2v@sirius.home.kraxel.org> <CAAFQd5A3=4JC+3bRf2iw8RwsoB1jJz8p5afi6KaHO6ML2LC0Rg@mail.gmail.com>
 <20200115112640.52kemwg4lncuvvir@sirius.home.kraxel.org>
In-Reply-To: <20200115112640.52kemwg4lncuvvir@sirius.home.kraxel.org>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Mon, 20 Jan 2020 16:20:03 +0900
Message-ID: <CAD90VcaAaomTnwVESp9RaBwhjx+cKjXAJv4T7wSkFiCEhOUo5Q@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH v2 0/1] VirtIO video device specification
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        spice-devel@lists.freedesktop.org, virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>, uril@redhat.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed, Jan 15, 2020 at 8:26 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > If you have (1) hardware you simply can't import buffers with arbitrary
> > > plane offsets, so I'd expect software would prefer the single buffer
> > > layout (i) over (ii), even when using another driver + dmabuf
> > > export/import, to be able to support as much hardware as possible.
> > > So (ii) might end up being unused in practice.
> > >
> > > But maybe not, was just an idea, feel free to scratch it.
> >
> > That's true, simple user space would often do that. However, if more
> > devices are in the game, often some extra alignment or padding between
> > planes is needed and that is not allowed by (1), even though all the
> > planes are in the same buffer.
> >
> > My suggestion, based on the latest V4L2 discussion on unifying the
> > UAPI of i) and ii), is that we may want to instead always specify
> > buffers on a per-plane basis. Any additional requirements would be
> > then validated by the host, which could check if the planes end up in
> > the same buffer (or different buffers for (3)) and/or at the right
> > offsets.
>
> Hmm, using (ii) the API, then check whenever your three plane buffers
> happen to have the correct layout for (1) hardware looks somewhat
> backwards to me.

Can't this problem be solved by adding "offset" field in virtio_video_mem_entry?

struct virtio_video_mem_entry {
  le64 addr;
  le32 length;
  le32 offset;
  u8 padding[4];
};

Here, "addr" must be the same in every mem_entry for (1) hardware.

>
> I'd suggest to use (i) API and allow the device specify alignment
> requirements.  So (1) hardware would say "need_align=0", whereas (3)
> hardware would probably say "need_align=PAGE_SIZE" so it can easily
> split the single buffer into three per-plane buffers.

Just to confirm, is "need_align" a field added in virtio_video_format_desc?
It sounds workable, too.

Best regards,
Keiichi


>
> cheers,
>   Gerd
>
