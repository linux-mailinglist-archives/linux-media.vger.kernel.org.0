Return-Path: <linux-media+bounces-23463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 621FE9F2EEC
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 12:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C6691648E7
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 11:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D978204578;
	Mon, 16 Dec 2024 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JYmCrVfa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6440A2040A7
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734347626; cv=none; b=E6rpSAYnHWtaDVl0H4AITIOJyVMQo6vYfHvZBuWyzPoL7KEn+csbX8fDIDrMELx0zZJ+Xx6NFfG4s8gRkQTLachVWt9ofbeExkM15KbucZ57R7xod0FfOfAvuqZ2FqKx+haog9yu7nbuSdEw5ZEmQ/E5hkkM2DOsnSTIY6On1js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734347626; c=relaxed/simple;
	bh=kiOJYC6uMEAWKTFFdc5EWUiz6hVrNJQJovFkQZs5RxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lppate/kgl/LZ8SVWrmlsqUANNa1aC4R6gMmeAfWGEwc6iqxOwfqpkFtGb/Urbrh9QP0bbKY+7m0YAS36JwCujtodq0Yn/sMgkyMerNjmHOb3ewHwDMcZ2AdFEdI0jyuE6pZ6XrG/Yp9uFBcTAN/zmm5BmO7g8O/f2uQs3ZK8yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JYmCrVfa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBD3E13C;
	Mon, 16 Dec 2024 12:13:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734347586;
	bh=kiOJYC6uMEAWKTFFdc5EWUiz6hVrNJQJovFkQZs5RxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYmCrVfakma2oJVkCVjA1/aRXxh18qi5HNvHRdQOg2Xbz8rY16YmMKkKVEv3qoSRv
	 FDoz8DNG8zzM1rDtwfXX0HIPCAyXvxU5DktlhM5Tq0+rD6JrVn/v+ukyQZqxtuXAcn
	 tFoySzbaGBjClFzf4bkuibAQEo5/+OxZWTH0BRtk=
Date: Mon, 16 Dec 2024 13:13:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 5/5] media: intel/ipu6: Obtain link frequency from a
 sub-device
Message-ID: <20241216111326.GK32204@pendragon.ideasonboard.com>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-6-sakari.ailus@linux.intel.com>
 <20241215170832.GI9975@pendragon.ideasonboard.com>
 <Z1_evC9EsHnXuj_r@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z1_evC9EsHnXuj_r@kekkonen.localdomain>

On Mon, Dec 16, 2024 at 08:03:08AM +0000, Sakari Ailus wrote:
> On Sun, Dec 15, 2024 at 07:08:32PM +0200, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > I think this should come before 4/5.
> 
> Because of...? Both are needed for this to work.

Because, unless I'm mistaken, it would otherwise introduce a bisection
breakage. 4/5 drops the LINK_FREQ control from the IVSC driver, and
obtaining the link frequency through .get_mbus_config() is only
supported when using the v4l2_get_link_freq() variant that takes a pad
argument.

> > On Tue, Dec 10, 2024 at 09:59:06AM +0200, Sakari Ailus wrote:
> > > Obtain the link frequency from the sub-device instead of a control
> > > handler. This allows obtaining it using the get_mbus_config() sub-device
> > > pad op that which is only supported by the IVSC driver.
> > 
> > "which is the only method supported by the IVSC driver"
> 
> Yes.

-- 
Regards,

Laurent Pinchart

