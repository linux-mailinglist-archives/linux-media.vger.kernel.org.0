Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9102B15A847
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2020 12:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgBLLu5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Feb 2020 06:50:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57080 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726775AbgBLLu5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Feb 2020 06:50:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581508256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Wbp6OYHT+ZYdi4EsCHYy54SXQdNb+4rYVUbEAVx189Q=;
        b=R7m72t+KwQxW9kjwjr6vYEPePPA/NVSI16ZMo2apz5J0efKRDmtVQzBYCxcMsgwoD5N4Bx
        JnkLPvZPmL/V8ktstWDaH3QU0S7V1QXzud+hN9SJG+oD5ZbxAZDK+HygBwS74jLXPdxDSg
        WGEvpPQT9iyjFxb5Tj54KMLJLwf2unE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-FsIYVDKLPMKL5g8tx3QhxQ-1; Wed, 12 Feb 2020 06:50:54 -0500
X-MC-Unique: FsIYVDKLPMKL5g8tx3QhxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CA3418FE868;
        Wed, 12 Feb 2020 11:50:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com [10.36.117.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4C16A5C102;
        Wed, 12 Feb 2020 11:50:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 864519D6B; Wed, 12 Feb 2020 12:50:51 +0100 (CET)
Date:   Wed, 12 Feb 2020 12:50:51 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     virtio-comment@lists.oasis-open.org,
        Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [RFC PATCH v3 2/2] virtio-gpu: add the ability to export
 resources
Message-ID: <20200212115051.woveg4nxgd4f7o73@sirius.home.kraxel.org>
References: <20200207074033.172289-1-stevensd@chromium.org>
 <20200207074033.172289-3-stevensd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200207074033.172289-3-stevensd@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 07, 2020 at 04:40:33PM +0900, David Stevens wrote:
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  virtio-gpu.tex | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/virtio-gpu.tex b/virtio-gpu.tex
> index af4ca61..e950ad3 100644
> --- a/virtio-gpu.tex
> +++ b/virtio-gpu.tex
> @@ -186,12 +186,16 @@ \subsubsection{Device Operation: Request header}\label{sec:Device Types / GPU De
>          VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
>          VIRTIO_GPU_CMD_MOVE_CURSOR,
>  
> +        /* misc commands */
> +        VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID = 0x0400,

I'd suggest to move that to the "2d commands" section (which isn't
really "2d" but more "not 3d").

We also need a feature flag signaling support for the new command.

Otherwise this looks ok to me.

Are there any patches and/or attempts to merge/discuss upstream?
Specifically for handling the uuids for dma-bufs in linux (guest side)?
I suspect there will be some discussions on this and having at least
some plan upstream can agree on would be good.

cheers,
  Gerd

