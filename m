Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F37CF1703C7
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 17:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgBZQH0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 11:07:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53053 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726388AbgBZQH0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 11:07:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582733244;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VC/fSjW6Q9Zf1CVil4K0XbAX6oR7WGL2RegTKV0OEzU=;
        b=VV8ZZEsOg+iP2dzMQmnmeE1uyL4OQyIMvecZ9OyXv7JsDRKFjnIZFUZLQJKYMNznu2/cvB
        nRzHbp43wYFKwKdw+mnyU81jkTtsgjOY1Yfzr1bor27e+ZtAtxiLlt6NuWOCuL0nekqIlO
        Fy+3SVot8P/6bDspw//r8FdXTkpelqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-WhzkhL_bOrG6VaE3qtfNWQ-1; Wed, 26 Feb 2020 11:07:20 -0500
X-MC-Unique: WhzkhL_bOrG6VaE3qtfNWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBC398018A1;
        Wed, 26 Feb 2020 16:07:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com [10.36.116.150])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CA69319C69;
        Wed, 26 Feb 2020 16:07:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id BCA821FCE8; Wed, 26 Feb 2020 17:07:14 +0100 (CET)
Date:   Wed, 26 Feb 2020 17:07:14 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linaro-mm-sig@lists.linaro.org, virtio-dev@lists.oasis-open.org
Subject: Re: [virtio-dev] Re: [PATCH 1/2] virtio: add dma-buf support for
 exported objects
Message-ID: <20200226160714.y2wt5ubtklljn576@sirius.home.kraxel.org>
References: <20200219080637.61312-1-stevensd@chromium.org>
 <20200219080637.61312-2-stevensd@chromium.org>
 <20200225061008.wqxqppfglzmwvtid@sirius.home.kraxel.org>
 <CAD=HUj7h1d8dXG94FUtj4fmeUvUM0dm6NW8WHGZAceHae0zGLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj7h1d8dXG94FUtj4fmeUvUM0dm6NW8WHGZAceHae0zGLw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 26, 2020 at 12:56:58PM +0900, David Stevens wrote:
> On Tue, Feb 25, 2020 at 3:10 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > How about dma_buf_{get,set}_uuid, simliar to dma_buf_set_name?
> 
> While I'm not opposed to such an API, I'm also hesitant to make
> changes to the dma-buf API for a single use case.

See virtio-wayland discussion.  I expect we will see more cases show up.
Maybe this should even go one level up, to struct file.

cheers,
  Gerd

