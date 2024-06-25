Return-Path: <linux-media+bounces-14135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D53A2917316
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 23:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10DEE1C22BC3
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 21:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA4A1836E8;
	Tue, 25 Jun 2024 21:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hCzpkt/c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D8717E45B;
	Tue, 25 Jun 2024 21:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719349795; cv=none; b=fcF31OmySuB54ksd8lL8RE8UVEcrJqAfa2CXfQw1wsyYks8x2iSaL9w+kivtw7uPdnzB376DZbB6AlYVK//xQaHfFg8H8uhdrwaFhTs2buG4sN2GPk8z2pydoocMwGN5bhQ3hw5DbJ1Ix9jsU0o5GsX18lW4Hdv35mLVRPoqPNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719349795; c=relaxed/simple;
	bh=1PYksQ3E9z4msNPu5htpDLVmL9zgWuVlY34orOJ78PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUKDbnHDCkxfDlYhKtsde+WS9KgfiLmfuab9rdPv+YGcEgZlYUWRIBblJWIJHCFeX7Vx4mccBamVdgnynVzlcBaksaWO1UZrRs7JiCmUuCIgWT9sYRF4nJFJpJkn2ZcQN5asNlFm3kTd9AdtL++Rw3xxUSJL51PR0zV9MiUP5/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hCzpkt/c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EA4D512;
	Tue, 25 Jun 2024 23:09:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719349767;
	bh=1PYksQ3E9z4msNPu5htpDLVmL9zgWuVlY34orOJ78PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCzpkt/cYwQMpgcV6XmKyCmFhOSErR0m+ex+3HrH0zEyOGKTDhAojO/tdd809eygh
	 ieJ5tVMvBNYrSJg4qzshxaogOZzFtai8AeFbRLPzv9/SBSPQm90+3sqN//UnNXnbm+
	 ikKm234BCwFme1fYKGYs/zCsAqdyk5VKQAJrJ0vs=
Date: Wed, 26 Jun 2024 00:09:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 2/8] media: sun4i_csi: Implement link validate for
 sun4i_csi subdev
Message-ID: <20240625210928.GA29726@pendragon.ideasonboard.com>
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240619012356.22685-3-laurent.pinchart+renesas@ideasonboard.com>
 <Znb_X42wK_UoMUNR@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Znb_X42wK_UoMUNR@valkosipuli.retiisi.eu>

On Sat, Jun 22, 2024 at 04:44:15PM +0000, Sakari Ailus wrote:
> On Wed, Jun 19, 2024 at 04:23:50AM +0300, Laurent Pinchart wrote:
> > The sun4i_csi driver doesn't implement link validation for the subdev it
> > registers, leaving the link between the subdev and its source
> > unvalidated. Fix it, using the v4l2_subdev_link_validate() helper.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> This looks like a bugfix. Shouldn't this be backported?

I'll add

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")

-- 
Regards,

Laurent Pinchart

