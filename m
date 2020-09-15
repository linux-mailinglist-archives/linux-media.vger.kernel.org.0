Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7491926B805
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 02:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgIONiY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 09:38:24 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:50905 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726658AbgIONbd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 09:31:33 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3D90324000B;
        Tue, 15 Sep 2020 13:31:00 +0000 (UTC)
Date:   Tue, 15 Sep 2020 15:34:51 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 3/3] media: docs: v4l2-subdev: move generic paragraph to
 the introduction
Message-ID: <20200915133451.jydprottrtskqe7y@uno.localdomain>
References: <20200904215141.20862-1-luca@lucaceresoli.net>
 <20200904215141.20862-3-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200904215141.20862-3-luca@lucaceresoli.net>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Luca,

On Fri, Sep 04, 2020 at 11:51:41PM +0200, Luca Ceresoli wrote:
> This paragraph provides generic information to explain what v4l2_subdev is
> useful for. Placing it in the middle of paragraphs describing the details
> of subdev registration does not make much sense. Move it near the beginning
> of the section when the v4l2_subdev idea has just been introduced and
> before going into its details.
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/driver-api/media/v4l2-subdev.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> index fb66163deb38..1c1e3f9da142 100644
> --- a/Documentation/driver-api/media/v4l2-subdev.rst
> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> @@ -12,6 +12,12 @@ Usually these are I2C devices, but not necessarily. In order to provide the
>  driver with a consistent interface to these sub-devices the
>  :c:type:`v4l2_subdev` struct (v4l2-subdev.h) was created.
>
> +The advantage of using :c:type:`v4l2_subdev` is that it is a generic struct and
> +does not contain any knowledge about the underlying hardware. So a driver might
> +contain several subdevs that use an I2C bus, but also a subdev that is
> +controlled through GPIO pins. This distinction is only relevant when setting
> +up the device, but once the subdev is registered it is completely transparent.
> +
>  Each sub-device driver must have a :c:type:`v4l2_subdev` struct. This struct
>  can be stand-alone for simple sub-devices or it might be embedded in a larger
>  struct if more state information needs to be stored. Usually there is a
> @@ -235,12 +241,6 @@ it can call ``v4l2_subdev_notify(sd, notification, arg)``. This macro checks
>  whether there is a ``notify()`` callback defined and returns ``-ENODEV`` if not.
>  Otherwise the result of the ``notify()`` call is returned.
>
> -The advantage of using :c:type:`v4l2_subdev` is that it is a generic struct and
> -does not contain any knowledge about the underlying hardware. So a driver might
> -contain several subdevs that use an I2C bus, but also a subdev that is
> -controlled through GPIO pins. This distinction is only relevant when setting
> -up the device, but once the subdev is registered it is completely transparent.
> -

Have you considered moving the whole part that describes how to call
operations, which comes after the synchronous registration case to a
dedicated sub-section ? The above paragraph makes sense in the context
of describing why v4l2_subdev is advantageous as it abstract the
underlying details under a unified call interface.

This could become

V4L2 sub-devices
----------------

Intro
~~~~~

Registration
~~~~~~~~~~~~

**synchronous**
**asynchronous**

Operations call (or a better name :)
~~~~~~~~~~~~~~~

What do you think ?

Thanks
  j

>  In the **asynchronous** case subdevice probing can be invoked independently of
>  the bridge driver availability. The subdevice driver then has to verify whether
>  all the requirements for a successful probing are satisfied. This can include a
> --
> 2.28.0
>
