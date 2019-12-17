Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C985122D17
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 14:39:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbfLQNjx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 08:39:53 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:45049 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726164AbfLQNjx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 08:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576589991;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=M5Ll0y0T3AHPX2/5owjoB4bNcgMaPHTd+rCp31Z6XeI=;
        b=L3ahLs9IlMq7vio3ITLlCF3M+ql/BSXEda/esgoe8WIJy4HFb4ngMUfkFKpSiyKHQkNNGk
        4zzSgLcxkQ/GtOeeGOsYKeVAyIV941SH8bGM6SpsXoHwuJPiFjkNpKn0qyyce/Zg78PZy7
        zDRB0aQgdS546DwgIQZ/WSwu42hvhNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-Fjzg1kUwOhSm_8kPyEb6Gw-1; Tue, 17 Dec 2019 08:39:48 -0500
X-MC-Unique: Fjzg1kUwOhSm_8kPyEb6Gw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64551593A0;
        Tue, 17 Dec 2019 13:39:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com [10.36.117.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DEA4E60C63;
        Tue, 17 Dec 2019 13:39:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 17AA89DA3; Tue, 17 Dec 2019 14:39:45 +0100 (CET)
Date:   Tue, 17 Dec 2019 14:39:45 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device
 specification
Message-ID: <20191217133945.oxnassyjr6hwtjbf@sirius.home.kraxel.org>
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <CAD90Vcbr7L2KsyDxPeoKPRt6y_ai8xkJ=J0JCGsW6tGZJGH=0A@mail.gmail.com>
 <20191120112929.gvsne7ykvcyw65lu@sirius.home.kraxel.org>
 <7736193.Whgddqjo8n@os-lin-dmo>
 <CAD90VcbYAhk9CiagSEi=ouNMioR4v71uc40rRHGMe_+wvAm+0g@mail.gmail.com>
 <20191204091620.zpnd7jttkpkduort@sirius.home.kraxel.org>
 <CAAFQd5Bs6NnsoOP1NFLREQSLNJs-K33ZvW5ZcdAZTv95WHmPBA@mail.gmail.com>
 <20191216103236.ugjorzq5pntc7gtt@sirius.home.kraxel.org>
 <CAAFQd5BN+enTk3-4aUCCB+ZUA+7ZsOP=zndXh4Y=a8faoRk1Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5BN+enTk3-4aUCCB+ZUA+7ZsOP=zndXh4Y=a8faoRk1Pw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> On the host side, the encode and decode APIs are different as well, so
> having separate implementation decoder and encoder, possibly just
> sharing some helper code, would make much more sense.

When going down that route I'd suggest to use two device ids (even when
specifying both variants in one spec section and one header file due to
the overlaps) instead of feature flags.

> > I don't think using fourcc is a problem, and given that both drm and
> > v4l2 use fourcc already this would be a good choice I think.
> 
> Both DRM and V4L2 use two mutually incompatible sets of FourCCs, so
> I'm not sure how it could be a good choice. At least unless we decide
> to pick a specific set of FourCC. It doesn't help that Windows/DirectX
> has its own set of FourCCs that's again slightly different than the
> two mentioned before.

Ouch, wasn't aware of that.  That makes reusing fourcc codes much less
useful.

> > But the definition should be more specific than just "fourcc".  Best
> > would be to explicitly list and define each format supported by the
> > spec.
> 
> Why not be consistent with virtio-gpu and just define new formats as
> we add support for them as sequential integers?

Yes, lets do that.

cheers,
  Gerd

