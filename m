Return-Path: <linux-media+bounces-30218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55090A894D8
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 09:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76D5B7A2B9B
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 07:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE42279911;
	Tue, 15 Apr 2025 07:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RPVTLxnE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A3620DF4
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 07:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701807; cv=none; b=FfQn0oHzVBsbj2NJ3lLWEDaHm9zM1yB+FcnsF7UqZGSV1QBxubOpJNmiiw/Qtf9tzuqSFEOp/Gdj7+Vb86t/CV4oCsNuNM23kfP4esSfZRf5iDceCrrvRXalP0dE+PQXVRc+CcaCElUJI7373PxFasKmlezn+vh/koDYhgoD3ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701807; c=relaxed/simple;
	bh=qmtM83UVCY1xtHfgPA4ZLDCClxZzlvJMTN4xRBtOqGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQ1Ns9bMCxJ5V3NmSdmmX3pOXBcJv+A2bLCaS7cm0R3BTX4jWyHrZcv3qEH+WO5B269QjP0adPENF0Ipn2rxMmV2BCiR5sgHtqalTNQa+bBC8m6DDoHKTHULD+P3px+j6ALEFClfXLjihqsQ6AoXzSzK1MSb6Fq7pf7B4eZh02M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RPVTLxnE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 844F4725;
	Tue, 15 Apr 2025 09:21:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744701681;
	bh=qmtM83UVCY1xtHfgPA4ZLDCClxZzlvJMTN4xRBtOqGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPVTLxnEUihgVZbNt/waWpooKtHSImkg5POiW0BKngLthDEHi0PJye2dlV6QMy96/
	 KqQaV1XKajSrYK+uuf4W8qgPTT4fq0zlFHB0hRUTluaNs1wy6w7DyxCfqeuZpLovvW
	 IM2zvt5mGvXA67uNRulcSvik4S3cfs4pltV1EYeY=
Date: Tue, 15 Apr 2025 10:23:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Hu, Jerry W" <jerry.w.hu@intel.com>
Cc: "libcamera-devel@lists.libcamera.org" <libcamera-devel@lists.libcamera.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <20250415072322.GJ15367@pendragon.ideasonboard.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
 <SA2PR11MB5131A5274209B90423488089D3A72@SA2PR11MB5131.namprd11.prod.outlook.com>
 <20250325123738.GA1320@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325123738.GA1320@pendragon.ideasonboard.com>

Hi Jerry,

On Tue, Mar 25, 2025 at 02:37:38PM +0200, Laurent Pinchart wrote:
> On Tue, Mar 25, 2025 at 12:20:16PM +0000, Hu, Jerry W wrote:
> > Hi Laurent & Hans,
> > 
> > I will join the summit remotely. Will video conference set up for this
> > conference? 
> 
> That's a very good question, which I haven't thought about. I will
> inquire with the venue about remote access options, and will let you
> know.

I have received logistics feedback from the venue. Rooms will not be
equipped with remote access infrastructure. We will bring conference
speakers and a laptop with a webcam. The internet connection bandwidth
should be sufficient, we will try our best to make remote attendance
possible (likely through Jitsi), but we can't guarantee there will be no
hiccups.

> > Would you please reserve a Topic Session for me? I will update the
> > topic later on.  
> > 
> > Thanks,
> > -Jerry
> > 
> > -----Original Message-----
> > From: libcamera-devel <libcamera-devel-bounces@lists.libcamera.org> On Behalf Of Laurent Pinchart
> > Sent: Tuesday, March 25, 2025 6:28 PM
> > To: libcamera-devel@lists.libcamera.org
> > Cc: linux-media@vger.kernel.org; Kieran Bingham <kieran.bingham@ideasonboard.com>
> > Subject: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
> > 
> > Hello everybody,
> > 
> > Another year, another libcamera workshop. After the previous editions
> > in Paris, Brussels and Vienna, we will organize the next workshop in
> > Nice on Friday the 16th of May. The event will be hosted by Embedded
> > Recipes ([1]) as part of their workshops day ([2]).
> > 
> > This year, our workshop will be colocated with the Pipewire workshop
> > on the same day and at the same venue (but a different room), to
> > facilitate discussions about topics that span libcamera and Pipewire.
> > The Linux Media Summit will also be organized in a nearby location on
> > Tuesday the 13th ([3]).
> > 
> > If you would like to attend, please register your interest by replying
> > to this e-mail, and indicate if you have any discussion topics you
> > would like to include in the schedule. We will draft and circulate an
> > agenda in the next few weeks after receiving topic proposals. If
> > registrations exceed our capacity, priority will be given based on
> > topic submissions.
> > 
> > The event will be free of charge for attendees.
> > 
> > [1] https://embedded-recipes.org/2025/
> > [2] https://embedded-recipes.org/2025/workshops/
> > [3] https://lore.kernel.org/r/044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl

-- 
Regards,

Laurent Pinchart

