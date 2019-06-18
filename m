Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A425E49CC3
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 11:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbfFRJNJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 05:13:09 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:35689 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbfFRJNJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 05:13:09 -0400
X-Originating-IP: 90.88.23.150
Received: from aptenodytes (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr [90.88.23.150])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 08404E001C;
        Tue, 18 Jun 2019 09:13:00 +0000 (UTC)
Message-ID: <dd632e5d4cc25a75ee78e688297ed793eae84819.camel@bootlin.com>
Subject: Re: [PATCH] media: Clarify the meaning of file descriptors in
 VIDIOC_DQBUF
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>
Date:   Tue, 18 Jun 2019 11:13:00 +0200
In-Reply-To: <20190612093648.47412-1-tfiga@chromium.org>
References: <20190612093648.47412-1-tfiga@chromium.org>
Organization: Bootlin
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed, 2019-06-12 at 18:36 +0900, Tomasz Figa wrote:
> When the application calls VIDIOC_DQBUF with the DMABUF memory type, the
> v4l2_buffer structure (or v4l2_plane structures) are filled with DMA-buf
> file descriptors. However, the current documentation does not explain
> whether those are new file descriptors referring to the same DMA-bufs or
> just the same integers as passed to VIDIOC_QBUF back in time. Clarify
> the documentation that it's the latter.

LGTM,

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> ---
>  Documentation/media/uapi/v4l/vidioc-qbuf.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-qbuf.rst b/Documentation/media/uapi/v4l/vidioc-qbuf.rst
> index dbf7b445a27b..407302d80684 100644
> --- a/Documentation/media/uapi/v4l/vidioc-qbuf.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-qbuf.rst
> @@ -139,6 +139,14 @@ may continue as normal, but should be aware that data in the dequeued
>  buffer might be corrupted. When using the multi-planar API, the planes
>  array must be passed in as well.
>  
> +If the application sets the ``memory`` field to ``V4L2_MEMORY_DMABUF`` to
> +dequeue a :ref:`DMABUF <dmabuf>` buffer, the driver fills the ``m.fd`` field
> +with a file descriptor numerically the same as the one given to ``VIDIOC_QBUF``
> +when the buffer was enqueued. No new file descriptor is created at dequeue time
> +and the value is only for the application convenience. When the multi-planar
> +API is used the ``m.fd`` fields of the passed array of struct
> +:c:type:`v4l2_plane` are filled instead.
> +
>  By default ``VIDIOC_DQBUF`` blocks when no buffer is in the outgoing
>  queue. When the ``O_NONBLOCK`` flag was given to the
>  :ref:`open() <func-open>` function, ``VIDIOC_DQBUF`` returns
-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

