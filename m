Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E28531D85D8
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 20:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387717AbgERSVZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 14:21:25 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:40331 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731473AbgERSVV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 14:21:21 -0400
Received: by mail-io1-f65.google.com with SMTP id s10so11690841iog.7;
        Mon, 18 May 2020 11:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G+w12N+B2PiHESokDoCntmAJD2nRnefuc3D2jDiR3h8=;
        b=fR9YE5SwKFbgrMXSqvAuaKVTyo2fSwMkEYOZPpwnHAcWQh99N5jXa5ezScA09ihfr7
         SjJ3IxgXAIgpxEYmzETxgEFeijcnfAcyat+qX3VgFUDPnpBPXM+FRDFhVPkgoli8sVOb
         IvVdyvxACxEXW8jkfXQNAO3VeywOKq9adpPlR430d2fFgVqfLFklycrN5FFmbK9mRcXS
         LPGFbxu0rJ7sBX1rPyBlIXumTJRAlL5JUm2AvMJU6D02IS4h/HKUyURdZ65DLKTzV+UD
         94DaSoWPQYIH7rYxqLVNHO3rNT0I8tymoeop4nL7zvacySvo3eHUZZ79nUpMgyzX9DU4
         0n6Q==
X-Gm-Message-State: AOAM530uU6xcDGKiG5D3Nu6A7REI5wG2Ih7Fu0u3o629+vOoFmz3lHyf
        D3RyGe+Ed6SLkFqbgH53QwkxFto=
X-Google-Smtp-Source: ABdhPJx72FnMnqBhY0ES/xdixMmYlsaeGaOPaJzpYhhzZYE1ew/CeuMZ+1kDJ3srj1k4VHm7DIoKMA==
X-Received: by 2002:a6b:dc11:: with SMTP id s17mr15908502ioc.42.1589826079993;
        Mon, 18 May 2020 11:21:19 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id m17sm5062222ilh.51.2020.05.18.11.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 11:21:19 -0700 (PDT)
Received: (nullmailer pid 27724 invoked by uid 1000);
        Mon, 18 May 2020 18:21:18 -0000
Date:   Mon, 18 May 2020 12:21:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz, devicetree@vger.kernel.org
Subject: Re: [PATCH v11 13/13] dt-bindings: Add media properties
Message-ID: <20200518182118.GA24090@bogus>
References: <20200509090456.3496481-1-jacopo@jmondi.org>
 <20200509090456.3496481-14-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509090456.3496481-14-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 09, 2020 at 11:04:56AM +0200, Jacopo Mondi wrote:
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
> ---
> 
> I currently don't have users in mainline for this, I understand this implies
> this is probably not going to be accepted. At the same time we don't have a
> common place for media-related definitions, which support properties defined in
> video-interfaces.txt

Fine for me with no users if values already defined in binding.

> 
> I leave it here at the end of the series for discussions, but I'm fine dropping
> it from the series.
> 
> Thanks
>   j
> 
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

Dual license please.

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
> +
> +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
> --
> 2.26.1
> 
