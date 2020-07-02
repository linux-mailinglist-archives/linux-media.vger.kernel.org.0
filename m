Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96BF2211D22
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 09:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgGBHiN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 03:38:13 -0400
Received: from plasma2.jpberlin.de ([91.198.250.140]:48977 "EHLO
        plasma2.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726630AbgGBHiM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 03:38:12 -0400
X-Greylist: delayed 358 seconds by postgrey-1.27 at vger.kernel.org; Thu, 02 Jul 2020 03:38:11 EDT
Received: from spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115])
        by plasma.jpberlin.de (Postfix) with ESMTP id B94B9BCF28;
        Thu,  2 Jul 2020 09:32:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
        with ESMTP id E6Bem4w4gEjv; Thu,  2 Jul 2020 09:32:07 +0200 (CEST)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "Let's Encrypt Authority X3" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id E4649BCE3F;
        Thu,  2 Jul 2020 09:32:06 +0200 (CEST)
Received: from os-lin-dmo.localnet (10.25.255.1) by webmail.opensynergy.com
 (10.25.10.17) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 2 Jul 2020
 09:32:06 +0200
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     <virtio-dev@lists.oasis-open.org>,
        Keiichi Watanabe <keiichiw@chromium.org>
CC:     <linux-media@vger.kernel.org>, <acourbot@chromium.org>,
        <alexlau@chromium.org>, <daniel@ffwll.ch>, <dgreid@chromium.org>,
        <dstaessens@chromium.org>, <egranata@google.com>,
        <fziglio@redhat.com>, <hverkuil@xs4all.nl>,
        <keiichiw@chromium.org>, <kraxel@redhat.com>,
        <marcheu@chromium.org>, <posciak@chromium.org>,
        <spice-devel@lists.freedesktop.org>, <stevensd@chromium.org>,
        <tfiga@chromium.org>, <uril@redhat.com>,
        <samiullah.khawaja@opensynergy.com>, <kiran.pawar@opensynergy.com>,
        <saket.sinha89@gmail.com>, <laurent.pinchart@ideasonboard.com>,
        <nicolas@ndufresne.ca>, <mst@redhat.com>
Subject: Re: [PATCH RFC v4 0/1] Virtio Video Device Specification
Date:   Thu, 2 Jul 2020 09:32:05 +0200
Message-ID: <2850781.lI95146Gml@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <20200623111325.237158-1-keiichiw@chromium.org>
References: <20200623111325.237158-1-keiichiw@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
X-MBO-SPAM-Probability: 0
X-Rspamd-Score: -5.09 / 15.00 / 200.00
X-Rspamd-Queue-Id: B94B9BCF28
X-Rspamd-UID: f083ff
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Keiichi,

Thank you very much for the hard work to update the spec and to summarize all 
of the recent proposals!

I want to again raise a topic that was discussed earlier and unfortunately the 
latest proposal cannot resolve the problem. I hope together with upstream 
people we'll be able to find a neat solution.

Please consider the following case:
1. Encoder case
2. User app does reqbufs with DMABUF flag.
3. User app submits frames to encode, each frame has a different fd, might be a 
completely new buffer.
4. Driver receives this buffer via queue() and does this check to verify 
whether it is a known dmabuf:
https://elixir.bootlin.com/linux/v5.7.6/source/drivers/media/common/videobuf2/
videobuf2-core.c#L1163
5. When the check fails, it does cleanup.
6. BUG: As we got rid of the flexible resource detach/destroy calls, host side 
has no way to know the resource has a new memory region. The new sgt is never 
propagated to the host.

The mentioned earlier CMD_RESOURE_REASSIGN_ENTRIES/CMD_RESOURE_REASSIGN_OBJECT 
are not included in the spec.

Thanks in advance.

Best regards,
Dmitry.

On Dienstag, 23. Juni 2020 13:13:24 CEST Keiichi Watanabe wrote:
> 
> This is the v4 RFC of virtio video device specification.
> PDF versions are available at [1, 2].
> 
> Note that this patch depends on a recent patchset "Cross-device resource
> sharing" [3].
> 
> Here is a list of major changes from v3:
> * Redesingned struct definitions for each command and request based on
>   discussions at [4].
> * Renamed commands/structs/enums to more descriptive names.
> * Had different structs and fields for image formats and bitstream formats.
> * Added more detailed specification for supported video codecs.
> * Made stream_id be allocated by the device.
> * Had a single parameter struct per-stream instead of per-queue parameters
> and controls.
> * Allowed the driver to specify the number of buffers to use via
>   "cur_{image,bitstream}_buffers".
> * Renamed RESOURCE_CREATE command to RESOURCE_ATTACH command and allow the
>   driver to use this command when replacing backing memories as well.
> 
> [5] is the diff of the header file from v3. Note that it only contains
> changes in the header. We haven't updated the driver nor device
> implementation to focus on protocol design discussion first.
> 
> While it may appear that many parts have been changed since the previous
> revision, these changes are to address the issues raised in previous
> discussions or/and to make the protocol simpler and easier to prevent
> misuse.
> I'd appreciate any types of feedback.
> 
> Best regards,
> Keiichi
> 
> [1] (full):
> https://drive.google.com/file/d/1DiOJZfUJ5wvFtnNFQicxt0zkp4Ob1o9C/view?usp=
> sharing [2] (only video section):
> https://drive.google.com/file/d/188uAkIWE0BsXETECez98y5fJKw8rslj3/view?usp=
> sharing [3]
> https://lists.oasis-open.org/archives/virtio-comment/202003/msg00035.html
> [4] https://markmail.org/thread/c6h3e3zn647qli3w
> [5]
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/
> 2164411
> 
> Keiichi Watanabe (1):
>   virtio-video: Add virtio video device specification
> 
>  .gitignore                        |    1 +
>  content.tex                       |    1 +
>  images/video-buffer-lifecycle.dot |   18 +
>  make-setup-generated.sh           |    8 +
>  virtio-video.tex                  | 1163 +++++++++++++++++++++++++++++
>  5 files changed, 1191 insertions(+)
>  create mode 100644 .gitignore
>  create mode 100644 images/video-buffer-lifecycle.dot
>  create mode 100644 virtio-video.tex
> 
> --
> 2.27.0.111.gc72c7da667-goog


