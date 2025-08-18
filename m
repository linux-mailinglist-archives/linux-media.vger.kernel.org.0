Return-Path: <linux-media+bounces-40139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CCFB2A08D
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 13:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EC7D7A4B2D
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 11:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71BD2E22A2;
	Mon, 18 Aug 2025 11:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b1HJKEJ9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E202E229F
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 11:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755517064; cv=none; b=oQC0NVckOSMP2/6QHhmEGranaNjj+qx/h1ZVWRdIT5QTpRDaeE2cTVE1eTJmffCjI55QJRe3iAYRRWwb2oml5hD7c20YaxUFWgeCRGgwzoh9V3ZImCKOPlNVk9a5lEgvSPN3O9XOs2D7AF8HKO7v5Vf4Si1eeA+bIBBg+7th27s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755517064; c=relaxed/simple;
	bh=aR1CeHJDHAoN5rt+AYEMj0E2EE0oO2ir6tn55ZMt00c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuKJvvqEhm5mlxAPzc8mlW7Cq2F3zIv6gwBwoIA1iHeJoDOzjmGJTJyauJh5p6O6Ias+D/DqgRmYKCmUsv2qLnHpngZiX6hsQhBi6OmQRV5AHXWDbFx1mhtrlwzZRqnYeEGOuycJ8Er0jH6mbVj4r5utLkhxmqlg3WscSbEAzwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b1HJKEJ9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-51-68.net.vodafone.it [5.90.51.68])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 942F117D1;
	Mon, 18 Aug 2025 13:36:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755517004;
	bh=aR1CeHJDHAoN5rt+AYEMj0E2EE0oO2ir6tn55ZMt00c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1HJKEJ9buKAdObYDYHd0R63LdNn9bfEHKJB2UTJDz2pdhq3d56oaNEmmBeNohJG1
	 mzP8LWIBPD64LAGDWWkQaOHmsZwNjOYbwbsgY5VknF24aMHa8kT4JlplUe5R4/+qJ2
	 dje5p+AoERqJNWkOiYMC0tC1tylxo1+aDH82NCsE=
Date: Mon, 18 Aug 2025 13:37:36 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [bug report] media: cx18: Access v4l2_fh from file
Message-ID: <ntji2u4yvzemi4tesd7syfmix2nbq4br3oh6bmzr2345qunmcf@iet7vsfps2dp>
References: <aKL4OMWsESUdX8KQ@stanley.mountain>
 <3wa4mdkewrgsmt6bdhhm5kuhkpso5lltj6e3zpfpjz2qyizkkk@7e3wxcrgycqx>
 <ddedadfb-2462-43be-9b34-f53dc28051a5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ddedadfb-2462-43be-9b34-f53dc28051a5@kernel.org>

Hi Hans,

On Mon, Aug 18, 2025 at 01:29:23PM +0200, Hans Verkuil wrote:
> On 18/08/2025 13:17, Jacopo Mondi wrote:
> > Hi Dan
> >
> > On Mon, Aug 18, 2025 at 12:54:00PM +0300, Dan Carpenter wrote:
> >> Hello Jacopo Mondi,
> >>
> >> Commit 7b9eb53e8591 ("media: cx18: Access v4l2_fh from file") from
> >> Aug 10, 2025 (linux-next), leads to the following Smatch static
> >> checker warning:
> >>
> >> drivers/media/pci/cx18/cx18-driver.c:1223 cx18_init_on_first_open() error: NULL dereference inside function
> >> drivers/media/pci/cx18/cx18-driver.c:1229 cx18_init_on_first_open() error: NULL dereference inside function
> >> drivers/media/pci/cx18/cx18-driver.c:1230 cx18_init_on_first_open() error: NULL dereference inside function
> >> drivers/media/pci/ivtv/ivtv-driver.c:1313 ivtv_init_on_first_open() error: NULL dereference inside function
> >> drivers/media/pci/ivtv/ivtv-driver.c:1319 ivtv_init_on_first_open() error: NULL dereference inside function
> >>
> >> drivers/media/pci/cx18/cx18-driver.c
> >>     1214         /* Set initial frequency. For PAL/SECAM broadcasts no
> >>     1215            'default' channel exists AFAIK. */
> >>     1216         if (cx->std == V4L2_STD_NTSC_M_JP)
> >>     1217                 vf.frequency = 1460;        /* ch. 1 91250*16/1000 */
> >>     1218         else if (cx->std & V4L2_STD_NTSC_M)
> >>     1219                 vf.frequency = 1076;        /* ch. 4 67250*16/1000 */
> >>     1220
> >>     1221         video_input = cx->active_input;
> >>     1222         cx->active_input++;        /* Force update of input */
> >> --> 1223         cx18_s_input(NULL, &fh, video_input);
> >>                               ^^^^
> >> The patch adds a new dereference of "file" but some of the callers pass a
> >> NULL pointer.
> >
> > smart smatch! Indeed the DVB layer calls the ioctl operation handler
> > directly, without a valid file *.
> >
> >>
> >>     1224
> >>     1225         /* Let the VIDIOC_S_STD ioctl do all the work, keeps the code
> >>     1226            in one place. */
> >>     1227         cx->std++;                /* Force full standard initialization */
> >>     1228         std = (cx->tuner_std == V4L2_STD_ALL) ? V4L2_STD_NTSC_M : cx->tuner_std;
> >>     1229         cx18_s_std(NULL, &fh, std);
> >>     1230         cx18_s_frequency(NULL, &fh, &vf);
> >
> > And I guess the same reasoning applies to these two.
>
> ivtv does the same (cx18 is closely based on ivtv).

Thanks, I'll address both in a single series

>
> Regards,
>
> 	Hans
>
> >
> > I'll send a patch right away
> >
> >>     1231         return 0;
> >>     1232 }
> >>
> >> regards,
> >> dan carpenter
> >
>

