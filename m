Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B62761A34C8
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 15:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgDINXd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 09:23:33 -0400
Received: from plasma4.jpberlin.de ([80.241.57.33]:59543 "EHLO
        plasma4.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgDINXd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 09:23:33 -0400
Received: from gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
        by plasma.jpberlin.de (Postfix) with ESMTP id C9105BC0E7;
        Thu,  9 Apr 2020 15:23:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([91.198.250.140])
        by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173]) (amavisd-new, port 10030)
        with ESMTP id vQcqLnKllJ-t; Thu,  9 Apr 2020 15:23:26 +0200 (CEST)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 60BC9BDC36;
        Thu,  9 Apr 2020 15:13:47 +0200 (CEST)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS01.open-synergy.com
 (10.25.10.17) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 9 Apr 2020
 15:13:47 +0200
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
Date:   Thu, 9 Apr 2020 15:13:46 +0200
Message-ID: <17068786.sWSEgdgrri@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <CAD90Vca4jqLPdK4my3mCmPM45Lwc5te6PbDhA+H=0X1QyTFWzQ@mail.gmail.com>
References: <20200206102058.247258-1-keiichiw@chromium.org> <4320831.CvnuH1ECHv@os-lin-dmo> <CAD90Vca4jqLPdK4my3mCmPM45Lwc5te6PbDhA+H=0X1QyTFWzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
X-Rspamd-Queue-Id: C9105BC0E7
X-Rspamd-Score: -1.23 / 15.00 / 200.00
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Keiichi,

On Donnerstag, 9. April 2020 12:46:56 CEST Keiichi Watanabe wrote:
> Hi,
> 
> On Tue, Apr 7, 2020 at 11:49 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> 
wrote:
> > Hi,
> > 
> > > +\item[VIRTIO_VIDEO_CMD_STREAM_DESTROY] Destroy a video stream
> > > +  (context) within the device.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_video_stream_destroy {
> > > +        struct virtio_video_cmd_hdr hdr;
> > > +};
> > > +\end{lstlisting}
> > 
> > Let's add more strict description to stream_destroy, like as follows:
> > Device MUST NOT generate any events for the stream in question after
> > receiving the command. Before completing the command, Device MUST ensure
> > that all asynchronous commands that are related to the stream have been
> > completed and all memory objects are unreferenced.
> 
> Sounds good. But, the device should probably be able to generate
> VIRTIO_VIDEO_EVENT_ERROR for a device-wide error?
> Or, should VIRTIO_VIDEO_EVENT_ERROR always be a per-stream error? (I
> haven't documented it in v3)
> 

In the current version of the driver  I have we interpret it a stream error. I 
think it makes sense as several stream formats might be backed by different 
hardware devices on the host side. So it would be an overkill to mark the 
whole virtio device as broken on the guest side.

BTW, I think we should add some hard limit to the max_cap_length and 
max_resp_length in the spec, so buggy device does not make us allocate all 
memory for a response on the host side by providing a garbage value. I think 
4k might be a good value.

Best regards,
Dmitry.

> Best regards,
> Keiichi
> 
> > Best regards,
> > Dmitry.


