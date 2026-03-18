Return-Path: <linux-media+bounces-56233-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PaPIQD8umlHeAIAu9opvQ
	(envelope-from <linux-media+bounces-56233-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:24:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A462C1FB1
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAAE33056174
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 19:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDB63EFD18;
	Wed, 18 Mar 2026 19:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CREnysAR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AFC329E40;
	Wed, 18 Mar 2026 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773861842; cv=none; b=FUNASz7r2qwuBTQlQm72LwdnnAPfly5IFU+fRXjy7CfsGLf39hkkEA7zc59/j6X05d3xe8EGKW6iBR33WG++ocQ6HtmZsdkjaOe5hJY4UTDygyMWOou8gcj+rlzVH+zaQGzTqpG1iXnO/qb3fMK5VoHLD1zg4lqF4aRYJJtOhNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773861842; c=relaxed/simple;
	bh=CD4l85WL9Qs8RtP6xsptN46JAxorn/BgrNYRCiS5yQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgamTreHlhJMRGkLWVD0RyNv37ZQC47R/lIo7k/3tuJ/1g4RQ4ehyYiOTpxQAMBjuu+mY2rBDvsVFoxstt3ovLqfQuJbpLi5Etlx0UJRnT+wJKS03idNgPmIf6snRmhqlGBU5YcdKK2gE4dAoOriHg9BtdpqwANmHPSv9FSUf44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CREnysAR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DE764308;
	Wed, 18 Mar 2026 20:22:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773861766;
	bh=CD4l85WL9Qs8RtP6xsptN46JAxorn/BgrNYRCiS5yQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CREnysARaMaDEZk2HqOYo0SBGytcDyMjNHdxoUianJWfHw/26ipkoeJPUoyvvxJWG
	 8alcf1dshhxiGTZuc3TiCzEXCMjkAcMIIxhXxj1T14Xk0338FqzNwVi7mD7zJLaGs3
	 eJ2yfmcqSqWoO0bP67q/MnanXD+0os0WtUlTPU6k=
Date: Wed, 18 Mar 2026 21:23:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yunke Cao <yunkec@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH 0/3] media: uvcvideo: Improvements for UVC metadata
Message-ID: <20260318192357.GD718539@killaraus.ideasonboard.com>
References: <20260309-uvc-metadata-dmabuf-v1-0-fc8b87bd29c5@chromium.org>
 <6783b48c-9e4c-45ad-a691-9f172c978428@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6783b48c-9e4c-45ad-a691-9f172c978428@kernel.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56233-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: E9A462C1FB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 01:05:30PM +0100, Hans de Goede wrote:
> On 9-Mar-26 4:01 PM, Ricardo Ribalda wrote:
> > This series introduces some improvements for UVC metadata:
> > 
> > - Allow bigger sizes of metadata.
> > - Refactor the code to avoid invalid pointer arithmetic.
> > - Add support for DMABUF
> > 
> > Cheers!
> > 
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> Thank you.
> 
> This entire series seems simple/safe enough and looks good to me
> from a review pov, so I've pushed this to uvc/for-next now.

I'd like a small change in 2/3. Ricardo, if you submit a new version of
2/3, I can merge it and handle the rebase.

> While it also rebasing uvc/for-next on top of the latest
> media-committers/next .
> 
> > ---
> > Ricardo Ribalda (3):
> >       media: uvcvideo: Enable VB2_DMABUF for metadata stream
> >       media: uvcvideo: uvc_queue_to_stream(): Support meta queues
> >       media: uvcvideo: Allow userspace to increase the meta buffersize
> > 
> >  drivers/media/usb/uvc/uvc_isight.c   |  3 ++-
> >  drivers/media/usb/uvc/uvc_metadata.c |  9 +++++++--
> >  drivers/media/usb/uvc/uvc_queue.c    | 18 ++++++++----------
> >  drivers/media/usb/uvc/uvcvideo.h     |  7 +++++--
> >  4 files changed, 22 insertions(+), 15 deletions(-)
> > ---
> > base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
> > change-id: 20260309-uvc-metadata-dmabuf-b98359eec8dd

-- 
Regards,

Laurent Pinchart

