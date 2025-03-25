Return-Path: <linux-media+bounces-28713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 073A8A701A0
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 14:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0200F1887310
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 13:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8F326B2DB;
	Tue, 25 Mar 2025 12:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tKolmvsf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCE525D540
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742906284; cv=none; b=rhwSVpVifrBlzN7T1qtYt+1Z7YcXSHF48WmtgdQ0D2tW7Ic+CjxtgRxenIyFX7xBMUaMfQ5J7pLJh5WgAcUnDws6vlKpNZSXujDzH0cn+nadbPeosTmzcT1E9nG06BOLQ72dh8GmkqTs81JLl3yLL2E0EBClWcdGwjGYAp7Z3lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742906284; c=relaxed/simple;
	bh=YR7GTafJMCJb/k5yC/vTfF16ftxl0lD5RKsxjMp3WLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUCSt6t37p6KGZS480WWTGzVlEjln/HZV90sh/t03nufdfqLCpK8L2fKPI3prUh8ceaN3/UK2gw4Eh7sd4axLe4v1ORdRQGlG3Iu9PdUfjlarHdlTwH8CAMvS8/Gg8NHXINY+qmFecDyU2vKJrBxi3x4Izne/ZoO6xEXjZCBnN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tKolmvsf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FF60594;
	Tue, 25 Mar 2025 13:36:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742906173;
	bh=YR7GTafJMCJb/k5yC/vTfF16ftxl0lD5RKsxjMp3WLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tKolmvsfm4ZVZb0BAv3Tw9ljE1lw29OJFi6rzcqa11N1MzlzH1Zu/yfDCmS6l6jgT
	 OpqikDcmsc31cikZmWgbdioUEl/byJdPEoJahkD/afBDRJXGsDaMJS1uynhFG3srZt
	 HZFSN3WtfA2wc7S74fNCscwc3T3Zct3KQBJhtzoc=
Date: Tue, 25 Mar 2025 14:37:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Hu, Jerry W" <jerry.w.hu@intel.com>
Cc: "libcamera-devel@lists.libcamera.org" <libcamera-devel@lists.libcamera.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <20250325123738.GA1320@pendragon.ideasonboard.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
 <SA2PR11MB5131A5274209B90423488089D3A72@SA2PR11MB5131.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SA2PR11MB5131A5274209B90423488089D3A72@SA2PR11MB5131.namprd11.prod.outlook.com>

Hi Jerry,

On Tue, Mar 25, 2025 at 12:20:16PM +0000, Hu, Jerry W wrote:
> Hi Laurent & Hans,
> 
> I will join the summit remotely. Will video conference set up for this
> conference? 

That's a very good question, which I haven't thought about. I will
inquire with the venue about remote access options, and will let you
know.

> Would you please reserve a Topic Session for me? I will update the
> topic later on.  
> 
> Thanks,
> -Jerry
> 
> -----Original Message-----
> From: libcamera-devel <libcamera-devel-bounces@lists.libcamera.org> On Behalf Of Laurent Pinchart
> Sent: Tuesday, March 25, 2025 6:28 PM
> To: libcamera-devel@lists.libcamera.org
> Cc: linux-media@vger.kernel.org; Kieran Bingham <kieran.bingham@ideasonboard.com>
> Subject: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
> 
> Hello everybody,
> 
> Another year, another libcamera workshop. After the previous editions
> in Paris, Brussels and Vienna, we will organize the next workshop in
> Nice on Friday the 16th of May. The event will be hosted by Embedded
> Recipes ([1]) as part of their workshops day ([2]).
> 
> This year, our workshop will be colocated with the Pipewire workshop
> on the same day and at the same venue (but a different room), to
> facilitate discussions about topics that span libcamera and Pipewire.
> The Linux Media Summit will also be organized in a nearby location on
> Tuesday the 13th ([3]).
> 
> If you would like to attend, please register your interest by replying
> to this e-mail, and indicate if you have any discussion topics you
> would like to include in the schedule. We will draft and circulate an
> agenda in the next few weeks after receiving topic proposals. If
> registrations exceed our capacity, priority will be given based on
> topic submissions.
> 
> The event will be free of charge for attendees.
> 
> [1] https://embedded-recipes.org/2025/
> [2] https://embedded-recipes.org/2025/workshops/
> [3] https://lore.kernel.org/r/044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl

-- 
Regards,

Laurent Pinchart

