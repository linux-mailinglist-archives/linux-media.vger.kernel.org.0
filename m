Return-Path: <linux-media+bounces-39920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C31B26888
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 16:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1E485E7BDB
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 13:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4A1301478;
	Thu, 14 Aug 2025 13:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ti6ik4a9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC53C3002D7;
	Thu, 14 Aug 2025 13:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179914; cv=none; b=g+2yVeH/evnAXLTXmj1jBVuaAgt8M11GdwQhTDIWE/zICOwvYJkh7pCKFEwwyPokHvjIM/qB2r80px0wCzn1S3UaXLy9GX1g77BuafZwmC/cFdZwV49ieoDKFpo1LBaqSVOid3C4RdIbFzq7Ne3vyBgkfABZuyoDBpQdVf1rWMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179914; c=relaxed/simple;
	bh=SrD6ygWA8JZfTF0oHikTh3rmv1gf5wSjvlZp7nXlVUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OI2nwrUkyIZsgvoFjtxD6C/jNpp0UMVz0MnBTXnRMEL2UKB6b2C4pTXuCfUkqLV/gxQLXpEZfn+lIkTLxI1aAweyQX0QD2DAKxejEWqXvebRmCOwgI3cKVSnkHfhW+V5HVjnG2tY9+DLxUCIKO3X0ucffHQplPqlQcQvhZG5uxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ti6ik4a9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494A4C4CEED;
	Thu, 14 Aug 2025 13:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755179913;
	bh=SrD6ygWA8JZfTF0oHikTh3rmv1gf5wSjvlZp7nXlVUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ti6ik4a9lDSRJcs1BwXX6/CKvS5q+y4+ola2QS4XAMADxdrIRlwBRBujissCXWYzZ
	 d2m3G4j56txBh+44aERIBapB6ImbKKae+n0jr3/l1SO25bau5IMQ70ru/UbdJWjNv0
	 OhiZR0aV0ZLVKx49pKWi6HFelzBhg48a4tA2pna4=
Date: Thu, 14 Aug 2025 15:58:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Qianfeng Rong <rongqianfeng@vivo.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] media: atomisp: Use vmemdup_user() instead of open-coding
Message-ID: <2025081424-spectacle-chevron-6be1@gregkh>
References: <20250814133032.236533-1-rongqianfeng@vivo.com>
 <73577de6-3fc1-456b-90b5-3fa69a42366e@web.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73577de6-3fc1-456b-90b5-3fa69a42366e@web.de>

On Thu, Aug 14, 2025 at 03:42:33PM +0200, Markus Elfring wrote:
> > Use vmemdup_user() to get a copy of the user buffer in
> > atomisp_v4l2_framebuffer_to_css_frame().
> 
> Was an information source (like the following) reused here?
> https://elixir.bootlin.com/linux/v6.16/source/scripts/coccinelle/api/memdup_user.cocci#L2
> 
> Regards,
> Markus

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot

