Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F34A1276C12
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 10:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbgIXIel (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 04:34:41 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:36675 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727046AbgIXIel (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 04:34:41 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id LMi2k3UQ24gEjLMi5kaXkp; Thu, 24 Sep 2020 10:34:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600936477; bh=FFxfLAp7KubmQtPBhG5ZkDa51TaYt+sXqo1v42oiKxI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MTmrIY6GhGJt273PCTEH3GjxxGG2ygrIi1lSA0xNZQZtZukN75/WXn1JoJC/T4o7q
         mMDOPW94fm8P6a3vB4srBn3Suvq7Y5Y6HAxAhn0pnh/BqTEsE6QT11rC+lC6clvD6M
         Fy4SpIDwP9w9Ap35Gl+IRVsmBg6N2UzGM1HG+1qJ3vQM1K9WmRHoDbd1vVedZdvNR2
         hR+fTxlMjd6nyMPgdmRboTOF8IWS5GYT96YCM+SzgJDRn2tphDZUVv1anwk8xZochT
         kLsQG4IhzRRo6M6zJupq8dSLBKPvtGV/luT98LFAQlvxtm77AFWXo1Qb/3X1v2QlPM
         Igta5H4o8jiZg==
Subject: Re: [PATCH v2 4/4] media: docs: v4l2-subdev: move calling ops to a
 subsection
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20200921202134.9792-1-luca@lucaceresoli.net>
 <20200921202134.9792-4-luca@lucaceresoli.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8c133704-df03-8ce9-4319-418ae6cca5ee@xs4all.nl>
Date:   Thu, 24 Sep 2020 10:34:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921202134.9792-4-luca@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCjIUXzXom1wlYllI9HhY3dpKurdq6dQNorRq7QRUxzFScbZ+WJzlU2wLDy8u/iIg5YaBO2Oi4sXpHlc3gpz6SQTQGVaBP5+6WL5oCY1rfH7dMKmUcXw
 wE9L5OXHbMeqOh7J8ezYeA4f2l+9pn07F7FHNm7oMIAVCJiJgSY8dO3+A1hsHBuVfeEJy/pBxT6d+AFZfq8LYsONsTb6TyXrWO1UJPF3FIJc5aInp+8eNtxb
 kajZB3rjxod7G8d/WuKKW6cUw1BuRmKapLUBS98OcwSYW8HSQHV2/mffstjTvpS2Cc3vVR4HhyGgHrz+TtFvbg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/09/2020 22:21, Luca Ceresoli wrote:
> Documentation on how to call the subdev ops is currently in the middle of
> synchronous and asynchronous registration. Move it to a dedicated
> subsection after the registration methods.
> 
> Also move the final paragraph "The advantage of using v4l2_subdev..." to
> the beginning of the new section as it has an introductory content.
> 
> Suggested-by: Jacopo Mondi <jacopo@jmondi.org>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> 
> Changes in v2:
>  - replaces the simpler patch 3/3 upon suggestion by Jacopo
> ---
>  .../driver-api/media/v4l2-subdev.rst          | 88 ++++++++++---------
>  1 file changed, 46 insertions(+), 42 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> index 3adcd881cae5..21ee54bbec77 100644
> --- a/Documentation/driver-api/media/v4l2-subdev.rst
> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> @@ -182,7 +182,51 @@ You can unregister a sub-device using:
>  Afterwards the subdev module can be unloaded and
>  :c:type:`sd <v4l2_subdev>`->dev == ``NULL``.
>  
> -You can call an ops function either directly:
> +In the **asynchronous** case subdevice probing can be invoked independently of
> +the bridge driver availability. The subdevice driver then has to verify whether
> +all the requirements for a successful probing are satisfied. This can include a
> +check for a master clock availability. If any of the conditions aren't satisfied
> +the driver might decide to return ``-EPROBE_DEFER`` to request further reprobing
> +attempts. Once all conditions are met the subdevice shall be registered using
> +the :c:func:`v4l2_async_register_subdev` function. Unregistration is
> +performed using the :c:func:`v4l2_async_unregister_subdev` call. Subdevices
> +registered this way are stored in a global list of subdevices, ready to be
> +picked up by bridge drivers.
> +
> +Bridge drivers in turn have to register a notifier object. This is
> +performed using the :c:func:`v4l2_async_notifier_register` call. To
> +unregister the notifier the driver has to call
> +:c:func:`v4l2_async_notifier_unregister`. The former of the two functions
> +takes two arguments: a pointer to struct :c:type:`v4l2_device` and a
> +pointer to struct :c:type:`v4l2_async_notifier`.
> +
> +Before registering the notifier, bridge drivers must do two things:
> +first, the notifier must be initialized using the
> +:c:func:`v4l2_async_notifier_init`. Second, bridge drivers can then
> +begin to form a list of subdevice descriptors that the bridge device
> +needs for its operation. Subdevice descriptors are added to the notifier
> +using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
> +takes two arguments: a pointer to struct :c:type:`v4l2_async_notifier`,
> +and a pointer to the subdevice descripter, which is of type struct
> +:c:type:`v4l2_async_subdev`.
> +
> +The V4L2 core will then use these descriptors to match asynchronously
> +registered subdevices to them. If a match is detected the ``.bound()``
> +notifier callback is called. After all subdevices have been located the
> +.complete() callback is called. When a subdevice is removed from the
> +system the .unbind() method is called. All three callbacks are optional.
> +
> +Calling subdev operations
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The advantage of using :c:type:`v4l2_subdev` is that it is a generic struct and
> +does not contain any knowledge about the underlying hardware. So a driver might
> +contain several subdevs that use an I2C bus, but also a subdev that is
> +controlled through GPIO pins. This distinction is only relevant when setting
> +up the device, but once the subdev is registered it is completely transparent.
> +
> +Once te subdev has been registered you can call an ops function either
> +directly:
>  
>  .. code-block:: c
>  
> @@ -233,47 +277,7 @@ that needs it.
>  If the sub-device needs to notify its v4l2_device parent of an event, then
>  it can call ``v4l2_subdev_notify(sd, notification, arg)``. This macro checks
>  whether there is a ``notify()`` callback defined and returns ``-ENODEV`` if not.
> -Otherwise the result of the ``notify()`` call is returned.
> -
> -The advantage of using :c:type:`v4l2_subdev` is that it is a generic struct and
> -does not contain any knowledge about the underlying hardware. So a driver might
> -contain several subdevs that use an I2C bus, but also a subdev that is
> -controlled through GPIO pins. This distinction is only relevant when setting
> -up the device, but once the subdev is registered it is completely transparent.
> -
> -In the **asynchronous** case subdevice probing can be invoked independently of
> -the bridge driver availability. The subdevice driver then has to verify whether
> -all the requirements for a successful probing are satisfied. This can include a
> -check for a master clock availability. If any of the conditions aren't satisfied
> -the driver might decide to return ``-EPROBE_DEFER`` to request further reprobing
> -attempts. Once all conditions are met the subdevice shall be registered using
> -the :c:func:`v4l2_async_register_subdev` function. Unregistration is
> -performed using the :c:func:`v4l2_async_unregister_subdev` call. Subdevices
> -registered this way are stored in a global list of subdevices, ready to be
> -picked up by bridge drivers.
> -
> -Bridge drivers in turn have to register a notifier object. This is
> -performed using the :c:func:`v4l2_async_notifier_register` call. To
> -unregister the notifier the driver has to call
> -:c:func:`v4l2_async_notifier_unregister`. The former of the two functions
> -takes two arguments: a pointer to struct :c:type:`v4l2_device` and a
> -pointer to struct :c:type:`v4l2_async_notifier`.
> -
> -Before registering the notifier, bridge drivers must do two things:
> -first, the notifier must be initialized using the
> -:c:func:`v4l2_async_notifier_init`. Second, bridge drivers can then
> -begin to form a list of subdevice descriptors that the bridge device
> -needs for its operation. Subdevice descriptors are added to the notifier
> -using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
> -takes two arguments: a pointer to struct :c:type:`v4l2_async_notifier`,
> -and a pointer to the subdevice descripter, which is of type struct
> -:c:type:`v4l2_async_subdev`.
> -
> -The V4L2 core will then use these descriptors to match asynchronously
> -registered subdevices to them. If a match is detected the ``.bound()``
> -notifier callback is called. After all subdevices have been located the
> -.complete() callback is called. When a subdevice is removed from the
> -system the .unbind() method is called. All three callbacks are optional.
> +Otherwise the result of the ``notify()`` call is return

It looks like the last bit of this sentences was accidentally deleted.
"return" -> "returned."

I'll fix this up myself, no need for a new version of this patch.

Regards,

	Hans

>  
>  V4L2 sub-device userspace API
>  -----------------------------
> 

