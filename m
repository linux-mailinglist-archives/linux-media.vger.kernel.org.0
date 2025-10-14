Return-Path: <linux-media+bounces-44405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBAEBD91EF
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 13:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26E9A18A70A3
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 11:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1990B3101D1;
	Tue, 14 Oct 2025 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p8gsXycd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A58F3101B6;
	Tue, 14 Oct 2025 11:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760442750; cv=none; b=JUO+dtNEvieH92L2l48EHNBbk5ntWpHEgmnGc+16rshof8n9OWcxNK2qsuJHcwj6QB6wAaHIjVY0X+rCSlnfB5HSzvVY4XAe+t3thP4yUQbViPRseZON9TbAi3OmFZ32CpkmUun4KuZPR/5y7eOJugn6DCA+M2tK4cd6GKaqL/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760442750; c=relaxed/simple;
	bh=3XVJuLXTqcUwfWrdJ5RIn39dvkfVJ7NKAlswAxMmqtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ch2KmE/X6/nz5ziSWq3IB5XfjNt30zwkOh53PVgSxuG6eje2mvz2S02Rfkm2/eKZNkeNRZFrLqCQeSdF/gdpEUYjZ6R5dn033unqJv4MdnTM86AMorFVWrO7SNQURqa7+4RFUYTZNwooJa+2ZM+n6M3peQPrato5jEKRY1/2j2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p8gsXycd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C22B3C7B;
	Tue, 14 Oct 2025 13:50:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760442642;
	bh=3XVJuLXTqcUwfWrdJ5RIn39dvkfVJ7NKAlswAxMmqtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p8gsXycdcA3BtZ7uS5smhn0oU3DLtZaFu41WcGnW99Wf2sh46ZnM8v/1cWyjefm0E
	 7DeLaXAVKw+nIBtIsampBkDXrt5TYy6HQvxGaOgLQSQA/wiebRWih8jk3eNXGiPCiq
	 9h3kVgyIcYP7+XexV3f+SxWlu77qkZy+xYRHxZkQ=
Date: Tue, 14 Oct 2025 13:52:18 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Andy Walls <awalls@md.metrocast.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] media: pci: Fix invalid access to file *
Message-ID: <3cqjf6pts5fzs5gziog3g3jay6txcvxshm554uqpzgb6ymnukh@dsbo27d47rol>
References: <20250819-cx18-v4l2-fh-v4-0-9db1635d6787@ideasonboard.com>
 <0627cfba-798a-482b-b335-cc78a609c150@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0627cfba-798a-482b-b335-cc78a609c150@kernel.org>

Hi Hans

On Tue, Oct 14, 2025 at 09:05:20AM +0200, Hans Verkuil wrote:
> Hi Jacopo,
>
> On 19/08/2025 09:07, Jacopo Mondi wrote:
> > Since commits
> > 7b9eb53e8591 ("media: cx18: Access v4l2_fh from file")
> > 9ba9d11544f9 ("media: ivtv: Access v4l2_fh from file")
> >
> > All the ioctl handlers access their private data structures
> > from file *
> >
> > The ivtv and cx18 drivers call the ioctl handlers from their
> > DVB layer without a valid file *, causing invalid memory access.
> >
> > The issue has been reported by smatch in
> > "[bug report] media: cx18: Access v4l2_fh from file"
> >
> > Fix this by providing wrappers for the ioctl handlers to be
> > used by the DVB layer that do not require a valid file *.
>
> This series should go to the fixes branch for v6.18, right?
> This looks like a pure regression, so I think that makes sense.
>

I think so, yes

> BTW, why is there a Link: tag in the cx18 patch? It just links to
> the v1 of the patch and that doesn't add meaningful information.
> Linus likes Link:, but only if it really adds useful information.

Good question. I presume it's probably a copy&paste error, as it has no
place in the patch.

Would you like me to resend or will you remove it ?


>
> Regards,
>
> 	Hans
>
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> > Changes in v4:
> > - Slightly adjust commit messages
> > - Link to v3: https://lore.kernel.org/r/20250818-cx18-v4l2-fh-v3-0-5e2f08f3cadc@ideasonboard.com
> >
> > Changes in v3:
> > - Change helpers to accept the type they're going to operate on instead
> >   of using the open_id wrapper type as suggested by Laurent
> > - Link to v2: https://lore.kernel.org/r/20250818-cx18-v4l2-fh-v2-0-3f53ce423663@ideasonboard.com
> >
> > Changes in v2:
> > - Add Cc: stable@vger.kernel.org per-patch
> >
> > ---
> > Jacopo Mondi (2):
> >       media: cx18: Fix invalid access to file *
> >       media: ivtv: Fix invalid access to file *
> >
> >  drivers/media/pci/cx18/cx18-driver.c |  9 +++------
> >  drivers/media/pci/cx18/cx18-ioctl.c  | 30 +++++++++++++++++++-----------
> >  drivers/media/pci/cx18/cx18-ioctl.h  |  8 +++++---
> >  drivers/media/pci/ivtv/ivtv-driver.c | 11 ++++-------
> >  drivers/media/pci/ivtv/ivtv-ioctl.c  | 22 +++++++++++++++++-----
> >  drivers/media/pci/ivtv/ivtv-ioctl.h  |  6 ++++--
> >  6 files changed, 52 insertions(+), 34 deletions(-)
> > ---
> > base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
> > change-id: 20250818-cx18-v4l2-fh-7eaa6199fdde
> >
> > Best regards,
>

