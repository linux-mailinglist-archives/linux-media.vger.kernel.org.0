Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57B41116B58
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 11:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbfLIKqY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 05:46:24 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56392 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727274AbfLIKqY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Dec 2019 05:46:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575888382;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HobdxtIPjaLIq7jve7aa98B79B1MYkEppd7W5IS+Q+c=;
        b=MmkPFLtOtydpUoEAm/znXGCmO+pJgGJ4bNtMvIPG+hL+E6aH3soesOQi85oRtO9Mqps6Bb
        ecRgt+luRQZYhPhayaEq2u1Ha+hHj4QWjzlvE0u2mqU0H+JGHOFcLgQqEdPZ6e1n68yHbl
        Kc3ANnx7wZZVV+/BkT0q7bIeFDXO9lc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-hLfVJctYNjivRee25yrjUA-1; Mon, 09 Dec 2019 05:46:19 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFF81107ACC7;
        Mon,  9 Dec 2019 10:46:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com [10.36.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DFF715C21A;
        Mon,  9 Dec 2019 10:46:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id EF13E16E08; Mon,  9 Dec 2019 11:46:15 +0100 (CET)
Date:   Mon, 9 Dec 2019 11:46:15 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     Enrico Granata <egranata@google.com>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        virtio-dev@lists.oasis-open.org, Tomasz Figa <tfiga@chromium.org>,
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
Message-ID: <20191209104615.ulct6p34cn7ypvrz@sirius.home.kraxel.org>
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <CAD90Vcbr7L2KsyDxPeoKPRt6y_ai8xkJ=J0JCGsW6tGZJGH=0A@mail.gmail.com>
 <20191120112929.gvsne7ykvcyw65lu@sirius.home.kraxel.org>
 <7736193.Whgddqjo8n@os-lin-dmo>
 <CAD90VcbYAhk9CiagSEi=ouNMioR4v71uc40rRHGMe_+wvAm+0g@mail.gmail.com>
 <20191204091620.zpnd7jttkpkduort@sirius.home.kraxel.org>
 <CAPR809uYEjSGqPA57HiDgTf7MESrXnsCKwvSEQQ8LfMvCJwaaQ@mail.gmail.com>
 <CAD90VcaTWvos-PPrniZn_AfFQrCEkMHNXvhR56ApD8kfdTSG9g@mail.gmail.com>
 <20191206073205.4f3bbqbyeyxeipsx@sirius.home.kraxel.org>
 <CAD90VcY1QgJGYYXTWDFMVshtV0ZnwLjYUzf3uHcDR=FNA2mMEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD90VcY1QgJGYYXTWDFMVshtV0ZnwLjYUzf3uHcDR=FNA2mMEw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: hLfVJctYNjivRee25yrjUA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > For (1) you'll simply do a QUEUE_BUFFER.  The command carries reference=
s
> > to the buffer pages.  No resource management needed.
> >
> > For (2) you'll have RESOURCE_CREATE + RESOURCE_DESTROY + QUEUE_RESOURCE=
,
> > where RESOURCE_CREATE passes the scatter list of buffer pages to the
> > host and QUEUE_RESOURCE will carry just the resource id.
> >
> > For (3) you'll have RESOURCE_IMPORT + RESOURCE_DESTROY + QUEUE_RESOURCE=
.
> >
>=20
> Thanks for the clarification.
> On second thought, however, I'm wondering if we should keep all
> RESOURCE controls.
> This should be an option (4).

Well, that's actually (2), aka "we use RESOURCE_* commands to manage
resources".  With the commands in the latest draft that would be:

  (1) RESOURCE_CREATE
  (2) RESOURCE_ATTACH_BACKING
  (3) RESOURCE_QUEUE (resource can be used multiple times here)
  (4) RESOURCE_DETACH_BACKING
  (5) RESOURCE_DESTROY

I'm not sure we need the separate *_BACKING commands.  I think we could
also have RESOURCE_CREATE pass the buffer pages scatter list instead.

Why it is done this way?  Just because the design was copied from
virtio-gpu?  Or is there some specific reason?

cheers,
  Gerd

