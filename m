Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261E120A363
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 18:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406377AbgFYQxR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 12:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404001AbgFYQxR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 12:53:17 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA12C08C5C1;
        Thu, 25 Jun 2020 09:53:17 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 27D3D2A0267
Message-ID: <00b859ea86dc12a7de54bb064fff3c3a08a9c4c4.camel@collabora.com>
Subject: Re: [RFC 2/7] fixup! media: uapi: h264: update reference lists
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Thu, 25 Jun 2020 13:52:39 -0300
In-Reply-To: <CAAFQd5DmsE4jvXNWVqRMifx48oLhQohm-sYYJNpsx2_ipb3Niw@mail.gmail.com>
References: <20200623182809.1375-1-ezequiel@collabora.com>
         <20200623182809.1375-3-ezequiel@collabora.com>
         <CAAFQd5DmsE4jvXNWVqRMifx48oLhQohm-sYYJNpsx2_ipb3Niw@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-06-25 at 17:30 +0200, Tomasz Figa wrote:
> On Tue, Jun 23, 2020 at 8:29 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > Align v4l2_h264_reference to 32-bits, giving some room
> > for future extensions.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  .../userspace-api/media/v4l/ext-ctrls-codec.rst  |  3 +++
> >  drivers/media/v4l2-core/v4l2-ctrls.c             | 16 ++++++++++++++++
> >  include/media/h264-ctrls.h                       |  7 +++++--
> >  3 files changed, 24 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > index 6c36d298db20..7af12447a5b0 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > @@ -1943,6 +1943,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >      * - __u8
> >        - ``index``
> >        -
> > +    * - __u32
> > +      - ``reserved``
> > +      - Applications and drivers must set this to zero.
> 
> __u16?
> 
> 

Indeed :)

Thanks,
Ezequiel


