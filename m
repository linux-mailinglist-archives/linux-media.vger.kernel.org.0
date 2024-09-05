Return-Path: <linux-media+bounces-17674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D3396D6EE
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 13:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40461282062
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 11:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFE41991AC;
	Thu,  5 Sep 2024 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HG+sjMcH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1F919885E
	for <linux-media@vger.kernel.org>; Thu,  5 Sep 2024 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725535094; cv=none; b=kAmcS+K/vXHCbHSGgyENuf2xZtBACBnoaQUUXTM4aLCyPWjlcXiItRUTQj9zigUjlYVZUIocSX7q6DeQvXJP4qnx76g9ToDYLtHHSnFWobsCDrLff/a/TRr87Ht88usHBSCwDmKWDrVfGV7z4zCXJ+MN9VVLGTOBS1ETBz8CLWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725535094; c=relaxed/simple;
	bh=CkNP16Qtdan0csSu5fnTnyzhQfmSk5DbvyxCC/Pf7FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hpdoo2Y8+aO0+Cq/DAuzO2OIeIIs0Jf7pk6V8HycQUs1n9cIn8j0fbyzzzrANjnAceDYCHvb9YTItO6hH5hwM20JYkMvtaISusABD4m8wKia3wLP91Yu77TLVA2le29JcywqaaVrMT2/5Atkh116jih5DUvogQ3ICTgS4mYalsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HG+sjMcH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E10E63E6;
	Thu,  5 Sep 2024 13:16:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725535018;
	bh=CkNP16Qtdan0csSu5fnTnyzhQfmSk5DbvyxCC/Pf7FA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HG+sjMcH3ZKScBPvjiQVDbzTCDArkcu5PU4nj726EhiA2UgpsakmLQyVe0Mzqt4T4
	 sqkaaq39WKySMvKGGcms2idGfLpkOtUaye/jfOfGx5VvmxQmLayiG/0eAm7NhSfjXw
	 c7KB5Z3Dk8sdj4gtp7FXuanNP0mdT+ERfX22fud0=
Date: Thu, 5 Sep 2024 14:18:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Hu, Jerry W" <jerry.w.hu@intel.com>
Cc: "libcamera-devel@lists.libcamera.org" <libcamera-devel@lists.libcamera.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: Interest for a libcamera workshop in Vienna - September 17th
Message-ID: <20240905111808.GL16183@pendragon.ideasonboard.com>
References: <20240729090042.GA2725@pendragon.ideasonboard.com>
 <SA2PR11MB5131B121A4F3745C6EAD4206D39D2@SA2PR11MB5131.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SA2PR11MB5131B121A4F3745C6EAD4206D39D2@SA2PR11MB5131.namprd11.prod.outlook.com>

Hi Jerry,

On Thu, Sep 05, 2024 at 09:04:40AM +0000, Hu, Jerry W wrote:
> Hi Laurent
> 
> Will it be an interesting to add following topic for discussion?
> 
> "Post Processing with PipeHandler" The post processing is done by SW
> (on GPU/NPU), the flow under pipehandler shall be considered as not
> ISP vendor specific, for example "Face Detection", it is ISP
> independent, but depends on the flow of PipeHandler. 

Very good topic, I've added it to the agenda.

I will publish a draft of the agenda in the middle of next week. We have
space for more discussion topics.

> -----Original Message-----
> From: libcamera-devel <libcamera-devel-bounces@lists.libcamera.org> On Behalf Of Laurent Pinchart
> Sent: Monday, July 29, 2024 5:01 PM
> To: libcamera-devel@lists.libcamera.org
> Cc: linux-media@vger.kernel.org; Kieran Bingham <kieran.bingham@ideasonboard.com>
> Subject: Interest for a libcamera workshop in Vienna - September 17th
> 
> Hello everybody,
> 
> Following the success of our workshop in Brussels in February, we
> would like to host another event in September.
> 
> We have evaluated different options, and opted for week 38 in Vienna.
> The city will host during that week the Linux Media Summit (Monday the
> 16th, [1]), OSS Europe (Monday the 16th to Wednesday the 18th, [2])
> and the Linux Plumbers Conference (Wednesday the 18th to Friday the
> 20th, [3]), and we expect that co-locating with those events will ease
> travel for attendees of the libcamera workshop.
> 
> The week is already busy with camera-related events on Monday with the
> Linux Media Summit, and on Thursday afternoon with the Complex Camera
> micro-conference at LPC ([4]). We have therefore selected Tuesday the
> 17th for libcamera.
> 
> To help us plan the venue, could you please register your interest by
> replying to this e-mail, either publicly, or in private to Kieran and
> me ? The event will be free of charge for attendees.
> 
> Please also let us know if you have any preferred discussion topics
> you would like to include. We will draft and circulate an agenda in
> the next few weeks.
> 
> [1] https://lore.kernel.org/all/ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl/
> [2] https://events.linuxfoundation.org/open-source-summit-europe/
> [3] https://lpc.events/
> [4] https://lpc.events/event/18/sessions/193/

-- 
Regards,

Laurent Pinchart

