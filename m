Return-Path: <linux-media+bounces-39071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F6DB1DD4E
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 21:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B7F3163B75
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 19:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCCC273814;
	Thu,  7 Aug 2025 19:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vc+UWihr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AA421CC6A;
	Thu,  7 Aug 2025 19:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754593545; cv=none; b=EA2cLtNGo1oLIAfHPlyKpI9eF5dZ4yZ2dYw9PeIJ7+caLzVX30rFezF/9Dz5kOHsSWDHqiSmj/Sbzi+QEJ1jJBuTuVZmqwM3xb7Btvqg2DH01Aivy8srxwXXZIFLVExSCYO6MFwnCfjczEq1kPtYi8sZfjnr3OpWGaVsyvJZ45U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754593545; c=relaxed/simple;
	bh=spQm+jymAJIrxauFHn6s78s0XVcdc+wTlMWHYLFpyF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4xCNgbQ7I0em/JZm1eQ/cq6LiWHfuCVf8+5UCt1T+s6XeBrXSzZG3mt7/rl25SwcPjBDEDflRoBGEITrQDmVD0xqeOg3StuDo4eweqxXmD09OyV3TMA2wgIRnZh40hUQ+pSP+VmvOCDvyw3neeCZP2h1I88mvCw/qcTUpsOxqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vc+UWihr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B7308C75;
	Thu,  7 Aug 2025 21:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754593490;
	bh=spQm+jymAJIrxauFHn6s78s0XVcdc+wTlMWHYLFpyF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vc+UWihrd+yDV7Srt1sBKV/ODWHGIi9ayiUX2rIfLG6cSov24CkzJWo36Tb6LwfXh
	 Ec+5vWZiMY1rsZ4D3Y8OqOl4zJiW1PTZiSrXnw5obRFxeU7cXEVUNQ3eAcmg9A1qCv
	 b9PiYgyk1uE6BgDleHl9YIPCjh5PhGtr6hlprgf0=
Date: Thu, 7 Aug 2025 22:05:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Imene Jaziri <imenjazirii18@gmail.com>, linux-media@vger.kernel.org,
	hansg@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Log driver load in uvc_probe function
Message-ID: <20250807190525.GA28610@pendragon.ideasonboard.com>
References: <20250801145326.28560-1-imenjazirii18@gmail.com>
 <20250801150430.GC4906@pendragon.ideasonboard.com>
 <452a1263-2ec3-4174-9082-078445e67637@foss.st.com>
 <20250807081408.GB11583@pendragon.ideasonboard.com>
 <b2430686-3da9-4fb9-8f91-5bb7da1920b0@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2430686-3da9-4fb9-8f91-5bb7da1920b0@linuxfoundation.org>

On Thu, Aug 07, 2025 at 12:40:48PM -0600, Shuah Khan wrote:
> On 8/7/25 02:14, Laurent Pinchart wrote:
> > Hi Benjamin,
> > 
> > (CC'ing Shuah)
> > 
> > On Thu, Aug 07, 2025 at 09:53:41AM +0200, Benjamin Mugnier wrote:
> >> On 8/1/25 17:04, Laurent Pinchart wrote:
> >>> On Fri, Aug 01, 2025 at 03:53:26PM +0100, Imene Jaziri wrote:
> >>>> Add a pr_info() in the uvc_probe function to trace when the
> >>>> uvcvideo driver is loaded. This is for learning purposes.
> >>>
> >>> What part of the learning instructions you are following instructed you
> >>> to submit this patch to kernel mailing lists ? We are regularly spammed
> >>> by similar patches, which indicates the instructions are not clear
> >>> enough.
> >>>
> >>
> >> I got curious too. It comes from the Linux Foundation training LFD103
> >> [1]. Chapter 8 describes this patch pretty much, and chapter 9 describes
> >> how to send the patch, but with a warning not to do so :
> >>
> >>    [...]
> >>    At this time, you can run:
> >>
> >>    git format-patch -1 <commit ID> --to=maintainer1 --to=maintainer2
> >> --cc=maillist1 --cc=maillist2
> >>
> >>    This will generate a patch.
> >>
> >>    Important Note:
> >>    Please note that this is just an example. Don’t send this patch upstream.
> >>
> >>    You can revert this commit now.
> >>
> >>    Please refer to the Select the recipients for your patch section in
> >> the Submitting patches: the essential guide to getting your code into
> >> the kernel document.
> >>
> >>    When you have your own patch ready for submittal, you can follow this
> >> example process to generate the patch and send it upstream using the
> >> following command:
> >>
> >>    git send-email <patch_file>
> >>    [...]
> > 
> > Imene provided me with that information in private.
> > 
> >> Looking at it I guess it's pretty easy to miss the note.
> > 
> > Yes, reading the text, I really can't blame the people training the
> > course for missing it. It's a bit like if a mushroom foraging book said
> > 
> > - go pick those red mushrooms with white dots on the cap in the forest
> > - cut them in pieces, pan-fry them with butter
> > - add a couple of eggs, salt and pepper to make an omelette
> > - the dish is ready ! enjoy your meal !
> > - you won't be eating that, it's poisonous. throw it away
> > 
> > :-)
> > 
> >> Maybe
> >> requesting to add '--dry-run' to the git send-email command could be a
> >> simple fix to prevent from copy/pasting ?
> 
> No question that the material is confusing. The material is in
> a publicly available fee course.
> 
> > I've contacted Shuah, who told me she updated the training material.
> > Hopefully we'll soon stop getting such patches.
> 
> It is fixed now and the spam should stop. This course has been in
> use for 6 years, this is the first time we are seeing spam.

Just to be clear, I'm not blameing Imene here. I've received quite a few
similar patches over the last years.

> Sorry for the oversight that resulted in spam.

No worries, it happens.

-- 
Regards,

Laurent Pinchart

