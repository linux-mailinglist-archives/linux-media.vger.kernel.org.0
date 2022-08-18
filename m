Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA7E597F64
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 09:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243751AbiHRHmD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 03:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243631AbiHRHmB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 03:42:01 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D2024BD08
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 00:41:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id D99E2CE1F21
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 07:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16F1C433C1;
        Thu, 18 Aug 2022 07:41:53 +0000 (UTC)
Message-ID: <9ef830aa-fd39-5dae-af8d-99751468fb19@xs4all.nl>
Date:   Thu, 18 Aug 2022 09:41:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/5] media: docs: Add V4L2_CAP_EDID_MEMORY
Content-Language: en-US
To:     Erling Ljunggren <hljunggr@cisco.com>, linux-media@vger.kernel.org
References: <20220803075850.1196988-1-hljunggr@cisco.com>
 <20220803075850.1196988-3-hljunggr@cisco.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220803075850.1196988-3-hljunggr@cisco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Erling,

On 03/08/2022 09:58, Erling Ljunggren wrote:
> Add documentation for the new edid eeprom capability.
> 
> Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
> ---
>  Documentation/userspace-api/media/v4l/biblio.rst      | 11 +++++++++++
>  .../userspace-api/media/v4l/vidioc-querycap.rst       |  7 +++++++
>  .../userspace-api/media/videodev2.h.rst.exceptions    |  1 +
>  3 files changed, 19 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
> index 9cd18c153d19..5cbe41877a63 100644
> --- a/Documentation/userspace-api/media/v4l/biblio.rst
> +++ b/Documentation/userspace-api/media/v4l/biblio.rst
> @@ -334,6 +334,17 @@ VESA DMT
>  
>  :author:    Video Electronics Standards Association (http://www.vesa.org)
>  
> +.. _vesaeddc:
> +
> +E-DDC
> +====
> +
> +
> +:title:     VESA Enhanced Display Data Channel (E-DDC) Standard
> +:subtitle:  Version 1.3
> +
> +:author:    Video Electronics Standards Association (http://www.vesa.org)
> +
>  .. _vesaedid:
>  
>  EDID
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> index 63e23f6f95ee..bdb530bd6816 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> @@ -173,6 +173,13 @@ specification the ioctl returns an ``EINVAL`` error code.
>  	interface. A video overlay device typically stores captured images
>  	directly in the video memory of a graphics card, with hardware
>  	clipping and scaling.
> +    * - ``V4L2_CAP_EDID_MEMORY``
> +      - 0x00000008
> +      - The device is a standalone EDID memory device. This is typically an eeprom
> +        that supports the VESA Enhanced Display Data Channel Standard.
> +
> +        While an eeprom is the most common implementation, it can be something else
> +        as well, such as a microcontroller. Hence the generic name 'memory'.

I realized that this is not just needed for inputs, but also for outputs.

This is the case for an HDMI splitter that is connected to a computer via (typically)
a serial port where you can use that to get/set the EDID for the input port and
get the EDIDs for the output ports (i.e. the EDIDs from the connected displays).

It's the same concept: a standalone EDID device. However, you are not talking
directly to a memory device like an eeprom. So I think to keep things generic
this capability should be renamed to just V4L2_CAP_EDID.

The description should be updated as well since it is no longer just for inputs.

And I think we can drop the references to 'memory'. It's really about hardware
devices that store an EDID for a sink or read an EDID from a source.

Patch 5 will have to be updated as well since for an output device this cap is
associated with ENUM/S/G_OUTPUT. And for output S_EDID is not supported, of
course.

I'm working on a driver for an HDMI Splitter (CEC and EDID support), so this
would come in very handy for that.

Regards,

	Hans

>      * - ``V4L2_CAP_VBI_CAPTURE``
>        - 0x00000010
>        - The device supports the :ref:`Raw VBI Capture <raw-vbi>`
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index 9cbb7a0c354a..12fa290828e7 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -185,6 +185,7 @@ replace define V4L2_CAP_META_OUTPUT device-capabilities
>  replace define V4L2_CAP_DEVICE_CAPS device-capabilities
>  replace define V4L2_CAP_TOUCH device-capabilities
>  replace define V4L2_CAP_IO_MC device-capabilities
> +replace define V4L2_CAP_EDID_MEMORY device-capabilities
>  
>  # V4L2 pix flags
>  replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`v4l2_pix_format`
