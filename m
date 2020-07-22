Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A53462298A6
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 14:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732447AbgGVMxe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 08:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732340AbgGVMxc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 08:53:32 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7D7C0619DC
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2020 05:53:32 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 184so1907337wmb.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2020 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WpWpodk0bkykYyQPhY1GLcLq3RG2UyzhjsrNWHvr0T0=;
        b=MIbvpaL0YOGsJvaNtGp45i0OD/GrjY6AbNwiFm2fRpn48im39Wm6adcHHCQJ9w40X8
         90pmiIU8C/W4ajcYLmQ4WWQvXQ2WYjL9GIRMFFpzpT/zqtdT7nru63v1j9fjTstqxpCN
         q+JMNSKTWHzDQF0S743aSv7f33qspRfk7LzXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WpWpodk0bkykYyQPhY1GLcLq3RG2UyzhjsrNWHvr0T0=;
        b=id4ywAflFexO1vMECeQaObYz0Sl/jCS0Fpj864/Dpv48aS5qBbaB8izxY2AzFZ06Ls
         Jp+eXThgD2NRsqmN7ggt4mi5Q9xQIMMjgU+3vadSl1QaRbhLJwJh3ZMp2oblC32pnKtd
         RF1kb9SOFWKnXQCEhbokCoZn7EKO2vEZulpPE7A2XspbYAFvXWRFgiJV9WB5RLCVIN0c
         q34/2PvAAResxcg6bBXmSqfy/4vH/KuIWCqMXARBI6uXDVYcnbE9qGvdogXOdjChvrfj
         W38aIldIH9dUr31cE1KE+h2a9TD6ZcdnBH8fBdtI9mULmMLAFnSLP6VtP6zeanHW/qT2
         v+vg==
X-Gm-Message-State: AOAM532u2kCQJ8P+0aUE6uAoJZmQCtDTnh/bFzL50/rq6QMLROZ5J4r0
        iGrjB5R5YYVikytntMYNGTiOKxDO5PU=
X-Google-Smtp-Source: ABdhPJzU+TSJErAVfK3dolNzb0q/+IAhbpku4rrYezbmA7lrWFN00F2h08omLUwG2B2GKWzKkxILdQ==
X-Received: by 2002:a1c:dd86:: with SMTP id u128mr8304083wmg.131.1595422410773;
        Wed, 22 Jul 2020 05:53:30 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id z8sm1264956wmi.6.2020.07.22.05.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 05:53:30 -0700 (PDT)
Date:   Wed, 22 Jul 2020 12:53:28 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH v5 4/7] v4l2: extend the CSC API to subdevice.
Message-ID: <20200722125328.GA1828171@chromium.org>
References: <20200703171019.19270-1-dafna.hirschfeld@collabora.com>
 <20200703171019.19270-5-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703171019.19270-5-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Fri, Jul 03, 2020 at 07:10:16PM +0200, Dafna Hirschfeld wrote:
> This patch extends the CSC API in video devices to be supported
> also on sub-devices. The flag V4L2_MBUS_FRAMEFMT_SET_CSC set by
> the application when calling VIDIOC_SUBDEV_S_FMT ioctl.
> The flags:
> 
> V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE, V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC,
> V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC,
> 
> are set by the driver in the VIDIOC_SUBDEV_ENUM_MBUS_CODE ioctl.
> 
> New 'flags' fields were added to the structs
> v4l2_subdev_mbus_code_enum, v4l2_mbus_framefmt which are borrowed
> from the 'reserved' field
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  .../media/v4l/subdev-formats.rst              | 78 +++++++++++++++++--
>  .../v4l/vidioc-subdev-enum-mbus-code.rst      | 44 ++++++++++-
>  include/uapi/linux/v4l2-mediabus.h            |  9 ++-
>  include/uapi/linux/v4l2-subdev.h              |  8 +-
>  4 files changed, 129 insertions(+), 10 deletions(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 9a4d61b0d76f..7362ee0b1e96 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -41,32 +41,96 @@ Media Bus Formats
>  	:ref:`field-order` for details.
>      * - __u32
>        - ``colorspace``
> -      - Image colorspace, from enum
> -	:c:type:`v4l2_colorspace`. See
> -	:ref:`colorspaces` for details.
> +      - Image colorspace, from enum :c:type:`v4l2_colorspace`.
> +        Must be set by the driver for capture streams and by the application
> +	for output streams, see :ref:`colorspaces`. If the application sets the
> +	flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set
> +	this field for a capture stream to request a specific colorspace

What is a "capture stream" in terms of the subdev API? Should this
perhaps refer to "source pads" instead?

[snip]
> +.. _v4l2-mbus-framefmt-flags:
> +
> +.. flat-table:: v4l2_mbus_framefmt Flags
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       3 1 4
> +
> +    * .. _`mbus-framefmt-set-csc`:
> +
> +      - ``V4L2_MBUS_FRAMEFMT_SET_CSC``
> +      - 0x00000001
> +      - Set by the application. It is only used for capture and is
> +	ignored for output streams. If set, then request the subdevice to do

Ditto.

> +	colorspace conversion from the received colorspace to the requested
> +	colorspace values. If colorimetry field (``colorspace``, ``ycbcr_enc``,

nit: a colorimetry field

> +	``quantization`` or ``xfer_func``) is set to 0, then that colorimetry

Is it okay to explicitly mention 0 here, rather than the defined
"_DEFAULT" values?

Best regards,
Tomasz
