Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1FA2130EAE
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 09:33:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbgAFIds (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 03:33:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35575 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725446AbgAFIds (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 03:33:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578299627;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=49l6bjAclyz7lkwNh/P8L5o26bsK4TdQICyfzEA+dF4=;
        b=V1Oeaj2cyBI23IBe4OP0evitsmgYLB1tvxd5N5I1i+3m9PnQKvcW+hgvS6auz5ZOyb3bC9
        OPiaSTqW9PQHJ15igQauQGiPmnmg6SBx01SpOz9NYA/2s6wTN0pFuZFeASCg5s5fWtgjNz
        KvQKxUENxD6kLV/YKW9wM7bCUc8S3pw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-IEiZZk7uNTuVn5dCgRwItg-1; Mon, 06 Jan 2020 03:33:44 -0500
X-MC-Unique: IEiZZk7uNTuVn5dCgRwItg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0B67593AC;
        Mon,  6 Jan 2020 08:33:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com [10.36.116.98])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BA13D5D9CA;
        Mon,  6 Jan 2020 08:33:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id EB7CA31E8E; Mon,  6 Jan 2020 09:33:35 +0100 (CET)
Date:   Mon, 6 Jan 2020 09:33:35 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        virtio-dev@lists.oasis-open.org,
        Keiichi Watanabe <keiichiw@chromium.org>,
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
Subject: Re: [virtio-dev] Re: [PATCH v2 1/1] virtio-video: Add virtio video
 device specification
Message-ID: <20200106083335.jmzhavtlq7ppgtic@sirius.home.kraxel.org>
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <20191218130214.170703-2-keiichiw@chromium.org>
 <2932378.s8JBUXtX1Y@os-lin-dmo>
 <2322065.f0tlG9Vh6p@os-lin-dmo>
 <CAAFQd5ANkgPdu71Oo6YjFPJ2dT24GK_Ne5=Omp6Sh+6FXT2BTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5ANkgPdu71Oo6YjFPJ2dT24GK_Ne5=Omp6Sh+6FXT2BTw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > We also see the need to add a max_streams value to this structure so as to
> > explicitly provide a limit on the number of streams the guest can create.
> 
> What would be the advantage over just trying to create one and
> failing? The maximum number would be only meaningful for the special
> case when the streams are always only created by one user space
> process. Otherwise, if several processes do that, they are not aware
> of each other and the number could be higher than they can actually
> create, because other processes could have some streams created
> already.

Also the number of streams might not be fixed but depend on stream
parameters, i.e. hardware can decode one hd or two sd streams ...

cheers,
  Gerd

