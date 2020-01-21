Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 624BE1438DF
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 09:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbgAUI4V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 03:56:21 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34199 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgAUI4V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 03:56:21 -0500
Received: by mail-lj1-f194.google.com with SMTP id z22so1905692ljg.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2020 00:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rLC7ArNDoCfPVLbHMJdB77/IsrZfFpX+7NPUfBcooDk=;
        b=mAWueqewBiPUSSaIIPKOJiYP0bTMehG82/cqa6OzdF1uSC8MUVyCPomPzLbipabg8l
         2UrFjf39kz3gGzgEa8d7cwSV36oHAN3idctNho8K+ONw56lxlUiXmBZpOYyuEA6wiHRq
         Vi9l/tqiQyVOblMWldOYUWbNSLhAdg3blv6qE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rLC7ArNDoCfPVLbHMJdB77/IsrZfFpX+7NPUfBcooDk=;
        b=KqHpJkrJa4qNbD8nUJgvm63VChDuH0UeU478BSRAsaFxHFWSAhDn6+HVE4csLNgDtb
         r/pNykIfjYZGhqzLjRfHkNGibJoKxkYq2cE2yLVL72E03WWOqTuQlPbgK4Mg6q0A/saj
         BAExkrZpCSws6Wkec/I18nYzpX6OPnZQW7W6lr5QiFAnVgx78HkozbfNV/BnQ4LbdfwH
         RGa435OLqHkptwr+OwwThb25KmusAyictd+l9ylbzxwVEkgVCTlXoS3nOJ7lmwZWiUUT
         nO1ggYGCFvng41nllMDOCW8ssSRPLcMkJytMjWm4IDypm8b/9qezBzP8x16wUa76/Uod
         yAeg==
X-Gm-Message-State: APjAAAX3rkkjrhAwp/EMPujIV1xbIwSriGHfg36ZxGK/7sNe2igT8Jf9
        /i/vU98brpREALKav8qfWQ6tQ9Q1g9X6BZpvpFlZ5w==
X-Google-Smtp-Source: APXvYqzfEmjmPOJHeDKP2Z9y+ERe2+MqVoF0+eDb8f075+fruHdB5RlXLG3x5T65ItaKNqNN9NRA2hru2z1xXZontcY=
X-Received: by 2002:a2e:9692:: with SMTP id q18mr1894304lji.177.1579596978386;
 Tue, 21 Jan 2020 00:56:18 -0800 (PST)
MIME-Version: 1.0
References: <20200113095636.blov62o4gbf27om5@sirius.home.kraxel.org>
 <12433898.dW097sEU6C@os-lin-dmo> <20200113110521.5ogc3fcy4zq32yzg@sirius.home.kraxel.org>
 <CAAFQd5D16G0E85BCZVx1LXd1TauQH8Lbgs5-0gLv7tNpm4sp_A@mail.gmail.com>
 <20200113132654.r4lhspfx2z7zse2v@sirius.home.kraxel.org> <CAAFQd5A3=4JC+3bRf2iw8RwsoB1jJz8p5afi6KaHO6ML2LC0Rg@mail.gmail.com>
 <20200115112640.52kemwg4lncuvvir@sirius.home.kraxel.org> <CAD90VcaAaomTnwVESp9RaBwhjx+cKjXAJv4T7wSkFiCEhOUo5Q@mail.gmail.com>
 <20200120104755.3hhxlx6x6o32bagf@sirius.home.kraxel.org> <CAD90Vcak0iohLny9UjkqtBmM0px7Rz1mqQE6jw1wdu66QB4U3Q@mail.gmail.com>
 <20200121064437.jryf3lq72bucs6rr@sirius.home.kraxel.org>
In-Reply-To: <20200121064437.jryf3lq72bucs6rr@sirius.home.kraxel.org>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Tue, 21 Jan 2020 17:56:05 +0900
Message-ID: <CAD90VcaTtCdrhnPhhDWrheF2xrgF-LXL94MPZy9BfHB-Wh9FwQ@mail.gmail.com>
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

On Tue, Jan 21, 2020 at 3:44 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> > > > Can't this problem be solved by adding "offset" field in virtio_video_mem_entry?
> > > >
> > > > struct virtio_video_mem_entry {
> > > >   le64 addr;
> > > >   le32 length;
> > > >   le32 offset;
> > > >   u8 padding[4];
> > > > };
> > > >
> > > > Here, "addr" must be the same in every mem_entry for (1) hardware.
> > >
> > > No.  virtio_video_mem_entry is basically a scatter list entry, you use
> > > an *array* of these entries to describe your buffer (unless you are
> > > using CMA due to hardware requirements, in this special case you have
> > > only one entry in your array).
> >
> > I see. I forgot about scatter list.
> > However, I'm still not sure about the usage for CMA.
> > if we're using CMA for a multiplanar format, how can the device know
> > where the second plane start from?
> > In my understanding, the number of entries in this case should be the
> > same with the number of planes and
> > "entries[0].addr + entries[0].length == entries[1].addr" should hold.
>
> With the one-buffer-per-frame model you could add a plane_offsets[4]
> field to virtio_video_resource_create.
>
> The virtio_video_mem_entry array describes the whole buffer for all
> planes, the plane_offsets array says where the individual planes start
> inside the buffer.

Got it. It makes sense to have plane_offsets[] separately.
Thanks!

Best regards,
Keiichi

>
> cheers,
>   Gerd
>
>
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>
