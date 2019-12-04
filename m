Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9004D11294B
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 11:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbfLDKaO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 05:30:14 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49398 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbfLDKaO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 05:30:14 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id D48DD2911A6
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rick Chang <rick.chang@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>, kernel@pengutronix.de
Subject: Re: [PATCH 0/5] v4l2 JPEG helpers and CODA960 JPEG decoder
In-Reply-To: <20191113150538.9807-1-p.zabel@pengutronix.de>
References: <20191113150538.9807-1-p.zabel@pengutronix.de>
Date:   Wed, 04 Dec 2019 12:30:38 +0200
Message-ID: <87pnh48jsh.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed, 13 Nov 2019, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> Hi, 
> 
> as far as I can tell we currently have three JPEG header parsers 
> in the media tree (in the rcar_jpu, s5p-jpeg, and mtk-jpeg 
> drivers). I would like to add support for the CODA960 JPEG 
> decoder to the coda-vpu driver without adding yet another. 
> 
> To this end, this patch series adds some common JPEG code to 
> v4l2-core.  For now this just contains header parsing helpers (I 
> have tried to keep the terminology close to JPEG ITU-T.81) that 
> should be usable for all of the current drivers. In the future 
> we might want to move JPEG header generation for encoders and 
> common quantization tables in there as well. 
> 
> I have tested this on hardware only with coda-vpu, the other 
> drivers are just compile-tested.

Tested-by: Adrian Ratiu <adrian.ratiu@collabora.com>

I'm testing this series on some i.MX 6 boards I have laying around 
and it works well: the new dev nodes appear once the patched coda 
driver is loaded and gstreamer1.0-plugins-good-jpeg uses them for 
dec/enc.

Thanks,
Adrian

>
> Feedback very welcome, especially whether this actually works for the
> other drivers, and if this could be structured any better. I'm a bit
> unhappy with the (current) need for separate frame/scan header and
> quantization/hfufman table parsing functions, but those are required
> by s5p-jpeg, which splits localization and parsing of the marker
> segments. Also, could this be used for i.MX8 JPEGDEC as is?
>
> regards
> Philipp
>
> Philipp Zabel (5):
>   media: add v4l2 JPEG helpers
>   media: coda: jpeg: add CODA960 JPEG decoder support
>   media: rcar_jpu: use V4L2 JPEG helpers
>   media: s5p-jpeg: use v4l2 JPEG helpers
>   media: mtk-jpeg: use V4L2 JPEG helpers
>
>  drivers/media/platform/Kconfig                |   4 +
>  drivers/media/platform/coda/coda-common.c     | 124 +++-
>  drivers/media/platform/coda/coda-jpeg.c       | 551 ++++++++++++++++
>  drivers/media/platform/coda/coda.h            |  11 +-
>  .../media/platform/mtk-jpeg/mtk_jpeg_parse.c  | 138 +---
>  drivers/media/platform/rcar_jpu.c             |  94 +--
>  drivers/media/platform/s5p-jpeg/jpeg-core.c   | 388 +++--------
>  drivers/media/platform/s5p-jpeg/jpeg-core.h   |  14 +-
>  drivers/media/v4l2-core/Kconfig               |   4 +
>  drivers/media/v4l2-core/Makefile              |   2 +
>  drivers/media/v4l2-core/v4l2-jpeg.c           | 614 ++++++++++++++++++
>  include/media/v4l2-jpeg.h                     | 135 ++++
>  12 files changed, 1580 insertions(+), 499 deletions(-)
>  create mode 100644 drivers/media/v4l2-core/v4l2-jpeg.c
>  create mode 100644 include/media/v4l2-jpeg.h
>
> -- 
> 2.20.1
