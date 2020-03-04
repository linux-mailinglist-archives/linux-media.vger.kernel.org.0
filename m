Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47A51178BE2
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 08:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728569AbgCDHsx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 02:48:53 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:53921 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727176AbgCDHsx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Mar 2020 02:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583308132;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VHfVr/tC6mnm30TtswDnaZCgkdF5cd/cEuR4XHAYi4k=;
        b=D1t14iF8O4v4UX5wzTkhY0bayMicKPlg7umZoSf1CbK8fk/LQsaToEXqoJqDMMD1ZSl74b
        833deNJFjLwyov07ZyeulwrcbF4P49GHkG9NS5a0Ugc79++mYYpRPwUIyGEqeRisfZS3/e
        w6pI3qPE0FI+8S3nPZzbRi4VvQgIUrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-fXX0MZD-OeewdNcRAR5oGg-1; Wed, 04 Mar 2020 02:48:48 -0500
X-MC-Unique: fXX0MZD-OeewdNcRAR5oGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1483C8018A6;
        Wed,  4 Mar 2020 07:48:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com [10.36.116.150])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EBD0891D6E;
        Wed,  4 Mar 2020 07:48:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 2D00B17506; Wed,  4 Mar 2020 08:48:41 +0100 (CET)
Date:   Wed, 4 Mar 2020 08:48:41 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtio-dev@lists.oasis-open.org
Subject: Re: [PATCH v2 1/4] dma-buf: add support for virtio exported objects
Message-ID: <20200304074841.gbfzhxorta3pfk4f@sirius.home.kraxel.org>
References: <20200302121524.7543-1-stevensd@chromium.org>
 <20200302121524.7543-2-stevensd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302121524.7543-2-stevensd@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 02, 2020 at 09:15:21PM +0900, David Stevens wrote:
> This change adds a new dma-buf operation that allows dma-bufs to be used
> by virtio drivers to share exported objects. The new operation allows
> the importing driver to query the exporting driver for the UUID which
> identifies the underlying exported object.
> 
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  drivers/dma-buf/dma-buf.c | 14 ++++++++++++++
>  include/linux/dma-buf.h   | 22 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index d4097856c86b..a04632284ec2 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1158,6 +1158,20 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
>  }
>  EXPORT_SYMBOL_GPL(dma_buf_vunmap);
>  
> +#ifdef CONFIG_VIRTIO
> +int dma_buf_get_uuid(struct dma_buf *dmabuf, uuid_t *uuid)

Hmm, I think I would drop the #ifdef

cheers,
  Gerd

