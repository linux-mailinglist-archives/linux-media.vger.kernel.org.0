Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFFE204F2B
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 12:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732213AbgFWKjH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 06:39:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:58084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732191AbgFWKjG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 06:39:06 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 396E520724;
        Tue, 23 Jun 2020 10:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592908746;
        bh=x00467Rl0LmFnavuTmVqzJxFqs8KPCS7xTfFN7uGrE8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hskJCYY2VQaWRQahqt6o9K8Jyv6ubz72qlv+HlgKATNsISBswCSBbABp4PKTnbXjK
         n04KepcydqoB/XHFNbdmSFiPKlzliv3QvDBRJQU9zHFa0j9441ZL5fgjwwLNI4oknY
         ZzGHdSNeUBOIk9OkhM2cOUsm8S7KpTJEd6YkehaM=
Date:   Tue, 23 Jun 2020 12:39:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [GIT PULL FOR v5.9] Finalize stateful encoder support
Message-ID: <20200623123902.334b4f15@coco.lan>
In-Reply-To: <741fd4cb-1c56-9546-36da-1993474caf49@xs4all.nl>
References: <741fd4cb-1c56-9546-36da-1993474caf49@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 2 Jun 2020 12:02:54 +0200
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

> Hi Mauro,
> 
> This PR finalizes the stateful encoder support by adding the stateful encoder
> spec. It was delayed quite a bit and the main reason was how framerates should
> be handled given the constraints of what existing stateful encoder drivers
> implemented.
> 
> Michael, can you make a allegro patch that sets the V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL
> flag in that driver and have it behave according to this updated spec?
> 
> Many thanks to all who contributed, with honorable mention of Tomasz who wrote
> the original version of this spec.
> 
> Regards,
> 
> 	Hans
> 
> The following changes since commit 938b29db3aa9c293c7c1366b16e55e308f1a1ddd:
> 
>   media: Documentation: media: Refer to mbus format documentation from CSI-2 docs (2020-05-25 15:47:02 +0200)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-stateful-enc
> 
> for you to fetch changes up to f73d82aca17259d7409c3bb675c1def0d71041e0:
> 
>   dev-encoder.rst: add reference to V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL (2020-06-02 11:05:51 +0200)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Hans Verkuil (4):
>       vidioc-g-parm.rst: update the VIDIOC_G/S_PARM documentation
>       dev-decoder.rst: small fixes
>       videodev2.h: add V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL flag
>       dev-encoder.rst: add reference to V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL
> 
> Tomasz Figa (1):
>       media: docs-rst: Document memory-to-memory video encoder interface
> 
>  Documentation/userspace-api/media/v4l/dev-decoder.rst        |   6 +-
>  Documentation/userspace-api/media/v4l/dev-encoder.rst        | 729 ++++++++++++++++++++++++++++++++++++++++

There's an issue here:

diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Documentation/userspace-api/media/v4l/dev-encoder.rst
new file mode 100644
index 000000000000..aace7b812a9c
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
@@ -0,0 +1,728 @@
+.. SPDX-License-Identifier: GPL-2.0

In order to be compatible with the license of the entire uAPI, we need
to use here:

	.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-or-later-no-invariants

E.g. dual GPLv2 and GFDL 1.1 or later.


Thanks,
Mauro
