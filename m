Return-Path: <linux-media+bounces-40129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE185B2A02B
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 13:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5B3B17A1D9
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 11:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2048311590;
	Mon, 18 Aug 2025 11:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JbQ8pWkm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0476F261B6C
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 11:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755515837; cv=none; b=O53wFomeprr+swydouwF/TtpYDSDcVhl0VPdox9kL3+8U0axBadFvAXACF3muBK+3IeaBoMi4S7MLS0WVS1n+HhHQdNvJBJlYScGMIxjw+9Du2FfaNGG8ShbxMT9Da3QW5b5kAtN2783+kZOoYFoMd/6C/L6PrsdTvleTbeWgds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755515837; c=relaxed/simple;
	bh=Wg1HIc/0XkahwP27trE3GBilos0oEq2g6hlRldbVm6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NcT8A7te0/tDsYNygzP2HSGKTb9Uczyb7/dGZYQH1UiSPbSca+cEgWNavio5wxhySb8msc5OtB8Gnpdw4yRMHftmoWwKbvwE6yyX/5c/xikbKhT+GektQ/CyeWwf0f/M0kyY+bTBKRHyM677mICVKCVSBGlcIzEHGww59m7lUO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JbQ8pWkm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-51-68.net.vodafone.it [5.90.51.68])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B47B17D1;
	Mon, 18 Aug 2025 13:16:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755515775;
	bh=Wg1HIc/0XkahwP27trE3GBilos0oEq2g6hlRldbVm6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JbQ8pWkm1UcLI7lwf0lHcJCar7g/vR6Dwpp3/+nILemBxC3mkGuLKczftMOPpLmA/
	 yjLjRg68LS/PKko1LyydSkHaTm2U3hARqoRl6qE6HM1JfFSgIglrJ6kZJaxgZBuVQm
	 HHJy/PJTkw7xKbeD9xiP3XLIjDro6T2qReEMbSP0=
Date: Mon, 18 Aug 2025 13:17:06 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [bug report] media: cx18: Access v4l2_fh from file
Message-ID: <3wa4mdkewrgsmt6bdhhm5kuhkpso5lltj6e3zpfpjz2qyizkkk@7e3wxcrgycqx>
References: <aKL4OMWsESUdX8KQ@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKL4OMWsESUdX8KQ@stanley.mountain>

Hi Dan

On Mon, Aug 18, 2025 at 12:54:00PM +0300, Dan Carpenter wrote:
> Hello Jacopo Mondi,
>
> Commit 7b9eb53e8591 ("media: cx18: Access v4l2_fh from file") from
> Aug 10, 2025 (linux-next), leads to the following Smatch static
> checker warning:
>
> drivers/media/pci/cx18/cx18-driver.c:1223 cx18_init_on_first_open() error: NULL dereference inside function
> drivers/media/pci/cx18/cx18-driver.c:1229 cx18_init_on_first_open() error: NULL dereference inside function
> drivers/media/pci/cx18/cx18-driver.c:1230 cx18_init_on_first_open() error: NULL dereference inside function
> drivers/media/pci/ivtv/ivtv-driver.c:1313 ivtv_init_on_first_open() error: NULL dereference inside function
> drivers/media/pci/ivtv/ivtv-driver.c:1319 ivtv_init_on_first_open() error: NULL dereference inside function
>
> drivers/media/pci/cx18/cx18-driver.c
>     1214         /* Set initial frequency. For PAL/SECAM broadcasts no
>     1215            'default' channel exists AFAIK. */
>     1216         if (cx->std == V4L2_STD_NTSC_M_JP)
>     1217                 vf.frequency = 1460;        /* ch. 1 91250*16/1000 */
>     1218         else if (cx->std & V4L2_STD_NTSC_M)
>     1219                 vf.frequency = 1076;        /* ch. 4 67250*16/1000 */
>     1220
>     1221         video_input = cx->active_input;
>     1222         cx->active_input++;        /* Force update of input */
> --> 1223         cx18_s_input(NULL, &fh, video_input);
>                               ^^^^
> The patch adds a new dereference of "file" but some of the callers pass a
> NULL pointer.

smart smatch! Indeed the DVB layer calls the ioctl operation handler
directly, without a valid file *.

>
>     1224
>     1225         /* Let the VIDIOC_S_STD ioctl do all the work, keeps the code
>     1226            in one place. */
>     1227         cx->std++;                /* Force full standard initialization */
>     1228         std = (cx->tuner_std == V4L2_STD_ALL) ? V4L2_STD_NTSC_M : cx->tuner_std;
>     1229         cx18_s_std(NULL, &fh, std);
>     1230         cx18_s_frequency(NULL, &fh, &vf);

And I guess the same reasoning applies to these two.

I'll send a patch right away

>     1231         return 0;
>     1232 }
>
> regards,
> dan carpenter

