Return-Path: <linux-media+bounces-32226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32943AB24F7
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 20:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BA5B1B65C1A
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 18:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CAA27703C;
	Sat, 10 May 2025 18:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LziO/b5W"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40E627701E
	for <linux-media@vger.kernel.org>; Sat, 10 May 2025 18:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746901873; cv=none; b=IUWV1fh3mfnft2T/JRrfXieo7REQxJuqNp5Zs9LH3upFkz/Ip0sZlfugaCjzzpajCXCG/Asoc55Jr/bBGvmT/yp8W5xY1uc/ZughLNa8EnlWR6I7cF1JK6u9diZJ0Y8HEXK7u+99atDAiORxKfGLakD/ru7omfnQmLlMJtcDx1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746901873; c=relaxed/simple;
	bh=pH0mwtHJFsL0wETJ5Jk4BklGcQr1+vTIvBFXnKHWl0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6boDtgotTcNybURzcjRCpLI8xjvQTtbKvsePfELoW46lsSmn41WouJ1tidtqfSXT6m3Cu1SZ1LZn5u6qupE/6FHVQeYOnTORmWLcR+n/g4sy1tpkGiy4wP7/HURYV6+Gc3ThZC5xSYYit2UF2UWYnJ+fKy63arwlpEHu4CrlkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LziO/b5W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (static-176-133-119-130.ftth.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 809898BE;
	Sat, 10 May 2025 20:30:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746901849;
	bh=pH0mwtHJFsL0wETJ5Jk4BklGcQr1+vTIvBFXnKHWl0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LziO/b5W62fShk9M9kn/lFkAnrwISmcUZz7OdbBerT1944PCAjU6dpmpV1c8oFrD/
	 nJvZxka13NU21mNrDKCGF3Uiui0V37H8iuuLPp+fzem9b0u0ZYPvAKe0Ii8tpGuvyw
	 sIzD+EWUxE/P+zVKICWSQZl34E1kZ+vchPDYvyVs=
Date: Sat, 10 May 2025 20:30:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 07/13] media: mt9m114: Update hblank and vblank defaults
 on pixel-array format changes
Message-ID: <20250510183055.GK19001@pendragon.ideasonboard.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
 <20250504101336.18748-8-hdegoede@redhat.com>
 <20250509223808.GH19001@pendragon.ideasonboard.com>
 <aB9LEZjRdPBpjnKH@kekkonen.localdomain>
 <c35ceb0f-167a-47d9-88ff-41837f75762b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c35ceb0f-167a-47d9-88ff-41837f75762b@redhat.com>

On Sat, May 10, 2025 at 04:04:04PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 10-May-25 2:48 PM, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Sat, May 10, 2025 at 12:38:08AM +0200, Laurent Pinchart wrote:
> >> Hi Hans,
> >>
> >> Thank you for the patch.
> >>
> >> On Sun, May 04, 2025 at 12:13:28PM +0200, Hans de Goede wrote:
> >>> Update hblank and vblank defaults when the pixel-array format changes,
> >>> to maintain 30 fps on format changes.
> >>
> >> I don't think this should be the kernel's responsibility to do so.
> >> Sakari, any opinion ?
> > 
> > Generally drivers don't do this indeed. It's the user space's resposibility
> > to configure the frame rate. Drivers only guarantee hardware limits are
> > respected.
> 
> Ok, I'll drop this patch for v2.
> 
> Laurent, thank you for all the reviews so far. I agree with
> all your remarks and I'll address them for v2.
> 
> I notice that you did not review 10/13 - 12/13 yet, I guess
> you ran out of time ?

Yes I ran out of time, and next week will likely be busy. Feel free to
send a v2 addressing the review comments so far, and I can review patchs
10/13to 12/13 from there.

> Also I guess 10/13 is possibly a bit
> controversial patch, all I can say about that is that this one
> is necessary to make things work in raw-bayer mode with the atomisp.
> 
> Regards,
> 
> Hans

-- 
Regards,

Laurent Pinchart

