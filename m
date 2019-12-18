Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1366712488B
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 14:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfLRNkt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 08:40:49 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46452 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726774AbfLRNks (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 08:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576676447;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aDHwmhE3N2YwBTvNh4XLjvyDwb1jj1B2UxIW+0S9e8M=;
        b=iOti5gKVEZaZ8OBvG28rhH06b/vCisFcXE+itFq1Xlf6ef6BlgYyReopvomuJ3cZXfgSNP
        wYNgpWkniqB24vNm1pbofW2/mEYPEUgEaEttBRVDM656XYIkxd1Tlrhldauc/lK5a37GtS
        CTJmTzxzJ1sB6NpJRiff2igfWzasP60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-C57EBOnPOg20XjurW3OY5g-1; Wed, 18 Dec 2019 08:40:43 -0500
X-MC-Unique: C57EBOnPOg20XjurW3OY5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AE20107ACE5;
        Wed, 18 Dec 2019 13:40:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com [10.36.117.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3D0FA5D9E2;
        Wed, 18 Dec 2019 13:40:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 70DA717538; Wed, 18 Dec 2019 14:40:37 +0100 (CET)
Date:   Wed, 18 Dec 2019 14:40:37 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     virtio-dev@lists.oasis-open.org, linux-media@vger.kernel.org,
        acourbot@chromium.org, alexlau@chromium.org, daniel@ffwll.ch,
        dgreid@chromium.org, dmitry.sepp@opensynergy.com,
        egranata@google.com, fziglio@redhat.com, hverkuil@xs4all.nl,
        marcheu@chromium.org, posciak@chromium.org,
        spice-devel@lists.freedesktop.org, stevensd@chromium.org,
        tfiga@chromium.org, uril@redhat.com
Subject: Re: [PATCH v2 1/1] virtio-video: Add virtio video device
 specification
Message-ID: <20191218134037.3jbouht52bxqwfyy@sirius.home.kraxel.org>
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <20191218130214.170703-2-keiichiw@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218130214.170703-2-keiichiw@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> +The device MUST mark the last buffer with the
> +VIRTIO_VIDEO_BUFFER_F_EOS flag to denote completion of the drain
> +sequence.

No, that would build a race condition into the protocol.  The device
could complete the last buffer after the driver has sent the drain
command but before the device saw it.  So the flag would not be
reliable.

I also can't see why the flag is needed in the first place.  The driver
should know which buffers are queued still and be able to figure
whenever the drain is complete or not without depending on that flag.
So I'd suggest to simply drop it.

That is the only issue I've spotted in the protocol on a first quick
look.  There are a few places where the spec text could be improved.
I'll try to set aside some time to go over this in detail, but I can't
promise I'll find the time to do that before xmas and new year.

cheers,
  Gerd

