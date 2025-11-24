Return-Path: <linux-media+bounces-47646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD19C7F6DF
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 09:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 572BE3A4EB1
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 08:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E99E2EF665;
	Mon, 24 Nov 2025 08:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gqzp8bqO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9778972631
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 08:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763974369; cv=none; b=M/lrsPWDmnM4QUKGQ2FKP8cjfH1YzMuGEMGNAosPyHrUj7vv8AHcHlsLMVb4JWIn240etwiuYL5rwBUkZivLThawRIwGsyAwsfM+itcsp6JGDUgrxy5IeClNOnDLDXOqJ03KxSQT8sqKko8GMRculrfK0y/kLacs18r5a2hzklo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763974369; c=relaxed/simple;
	bh=LjRkkugImeZTiw3TTfmkxRIH1LQ47vijjqxi3xJubck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWfMv2J0Ucq5OZhutna6a94a2mnABhu5udmpKi6dbu+k28V76D+LGSz5dSGW0wkB6wOgGrgCoT8ZAtFIaPb9AtzifnbP6PHbbKlGPC37VI+RgvPnmDfteZnybUueSULdV9gdnbP5zhND708gykX8N8UQXIqwsbAiYaPtlC0ipwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gqzp8bqO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-137-64.net.vodafone.it [5.90.137.64])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9588029A;
	Mon, 24 Nov 2025 09:50:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763974237;
	bh=LjRkkugImeZTiw3TTfmkxRIH1LQ47vijjqxi3xJubck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gqzp8bqOlJR82itTweCSfLr60/lk6mvNoom8Ac1d7/ZM8sXBxc9ggHHvjvmem4QE1
	 ciVRKvW+i5GAQXdMKlsc2zypEYFGk7CAC+3QZegatl2jApCJr9GRoHQ72M/IuNX5Ue
	 P2QC/noZfSxTcIMdkjFk5S3tAMDs3v8WgJSb0Poo=
Date: Mon, 24 Nov 2025 09:52:40 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sune Brian <briansune@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org
Subject: Re: [HELP] V4L2 kept reporting CROPCAP fail
Message-ID: <57px3akwyj6usy6llbichpu4ioaj7kj2sbv3jzqt3fo4bjknvd@hnw6docub3nr>
References: <CAN7C2SA34JN71qvqyefmr9h11SsmCaeGGVyc=GW408+MrC-aRg@mail.gmail.com>
 <3qt2yxwubrxhbhst5o2ig5ng4wqokzfg6uqzrtc2lfzq2cjbds@uwdb3zg2a7vi>
 <CAN7C2SC+nDhoHonOB=AkKgsunyijuV0aAYvBJ1C5iaU76Q0U5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAN7C2SC+nDhoHonOB=AkKgsunyijuV0aAYvBJ1C5iaU76Q0U5Q@mail.gmail.com>

Hello

On Mon, Nov 24, 2025 at 04:42:44PM +0800, Sune Brian wrote:
> Hi Jaco.
>
> > > * Platform using: Nanopi-Neo4 (RK3399)
> > > * Kernel version: 6.12 & 6.18
> >
> > Is this a mainline kernel or a Rockchip BSP ? (tbh I've no idea if
> > rockchip BSP ships a different camera/ISP driver than mainline..)
>
> Main stream kernel NOT RK BSP.
> I don't plan to use RK kernel because they don't give a "F" on
> updates and long term supports. Using 4.19 what a joke man.
>

Ok, great

> >
> > > * Issue: CROPCAP fail warming and possible stall on v4l2
> > >
> > > More information:
> > >
> > > The MIPI camera is functioning on both 6.12&6.18.
> > > However, no matter preview or capturing there is
> > > a warming message kept reports and cannot found
> > > possible root cause.
> > >
> > > Message as follows:
> > > v4l2 gstv4l2object.c:5032:gst_v4l2_object_get_crop_rect:<v4l2src0:src>
> >
> > this is gstreamer reporting an error.
> >
> > I would start by suggesting increasing the gstreamer debug (plenty of
> > resources online)
> >
> > However, if you're trying to capture from a camera going through the ISP
> > the v4l2src plugin from gstreamer shouldn't work, so I suspect you
> > might be on a different software stack than mainline linux and
> > gstreamer or you are using a different camera than what I'm thinking
> > of.
> >
> The current situation is that for 6.18 kernel it can capture both
> video and image but for image it is reporting that message
> again and again and google also shows this very puzzling
> warming message.
>

Through which app ? which gstreamer version ? which camera input ?
(I'm trying to identify where I should suggest you to enable debug on,
without details, it's hard to guess).

> The camera driver w/o any modification works but again
> that message is so puzzling and I cannot understand why.
>
> For kernel 6.12 that is even more trouble but I think if 6.18
> works why use old kernel when new kernel have its benefit.
> Yet, still worth to point out the issue a bit.
>
> Thanks,
> Brian

