Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83F4411E077
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 10:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbfLMJSm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 04:18:42 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:47389 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725906AbfLMJSm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 04:18:42 -0500
Received: from [IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478]
 ([IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478])
        by smtp-cloud7.xs4all.net with ESMTPA
        id fh5pikT1Oapzpfh5qidL6g; Fri, 13 Dec 2019 10:18:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576228720; bh=Vwm0r33QgcmTAFBUdqVZZ6Da9OcUTmyDojZ05ZM3y0c=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IWyxpAGE/NilvXtZ8Eq7YeR2buelI7AUUzKCaG57c2zl6O0ACtTBetIISyojwFYSr
         sYaXzaXUWY7zQ3aUMuze0EukYPI+6uap8mz6iZvHfbYZSPqaS4xGZJmdEbPHY6Mrg7
         OJkpjXS1fHuthpt8+EK2Ynuk47CFlaIo+2Z+kKlXj2DVR2X4NxGEWEB+C/g6jaIQam
         P6ounO0ypAWuffzBdrWKeFnDPfbYC8jsHojDncp6BmsZsrg34MTSwX9wp8+h4o7N2B
         HZNY9B0mDNj9tVDm5xEIN6Wi35m/bbIf40Ix9gxI/eSuyDbATOA8g+SRaG6BC2YPSy
         WjT7Gc6lnxn0g==
Subject: Re: [PATCH 0/5] v4l2 JPEG helpers and CODA960 JPEG decoder
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rick Chang <rick.chang@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>, kernel@pengutronix.de
References: <20191113150538.9807-1-p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <7e656b04-7695-d84b-a646-aa03e9d771c9@xs4all.nl>
Date:   Fri, 13 Dec 2019 10:18:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113150538.9807-1-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCJaHCD2kkSk7A5TgSCFC54eSM2/4nC5j4F8sBQ/dZipCX0Ex9K5ma/mnmRHabIbjTvgDpZ9u58VTbkeBvJjf5de362Pn7oXcwgM8PQKKDkhWk7k6PMR
 LI1LVmWtdA2iYDZYt0osC/3jNSS8JmhwQ59vWh3A3VNiDJr4ynoCFRVrWy5/PN00C5Wwc0xxS2p9Wnx5pGXPSFLcWddROE+oxNf1qGPuFt1SGk+LlSA1tjX+
 mvdYQMXmO/7MH7+FYRvdzYpwLbn8TN5pBWxXSqhUVukW3omV+RHYCQbGDC0BL7m3DiRRt+D5ALlc/psVq6GcDAAauZNEVYoXc9Y8GKtyvvYfHdFuILOVe2oZ
 fpUpS2LFwFNbWMhP8VpTnUA1FlyjbTImpzm+zQdcL8zHPBK7h0aHVliWJR4dDK3sHTEt7Chr7p/H9AgGC+bZ508GhkWSD8iiAEh07eOvhtcMoYhtCFxLq/9C
 hYfw3+y5kHb+hEqzR0a/DS/IKXebcQ3U9qrcUrULShpW+pjvu6wg97qrnxktsK0o4odkCj5L2+KL3AxsGMyuRqfm4a5C0SbvtKJQj5gMPp2yZAdod03pZjsI
 qdtG0QKSY4aXt087kGW40BVqalhmrHcazMDMW18bjO40qSHpiRp7N6seCkDbIymU9sE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/13/19 4:05 PM, Philipp Zabel wrote:
> Hi,
> 
> as far as I can tell we currently have three JPEG header parsers in the
> media tree (in the rcar_jpu, s5p-jpeg, and mtk-jpeg drivers). I would
> like to add support for the CODA960 JPEG decoder to the coda-vpu driver
> without adding yet another.
> 
> To this end, this patch series adds some common JPEG code to v4l2-core.
> For now this just contains header parsing helpers (I have tried to keep
> the terminology close to JPEG ITU-T.81) that should be usable for all of
> the current drivers. In the future we might want to move JPEG header
> generation for encoders and common quantization tables in there as well.
> 
> I have tested this on hardware only with coda-vpu, the other drivers are
> just compile-tested.
> 
> Feedback very welcome, especially whether this actually works for the
> other drivers, and if this could be structured any better. I'm a bit
> unhappy with the (current) need for separate frame/scan header and
> quantization/hfufman table parsing functions, but those are required
> by s5p-jpeg, which splits localization and parsing of the marker
> segments. Also, could this be used for i.MX8 JPEGDEC as is?

This series no longer applies, and I gather that you want to make a v2
anyway based on Mirela's comments.

Marked as 'Changes Requested' in patchwork.

Regards,

	Hans

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

