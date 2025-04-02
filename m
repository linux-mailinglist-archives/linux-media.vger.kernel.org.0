Return-Path: <linux-media+bounces-29178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A46DFA785BA
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 02:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D85C4188CA99
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 00:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265AC8494;
	Wed,  2 Apr 2025 00:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wCEvoDfH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ACA36D;
	Wed,  2 Apr 2025 00:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743553815; cv=none; b=Yny/BLIqj8SDfdOO7H9CY+23XDa2jNqgySCxpfQDTHnWe4UlVaDLdSoL8GI1h9RZAgAg9FWfLO6FLKGYMhEo+u7L+AB/rlgLndebe30pzb9BX4KWhjbN8xCD0ISYVgKasQhkMbUaEHD27ZaqJN9psmRH+GFV4zFa/bAj9aG7A+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743553815; c=relaxed/simple;
	bh=ks3FoRalUy+GxNwqTzbVxz4t91WqPu5KkjffOTeY6aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHeaAe15O512n+eSWkMjN9S3d0V1FciTu89n92PiKrw+09JeY243zJUau6HyW5tYFF1VdQGcWy4iC7Rs/zU1XmQKfwSSgFLwzjCiCuopfskU8Iu8J8Cpms9BPXwweGrsejI4MICr+44XjrPQTNzlNJpKBYE6XYiQsYy6Z6XixYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wCEvoDfH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B492B6A2;
	Wed,  2 Apr 2025 02:28:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743553699;
	bh=ks3FoRalUy+GxNwqTzbVxz4t91WqPu5KkjffOTeY6aA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wCEvoDfH3i+sL9c97S9iDN820KbpDkbjjLJvVnklp0HKK53QYJd+2slu0y9TX5rh/
	 BH/XcEBD6/NxNLmU1i0S+/UCyNoKYt5+qxOJ4+ZXYbOqoNbCKXskLPilF45wMRpn7I
	 8IWX4CXtzRyyr9Xz4kqtdJGYHZtak+X5uSMMXk4I=
Date: Wed, 2 Apr 2025 03:29:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Gabriel <gshahrouzi@gmail.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, hdegoede@redhat.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+701fc9cc0cb44e2b0fe9@syzkaller.appspotmail.com,
	skhan@linuxfoundation.org, kernelmentees@lists.linuxfoundation.org
Subject: Re: [PATCH] media: Fix invalid link creation when source entity has
 0 pads
Message-ID: <20250402002948.GC4845@pendragon.ideasonboard.com>
References: <67e26157.0c0a0220.36adcd.506e@mx.google.com>
 <CANiDSCsvEke31SAgXhs_sXEN7d6fXrwuhJFsi2mzESq1Jc8pxA@mail.gmail.com>
 <CAKUZ0zJjdSDH3cw=8iKJauU5dmcq9TFhAaJX4yS5UQoiCUaguA@mail.gmail.com>
 <20250326001336.GA23984@pendragon.ideasonboard.com>
 <CAKUZ0zKDy47cQ0ZQo-=1c7wmazbutF=VF3qX09DfZFBz01hh-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKUZ0zKDy47cQ0ZQo-=1c7wmazbutF=VF3qX09DfZFBz01hh-g@mail.gmail.com>

Hi Gabriel,

On Sat, Mar 29, 2025 at 01:50:00PM -0400, Gabriel wrote:
> Hi Laurent,
> 
> I’ve analyzed the bug report, and the root cause of the
> "WARNING-media_create_pad_link" issue is a mismatch in terminal
> references in the USB descriptor.
> 
> The format type descriptor references terminal ID 6, while the audio
> streaming interface descriptor points to terminal ID 5. This
> discrepancy triggers the warning: "No streaming interface found for
> terminal 6", followed by the media pad link warning.

Can you share the USB descriptors.

> I confirmed this by changing the terminal ID in the format descriptor
> from 6 to 5, which eliminates both warnings. This shows the warning is
> correctly identifying an invalid descriptor configuration, not a
> kernel bug.

There's still something not quite right. uvc_entity->num_pads should
always be equal to the corresponding media_entity->num_pads. That's not
the case here, and I think it indicates a bug.

> Since the USB descriptor is invalid, I believe the warning is
> necessary and should remain. The code should stay as is.

There should be a warning, but I think it needs to be caught in a
different place, earlier.

> On Tue, Mar 25, 2025 at 8:13 PM Laurent Pinchart wrote:
> >
> > On Tue, Mar 25, 2025 at 06:05:00PM -0400, Gabriel wrote:
> > > Hi Ricardo,
> > >
> > > > I cannot reach that URL
> > > I was unable to access the URL from my email client when I initially
> > > sent the email, but a couple of hours later, I was able to. Initially,
> > > copying and pasting the URL into the browser provided a workaround.
> > >
> > > > Shouldn't it be?:
> > > > Fixes: 4ffc2d89f38a ("[media] uvcvideo: Register subdevices for each entity")
> > > You're right, I incorrectly referenced the wrong commit. However, I’m
> > > not certain if it should reference a96aa5342d57 (Fixes: a96aa5342d57 -
> > > '[media] uvcvideo: Ignore entities for terminals with no supported
> > > format') as it's the latest commit affecting the line I'm changing or
> > > the one you mentioned.
> > >
> > > > Shouldn't source->num_pads be the same as remote->num_pads?
> > > The fuzzer (Syzkaller) that triggered the warning appears to have
> > > encountered a case where source->num_pads and remote->num_pads were
> > > different. When analyzing the case in GDB, remote->num_pads was 1,
> > > while source->num_pads was 0.
> >
> > This seems like the real bug that should be fixed.
> >
> > > > Are you sure that your kernel does not contain?
> > > > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/media/usb/uvc/uvc_entity.c?id=41ddb251c68ac75c101d3a50a68c4629c9055e4c
> > > Yes, it should be included since I am running the upstream kernel.

-- 
Regards,

Laurent Pinchart

