Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B99991CA8EE
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 13:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgEHLEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 07:04:31 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:57511 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726891AbgEHLEb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 07:04:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X0nojdsWmtKAsX0nrje7Sw; Fri, 08 May 2020 13:04:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588935868; bh=jWeWN61JQKvTu589M4NfqHuR1nw9CwTDajchbqCtB34=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DRzB2sUEc5k6d7SvFkx61vTUCoYiWjtG6bW5HDToQscxCFSM0hbuZZvzy1+rBV0ld
         S87o3+rZgDysesypnZwBSS5FHWym3GEgp/o20gGCP65w7z+J3aMxJmqX++i6j4282o
         hvyuVIygqvToOatIkk0mZbO2mOvoSfTJ5YevQ0Q1+8AlFTG89WYI7h9d3iKC1bDWyZ
         2cWbcoE3C75rXaukg8Hlpjk4gfVwBbuaemeZChX8a8Zk6wWb8ASoBjAi44SBj1BeXN
         RDcyp3+6/T59qMsMijErA/PwUCahgZ5jKNNnQTyDkeY4F+kGeWtiB1VF/LYyJbFRPj
         glP0V7nVVlulQ==
Subject: Re: [PATCH v10 03/13] dt-bindings: Add media properties
To:     Jacopo Mondi <jacopo@jmondi.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Cc:     tfiga@google.com, pavel@ucw.cz, devicetree@vger.kernel.org
References: <20200508100158.3437161-1-jacopo@jmondi.org>
 <20200508100158.3437161-4-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c09f2875-b9ca-8154-0491-3c5da1dc0c10@xs4all.nl>
Date:   Fri, 8 May 2020 13:04:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200508100158.3437161-4-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMrALxKOdEXDZO7irx6rGkiShrXWVzOOpwoMvHzTLPh3kQ0ev1tWbMlaohfEk6YjZ6qCF36EwujPyQ4ko9GDEnrgTNGXaaS3jUFdJlzPa96SerwotLOf
 C6UPX3mYCAjB8j2Kl6z1GBZi7Fd16A4veUFX9Aapei0bG1UoCZMXNMSNQdQVPC2kOzSpaJf58H18bm4udRMmaaqvGWqzQF9YG/CAwTRuZFf3fpaHFhD/Gp0P
 /l4QC6e1Eo3h3dBW/mSHxdv0H5ZVws3bt3y2QNCl26+ZwWNWhBnUbt+jJDBhwF9EolBU0Xyvh8cDFZKvd6TEiaNCANAjbOs3LVUKdAy/ORt0ikD71nOnpUOb
 XT7g7oS9DGEozQ6on002ogJDCSMoIZWreqn8rt1DpAuwS9HQS8SfSdyQnY4fFdM+uYoD+BZZl0SgxzjeHEfvBTO2WocdUf4RKHZV5Cf8c+jDN2bnEeQcbbv0
 7vvvN8XrxoYlVipnJJTwlFM5xno96ijD2yYPaw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/05/2020 12:01, Jacopo Mondi wrote:
> Add a DT header file to contain definitions for standard media properties.
> 
> The file is named after:
> Documentation/devicetree/bindings/media/video-interfaces.txt
> which contains the standard media properties definitions.
> 
> Initially add three macros to define the supported 'orientation'
> property values.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

For v11 just move this to the end of the series since it is an independent
patch.

> ---
>  include/dt-bindings/media/video-interfaces.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 include/dt-bindings/media/video-interfaces.h
> 
> diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
> new file mode 100644
> index 0000000000000..404c697d6bd6e
> --- /dev/null
> +++ b/include/dt-bindings/media/video-interfaces.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * include/dt-bindings/media/video-interfaces.h
> + *
> + * Copyright (C) 2020 Jacopo Mondi <jacopo@jmondi.org>
> + */
> +
> +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> +
> +#define FRONT_CAMERA		<0>
> +#define BACK_CAMERA		<1>
> +#define EXTERNAL_CAMERA		<2>

Wouldn't it be better to say CAMERA_FRONT (i.e. swap the words) or
even CAMERA_ORIENTATION_FRONT?

Regards,

	Hans

> +
> +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
> --
> 2.26.1
> 

