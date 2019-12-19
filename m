Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 992461262CC
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 14:02:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfLSNCH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 08:02:07 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47722 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726701AbfLSNCG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 08:02:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576760525;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BIuW3mEuk8a1ZwAYQGdutllkKPAoXcw9K6KLzQ0xKIw=;
        b=XgYZYwh6kJZVwmZxQlc51WVrbZrGuAWfsu7hU5BVdjgTX8kauUyD8UVMkdTdjF4OB9ncZ7
        LRZEH872puSZa4T8oHJxOloGPm3i31Y6Rl8tDPzysSZPeJ27HZPH6ZgoRRSB4K9wZAUTsA
        SATM/wmOqI1DCQ3Xt3fCzJUQv6n8Sjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-kdlq7Sa4OCmY1hrQqKMWSQ-1; Thu, 19 Dec 2019 08:02:02 -0500
X-MC-Unique: kdlq7Sa4OCmY1hrQqKMWSQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1780E18B644F;
        Thu, 19 Dec 2019 13:02:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com [10.36.116.98])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6B95C10013A7;
        Thu, 19 Dec 2019 13:01:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 810C611AAA; Thu, 19 Dec 2019 14:01:58 +0100 (CET)
Date:   Thu, 19 Dec 2019 14:01:58 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        Enrico Granata <egranata@google.com>, fziglio@redhat.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>, uril@redhat.com
Subject: Re: [virtio-dev] Re: [PATCH v2 1/1] virtio-video: Add virtio video
 device specification
Message-ID: <20191219130158.7rzdkyemupreudko@sirius.home.kraxel.org>
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <CAAFQd5AEJ0sUzqrXJAmFnBn0aU8Ef6FwXYo0LgK0NO_CdWXRVg@mail.gmail.com>
 <20191219074639.kdkrqxwb6fdb67hu@sirius.home.kraxel.org>
 <3550989.gzE5nMqd4t@os-lin-dmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3550989.gzE5nMqd4t@os-lin-dmo>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > Not clearly defined in the spec:  When is the decoder supposed to send
> > the response for a queue request?  When it finished decoding (i.e. frame
> > is ready for playback), or when it doesn't need the buffer any more for
> > decoding (i.e. buffer can be re-queued or pages can be released)?
> In my eyes the both statements mean almost the same and both are valid.

Well, no.  When the device decoded a P-Frame it can notify the device,
saying "here is your decoded frame".  But the device might still need
the buffer with the decoded frame to properly decode the following B/I
Frames which reference the P-Frame.

cheers,
  Gerd

