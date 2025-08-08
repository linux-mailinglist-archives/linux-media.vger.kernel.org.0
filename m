Return-Path: <linux-media+bounces-39121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 599E8B1E85D
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 14:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79406584FB3
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 12:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAB627A47E;
	Fri,  8 Aug 2025 12:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lTzC9hDp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFDA27A455
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 12:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754656093; cv=none; b=Fd9Wl0h43GmetTPDOjODOYUUbN2wDMOqqLg14i3z+NdHa+J+hxioISF9DKre81HzlA+YCGZTVi0sM0j1yfhxDQtD+kMD4L66VM+vh4zco/My4l6Ykb3Rxje4hVGYOJUsUpbPov0UGoeVrr8iAh1qCxL+Vq2rc/ro46JF66MOSdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754656093; c=relaxed/simple;
	bh=UlmptQ1Xf2x9W2byEl+LcIcI+LNH6hxYeYwGq69Jlck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UOj6W+ivCfgqdWF1dHFWkI59O5SlD/elhmsKjt7AqAy3XZLRp7V1bQOdX22yJkPZ2gUh86sbPxV2MPw+jQPr+jXNrY05wmQRWyq9BVmt7NZr3LFw088zU9QpWyUYfB4QI8d1iuCm3uAetz1k6vSY76J72PGHtErr4exumS1f8fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lTzC9hDp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0A3FA185B;
	Fri,  8 Aug 2025 14:19:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754655577;
	bh=UlmptQ1Xf2x9W2byEl+LcIcI+LNH6hxYeYwGq69Jlck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTzC9hDp2X12e8tvv5tXon9tGjlHLYSZBug9Y6zOyOko3tzJXpmDstg+og4o+u8Cw
	 K/4WJw/vJenLG59qoZGiPMwejB/bt64Wt7jEJLcKtALo8WRry4/PGBu0VlFgIUP+OT
	 kPV0up6NbfwpyJR0rrhjG3I+l5MeIgpcoZV0m/hQ=
Date: Fri, 8 Aug 2025 15:20:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 1/1] media: MAINTAINERS: Orphan the rcar_jpu driver
Message-ID: <20250808122011.GB7299@pendragon.ideasonboard.com>
References: <20250808083021.2113627-1-sakari.ailus@linux.intel.com>
 <20250808084738.GA7299@pendragon.ideasonboard.com>
 <aJXGrpbFbyxRN38u@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aJXGrpbFbyxRN38u@kekkonen.localdomain>

On Fri, Aug 08, 2025 at 09:43:10AM +0000, Sakari Ailus wrote:
> On Fri, Aug 08, 2025 at 11:47:38AM +0300, Laurent Pinchart wrote:
> > On Fri, Aug 08, 2025 at 11:30:21AM +0300, Sakari Ailus wrote:
> > > Mikhail's e-mail is bouncing:
> > > 
> > > ===========8<-----------
> > > The following message to <mikhail.ulyanov@cogentembedded.com> was undeliverable.
> > > The reason for the problem:
> > > 5.1.0 - Unknown address error 550-"5.1.1 The email account that you tried to
> > > reach does not exist. Please try\n5.1.1 double-checking the recipient's email
> > > address for typos or\n5.1.1 unnecessary spaces. For more information, go
> > > to\n5.1.1  https://support.google.com/mail/?p=NoSuchUser
> > > d75a77b69052e-4b07f8ba752si46048731cf.823 - gsmtp"
> > > ===========8<-----------
> > > 
> > > Assign the driver to Laurent with "Odd Fixes" status.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > I'm fine maintaining the driver (for odd fixes at least, as I don't
> > think I could even test the code), but Cogent Embedded should be
> > contacted to see if there's an issue with Mikhail's e-mail address, if
> > he moved somewhere else and would like to keep being the driver's
> > maintainer, or if someone else from Cogent would step up.
> 
> I don't have contacts there. The last indication of Mikhail is from 2018 in
> form of an ack so I don't think his maintenance has been very active lately
> in any case, effetively the driver is abandoned independently of the status
> of the e-mail account.

There are more recent contributions from Cogent Embedded to the kernel,
how about CC'ing those developers ?

-- 
Regards,

Laurent Pinchart

