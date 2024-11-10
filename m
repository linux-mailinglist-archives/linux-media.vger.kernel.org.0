Return-Path: <linux-media+bounces-21215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A867A9C3183
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 11:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55666B2109F
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 10:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93A6153BFC;
	Sun, 10 Nov 2024 10:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLNQFUS+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3601314264A;
	Sun, 10 Nov 2024 10:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731232984; cv=none; b=BzDxD3vGr3zn1KTHLwHruQuKXhMW9xw7u48H3IwJYoNS/3QnCSlJZSRFzC9+2tkAue4abv9aPEoYQEXUMeDYrPRYnIo1ri/u1YvbTor21q40pc7uucvY6VulHI5/1E/Et++i6qpgScX+vqgH1IQ+pMBIy8Uzz5KYe6jS9rxP3WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731232984; c=relaxed/simple;
	bh=2T78Ii61IdDlQvvpobNBGDbWVCm6kDtn4WhH9m4bfiY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eOceTTiVQELaVApiigb91yKDrowd6aEGDvmEQmUTwYfsVpeFaoBCAO7oy2udHp9mlJeNo24RL/ayNtIackBMCGsQpPaoIy0nrUwoBenjPxvlLTq1szO4q+h4IQz+J8NedTYkRwH44Ij+Y67e6OhCBh/khOICalNCg+2mmelphrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLNQFUS+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B913EC4CECD;
	Sun, 10 Nov 2024 10:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731232983;
	bh=2T78Ii61IdDlQvvpobNBGDbWVCm6kDtn4WhH9m4bfiY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mLNQFUS+iFKSNMRdpatTJlyOsJRRG4Zd1NLzfUKw3LE/CLYe/OPkDi5UHIuZ0LyDs
	 qD4tojjkrzTRsioMkHyZnpCMywUPl+UZjsIb9Sh9p/3ERcj+vWDLpYlN5VLc7CZxsq
	 TPzAfemfDxvphZvNQ/5GkHBxUS1CyFVIv2uP7YKwhZVls6jfaFf1aKByhTIhcCO7fR
	 WeqQfqPXB7Qyqv9Aadwnv79E2dsoVm1nENiCbIzYcy+AGrOpCxxynpXy21qug0M7ca
	 xl48/Bxfx50xDjPS+iHrhN0aAziDA0t4+Vjcm5cM9dwVR3zzNrskHmJNuwvx3ilymL
	 mOJaU4Q5ImKcw==
Date: Sun, 10 Nov 2024 11:02:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Yunke Cao
 <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
Message-ID: <20241110110257.5160a7d1@foz.lan>
In-Reply-To: <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
	<5b5f3bb7-7933-4861-be81-30345e333395@redhat.com>
	<CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 9 Nov 2024 17:29:54 +0100
Ricardo Ribalda <ribalda@chromium.org> escreveu:

> >
> > I think that should sort the issue, assuming that 1. above holds true.
> >
> > One downside is that this stops UVC button presses from working when
> > not streaming. But userspace will typically only open the /dev/video#
> > node if it plans to stream anyways so there should not be much of
> > a difference wrt button press behavior.  
> 
> I do not personally use the button, but it is currently implemented as
> a standard HID device. 

IMO, controlling the privacy via evdev is the best approach then. There's
no need for a RW control neither at subdev or at device level. It could
make sense a Read only to allow apps to read, but still it shall be up to
the Kernel to protect the stream if the button is pressed.

> Making it only work during streamon() might be
> a bit weird.
> I am afraid that if there is a button we should keep the current behaviour.

Privacy matters only when streaming. IMO the Kernel check for it needs to
be done at DQBUF time and at read() calls, as one can enable/disable the
camera while doing videoconf calls. I do that a lot with app "soft" buttons,
and on devices that physically support cutting the video. 

I don't trust myself privacy soft buttons, specially when handled in userspace,
so what I have are webcam covers (and a small stick glued at a laptop camera
that has a too small sensor for a webcam cover). I only remove the cover/stick
when I want to participate on videoconf with video enabled with the builtin
camera.

Regards

Thanks,
Mauro

