Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99CB51603C4
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2020 12:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgBPLDu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Feb 2020 06:03:50 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:36309 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727943AbgBPLDt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Feb 2020 06:03:49 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3HiAjTYo48i433HiEjTw5k; Sun, 16 Feb 2020 12:03:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581851027; bh=+aNvZy8aD/dcufEoPL+QDCX1KUO9B+3y0UVN4XJ/BNQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tG0FT+xfYdW0/2XYT7hVpBBOwF/S9gdqIqgXu6cT52AYwsza6QFT51iH/4rNT2grj
         st7dy2JhlO0230j85OYjIYSkA0KVaxZwkiasrq2ekaDgeRZGMTBa3tFqSVLSkXqIoC
         gT1l4SuGRrJPPM5j+obCTz0NJcpOsfYIfcWc3dsI+H/fmfeOjFg/4CGUVAlZT5yGiF
         juIEPI4l+ah5KbdKk2ZT4RJEQzv2OkNR4YKWddUaV4d5WPCkmkBVMgKZNgg1SxMGC9
         GyIPc1mUjpKIUzx+CATaPTjvZfXpWGv9N/vPaLAF+qOxnTfe/2Ny6Mi2G3sohYGARp
         ToXlJFItC93eA==
Subject: Re: [RFC PATCH v3 4/6] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        helen.koike@collabora.com, sboyd@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
 <1581704608-31219-5-git-send-email-skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <30e417ba-84e1-63d2-de74-22cfe859bddb@xs4all.nl>
Date:   Sun, 16 Feb 2020 12:03:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1581704608-31219-5-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEHJX4QNbEtlvlNbNh8D9iO53jn6o9B1tz9SAXEUfYWVqgJik08fvS124TIyTWQBoLaKpXZ0bVjkYd3BRCoYngir51sZDOisiV6vHpCxBuwe2+L8gB2p
 Rrj4kheVXgwW827H19M6HXaKoYc1oPrQTmNocNbL+LZgzAiWqYPg2eUh1aZ1FOu4C9XODs010r7nD+ORs7A4wMmF4mn3GrHMVdXelHGLyNVEg/G0aVT7laGv
 dcOyIIYkKccKcHVjcqu/PQocZYWFIoq8pIXnDOd9pfvce8fO8ohgsBo6hW5UBhKY+Re5NO4YWo+CtFdXNHb/Bt6ta8FJ5H9nS1FCh+7Sl1uRqQPnvjqUctdV
 e0CuselYWW5y2mK98CFVvvwE9bbV5mIvdVBLL+vKS9CHf8zrcKBUIZGk6zRHFKCXQKvZrQVJqNXzhjePMZ+PSjTc8C3NRALovcYGxuLXqfpfzqbNvmLjPDsK
 mYOHLcPs2HzlS2ErtSTGeEj/hC/u0gzlCVCvENfz85CSFHBVoiY9piFIdpAH7b207JXd7eKpUW+S9wei
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/14/20 7:23 PM, Sowjanya Komatineni wrote:
> Tegra210 contains a powerful Video Input (VI) hardware controller
> which can support up to 6 MIPI CSI camera sensors.
> 
> Each Tegra CSI port can be one-to-one mapped to VI channel and can
> capture from an external camera sensor connected to CSI or from
> built-in test pattern generator.
> 
> Tegra210 supports built-in test pattern generator from CSI to VI.
> 
> This patch adds a V4L2 media controller and capture driver support
> for Tegra210 built-in CSI to VI test pattern generator.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/staging/media/Kconfig              |    2 +
>  drivers/staging/media/Makefile             |    1 +
>  drivers/staging/media/tegra/Kconfig        |   10 +
>  drivers/staging/media/tegra/Makefile       |    8 +
>  drivers/staging/media/tegra/TODO           |   10 +
>  drivers/staging/media/tegra/tegra-common.h |  239 +++++++
>  drivers/staging/media/tegra/tegra-csi.c    |  374 ++++++++++
>  drivers/staging/media/tegra/tegra-csi.h    |  115 ++++
>  drivers/staging/media/tegra/tegra-vi.c     | 1019 ++++++++++++++++++++++++++++
>  drivers/staging/media/tegra/tegra-vi.h     |   79 +++
>  drivers/staging/media/tegra/tegra-video.c  |  118 ++++
>  drivers/staging/media/tegra/tegra-video.h  |   32 +
>  drivers/staging/media/tegra/tegra210.c     |  767 +++++++++++++++++++++
>  drivers/staging/media/tegra/tegra210.h     |  190 ++++++
>  14 files changed, 2964 insertions(+)
>  create mode 100644 drivers/staging/media/tegra/Kconfig
>  create mode 100644 drivers/staging/media/tegra/Makefile
>  create mode 100644 drivers/staging/media/tegra/TODO
>  create mode 100644 drivers/staging/media/tegra/tegra-common.h
>  create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>  create mode 100644 drivers/staging/media/tegra/tegra-csi.h
>  create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>  create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>  create mode 100644 drivers/staging/media/tegra/tegra-video.c
>  create mode 100644 drivers/staging/media/tegra/tegra-video.h
>  create mode 100644 drivers/staging/media/tegra/tegra210.c
>  create mode 100644 drivers/staging/media/tegra/tegra210.h
> 

<snip>

> +/*
> + * videobuf2 queue operations
> + */
> +static int tegra_channel_queue_setup(struct vb2_queue *vq,
> +				     unsigned int *nbuffers,
> +				     unsigned int *nplanes,
> +				     unsigned int sizes[],
> +				     struct device *alloc_devs[])
> +{
> +	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
> +
> +	if (*nplanes)
> +		return sizes[0] < chan->format.sizeimage ? -EINVAL : 0;
> +
> +	*nplanes = 1;
> +	sizes[0] = chan->format.sizeimage;
> +	alloc_devs[0] = chan->vi->dev;
> +
> +	/*
> +	 * allocate min 3 buffers in queue to avoid race between DMA
> +	 * writes and userspace reads.
> +	 */
> +	if (*nbuffers < 3)
> +		*nbuffers = 3;

First of all, don't check this here, instead set the struct vb2_queue field
'min_buffers_needed' to 3 instead.

But the reason given for this check is peculiar: there should not be any
race at all. Usually the reason for requiring a specific minimum number of
buffers is that the DMA engine needs at least 2 buffers before it can start
streaming: it can't give back a buffer to userspace (vb2_buffer_done())
unless there is a second buffer it can start to capture to next. So for many
DMA implementations you need a minimum of 2 buffers: two buffers for the
DMA engine, one buffer being processed by userspace.

If the driver is starved of buffers it will typically keep capturing to
the last buffer until a new buffer is queued.

In any case, once the driver releases a buffer via vb2_buffer_done() the
buffer memory is no longer owned by the driver.

To be precise, buffer ownership is as follows:

userspace -> VIDIOC_QBUF -> vb2 -> buf_queue -> driver -> vb2_buffer_done() -> vb2 -> VIDIOC_DQBUF -> userspace

(vb2 == videobuf2 framework)

Note that vb2 never touches the buffer memory.

So if you get a race condition in this driver, then there is something
strange going on. It looks like vb2_buffer_done() is called while DMA is
still ongoing, or because the driver really needs to keep one buffer
available at all times.

Regards,

	Hans

> +
> +	return 0;
> +}
