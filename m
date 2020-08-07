Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD0323ECFC
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 13:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgHGL5N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 07:57:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52912 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726293AbgHGL5N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 07:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596801432;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4OTRM6GItp3LnFcS/b/Uhe1XhDIzGwsKYalbI9Dy4T8=;
        b=C+J9s/vwZFAVYhxdXJUa/fP9i/dV8qCG4Y5bizH23UN+zM7WHJhDrVse7TAbij3wrTOZjU
        XNhmXKnktC9HOIggl5U3y66lhfVOe+veNAMs0Zv/f3t1sVunhAx5O1oLGbwiXUPZsjp8mt
        lVOLuC2TKDeHDwRH0kaIJUIIzSyj0Dg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-x7C4o9zANwWgQB1b1vy1gw-1; Fri, 07 Aug 2020 07:57:10 -0400
X-MC-Unique: x7C4o9zANwWgQB1b1vy1gw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85A3880BCB2;
        Fri,  7 Aug 2020 11:57:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com [10.36.112.195])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DC92F87A7A;
        Fri,  7 Aug 2020 11:57:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id BEDD7B1A; Fri,  7 Aug 2020 13:57:04 +0200 (CEST)
Date:   Fri, 7 Aug 2020 13:57:04 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Xin He <hexin.op@bytedance.com>
Cc:     daniel@ffwll.ch, airlied@linux.ie, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Qi Liu <liuqi.16@bytedance.com>,
        Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v3] drm/virtio: fix missing dma_fence_put() in
 virtio_gpu_execbuffer_ioctl()
Message-ID: <20200807115704.4epnok7vxwdmemns@sirius.home.kraxel.org>
References: <20200721101647.42653-1-hexin.op@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721101647.42653-1-hexin.op@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 21, 2020 at 06:16:47PM +0800, Xin He wrote:
> From: Qi Liu <liuqi.16@bytedance.com>
> 
> We should put the reference count of the fence after calling
> virtio_gpu_cmd_submit(). So add the missing dma_fence_put().

>  	virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
>  			      vfpriv->ctx_id, buflist, out_fence);
> +	dma_fence_put(&out_fence->f);
>  	virtio_gpu_notify(vgdev);

Pushed to drm-misc-fixes.

thanks,
  Gerd

