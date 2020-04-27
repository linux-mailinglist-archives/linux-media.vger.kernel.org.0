Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAAA1BA033
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 11:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgD0Jms (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 05:42:48 -0400
Received: from plasma33.jpberlin.de ([80.241.58.43]:44241 "EHLO
        plasma33.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbgD0Jmr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 05:42:47 -0400
X-Greylist: delayed 518 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 Apr 2020 05:42:47 EDT
Received: from gerste.heinlein-support.de (unknown [80.241.56.124])
        by plasma.jpberlin.de (Postfix) with ESMTP id AD2571021E1;
        Mon, 27 Apr 2020 11:34:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.76])
        by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173]) (amavisd-new, port 10030)
        with ESMTP id 0oLZMmHE_UCb; Mon, 27 Apr 2020 11:33:58 +0200 (CEST)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id CE3571007AE;
        Mon, 27 Apr 2020 11:33:57 +0200 (CEST)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS02.open-synergy.com
 (10.25.10.18) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 27 Apr
 2020 11:33:56 +0200
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
CC:     <virtio-dev@lists.oasis-open.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        <spice-devel@lists.freedesktop.org>,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, <uril@redhat.com>,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>
Subject: Re: [PATCH v3 1/2] virtio-video: Add virtio video device specification
Date:   Mon, 27 Apr 2020 11:33:56 +0200
Message-ID: <3353506.N7aMVyhfb1@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <CAD90Vcbrgf2dK2EYeQDJ=-AFA2NkFnyJhutLX3nfeD7ajNYw=A@mail.gmail.com>
References: <20200206102058.247258-1-keiichiw@chromium.org> <17068786.sWSEgdgrri@os-lin-dmo> <CAD90Vcbrgf2dK2EYeQDJ=-AFA2NkFnyJhutLX3nfeD7ajNYw=A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
X-Rspamd-Queue-Id: AD2571021E1
X-Rspamd-Score: -1.29 / 15.00 / 200.00
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Keiichi,

One more addition to the comments below. Currently spec does not define units 
for bitrate (are units needed for anything else except that?). Let's 
explicitly state that bitrate is provided in bits per sec, so whatever 
implementation can do proper conversion if needed.

Best regards,
Dmity.

On Freitag, 24. April 2020 13:45:38 CEST Keiichi Watanabe wrote:
> Hi Dmitry,
> 
> On Thu, Apr 9, 2020 at 10:23 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> 
wrote:
> > Hi Keiichi,
> > 
> > On Donnerstag, 9. April 2020 12:46:56 CEST Keiichi Watanabe wrote:
> > > Hi,
> > > 
> > > On Tue, Apr 7, 2020 at 11:49 PM Dmitry Sepp
> > > <dmitry.sepp@opensynergy.com>
> > 
> > wrote:
> > > > Hi,
> > > > 
> > > > > +\item[VIRTIO_VIDEO_CMD_STREAM_DESTROY] Destroy a video stream
> > > > > +  (context) within the device.
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_video_stream_destroy {
> > > > > +        struct virtio_video_cmd_hdr hdr;
> > > > > +};
> > > > > +\end{lstlisting}
> > > > 
> > > > Let's add more strict description to stream_destroy, like as follows:
> > > > Device MUST NOT generate any events for the stream in question after
> > > > receiving the command. Before completing the command, Device MUST
> > > > ensure
> > > > that all asynchronous commands that are related to the stream have
> > > > been
> > > > completed and all memory objects are unreferenced.
> > > 
> > > Sounds good. But, the device should probably be able to generate
> > > VIRTIO_VIDEO_EVENT_ERROR for a device-wide error?
> > > Or, should VIRTIO_VIDEO_EVENT_ERROR always be a per-stream error? (I
> > > haven't documented it in v3)
> > 
> > In the current version of the driver  I have we interpret it a stream
> > error. I think it makes sense as several stream formats might be backed
> > by different hardware devices on the host side. So it would be an
> > overkill to mark the whole virtio device as broken on the guest side.
> 
> It makes sense. I'll explicitly document that it's a per-stream error.
> 
> > BTW, I think we should add some hard limit to the max_cap_length and
> > max_resp_length in the spec, so buggy device does not make us allocate all
> > memory for a response on the host side by providing a garbage value. I
> > think 4k might be a good value.
> 
> Sounds good. Thank you for the suggestion.
> 
> Best regards,
> Keiichi
> 
> > Best regards,
> > Dmitry.
> > 
> > > Best regards,
> > > Keiichi
> > > 
> > > > Best regards,
> > > > Dmitry.


