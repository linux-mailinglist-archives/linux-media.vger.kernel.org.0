Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69321133F85
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 11:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgAHKpG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 05:45:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50550 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726098AbgAHKpG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 05:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578480305;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PJFG+LWZhDtbC1m8KwxjvCdvwcMEMO+uAQF+tCPQvgo=;
        b=UXz3PbArNxwfapS4FinLE1/k8vp5aCh/pUAFr7gTXo9n0bS7SwB76k2GUliYqiFROEynHg
        VcgfWgnYi4ZuTRxox+AO5L6dKsB99BBliXPXzBm8jrf7V9Q22cMBp+DrpYSapTFYEj/a0v
        bFRSkmjcmHCTDha+x63Fx16EkgDx46Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-luh_hD2SNDaDuuVeDS-KMw-1; Wed, 08 Jan 2020 05:45:02 -0500
X-MC-Unique: luh_hD2SNDaDuuVeDS-KMw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62DBDDB60;
        Wed,  8 Jan 2020 10:45:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com [10.36.116.98])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1DD9A5C1B0;
        Wed,  8 Jan 2020 10:45:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 474F39DA5; Wed,  8 Jan 2020 11:44:59 +0100 (CET)
Date:   Wed, 8 Jan 2020 11:44:59 +0100
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
Subject: Re: [virtio-dev][RFC PATCH v1 2/2] virtio-gpu: add the ability to
 export resources
Message-ID: <20200108104459.qikjl4n2j5wkwslu@sirius.home.kraxel.org>
References: <CAD=HUj5U-TxqbPJiRRbyMHON21sht75q3nisvwvKrO+Bf=n8ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj5U-TxqbPJiRRbyMHON21sht75q3nisvwvKrO+Bf=n8ng@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> +\begin{lstlisting}
> +struct virtio_gpu_export_resource {
> +        struct virtio_gpu_ctrl_hdr hdr;
> +        le32 resource_id;
> +        le32 padding;
> +};
> +
> +struct virtio_gpu_resp_export_resource {
> +        struct virtio_gpu_ctrl_hdr hdr;
> +        le64 uuid_low;
> +        le64 uuid_high;
> +};
> +\end{lstlisting}

Is there a specific reason why you want the host pick the uuid?  I would
let the guest define the uuid, i.e. move the uuid fields to
virtio_gpu_export_resource and scratch virtio_gpu_resp_export_resource.

Also I'd siggest to name the command (and struct) RESOURCE_ASSIGN_UUID.

cheers,
  Gerd

