Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6972A138E52
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 10:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgAMJ4s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 04:56:48 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49196 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726163AbgAMJ4s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 04:56:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578909407;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UCvTXYMbzC5vCpYE+uOK6yxI2QnoH2hk7vv2O/6gzmk=;
        b=XS2NL25dBLXrWRE2SNmcSTEOku6UdJQU1X1djFXA/qGT1yZD7QChsx+0ehddktvia2XIRB
        wwbLzuY78f77W47S9nMD4gt8+cuUer55urofpMDstyuQ1AlsZ1SCHpXVYuBaohXo1+iOQh
        2Q9T1v7x4B5he2+IOpaTobyIyb5l24g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-HdATJDllOr6NV5NQyjFoag-1; Mon, 13 Jan 2020 04:56:43 -0500
X-MC-Unique: HdATJDllOr6NV5NQyjFoag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2105E1800D78;
        Mon, 13 Jan 2020 09:56:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com [10.36.116.106])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0CE411001DD7;
        Mon, 13 Jan 2020 09:56:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 1B9679DB3; Mon, 13 Jan 2020 10:56:36 +0100 (CET)
Date:   Mon, 13 Jan 2020 10:56:36 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
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
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>, uril@redhat.com
Subject: Re: [virtio-dev] Re: [PATCH v2 0/1] VirtIO video device specification
Message-ID: <20200113095636.blov62o4gbf27om5@sirius.home.kraxel.org>
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <2137719.ElGaqSPkdT@os-lin-dmo>
 <CAD90Vcbk5DerrFNQdH1wdAX=HxBjMz9-FoNiWm_ryvwsA_YvYA@mail.gmail.com>
 <7740094.NyiUUSuA9g@os-lin-dmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7740094.NyiUUSuA9g@os-lin-dmo>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> This also means that we cannot have unspec for planes layout. Device either 
> expects planes in separate buffers or in one buffer with some offsets, there 
> cannot be mixed cases.

Hmm.  Is it useful to support both?  Or maybe support the "one buffer +
offsets" case only?  Splitting one buffer into multiple smaller ones
internally if needed shouldn't be a problem, and it would simplify the
interface a bit ...

cheers,
  Gerd

