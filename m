Return-Path: <linux-media+bounces-29524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E90A7E0D4
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 16:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 725D216B9E7
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 14:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0CA1CAA97;
	Mon,  7 Apr 2025 14:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z+36GkS7"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDAA1D4356
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 14:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035240; cv=none; b=OdShBI+F6J6EPNsOxfLZWCbr47Nc5J2HGhiJ1Y4ExyliyhpKmaIU+eeLEplfGsO4gatXWs3+jLH9u1fGI87W2i5likQt4JuMtI7r3VFoNpbN41+J8Nh4DAXUD6yjk0JxBrIxuAdSgafgVqfqoXPgt0NALffDKgrRl/UUvwLExTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035240; c=relaxed/simple;
	bh=rJWW+hRErOu0q7smwoCDx5wqQQ9FudwS36deRvjLlqI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ddUdlhK6HnEm9uWoj8NtpTL0P2Im6gNdMNf7E3rFQHXVFJHk+8FEk/ft+LhXreZsVhlh1Nd5quf2ylLMTaNTYkvyq0X6/fQH7nz/tLB2tjwAcxnuPtHzPUjRYcwWuwIvLAVAo6xVf7hMvj9mfvM8U8GwpqCo6MN5ZM1xKzivPj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Z+36GkS7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744035236;
	bh=rJWW+hRErOu0q7smwoCDx5wqQQ9FudwS36deRvjLlqI=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=Z+36GkS7H+tx6GV1A3rkvbuOuQV8B/giYurIE/POQxSA5DFmmduaNymEUOHz6toRi
	 AgK0XiSwwAm5mwKnYF5wjUtWXyi6Btg/J6L0JwbQGKBWrlDffcLN6qEddKrRfS4ELu
	 Sd3l/hoNYV3Lyo0eQBFmaILDJLGngnn7NWqjJnUq8+Z1W+TK78SbgRG5KTbBhqjNNd
	 YU2EiZVYMmeEo7wjmgtS3N5qlA3tYM49tXaeRn+vJhEKYSuyZ7W+CsMaImMNMEHuSw
	 AoPQwvWMNqvSFoQP7Z8k6LfQXwSNXTAM8iD93J66aluRjclwQrNdy+0HeSAivJzbmN
	 PNIl/zt+XFhvg==
Received: from [IPv6:2606:6d00:11:e976::c41] (unknown [IPv6:2606:6d00:11:e976::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B4EDF17E0EC0;
	Mon,  7 Apr 2025 16:13:55 +0200 (CEST)
Message-ID: <f695086274d6207b7cfe7735b51cddb57aa52a74.camel@collabora.com>
Subject: Re: GIT PULL FOR 6.16] Enable 10bit and YCbCr 422 in RKVDEC H.264
 decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Date: Mon, 07 Apr 2025 10:13:54 -0400
In-Reply-To: <7e4add79-dca2-42ec-a221-df089f6472e6@xs4all.nl>
References: <fc348bb52d60acaaa15d3221aaba8217d67d349c.camel@collabora.com>
	 <1b7c3c7a-69b6-4a40-9345-f52e18d07b18@xs4all.nl>
	 <7e4add79-dca2-42ec-a221-df089f6472e6@xs4all.nl>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le lundi 07 avril 2025 à 13:13 +0200, Hans Verkuil a écrit :
> On 07/04/2025 13:11, Hans Verkuil wrote:
> > On 01/04/2025 22:09, Nicolas Dufresne wrote:
> > > Hey Hans & Mauro,
> > > 
> > > The following changes since commit f2151613e040973c868d28c8b00885dfab69eb75:
> > > 
> > >   media: pci: mgb4: include linux/errno.h (2025-03-07 12:05:42 +0100)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6.16-rkvdec-h264-high10-and-422
> > > 
> > > for you to fetch changes up to 619d9391efd5ed93f805734279034fa34f537347:
> > > 
> > >   media: rkvdec: Fix frame size enumeration (2025-04-01 15:25:07 -0400)
> > > 
> > > ----------------------------------------------------------------
> > > Enable 10bit and YCbCr 422 in RKVDEC H.264 decoder
> > > 
> > > ----------------------------------------------------------------
> > > Alex Bee (1):
> > >       media: rkvdec: h264: Don't hardcode SPS/PPS parameters
> > > 
> > > Jonas Karlman (10):
> > >       media: v4l2-common: Add helpers to calculate bytesperline and sizeimage
> > >       media: v4l2: Add NV15 and NV20 pixel formats
> > >       media: rkvdec: h264: Use bytesperline and buffer height as virstride
> > >       media: rkvdec: Extract rkvdec_fill_decoded_pixfmt into helper
> > >       media: rkvdec: Move rkvdec_reset_decoded_fmt helper
> > >       media: rkvdec: Extract decoded format enumeration into helper
> > >       media: rkvdec: Add image format concept
> > >       media: rkvdec: Add get_image_fmt ops
> > 
> > So this patch needs more work.
> > 
> > >       media: rkvdec: h264: Support High 10 and 4:2:2 profiles
> > 
> > and this depends on the previous patch.
> > 
> > >       media: rkvdec: Fix frame size enumeration
> > > 
> > > Sebastian Fricke (1):
> > >       media: rkvdec: h264: Limit minimum profile to constrained baseline
> 
> Ah, this also depends on the change. I'll have to skip this one too.

Just let me know if you can't fix the merge conflict, it has no
"semantic" dependency though, and is minor change that can be re-added
later in any case.

> 
> Regards,
> 
> 	Hans
> 
> > 
> > I can take all other patches except those two. Would that work for you, Nicolas?

Please have a look at my reply on the patch review. Though, yes, it
would be helpful to take some of it, just let me know what applied
cleanly, I'll make sure the rest is picked later. The NV15 format, will
allow some Hantro change to happen, and will reduce the on-going
rkvdec2 work (1).

Nicolas

(1) RKVDEC2 might endup being merged back into rkvdec since it
duplicates quite a lot, if we do that, we'll unstage rkvdec first, so
you'll have a chance to check for more things you don't like.

> > 
> > Regards,
> > 
> > 	Hans
> > 
> > > 
> > >  Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst | 128 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > >  drivers/media/v4l2-core/v4l2-common.c                       |  80 +++++++++++++++++++++++++++++++++++++-----------------------------------
> > >  drivers/media/v4l2-core/v4l2-ioctl.c                        |   2 ++
> > >  drivers/staging/media/rkvdec/rkvdec-h264.c                  |  64 ++++++++++++++++++++++++++++++++++++++--------------------
> > >  drivers/staging/media/rkvdec/rkvdec.c                       | 239 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------------
> > >  drivers/staging/media/rkvdec/rkvdec.h                       |  18 ++++++++++++++++-
> > >  include/uapi/linux/videodev2.h                              |   2 ++
> > >  7 files changed, 410 insertions(+), 123 deletions(-)
> > > 
> > 
> > 

-- 
Nicolas Dufresne
Principal Engineer at Collabora

