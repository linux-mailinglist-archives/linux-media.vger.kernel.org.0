Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5701D133F6E
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 11:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727337AbgAHKkK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 05:40:10 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:54205 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726955AbgAHKkK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Jan 2020 05:40:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578480008;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Gk5FuMwr+1rqCqZ5AZAcPgLfCDw7n+uF6yKOUI46XaM=;
        b=I8wfAXaDW+Y3vgM+rX2zzIWKDAJlhzv/sffNmifcZFoliRmw/IuR0iyCD6NcPbNxFOfgAX
        4dG6+3tJnkdvc8F+XKcGdyY4AJ3yTTi3UxqAsTXI/nNoIfIueswEFncuVtIwmvz2k8J15i
        8D6Yfs83VQqrrlKMVNxI5fiz+xJThXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-s9ud41kuO-qesu25yrPp8A-1; Wed, 08 Jan 2020 05:40:05 -0500
X-MC-Unique: s9ud41kuO-qesu25yrPp8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FE171005502;
        Wed,  8 Jan 2020 10:40:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com [10.36.116.98])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E854B10016DA;
        Wed,  8 Jan 2020 10:40:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 23E7611AAA; Wed,  8 Jan 2020 11:40:02 +0100 (CET)
Date:   Wed, 8 Jan 2020 11:40:02 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     virtio-dev@lists.oasis-open.org, Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [virtio-dev][RFC PATCH v1 1/2] content: define what exporting a
 resource is
Message-ID: <20200108104002.jxh6amnrazhnamej@sirius.home.kraxel.org>
References: <CAD=HUj6FA3VoTJqNa+gmAgVOv9zS7Qk9pdg46EY9NvtJOdz5_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj6FA3VoTJqNa+gmAgVOv9zS7Qk9pdg46EY9NvtJOdz5_A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 08, 2020 at 06:01:58PM +0900, David Stevens wrote:
> Define a mechanism for sharing resources between different virtio
> devices.
> 
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  content.tex | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index b1ea9b9..73bd28e 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -373,6 +373,24 @@ \section{Driver Notifications}
> \label{sec:Virtqueues / Driver notifications}
> 
>  \input{shared-mem.tex}
> 
> +\section{Exporting Resources}\label{sec:Basic Facilities of a Virtio
> Device / Exporting Resources}
> +
> +When a resource created by one virtio device needs to be
> +shared with a seperate virtio device, the first device can
> +export the resource by generating a \field{uuid} which the
> +guest can pass to the second device to identify the resource.
> +
> +What constitutes a resource, how to export resources, and
> +how to import resources are defined by the individual device
> +types. The generation method of a \field{uuid} is dependent
> +upon the implementation of the exporting device.
> +
> +Whether a particular exported resource can be imported into
> +a device is dependent upon the implementations of the exporting
> +and importing devices. Generally speaking, the guest should
> +have some knowledge of the host configuration before trying to
> +use exported resources.

Hmm, I'd suggest to move the whole thing into the virtio-gpu section.
There is no such thing as a "resource" in general virtio context ...

cheers,
  Gerd

