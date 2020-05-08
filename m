Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7121F1CB0D7
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 15:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728418AbgEHNq5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 09:46:57 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:56155 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727890AbgEHNq4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 09:46:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id X3L0j132A8hmdX3L3jIPoI; Fri, 08 May 2020 15:46:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588945613; bh=TOetOb+xi4Ia7GaX+72kUhnuBnRLDsNajnp+suGAe98=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=D+rzZmqtQw7KkFnGLCY6kABAcS/sKrd06gQkVD1MlS78fROYurvLSGwGXNmP0ipDU
         l6/MXl2UrnfS1beMtMMzWG6zv0TmQJMTbKFcD+V3bT6PayKXHELCsELI8HOlKuGwun
         43ILCa0IOec3GcGa0P5rFcVudfzaA48dKRjrT/vKdnvm76kZiMHkT385CTeu8NYpfU
         jVxm8CzRNnVcOPXNXPOH1M19F7RY5txmXqTRpXBZT7dxsaRmpeQaMR/KX5SV7JRKkK
         csUAURE932vNiYePcw0FLW9g/rPBiLnN1C3jE3VNhNtGopdO0+UidbbJYxwEzMdDq3
         ZDUxL7lhWAs0g==
Subject: Re: [PATCH v9 4/5] media: glossary.rst: add terms for MC-centric
 video-node-centric
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <cover.1588943181.git.mchehab+huawei@kernel.org>
 <0c083fffe63499a9ce49d30f3c907668299401f1.1588943181.git.mchehab+huawei@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <230cccf3-fbe9-5308-9c11-b48aa8382709@xs4all.nl>
Date:   Fri, 8 May 2020 15:46:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0c083fffe63499a9ce49d30f3c907668299401f1.1588943181.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPAmToyQwx6QtPS05+PzfbmGkdQh2a1BaaRCCiBWKh92NM3992WIb+kWs3PZydZOWJ8hQpjRjBef6OxUxmp3wa3qWt0uMsHmhKMcHRZ3AZ50m/hjwYRE
 3YYtXIyPvXDVGBHg50gdkZyw1NdWAFRIJ5dMvvMuqZLntH4rrBiBm3JYdIm85sVeVG0sO3OvdrvvRpDLH4RAIdQVCCV+JQpsaSJxFxeRPyjL5pmrUI0EGS9y
 zIzSMFR8lYvcktyRGPJIncboyyvXTU2My6BCFW0nVFULVMym1bFXN9SUHncPcfA3ir2PEk+lLBZKxbFPHGxDzg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/05/2020 15:10, Mauro Carvalho Chehab wrote:
> Now that we have a chapter describing hardware control, let's
> add the terms used there to the glossary.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../userspace-api/media/glossary.rst          | 42 ++++++++++++++++---
>  1 file changed, 37 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> index 18a1ace00159..8cdb7900e994 100644
> --- a/Documentation/userspace-api/media/glossary.rst
> +++ b/Documentation/userspace-api/media/glossary.rst
> @@ -69,6 +69,20 @@ Glossary
>  
>  	See https://en.wikipedia.org/wiki/Field-programmable_gate_array.
>  
> +    Hardware Component
> +	A subset of the :term:`media hardware`. For example an :term:`I²C` or
> +	:term:`SPI` device, or an :term:`IP block` inside a

inside a -> inside an

> +	:term:`SoC` or :term:`FPGA`.
> +
> +    Hardware Peripheral
> +	A group of :term:`hardware components <hardware component>` that
> +	together make a larger user-facing functional peripheral. For
> +	instance the :term:`SoC` :term:`ISP` :term:`IP	block <ip block>`

Are there some commas missing here after 'SoC' and 'ISP'?

> +	and external camera sensors together make a camera hardware
> +	peripheral.
> +
> +	Also known as :term:`peripheral`.
> +
>      I²C
>  	**Inter-Integrated Circuit**
>  
> @@ -126,6 +140,14 @@ Glossary
>  
>  	See :ref:`media_controller`.
>  
> +    MC-Centric
> +	:term:`V4L2 hardware` that requires a :term:`MC API`.

a -> the

> +
> +	Such hardware have ``V4L2_CAP_IO_MC`` device_caps field unset

They have that capability set, not unset.

> +	(see :ref:`VIDIOC_QUERYCAP`).
> +
> +	See :ref:`v4l2_hardware_control` for more details.
> +
>      Media Hardware
>  	Subset of the hardware that is supported by the Linux Media API.
>  
> @@ -139,6 +161,9 @@ Glossary
>  	control and input/output (I/O) operations specified by the
>  	instructions on a single integrated circuit.
>  
> +    Peripheral
> +	The same as :term:`hardware peripheral`.
> +
>      RC API
>  	**Remote Controller API**
>  
> @@ -168,15 +193,22 @@ Glossary
>  	The userspace API defined in :ref:`v4l2spec`, which is used to
>  	control a V4L2 hardware.
>  
> +    V4L2 Device Node
> +	A :term:`device node` that is associated to a V4L driver.
> +
> +	The V4L2 device node naming is specified at :ref:`v4l2_device_naming`.
> +
>      V4L2 Hardware
>  	Part of a media hardware with is supported by the :term:`V4L2 API`.
>  
>      V4L2 Sub-device
>  	V4L2 hardware components that aren't controlled by a
> -	:term:`bridge driver`.
> +	:term:`bridge driver`. See :ref:`subdev`.
>  
> -    V4L2 Sub-device API
> -	Part of the :term:`V4L2 API` which control
> -	:term:`V4L2 sub-devices <V4L2 Sub-device>`.
> +    Video-node-Centric

Either Video-Node-Centric or Video-node-centric, but not Video-node-Centric,
that's inconsistent use of capitals.

> +	V4L2 hardware that doesn't require a media controller to be used.

a media controller to be used -> the MC API.

>  
> -	See :ref:`subdev`.
> +	Such hardware have ``V4L2_CAP_IO_MC`` device_caps field unset
> +	(see :ref:`VIDIOC_QUERYCAP`).
> +
> +	See :ref:`v4l2_hardware_control` for more details.
> 

Regards,

	Hans
