Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61D64144DBF
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 09:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbgAVI3g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 03:29:36 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27799 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725868AbgAVI3g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 03:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579681774;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Rsxv79MIsJpMkuOHmysIM4sn2CG/wHNfUOUxHKcwzjQ=;
        b=iQz7PvrKlO32QeTWIrUllnAvt/C/QZRQqAqqAnkbWa+yJQdi/a9hSz0o+oPm/HkAFbw0YQ
        Dqk+2d07iQlnYOSj/opm88pNO9Sxz0RT1H1MKzaIDrMaTh1DnhwUVvpvSpRU5RTGYjZwF/
        O+SVemHkS3sH0BEfiJh4z89bi2S5eKg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-cliUvi1AM_WxXZUMcMOxFQ-1; Wed, 22 Jan 2020 03:29:33 -0500
X-MC-Unique: cliUvi1AM_WxXZUMcMOxFQ-1
Received: by mail-wr1-f72.google.com with SMTP id j13so2684663wrr.20
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2020 00:29:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rsxv79MIsJpMkuOHmysIM4sn2CG/wHNfUOUxHKcwzjQ=;
        b=eZ92iun0KGkaGCbQp5c5bh3SjFwV1QQu8a5MJEWzAHuoCnAsaJtXSjZqpavqijlZiJ
         peLbm1m05S10U57HlxUA6U1JTBz0h8IZo98YJQ1lOSRd1W0XLx2wWrSNMYJPLxEiAhjg
         48Mqo8ijd/tzCe+vDNvS0fXsrEEMA+/W0VCNnGNjst1+r0gR8OI40VeZ7/a4Vo1h5tP8
         cJH4hCmxkDfvzsIJK+v5JSzhxu97NvfIIoIpkkYJhOiYqfn7sG+Pbdh9GTvxYXA0aRFV
         DXWtu0rN65ogtuMvtZyqrEIKhW9vSNb+k8Cklhj7X26Eb8G7Rmsmb6ef5ELzl0k/iqgU
         SiUA==
X-Gm-Message-State: APjAAAWuGmrHcvZ00ZRc7iOa0fGAFJpQgOYLKc0ITSxEoXHmOTwBbMAt
        cCGgTF7TaBip7HnAASspwjJ4KQnVqzC/iNEmsvZBVYv5V/NyjxVKpbrefq35CR2HmmZTE1z3IC4
        Yk7PCuFCBtfCx83mEJOtqyug=
X-Received: by 2002:a5d:548e:: with SMTP id h14mr9131464wrv.380.1579681772098;
        Wed, 22 Jan 2020 00:29:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqxrFUnPGgplkiiBhAQPOlTJ32CQ5imjYv5btpKqodQXvX+aqR6aocpL97Qcfli8Mbqxh9qwtw==
X-Received: by 2002:a5d:548e:: with SMTP id h14mr9131438wrv.380.1579681771795;
        Wed, 22 Jan 2020 00:29:31 -0800 (PST)
Received: from redhat.com (bzq-79-176-0-156.red.bezeqint.net. [79.176.0.156])
        by smtp.gmail.com with ESMTPSA id g7sm55791801wrq.21.2020.01.22.00.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 00:29:31 -0800 (PST)
Date:   Wed, 22 Jan 2020 03:29:28 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     virtio-dev@lists.oasis-open.org, Gerd Hoffmann <kraxel@redhat.com>,
        Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [virtio-dev][RFC PATCH v1 2/2] virtio-gpu: add the ability to
 export resources
Message-ID: <20200122032433-mutt-send-email-mst@kernel.org>
References: <CAD=HUj7N8dpEvf0Be8fg-qpFFTQOqzZX_kVoFB=BWp8S4uEFvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj7N8dpEvf0Be8fg-qpFFTQOqzZX_kVoFB=BWp8S4uEFvg@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 22, 2020 at 04:16:35PM +0900, David Stevens wrote:
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  virtio-gpu.tex | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/virtio-gpu.tex b/virtio-gpu.tex
> index af4ca61..a1f0210 100644
> --- a/virtio-gpu.tex
> +++ b/virtio-gpu.tex
> @@ -186,12 +186,16 @@ \subsubsection{Device Operation: Request
> header}\label{sec:Device Types / GPU De
>          VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
>          VIRTIO_GPU_CMD_MOVE_CURSOR,
> 
> +        /* misc commands */
> +        VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID = 0x0400,
> +
>          /* success responses */
>          VIRTIO_GPU_RESP_OK_NODATA = 0x1100,
>          VIRTIO_GPU_RESP_OK_DISPLAY_INFO,
>          VIRTIO_GPU_RESP_OK_CAPSET_INFO,
>          VIRTIO_GPU_RESP_OK_CAPSET,
>          VIRTIO_GPU_RESP_OK_EDID,
> +        VIRTIO_GPU_RESP_OK_RESOURCE_ASSIGN_UUID,
> 
>          /* error responses */
>          VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
> @@ -454,6 +458,32 @@ \subsubsection{Device Operation:
> controlq}\label{sec:Device Types / GPU Device /
>  This detaches any backing pages from a resource, to be used in case of
>  guest swapping or object destruction.
> 
> +\item[VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID] Creates an exported object from
> +  a resource. Request data is \field{struct
> +    virtio_gpu_resource_assign_uuid}.  Response type is
> +  VIRTIO_GPU_RESP_OK_RESOURCE_ASSIGN_UUID, response data is \field{struct
> +    virtio_gpu_resp_resource_assign_uuid}.
> +
> +\begin{lstlisting}
> +struct virtio_gpu_resource_assign_uuid {
> +        struct virtio_gpu_ctrl_hdr hdr;
> +        le32 resource_id;
> +        le32 padding;
> +};
> +
> +struct virtio_gpu_resp_resource_assign_uuid {
> +        struct virtio_gpu_ctrl_hdr hdr;
> +        le64 uuid_low;
> +        le64 uuid_high;
> +};
> +\end{lstlisting}
> +

ok but how is this then used? will there be more commands to pass
this uuid to another device?

> +The response contains a uuid which identifies the exported object created from
> +the host private resource.

Are the uuids as specified in rfc-4122? I guess we need to link to that spec then
..

> Note that if the resource has an attached backing,
> +modifications made to the host private resource through the exported object by
> +other devices are not visible in the attached backing until they are
> transferred
> +into the backing.
> +

s/host/device/?

>  \end{description}
> 
>  \subsubsection{Device Operation: cursorq}\label{sec:Device Types /
> GPU Device / Device Operation / Device Operation: cursorq}
> -- 
> 2.25.0.341.g760bfbb309-goog
> 
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org

