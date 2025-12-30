Return-Path: <linux-media+bounces-49731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DEECE9CB2
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FB9930206B0
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E602376FD;
	Tue, 30 Dec 2025 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XOoH+vs5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1FE1A5B84;
	Tue, 30 Dec 2025 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767101663; cv=none; b=TW7h84MLlW94J4kNxtjMWz2B3ZOcoIMWO6FXzUzgZXBH8VFGFZ/u2nq04gNHSrsjfMai5Lcss47Eu8EVTxEhQQf0OIBKfraLAn7mBG0EdsviA1Rq5QdwLGQwc4JxW72gWiPhqichYZojKZ5midrLzr0mfMADRvEUBgtiNlQ3iec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767101663; c=relaxed/simple;
	bh=lMq+1h7QC1VVEVe0XAMeUptGZhwTBmsEtr6h+tH9y3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSz8qU/71369uZLGb4CIzqehVn+mAAGhQkHZXj135oo72WNTSOdJejqq93Oj/R1rW/3qzXuUOv6o7RnOK5R1KAaE6TYMHtTMZv8ykgGoCoNZMP1VTrAc+u5MpdLEsENnZBLfzm9DTgjqmN7wV/3ol6x5u4RvKkymujMOMW+aOGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XOoH+vs5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 02C4855C;
	Tue, 30 Dec 2025 14:33:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767101637;
	bh=lMq+1h7QC1VVEVe0XAMeUptGZhwTBmsEtr6h+tH9y3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XOoH+vs52zNezGp8KdFJ7wCNHmgQCZ6w0867mIupmqYVhBGcL1B2t18WajnSVKGZn
	 Ozk6vFtLg5ieSKRW3hjjbRUheRGDzosVQ8OO/ub5Yni9xLpSajmfAc+fI3w1mrAnXN
	 2aH0D7wLP32XiL155pPgZtK7UdzbQkjodkBPVsZw=
Date: Tue, 30 Dec 2025 15:33:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, krzk+dt@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	dave.stevenson@raspberrypi.com, robh@kernel.org,
	conor+dt@kernel.org, mchehab@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/4] media: i2c: ov9282: Fix reset-gpio logical state
Message-ID: <20251230133354.GA24182@pendragon.ideasonboard.com>
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
 <20251114133822.434171-2-loic.poulain@oss.qualcomm.com>
 <aRtbwK0Afo50Lh0B@kekkonen.localdomain>
 <CAFEp6-1Tdmr5v0r+q0qeOG6qqA-hiBaF1iTEcmhBA0oTjLgbgg@mail.gmail.com>
 <aT_Xc6LR161QBRFp@kekkonen.localdomain>
 <CAFEp6-2PP0ufge0RXTrE2Nrn_sLCN5erokxpJsuGeHq7ZEZ83g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-2PP0ufge0RXTrE2Nrn_sLCN5erokxpJsuGeHq7ZEZ83g@mail.gmail.com>

On Mon, Dec 15, 2025 at 11:19:51AM +0100, Loic Poulain wrote:
> On Mon, Dec 15, 2025 at 10:40 AM Sakari Ailus wrote:
> > On Mon, Dec 15, 2025 at 10:35:15AM +0100, Loic Poulain wrote:
> > > On Mon, Nov 17, 2025 at 6:30 PM Sakari Ailus wrote:
> > > > On Fri, Nov 14, 2025 at 02:38:19PM +0100, Loic Poulain wrote:
> > > > > Ensure reset state is low in the power-on state and high in the
> > > > > power-off state (assert reset). Note that the polarity is abstracted
> > > > > by the GPIO subsystem, so the logic level reflects the intended reset
> > > > > behavior.
> > > >
> > > > That's an interesting approach to fix DTS gone systematically wrong.
> > > >
> > > > I was thinking of the drivers that have this issue, too, but I would have
> > > > introduced a new GPIO under a different name (many sensors use "enable",
> > > > too). Any thoughts?
> > >
> > > Apologies for missing your point earlier. We can’t really name it
> > > enable, as it performs the opposite function and that would be
> > > confusing in the device tree description. A property like reset2 would
> > > be more accurate, but I suspect such a binding wouldn’t be acceptable
> > > from a device tree/bindings perspective.
> >
> > Many sensor datasheets document a pin called "xshutdown" or alike. That's
> > not exactly "reset" or "enable" but it can be mapped to either and this can
> > be seen in the existing bindings. The polarity is effectively the opposite,
> > yes, but does that matter?
> 
> I assume naming a pin 'xshutdown' or 'xreset' indicates that its
> polarity is inverted at the driver level, the driver interprets the
> shutdown or reset function as being active when the logical level is 0
> (low), as they actually incorrectly do for the 'reset' gpio.
> 
> From the driver’s perspective, this naming convention is acceptable;
> however, it causes the devicetree description to slightly diverge from
> the datasheet and leaves the reset property effectively inverted (and
> therefore incorrect).
> 
> Honestly, in this specific case, the simplest solution would be to fix
> the driver, since there is currently no upstream devicetree using this
> sensor. That would technically break backward compatibility for any
> out-of-tree DTS (if they exist), but those would have been incorrect
> in the first place.

I would either fix the driver, or update the DT bindings to indicate the
polarity should be inverted due to a historical mistake.

I don't think this patch is right. The polarity in DT is meant to
describe board-level inversion of the GPIO, so you can't consider that
ACTIVE_HIGH is a DT bug and print a warning.

> But yes, this seems like a good opportunity to discuss and define a
> more general approach that can be applied to other drivers with
> similar polarity or naming issues.
> 
> Krzysztof, any thoughts?

-- 
Regards,

Laurent Pinchart

