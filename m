Return-Path: <linux-media+bounces-49889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8899CF2CCE
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 10:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91409305B59E
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 09:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD8F32E14E;
	Mon,  5 Jan 2026 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BVTJpDyD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ABB330338
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 09:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767605623; cv=none; b=CKXN/mnLno9j7wYwk3vpAfcsD0tJAgXZZbGl4KM42G6n8WXYk+ELrch7Lpz2nun7jjETHruANlNzTVpm9qaQYpwsxidxA+KqwlKFHYVliieFDdl/PxRJeUq7av+Uklnj51giWRD8gSoQve4Pvq3P4SuupYoGciKzKamsmfnua/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767605623; c=relaxed/simple;
	bh=TOKQV8XZe5uBdhhfAFV9080Rw51LPDdgFfW3dtqkok4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCoLcRJjvaFuczQBqfolTbHbrZEKPx5ctH45RkrJDTKrqcTcKBkvHvsRhNIfO6BlFoTLN6U5DK2wEkDwuPsghGficy3o9CMhJVM2Kv9kf+K03Ptmh56AF/t8PxtPnAitAzqNqTUp3nHaK0BLK7SezW0TrUfvI6BRr3smBknwsR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BVTJpDyD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9E17B10D;
	Mon,  5 Jan 2026 10:33:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767605593;
	bh=TOKQV8XZe5uBdhhfAFV9080Rw51LPDdgFfW3dtqkok4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BVTJpDyDB/BM7vbFXSX/vHG8J6Obyjk3pcN2ccLiwkkqXXIT5giPMm5/xoDoqQ0m3
	 hRWoFngMw24jaGWGH94emx9F4Up5tfNASe6BmK7Ennp3a5Ygwx3h0oVnKTXC95OM+l
	 GkfvEeYE52K2WIduuNAcGy5/uHo+qwGOCDHrsgPI=
Date: Mon, 5 Jan 2026 11:33:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [ANN] Media Summit 2026: co-locate again with Embedded Recipes?
Message-ID: <20260105093315.GA9526@pendragon.ideasonboard.com>
References: <0fa3fccd-c619-4a98-b50c-41fd513a847c@kernel.org>
 <c2a1e48f-2ba3-4754-85ed-ccf6399d0791@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c2a1e48f-2ba3-4754-85ed-ccf6399d0791@oss.qualcomm.com>

On Sat, Nov 15, 2025 at 01:02:10PM +0100, Hans de Goede wrote:
> On 15-Oct-25 11:08 AM, Hans Verkuil wrote:
> > Hi all,
> > 
> > The Embedded Recipes conference 2026 will be May 27 and 28, again in Nice, same venue
> > as this year (flamingos!).
> > 
> > We co-located with ER this year, and I thought that was quite successful. I also liked
> > the meeting room we had, so I plan to be early for once and see if we can get the same
> > meeting room for (hopefully) Tuesday May 26 2026.
> > 
> > But that assumes that there are no objections. The alternative would be to co-locate with
> > the Embedded Linux Conference Europe in Prague on October 7-9 2026.
> > 
> > Let me know if co-locating with the ER 2026 conference is a problem, or if you really
> > prefer the ELCE, or have an alternative.
> > 
> > If I don't hear any objections by the end of the month, then I'll see if I can get the
> > meeting room organized.
> 
> I'm a bit late with replying, but it looks like this thread can use
> a bump anyways.
> 
> I think that co-locating this with ER in Nice again and doing it the day before ER
> would be a great idea, so +1 from me on that.

Likewise, Tuesday the 26th of May seems good to me.

-- 
Regards,

Laurent Pinchart

