Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDC05F4188
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 08:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfKHHuE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 02:50:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40960 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725975AbfKHHuE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 02:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573199402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bAwPu7Y+2B56ZFmNE2RJtjED536uO0V2o1jRbSldlU4=;
        b=cD2UdR/zOoydIfpbH+X1G3+pixUsd0Qlv7L8uMeFB892kczf6Y/gw7Iy0Wo8LDz43kbjHP
        DwAr262onZm5gAaAsvmR6BSpIQCB6+Z4X/QyJs3SVZqMEGo70m3b6l/Y9iQDIUYU6u9nip
        YG2PiSe3zPRntjrBNdFMkluIw2gKI5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-p6guKsiYONq0MFR5XybYWw-1; Fri, 08 Nov 2019 02:49:59 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81D15477;
        Fri,  8 Nov 2019 07:49:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com [10.36.116.69])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DAB655D6A5;
        Fri,  8 Nov 2019 07:49:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 1B44A11AAA; Fri,  8 Nov 2019 08:49:55 +0100 (CET)
Date:   Fri, 8 Nov 2019 08:49:55 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     virtio-dev@lists.oasis-open.org, linux-media@vger.kernel.org,
        tfiga@chromium.org, keiichiw@chromium.org, acourbot@chromium.org,
        alexlau@chromium.org, dgreid@chromium.org, marcheu@chromium.org,
        posciak@chromium.org, stevensd@chromium.org, hverkuil@xs4all.nl,
        daniel@ffwll.ch
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device
 specification
Message-ID: <20191108074955.t7mtqks4dfmrdzod@sirius.home.kraxel.org>
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <20191107095657.72dlxzm4uz7ndkek@sirius.home.kraxel.org>
 <1573181413.STYvEGL1rf@os-lin-dmo>
MIME-Version: 1.0
In-Reply-To: <1573181413.STYvEGL1rf@os-lin-dmo>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: p6guKsiYONq0MFR5XybYWw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 07, 2019 at 02:09:34PM +0100, Dmitry Sepp wrote:
> Hello Gerd,
>=20
> Thank you for your feedback.
>=20
> There is no relationship between those. As I mentioned earlier. we have a=
lso=20
> been working on a virtio video device at the same time. And there is no=
=20
> relationship between the two specs.

Keiichi, have you looked at the spec?

I think it is useful to have a single device specification for all video
functions given that there is a bunch of common stuff.  Both encoder and
decoder must negotiate video frame and video stream parameters for
example.  Also the virtio-video spec looks like a superset of
virtio-vdec.

Is there any important feature in video-vdec which is missing in
virtio-video?

> virtio-video:
> 1. Uses the 'driver requests - device responses' model.
> 2. Does not  have the logical split of bitstreams and framebuffers, has o=
nly a=20
> generic buffer object.

Can you give a quick summary on buffer object management?

thanks,
  Gerd

