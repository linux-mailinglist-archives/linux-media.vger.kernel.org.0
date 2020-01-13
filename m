Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F760138FBA
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 12:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgAMLFc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 06:05:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23661 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726480AbgAMLFc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 06:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578913531;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=59lWFDYW3VFdpEox0GkaZ5lVDt5TY88LO0e7WvoKGxc=;
        b=gR7s3KYuEMfmeiES/c/pqB6HP37LGYmkti9KamMsxPANFWj2Vj02RdUaCFWHi/ZR4jatK6
        qFj6BX8M+TX9y8zhA6dFfBq2f9pdmVloKzr2EPHkWN/5Uz+mMAWMaF/d6Cq11hCtKuxfm5
        h0Zn8MVkT5EPdhBe4gZvcDICT6Y6E3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-plPcE48VMBu2XOLWC5sA6w-1; Mon, 13 Jan 2020 06:05:28 -0500
X-MC-Unique: plPcE48VMBu2XOLWC5sA6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BE9A1137853;
        Mon, 13 Jan 2020 11:05:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com [10.36.116.106])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3FF9687EC6;
        Mon, 13 Jan 2020 11:05:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 4B28531F5E; Mon, 13 Jan 2020 12:05:21 +0100 (CET)
Date:   Mon, 13 Jan 2020 12:05:21 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     spice-devel@lists.freedesktop.org,
        Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org, Tomasz Figa <tfiga@chromium.org>,
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
Message-ID: <20200113110521.5ogc3fcy4zq32yzg@sirius.home.kraxel.org>
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <7740094.NyiUUSuA9g@os-lin-dmo>
 <20200113095636.blov62o4gbf27om5@sirius.home.kraxel.org>
 <12433898.dW097sEU6C@os-lin-dmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12433898.dW097sEU6C@os-lin-dmo>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 13, 2020 at 11:41:45AM +0100, Dmitry Sepp wrote:
> Hi Gerd,
> 
> Thanks for reviewing!
> 
> On Montag, 13. Januar 2020 10:56:36 CET Gerd Hoffmann wrote:
> >   Hi,
> > 
> > > This also means that we cannot have unspec for planes layout. Device
> > > either
> > > expects planes in separate buffers or in one buffer with some offsets,
> > > there cannot be mixed cases.
> > 
> > Hmm.  Is it useful to support both?  Or maybe support the "one buffer +
> > offsets" case only?  Splitting one buffer into multiple smaller ones
> > internally if needed shouldn't be a problem, and it would simplify the
> > interface a bit ...
> > 
> 
> Ok, let's consider the following case:
>  - the device expects planes in separate buffers.
>  - say, Android on the guest side also imports planes in separate buffers into the driver.
>  - but he driver only supports one buffer + offsets.
> 
> Do you mean the driver then can join the underlying page lists and set offsets then? Yes, 
> this would probably make sense.

Well, no.  Tomasz Figa had splitted the devices into three groups:

  (1) requires single buffer.
  (2) allows any layout (including the one (1) devices want).
  (3) requires per-plane buffers.

Category (3) devices are apparently rare and old.  Both category (1)+(2)
devices can handle single buffers just fine.  So maybe support only
that?

Hope it's more clear this time,
  Gerd

