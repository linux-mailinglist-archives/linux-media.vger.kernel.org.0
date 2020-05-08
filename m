Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537981CB110
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 15:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbgEHNyY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 09:54:24 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:35013 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728354AbgEHNyV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 09:54:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id X3SBj15X38hmdX3SFjIRLl; Fri, 08 May 2020 15:54:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588946059; bh=g28m16k9PVCujQ/KD/8jSldMTDsaIS8scKOwL8rU4hg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Z86g9nNSiZlkJ5v4id4Wm/JAl8pXWsbzp/7x9wXpzYJdWSFonzWt1LLyL/9MlCuBz
         CRLUlxhR+B9/TcdvlcH3jxFvlOKuHhoUsvV05YzCU/RRujEvzWcxrbzo1ECWayJvnh
         9+BHjvuPCWePwstNGQdq/n4YgtroDGruNbGyiELaWjY125F5W+GnbGygCqJsIlu6ik
         WRqxwkdNvo3e0QshrhWxlW/I7FeT1q07SeBaROpQbWKpfg2CwAOLPSKbRs+HaD/zmG
         VayQrrN/5sdyRQq8cdjJMQDaAsfVZlJ2mycQ5mpnfV58ufuzBdFK5vvzlGw/d7V8sg
         PH4XnkvsZj+9w==
Subject: Re: [PATCH v9 5/5] media: open.rst: document mc-centric and
 video-node-centric
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
References: <cover.1588943181.git.mchehab+huawei@kernel.org>
 <4fe37ecf19ad62f3c2ba6af31de81ec724fead16.1588943181.git.mchehab+huawei@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c863a62c-a345-612a-9723-e907c711155b@xs4all.nl>
Date:   Fri, 8 May 2020 15:54:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4fe37ecf19ad62f3c2ba6af31de81ec724fead16.1588943181.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPsIal0Rk/3L129adr2ogpACCtlJWec7neOc+HP4rSTpRFzVvlzgiRpJf/mQKdPrJ1cZvkkk/E9ybxQ1SjP8Xede0GeeG1BqcHZl85De+5eTdf2C5L/g
 0Aqf9mbXa6ESZXEaKorooCza5+S2e6Y4piEAJwuVKJkNNTCt1SF5sv8CR4HuPxzJEAO8rJVNhOSnprO5jdRlPwXFvqKgSX4dm76tBW1kwRWKtcZlq2fkIG5G
 5YX97Qy70QVYRSdPphjSk+6ORVU+ZVlsB6GIuZa2IUvR1dbTi+SIjBG95xrejJ/GgTep5dYQ+KV209N3rI7f8UQbGLrbsHiJhYCzdLQYBlfW4JGHFRYtQKdP
 NbsZ8WNa
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/05/2020 15:10, Mauro Carvalho Chehab wrote:
> When we added support for omap3, back in 2010, we added a new
> type of V4L2 devices that aren't fully controlled via the V4L2
> device node.
> 
> Yet, we have never clearly documented in the V4L2 specification
> the differences between the two types.
> 
> Let's document them based on the the current implementation.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../userspace-api/media/v4l/open.rst          | 54 ++++++++++++++++---
>  1 file changed, 48 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/open.rst b/Documentation/userspace-api/media/v4l/open.rst
> index ee4c8f123815..8a9f766ab855 100644
> --- a/Documentation/userspace-api/media/v4l/open.rst
> +++ b/Documentation/userspace-api/media/v4l/open.rst
> @@ -13,6 +13,48 @@
>  Opening and Closing Devices
>  ***************************
>  
> +.. _v4l2_hardware_control:
> +
> +Controlling a hardware peripheral via V4L2
> +==========================================
> +
> +V4L2 hardware peripheral is usually complex: support for it is

V4L2 -> A V4L2

> +implemented via a bridge driver and often by several additional drivers.
> +The bridge driver exposes one or more V4L2 device nodes
> +(see :ref:`v4l2_device_naming`).
> +
> +There are other drivers providing support for other components of
> +the hardware, with may also expose device nodes, called V4L2 sub-devices.

with -> which

> +
> +When such V4L2 sub-devices are exposed, they allow controlling
> +other hardware components - usually connected via a serial bus (like

other -> those other

> +I²C, SMBus or SPI). Depending on the bridge driver, those sub-devices
> +can be controlled indirectly via the bridge driver or explicitly via
> +the :ref:`Media Controller <media_controller>` and via the
> +:ref:`V4L2 sub-devices <subdev>`.
> +
> +The devices that require the use of the
> +:ref:`Media Controller <media_controller>` are called **MC-centric**
> +devices. The devices that are fully controlled via V4L2 device nodes
> +are called **video-node-centric**.
> +
> +Userspace can check if a V4L2 hardware peripheral is MC-centric by
> +calling :ref:`VIDIOC_QUERYCAP` and checking the
> +:ref:`device_caps field <device-capabilities>`.
> +
> +If the device returns ``V4L2_CAP_IO_MC`` flag at ``device_caps``,
> +it is MC-centric, otherwise, it is video-node-centric.

then it is MC-centric, otherwise it is video-node-centric.

> +
> +It is required for MC-centric hardware to identify the V4L2
> +sub-devices and to configure the pipelines via the
> +:ref:`media controller API <media_controller>` before using the peripheral.
> +Also, the sub-devices' configuration shall be controlled via the
> +:ref:`sub-device API <subdev>`.
> +
> +.. note::
> +
> +   A video-node-centric may still provide a both media-controller and

a both -> the

> +   sub-device interfaces as well.

Add:

However, in that case the media-controller and the sub-device interfaces
are read-only and just provide information about the device. The actual
configuration is done via the video nodes.

>  
>  .. _v4l2_device_naming:
>  
> @@ -109,7 +151,7 @@ Related Devices
>  Devices can support several functions. For example video capturing, VBI
>  capturing and radio support.
>  
> -The V4L2 API creates different nodes for each of these functions.
> +The V4L2 API creates different V4L2 device nodes for each of these functions.
>  
>  The V4L2 API was designed with the idea that one device node could
>  support all functions. However, in practice this never worked: this
> @@ -119,17 +161,17 @@ switching a device node between different functions only works when
>  using the streaming I/O API, not with the
>  :ref:`read() <func-read>`/\ :ref:`write() <func-write>` API.
>  
> -Today each device node supports just one function.
> +Today each V4L2 device node supports just one function.
>  
>  Besides video input or output the hardware may also support audio
>  sampling or playback. If so, these functions are implemented as ALSA PCM
>  devices with optional ALSA audio mixer devices.
>  
>  One problem with all these devices is that the V4L2 API makes no
> -provisions to find these related devices. Some really complex devices
> -use the Media Controller (see :ref:`media_controller`) which can be
> -used for this purpose. But most drivers do not use it, and while some
> -code exists that uses sysfs to discover related devices (see
> +provisions to find these related V4L2 device nodes. Some really complex
> +hardware use the Media Controller (see :ref:`media_controller`) which can
> +be used for this purpose. But several drivers do not use it, and while some
> +code exists that uses sysfs to discover related V4L2 device nodes (see
>  libmedia_dev in the
>  `v4l-utils <http://git.linuxtv.org/cgit.cgi/v4l-utils.git/>`__ git
>  repository), there is no library yet that can provide a single API
> 

Regards,

	Hans
