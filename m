Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C88BBFC2A7
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 10:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfKNJdA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 04:33:00 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47038 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfKNJc7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 04:32:59 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9CDF9291544;
        Thu, 14 Nov 2019 09:32:57 +0000 (GMT)
Date:   Thu, 14 Nov 2019 10:32:55 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] media: vidioc-enum-fmt.rst: clarify format
 preference
Message-ID: <20191114103255.0f14ce70@collabora.com>
In-Reply-To: <20191113175603.24742-4-ezequiel@collabora.com>
References: <20191113175603.24742-1-ezequiel@collabora.com>
        <20191113175603.24742-4-ezequiel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 13 Nov 2019 14:56:03 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> It has been decided to use the ENUM_FMT index value
> as a hint for driver preference. This is defined purposedly
> in a very liberal way, letting drivers define what "preference"
> means.
> 
> For instance, the Hantro VPU driver indicates additional
> processing to output a given format, and thus implicates
> more CPU usage, which is enumerated after native (non-processed)
> formats.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> index 399ef1062bac..8ca6ab701e4a 100644
> --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> @@ -44,7 +44,9 @@ To enumerate image formats applications initialize the ``type`` and
>  the :ref:`VIDIOC_ENUM_FMT` ioctl with a pointer to this structure. Drivers
>  fill the rest of the structure or return an ``EINVAL`` error code. All
>  formats are enumerable by beginning at index zero and incrementing by
> -one until ``EINVAL`` is returned.
> +one until ``EINVAL`` is returned. If applicable, drivers shall return
> +formats in preference order, where preferred formats are returned before
> +(that is, with lower ``index`` value) less-preferred formats.
>  
>  .. note::
>  

