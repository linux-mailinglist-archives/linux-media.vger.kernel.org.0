Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5518C205120
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 13:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732513AbgFWLrg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 07:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732484AbgFWLrf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 07:47:35 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1704DC061573
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 04:47:35 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id h28so3915039edz.0
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 04:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rfg+eTx38SOH2bj+iaEhdB/6FbC8ETtey+Vu54F6Vw0=;
        b=AbhjwL6kny0nflNtavl6SxGieKnR5WTHz9cGEpcL2iui/pvIicLt1I5+ZAWRjfxaDS
         /AuRBkI48qbnOQnHilZ9dDdsBvIkHKke0G8OTRK/s0wRNOIjQnDY/drCJjUilWGYYURq
         pZ9LmOgt+XUnFweD8yqbNsBSQF9P6Spp4qQsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rfg+eTx38SOH2bj+iaEhdB/6FbC8ETtey+Vu54F6Vw0=;
        b=K8GKx/uD9b/GFQ4lZZmu9VAVPebn2qaxwkUajkGYfv72RToAyYsMbtfWOE0kEx4zzw
         ir2+IdHmXFdO7bv/tC+yK7ThroYCriXaX6mCUwuSZ4YLO+MSovH6ZzSn0SYJDP1gfo1Q
         wfcRiDR9UW1ZqX7SoLaNAvdHZPoIxf6HDYHqxzO2naphrxawqOw8S+KDeOEJwZ9Boa+p
         snsqWQtD3b+5YtygSMPezbbPQ6twkPsB0GFVSeEFM1zGEOF3m3GjyI/AQvRm/xzyP7RZ
         S5MlVgfGg8+9QoKvv59/NypDpRqnL5LjArzO4NIOb9gO2OtxySRJBCFnWio7TpJ158Am
         Jsqw==
X-Gm-Message-State: AOAM530mfEYxBJWdjVw138/+GQN+3wH91BOkhGFRnBZ4ytX+V0JnK0KK
        bZoCIpLVN+u0uWUDN40rvpMMto+yzqyYbQ==
X-Google-Smtp-Source: ABdhPJwSmri70r3qJxfCOkWfgmgrE1FxxYDo0XaY5V3tF7uvFuhcBKeqIn8B4DEj1s3lHPjY4HIAHw==
X-Received: by 2002:a50:bf4c:: with SMTP id g12mr21848313edk.203.1592912853566;
        Tue, 23 Jun 2020 04:47:33 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id k23sm13340482ejg.89.2020.06.23.04.47.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 04:47:32 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id a6so18226227wrm.4
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 04:47:32 -0700 (PDT)
X-Received: by 2002:adf:80e6:: with SMTP id 93mr24052047wrl.17.1592912852165;
 Tue, 23 Jun 2020 04:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
 <20200526100932.2626420-2-hverkuil-cisco@xs4all.nl> <e08d5c45-cf34-e945-e5be-7e43eeaf35f5@xs4all.nl>
In-Reply-To: <e08d5c45-cf34-e945-e5be-7e43eeaf35f5@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 23 Jun 2020 13:47:21 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BefRDE+-Zcf=oxS6iAfz3rCEp0+nFrLkVZjmsninFMrg@mail.gmail.com>
Message-ID: <CAAFQd5BefRDE+-Zcf=oxS6iAfz3rCEp0+nFrLkVZjmsninFMrg@mail.gmail.com>
Subject: Re: [PATCHv3 1/5] media: docs-rst: Document memory-to-memory video
 encoder interface
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 23, 2020 at 12:37 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wr=
ote:
>
> Hi Tomasz,
>
> On 26/05/2020 12:09, Hans Verkuil wrote:
> > From: Tomasz Figa <tfiga@chromium.org>
> >
> > Due to complexity of the video encoding process, the V4L2 drivers of
> > stateful encoder hardware require specific sequences of V4L2 API calls
> > to be followed. These include capability enumeration, initialization,
> > encoding, encode parameters change, drain and reset.
> >
> > Specifics of the above have been discussed during Media Workshops at
> > LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> > Conference Europe 2014 in D=C3=BCsseldorf. The de facto Codec API that
> > originated at those events was later implemented by the drivers we alre=
ady
> > have merged in mainline, such as s5p-mfc or coda.
> >
> > The only thing missing was the real specification included as a part of
> > Linux Media documentation. Fix it now and document the encoder part of
> > the Codec API.
> >
> > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> >  .../userspace-api/media/v4l/dev-encoder.rst   | 728 ++++++++++++++++++
> >  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
> >  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
> >  .../userspace-api/media/v4l/v4l2.rst          |   2 +
> >  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
> >  5 files changed, 767 insertions(+), 20 deletions(-)
> >  create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.r=
st
> >
> > diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Do=
cumentation/userspace-api/media/v4l/dev-encoder.rst
> > new file mode 100644
> > index 000000000000..aace7b812a9c
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> > @@ -0,0 +1,728 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
>
> New rst docs should be dual licensed:
>
> SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-or-later-no-invariants
>
> It is OK to make this change? No need to repost, if you agree with this
> I or Mauro will make the change.
>
> If you agree, just reply with your Signed-off-by line.

Fine with me.

Signed-off-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
