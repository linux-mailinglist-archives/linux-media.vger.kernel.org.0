Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76001120787
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 14:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbfLPNrh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 08:47:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32504 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727579AbfLPNrh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 08:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576504055;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kcfd8q7aU1VShFTNcYcNicV0YwARRO8sY0W5i8lSIPk=;
        b=hRd3z04VfK0fP3nAEiCLF5V2thYMtMTTJXHm7NCtvkuKIvsWP+v6byyBOp+m5BA/kKirX+
        twY+L+F2nmCovIeDj9ie6b8od2a43O9W2GUnOLueX8amrZJLzqASlWccDNNwGp8oQplc0p
        jFBcfRj4jrbwjvM/BrogGHjgdQHUDSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-p8bfY4LhOYycoY-vPmpu6A-1; Mon, 16 Dec 2019 08:47:32 -0500
X-MC-Unique: p8bfY4LhOYycoY-vPmpu6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E092C911E9;
        Mon, 16 Dec 2019 13:47:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com [10.36.117.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 05CA77BE60;
        Mon, 16 Dec 2019 13:47:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 3D0169DA5; Mon, 16 Dec 2019 14:47:28 +0100 (CET)
Date:   Mon, 16 Dec 2019 14:47:28 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     Dylan Reid <dgreid@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Geoffrey McRae <geoff@hostfission.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [virtio-dev] Re: guest / host buffer sharing ...
Message-ID: <20191216134728.czulyb6yvrkokrqv@sirius.home.kraxel.org>
References: <d65bec5074eda5f389668e28922c1609@hostfission.com>
 <CAAFQd5AWqYaNWfYQ2hepjg7OD8y8ehHn0guusAR8JYefc+BNaw@mail.gmail.com>
 <CAEUnVG77y2DrV5kLTHDy1xio+yzMGv9j=M0c4388vH_LUaiXLg@mail.gmail.com>
 <CAD=HUj40Jb2cy8EP=24coO-CPUvq6ib+01bvXHn1G9GD8KuenA@mail.gmail.com>
 <20191211092625.jzqx2ukphhggwavo@sirius.home.kraxel.org>
 <CAD=HUj7d3SWqCH=57ymy-BVd6xdJWc=WSqHAFyQXt-3MjchEAA@mail.gmail.com>
 <20191212094121.by7w7fywlzdfoktn@sirius.home.kraxel.org>
 <CAD=HUj6YYupjdxxz2mgMmE2DcKhXP-qdhRORvUNTmzcORRrLzg@mail.gmail.com>
 <20191212133048.4nbmuwhbq5z2ai6o@sirius.home.kraxel.org>
 <CAD=HUj623MyeZ7VmrYTfig9oiyNhipidpvhuuurs3VgGBgjZpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj623MyeZ7VmrYTfig9oiyNhipidpvhuuurs3VgGBgjZpQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > Of course only virtio drivers would try step (2), other drivers (when
> > sharing buffers between intel gvt device and virtio-gpu for example)
> > would go straight to (3).
> 
> For virtio-gpu as it is today, it's not clear to me that they're
> equivalent. As I read it, the virtio-gpu spec makes a distinction
> between the guest memory and the host resource. If virtio-gpu is
> communicating with non-virtio devices, then obviously you'd just be
> working with guest memory. But if it's communicating with another
> virtio device, then there are potentially distinct guest and host
> buffers that could be used. The spec shouldn't leave any room for
> ambiguity as to how this distinction is handled.

Yep.  It should be the host side buffer.  The whole point is to avoid
the round trip through the guest after all.  Or does someone see a
useful use case for the guest buffer?  If so we might have to add some
way to explicitly specify whenever we want the guest or host buffer.

cheers,
  Gerd

