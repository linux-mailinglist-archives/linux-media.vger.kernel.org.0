Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 305F3284D8C
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 16:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgJFOXO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 6 Oct 2020 10:23:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgJFOXO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 10:23:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 602B0C061755
        for <linux-media@vger.kernel.org>; Tue,  6 Oct 2020 07:23:14 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kPns1-0005Ej-1E; Tue, 06 Oct 2020 16:23:13 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kPns0-0008Ek-Nq; Tue, 06 Oct 2020 16:23:12 +0200
Message-ID: <e79fc99b0097a4de74d43aafb717fd93ae41cf31.camel@pengutronix.de>
Subject: Re: [PATCH 3/6] coda: Clarify device registered log
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, cphealy@gmail.com,
        Benjamin.Bara@skidata.com, l.stach@pengutronix.de,
        kernel@collabora.com
Date:   Tue, 06 Oct 2020 16:23:12 +0200
In-Reply-To: <20201006104414.67984-4-ezequiel@collabora.com>
References: <20201006104414.67984-1-ezequiel@collabora.com>
         <20201006104414.67984-4-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-10-06 at 07:44 -0300, Ezequiel Garcia wrote:
> Instead of printing just the device type, let's use
> the device name, which makes the message more useful.
> 
> With this commit, the messages shown when the driver
> is registered are:
> 
> coda 2040000.vpu: Firmware code revision: 570363
> coda 2040000.vpu: Initialized CODA960.
> coda 2040000.vpu: Firmware version: 3.1.1
> coda 2040000.vpu: coda-jpeg-encoder registered as video0
> coda 2040000.vpu: coda-jpeg-decoder registered as video1
> coda 2040000.vpu: coda-video-encoder registered as video2
> coda 2040000.vpu: coda-video-decoder registered as video3
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/platform/coda/coda-common.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
> index 87a2c706f747..a72ea4bb37d7 100644
> --- a/drivers/media/platform/coda/coda-common.c
> +++ b/drivers/media/platform/coda/coda-common.c
> @@ -172,7 +172,7 @@ struct coda_video_device {
>  };
>  
>  static const struct coda_video_device coda_bit_encoder = {
> -	.name = "coda-encoder",
> +	.name = "coda-video-encoder",
>  	.type = CODA_INST_ENCODER,
>  	.ops = &coda_bit_encode_ops,
>  	.src_formats = {
> @@ -202,7 +202,7 @@ static const struct coda_video_device coda_bit_jpeg_encoder = {
>  };
>  
>  static const struct coda_video_device coda_bit_decoder = {
> -	.name = "coda-decoder",
> +	.name = "coda-video-decoder",
>  	.type = CODA_INST_DECODER,
>  	.ops = &coda_bit_decode_ops,
>  	.src_formats = {
> @@ -2851,12 +2851,12 @@ static int coda_hw_init(struct coda_dev *dev)
>  static int coda_register_device(struct coda_dev *dev, int i)
>  {
>  	struct video_device *vfd = &dev->vfd[i];
> -	enum coda_inst_type type;
> +	const char *name;
>  	int ret;
>  
>  	if (i >= dev->devtype->num_vdevs)
>  		return -EINVAL;
> -	type = dev->devtype->vdevs[i]->type;
> +	name = dev->devtype->vdevs[i]->name;
>  
>  	strscpy(vfd->name, dev->devtype->vdevs[i]->name, sizeof(vfd->name));
>  	vfd->fops	= &coda_fops;
> @@ -2876,8 +2876,7 @@ static int coda_register_device(struct coda_dev *dev, int i)
>  	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
>  	if (!ret)
>  		v4l2_info(&dev->v4l2_dev, "%s registered as %s\n",
> -			  type == CODA_INST_ENCODER ? "encoder" : "decoder",
> -			  video_device_node_name(vfd));
> +			  name, video_device_node_name(vfd));
>  	return ret;
>  }

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
