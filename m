Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F63144D87
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 09:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgAVIXS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 03:23:18 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57208 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725868AbgAVIXS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 03:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579681397;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oxbFuRA6cYANIAIOn7mbS+CIioBKwjscNIESnmng42k=;
        b=HKGYUvRRAxfJ+Az6h/OIYv5zyWnRdtBUGtRmgIKE4EZhxnllGNNzrs8AwjmEw/JtZlZZfU
        0X/Hg/oya0nGo2OzDZd9nfZ5hk4wbIT/k2sHLXL4aMbNamF6uA7S7zBr7U9a3/sufkhU6x
        F/L8D9Ktk2pUchUxjIa2BcwWeadopDQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-927HwMy4OFCuQf0GGEDO2w-1; Wed, 22 Jan 2020 03:23:15 -0500
X-MC-Unique: 927HwMy4OFCuQf0GGEDO2w-1
Received: by mail-wr1-f72.google.com with SMTP id z14so2734829wrs.4
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2020 00:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oxbFuRA6cYANIAIOn7mbS+CIioBKwjscNIESnmng42k=;
        b=WmvexVZeYP2iFNUGrv1NKwN+CWoe022bOpY86jRsYwUg3ThW7P8CiFL2qap5zKSz7d
         DU5df6D+kBBmcacNxuZ//8suXSpZ9XXzerJNC1YNsmQEifxKSoBWStsvl/oW9zQVRv42
         QVyur3zgR+neTdtPRibee5yVnVoJvbsGGRFvUtEkWyBHfVujBLnw2QgqNBcaWuPEnfgO
         iRyLdf2Y39jfTLXmx3XttzdzWeqyqyQKVXFmhu8p4webSm1iCmwgyY+wZjpndLfa+9qJ
         mDXhtkRPR6izF2M8YTCBGMCMyOuJVHI1924l7GWF68YvctvxNLaP2OEIMeqzTqZkMg23
         8rIQ==
X-Gm-Message-State: APjAAAWOtR0ZFnMFaDb2IY81+EQvJfxMxoy0it55Rv4xRcDQwmogMFVf
        5DlvQXY3hO7gHp96ISyX4W2bGRpJTzzG5pJoYWpjqjllj2/r2e961vzAwFkcb/nMWmsWLzsGMl2
        DUtOmIC1Ghzcxd0LzO987uRU=
X-Received: by 2002:adf:97d6:: with SMTP id t22mr9572858wrb.407.1579681394321;
        Wed, 22 Jan 2020 00:23:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqy4Nc8yNudGXZtdqyE7DdO2kl4yoezYKuFNaKXZ60TsSGEZrp6pQXUYLinQY1sIflkXMblYHA==
X-Received: by 2002:adf:97d6:: with SMTP id t22mr9572839wrb.407.1579681394150;
        Wed, 22 Jan 2020 00:23:14 -0800 (PST)
Received: from redhat.com (bzq-79-176-0-156.red.bezeqint.net. [79.176.0.156])
        by smtp.gmail.com with ESMTPSA id s19sm2754234wmj.33.2020.01.22.00.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 00:23:13 -0800 (PST)
Date:   Wed, 22 Jan 2020 03:23:10 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     virtio-dev@lists.oasis-open.org, Gerd Hoffmann <kraxel@redhat.com>,
        Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [virtio-dev][RFC PATCH v1 1/2] content: define what an exported
 object is
Message-ID: <20200122032103-mutt-send-email-mst@kernel.org>
References: <CAD=HUj640QfNwO4J_tdcSx36YOVAVT_dZUXYuKPaCKvZVWeHsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj640QfNwO4J_tdcSx36YOVAVT_dZUXYuKPaCKvZVWeHsg@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 22, 2020 at 04:16:24PM +0900, David Stevens wrote:
> Define a mechanism for sharing objects between different virtio
> devices.
> 
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  content.tex | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index b1ea9b9..6c6dd59 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -373,6 +373,24 @@ \section{Driver Notifications}
> \label{sec:Virtqueues / Driver notifications}
> 
>  \input{shared-mem.tex}
> 
> +\section{Exporting Objects}\label{sec:Basic Facilities of a Virtio
> Device / Exporting Objects}
> +
> +When an object created by one virtio device needs to be
> +shared with a seperate virtio device, the first device can
> +export the object by generating a \field{uuid}

This is a field where?

> which the
> +guest can pass to the second device to identify the object.


s/guest/Driver/ ?

> +
> +What constitutes an object, how to export objects, and
> +how to import objects are defined by the individual device
> +types. The generation method of a \field{uuid} is dependent
> +upon the implementation of the exporting device.
> +
> +Whether a particular exported object can be imported into
> +a device is dependent upon the implementations of the exporting
> +and importing devices. Generally speaking, the guest should
> +have some knowledge of the host configuration before trying to
> +use exported objects.

this last paragraph seems to be too general to be really useful.

Also - what are guest and host here?


> +
>  \chapter{General Initialization And Device
> Operation}\label{sec:General Initialization And Device Operation}
> 
>  We start with an overview of device initialization, then expand on the
> -- 
> 2.25.0.341.g760bfbb309-goog
> 
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org

