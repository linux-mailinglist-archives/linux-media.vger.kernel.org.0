Return-Path: <linux-media+bounces-36230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AB4AED202
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 02:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 444DB7A2853
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 00:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB46282FA;
	Mon, 30 Jun 2025 00:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hLgsiMBE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C1110957
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 00:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751244467; cv=none; b=UsB0nbDL7rUcaLQSDjBNGE9kSFiNLQG5P3tGAVSTKU3wpTPGLHDJBX3T/0d8tgN9oKpxuLvmiKn5H/TgAjnJi9i1467FNFlCYHzlcBb8J3pTSTsaRXIyxR8MABsRWH7hDhokm2yguJNFDMjBwOe4m/u7+YYGTy9KVTZBIiEuVL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751244467; c=relaxed/simple;
	bh=viBuxpqGxuVyvBaB+mjvSBlXMzlmg3MJt4aGbRXKovU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbAMTdBBiWbVSLtGLmO60G7mdGZCRqnv9FFI4SmdR0Fr89PWdWXBmJpUMNohL/pyIjbDyuZSrRAD7aLfXQGhbOMQqXJ5qesVdg7Tq62v73CLdV4wzIHs0GzeRADQf0LSdgk3xyJcqvAb6grxcXKTCa1LIdKsKGlbtzeHGc9v0C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hLgsiMBE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7CE083D5;
	Mon, 30 Jun 2025 02:47:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751244442;
	bh=viBuxpqGxuVyvBaB+mjvSBlXMzlmg3MJt4aGbRXKovU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hLgsiMBEyi91Mwdr0jD2s/rBM7Nx9nn99VZQjA147bcWzxYlhvla76LP7s0FalnEs
	 8V2ZZVe7BF2ePLANSdfYJHThZUs+/HMPb2gyrgtiZlZ1H7MQjT6TAxZKKhB5AVB0r/
	 9GRDMm1YEglLYrP3rZ4+zz1GqsYfceFoalnRvJYE=
Date: Mon, 30 Jun 2025 03:47:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com
Subject: Re: [PATCH 06/13] media: v4l2-subdev: Mark both streams of a route
 enabled
Message-ID: <20250630004720.GB24861@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-7-sakari.ailus@linux.intel.com>
 <15ed5a72-8c0d-4e94-90e6-dc3ea6e39e89@ideasonboard.com>
 <aF41n2Y3Rf6HneiD@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aF41n2Y3Rf6HneiD@kekkonen.localdomain>

On Fri, Jun 27, 2025 at 06:09:35AM +0000, Sakari Ailus wrote:
> On Thu, Jun 26, 2025 at 06:17:13PM +0300, Tomi Valkeinen wrote:
> > On 19/06/2025 11:15, Sakari Ailus wrote:
> > > Streams are stored in sink-source pairs in sub-device state. When a stream
> > > was marked enabled (or disabled), only the state of one end of the stream
> > > was modified, leaving the stream in an incoherent state. Mark both ends of
> > > the stream enabled (or disabled).
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-subdev.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index 60b8febd3339..5afdd9d548b5 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -2254,9 +2254,11 @@ static void v4l2_subdev_set_streams_enabled(struct v4l2_subdev *sd,
> > >  	for (unsigned int i = 0; i < state->stream_configs.num_configs; ++i) {
> > >  		struct v4l2_subdev_stream_config *cfg =
> > >  			&state->stream_configs.configs[i];
> > > +		struct v4l2_subdev_stream_config *cfg2 =
> > > +			&state->stream_configs.configs[i ^ 1U];
> > 
> > I don't think this is correct. There's no specific rule that the stream
> > configs would be in a particular order. Or that there even are a pair.
> > 
> > You should look for the other end of the stream from the routing table.
> 
> Currently the code managing the streams stores them in this array in pairs,
> the sink followed by the source for each route. As noted in the commit
> message, this patch also fixes a bug.
> 
> I can change the patch to use routes to find the other end, but over time
> we might want to use a different data structure to store this information
> (a linked list perhaps). The number of routes and stream configurations is
> presumably fairly small in most cases so right now I presume there's no
> noteworthy effect on performance.

At the very least I would like to document somewhere that each route
stores a pair of stream config. We also really, *really*, *REALLY* need
to make sure that as little code as possible depends on this, and
especially that no driver accesses the stream configs directly...
aargghghhhh the ds90ub913 driver does already :'-(

I've submitted [1] to make the v4l2_subdev_stream_config structure
private.

[1] https://lore.kernel.org/r/20250630004602.23075-1-laurent.pinchart@ideasonboard.com

-- 
Regards,

Laurent Pinchart

