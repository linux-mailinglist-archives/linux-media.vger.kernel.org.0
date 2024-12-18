Return-Path: <linux-media+bounces-23748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DC49F70CE
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 00:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8236D16E1B3
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 23:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546481FD7A4;
	Wed, 18 Dec 2024 23:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k2z3+Kqz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FA01FD780;
	Wed, 18 Dec 2024 23:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734564525; cv=none; b=KLI7LHptKJSqorQP6leQKN4VUTbk7HClqlfDqsLigymj9WiL1M4sGQXcpIW0pF0KSRoDKQsyK2qzwpBtFNaSpa9SAN+Vsy5zVTZ/uWd1rEXJpqEGPSttKYdy5Rn7ElN8RAgvLMMSFYVA3u+SX2gNPP4+AGudn8vpSZUeylnRnsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734564525; c=relaxed/simple;
	bh=rIZT3JqsgTOCIDosRRfaFGJoO7OvjcdyHmNvNGPf434=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSlD4hnEIr0JnLLQ5CiOPOKZm5n4Mmd7mskh9B5C993OpHyKfamusxgl9CNZ819/arcuG+qT6mhWBj1/OduMiVN4gzCnohJSmVHaZvmXqnOvaM4VFR0xPxFKVi3IqVcJbokisAXIfHGRKBKJQnZERtY2u6hVkZuH9aa36sGh74M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k2z3+Kqz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 349714D4;
	Thu, 19 Dec 2024 00:28:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734564483;
	bh=rIZT3JqsgTOCIDosRRfaFGJoO7OvjcdyHmNvNGPf434=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2z3+Kqzrm/6ot4O1OEUMQN1teWGzBefnOzY1Y0JwU9t2FLZTb4MX0XaCCZzcabOt
	 GGt9qEAiRDVjnOfrGQIDLpf817XXFLErcHYamAIMbe6m7ft4j5jqiP550ze4nxvcha
	 zSsB8UZeTgqYgA94VixUlqrwlm8zNgWWDCPwz3k0=
Date: Thu, 19 Dec 2024 01:28:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Filter hw errors while enumerating
 controls
Message-ID: <20241218232838.GG5518@pendragon.ideasonboard.com>
References: <20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org>
 <CANiDSCvL_C5mgGoXz9zWjJA7fXizM751hjm5jadWsRiymTRYsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvL_C5mgGoXz9zWjJA7fXizM751hjm5jadWsRiymTRYsQ@mail.gmail.com>

On Wed, Dec 18, 2024 at 03:38:34PM +0100, Ricardo Ribalda wrote:
> On Fri, 13 Dec 2024 at 12:21, Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > To implement VIDIOC_QUERYCTRL, we need to read from the hardware all the
> > values that were not cached previously. If that read fails, we used to
> > report back the error to the user.
> >
> > Unfortunately this does not play nice with userspace. When they are
> > enumerating the contols, the only expect an error when there are no
> > "next" control.
> >
> > This is probably a corner case, and could be handled in userspace, but
> > both v4l2-ctl and yavta fail to enumerate all the controls if we return
> > then -EIO during VIDIOC_QUERYCTRL. I suspect that there are tons of
> > userspace apps handling this wrongly as well.
> 
> Actually it CANNOT be handled in userspace.
> 
> If we return anything different than 0, the structure is not copied to
> userspace:

That could be fixed, we do copy data back to userspace in case of
failure for some ioctls. I don't think that would be needed though, I
believe we can either mark controls as broken in the uvcvideo driver
through quirks, or in a dynamic fashion.

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/v4l2-core/v4l2-ioctl.c#n2929
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/v4l2-core/v4l2-ioctl.c#n3490

-- 
Regards,

Laurent Pinchart

