Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D31614286C
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2020 11:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgATKsI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jan 2020 05:48:08 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50675 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726417AbgATKsI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jan 2020 05:48:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579517286;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PJbVKql0qoMPmzm77SluaDLF6t/9vPquBMgRpCok4Fw=;
        b=SiYe/o08CCUfhL5XPW2R56XpujoUX5O5UmLkzJhhiFULk3FrFptCl8lJrMvGfUQLHH3YpE
        PJTN5W+YEU09oHrfJX8hkl01hCauwj1556hu3OIU/8YywZidkx/S4MSIC7dGPT4StvcCIW
        vWSKR2kL3pnKgML/jS03i1jTHDgkBMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395--7ImMQjkP5CpcQscamrOVw-1; Mon, 20 Jan 2020 05:48:03 -0500
X-MC-Unique: -7ImMQjkP5CpcQscamrOVw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42A0918A6EC3;
        Mon, 20 Jan 2020 10:48:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com [10.36.116.106])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9FADE10013A7;
        Mon, 20 Jan 2020 10:47:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id D1CA316E36; Mon, 20 Jan 2020 11:47:55 +0100 (CET)
Date:   Mon, 20 Jan 2020 11:47:55 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
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
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>, uril@redhat.com
Subject: Re: [virtio-dev] Re: [PATCH v2 0/1] VirtIO video device specification
Message-ID: <20200120104755.3hhxlx6x6o32bagf@sirius.home.kraxel.org>
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <7740094.NyiUUSuA9g@os-lin-dmo>
 <20200113095636.blov62o4gbf27om5@sirius.home.kraxel.org>
 <12433898.dW097sEU6C@os-lin-dmo>
 <20200113110521.5ogc3fcy4zq32yzg@sirius.home.kraxel.org>
 <CAAFQd5D16G0E85BCZVx1LXd1TauQH8Lbgs5-0gLv7tNpm4sp_A@mail.gmail.com>
 <20200113132654.r4lhspfx2z7zse2v@sirius.home.kraxel.org>
 <CAAFQd5A3=4JC+3bRf2iw8RwsoB1jJz8p5afi6KaHO6ML2LC0Rg@mail.gmail.com>
 <20200115112640.52kemwg4lncuvvir@sirius.home.kraxel.org>
 <CAD90VcaAaomTnwVESp9RaBwhjx+cKjXAJv4T7wSkFiCEhOUo5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD90VcaAaomTnwVESp9RaBwhjx+cKjXAJv4T7wSkFiCEhOUo5Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > Hmm, using (ii) the API, then check whenever your three plane buffers
> > happen to have the correct layout for (1) hardware looks somewhat
> > backwards to me.
> 
> Can't this problem be solved by adding "offset" field in virtio_video_mem_entry?
> 
> struct virtio_video_mem_entry {
>   le64 addr;
>   le32 length;
>   le32 offset;
>   u8 padding[4];
> };
> 
> Here, "addr" must be the same in every mem_entry for (1) hardware.

No.  virtio_video_mem_entry is basically a scatter list entry, you use
an *array* of these entries to describe your buffer (unless you are
using CMA due to hardware requirements, in this special case you have
only one entry in your array).

> > I'd suggest to use (i) API and allow the device specify alignment
> > requirements.  So (1) hardware would say "need_align=0", whereas (3)
> > hardware would probably say "need_align=PAGE_SIZE" so it can easily
> > split the single buffer into three per-plane buffers.
> 
> Just to confirm, is "need_align" a field added in virtio_video_format_desc?

Given that different formats might have different alignment
requirements this looks like a good place to me.  Maybe rename to
plane_align to make clear what kind of alignment this is.

cheers,
  Gerd

