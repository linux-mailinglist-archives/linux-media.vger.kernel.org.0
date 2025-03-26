Return-Path: <linux-media+bounces-28754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6E1A70E25
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 01:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B16A84077C
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 00:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3DD6FB0;
	Wed, 26 Mar 2025 00:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="epV8CTCw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB374A24;
	Wed, 26 Mar 2025 00:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742948043; cv=none; b=FHNXLZI11tqrsfkwIZtY8ncAbAaeHotvt+tZb4b9Jz5k3GwofftoKw/kfddKJxIFhiLjYZdEUhPdrXt12wev4nx7b/Svqc8O1nT67/jGJRDyr+c0wqRbIifYaQfU7EXLYgCNC5CTa69ZeXn4hdHeTgsAu+rmRdj9uFDctottIqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742948043; c=relaxed/simple;
	bh=fP5/0TGq8PYCbdlKXxJZCd5Cs4AQ3mR7NY4cgaWuLhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZ6jtlRQGB7gh+fhGNR2uLi+0Jw5J/RNtYbm/j7jWLZEDdIcO5YNXkG3oX5wVEzGeGJwK1tB9Ym6P7ak2OwE9MGJSaIVXApqyiKSVAoxlpqfu8Pjkp6F0NJhdozhEHPe1DcWERTeYY5hqEqz4ghoQbMg+LF2dnc9/e4gF3TM7/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=epV8CTCw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8026C475;
	Wed, 26 Mar 2025 01:12:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742947931;
	bh=fP5/0TGq8PYCbdlKXxJZCd5Cs4AQ3mR7NY4cgaWuLhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=epV8CTCwIOeRQ5BMub4yobyPlOyXZeDS4tAwcdmQiotvpCd5ko6BVjgCjkzf7ClvZ
	 Az6QwEfxTLWuAmAgmCZqNa1Gle1FLHJhFEXWBtMOxo3zvELvAKIeQdky0rn18+dLEH
	 gvw3b5x1tmdcXzwXXEBUFFCxCbOzXAfF/9LBjHsA=
Date: Wed, 26 Mar 2025 02:13:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Gabriel <gshahrouzi@gmail.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, hdegoede@redhat.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+701fc9cc0cb44e2b0fe9@syzkaller.appspotmail.com,
	skhan@linuxfoundation.org, kernelmentees@lists.linuxfoundation.org
Subject: Re: [PATCH] media: Fix invalid link creation when source entity has
 0 pads
Message-ID: <20250326001336.GA23984@pendragon.ideasonboard.com>
References: <67e26157.0c0a0220.36adcd.506e@mx.google.com>
 <CANiDSCsvEke31SAgXhs_sXEN7d6fXrwuhJFsi2mzESq1Jc8pxA@mail.gmail.com>
 <CAKUZ0zJjdSDH3cw=8iKJauU5dmcq9TFhAaJX4yS5UQoiCUaguA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKUZ0zJjdSDH3cw=8iKJauU5dmcq9TFhAaJX4yS5UQoiCUaguA@mail.gmail.com>

On Tue, Mar 25, 2025 at 06:05:00PM -0400, Gabriel wrote:
> Hi Ricardo,
> 
> > I cannot reach that URL
> I was unable to access the URL from my email client when I initially
> sent the email, but a couple of hours later, I was able to. Initially,
> copying and pasting the URL into the browser provided a workaround.
> 
> > Shouldn't it be?:
> > Fixes: 4ffc2d89f38a ("[media] uvcvideo: Register subdevices for each entity")
> You're right, I incorrectly referenced the wrong commit. However, I’m
> not certain if it should reference a96aa5342d57 (Fixes: a96aa5342d57 -
> '[media] uvcvideo: Ignore entities for terminals with no supported
> format') as it's the latest commit affecting the line I'm changing or
> the one you mentioned.
> 
> > Shouldn't source->num_pads be the same as remote->num_pads?
> The fuzzer (Syzkaller) that triggered the warning appears to have
> encountered a case where source->num_pads and remote->num_pads were
> different. When analyzing the case in GDB, remote->num_pads was 1,
> while source->num_pads was 0.

This seems like the real bug that should be fixed.

> > Are you sure that your kernel does not contain?
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/media/usb/uvc/uvc_entity.c?id=41ddb251c68ac75c101d3a50a68c4629c9055e4c
> Yes, it should be included since I am running the upstream kernel.

-- 
Regards,

Laurent Pinchart

