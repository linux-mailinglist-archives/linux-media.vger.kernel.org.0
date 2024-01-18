Return-Path: <linux-media+bounces-3847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CD38316C9
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 11:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9618E287A4C
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 10:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE1122F16;
	Thu, 18 Jan 2024 10:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PAwopk2D"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B892B65C
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 10:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705574937; cv=none; b=tCLVWrJ4U2453lpRQ41EOgOCd5hI3pR3vK1P9NbSG98DbufE1S/03Or/XvlkAspMRj9jmhrLuvduGYuiwJNFmmpj3VQsfYfD+y91I0lqyhV+3+EH6/j9rPdFi5mC6XF0s/V/hcIK7Q0b89HIbJwUd7sfj/6/LkvDzg08zLEa7TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705574937; c=relaxed/simple;
	bh=1f2mTi/fowM6ZTZGkhH8/65KDgyczcAY4VxrGCDNNho=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=kcJ/wK3FKkjnU6X+yzlYTOgyWM/R5fCZsWiK5rh6GBpJ0tZHMQVB5cE21BZZbR2ASEb3BeaxNawOpJEVmmZ6AVGvbUiBmuFh50VCLCyhQvr3gmWVZ2W0V+CyTFxNXYx5ZaicZMLZgmaz5Acv3P/b99V3Nbdg7ihJMo0i7IExYHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PAwopk2D; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EA89674;
	Thu, 18 Jan 2024 11:47:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705574863;
	bh=1f2mTi/fowM6ZTZGkhH8/65KDgyczcAY4VxrGCDNNho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PAwopk2DoWKZ1SfUm6KGa/Cz0OxDXpJeOewA9PsXgxVDsvGffBVWgX67O0l/cRP+d
	 nAfiS9HEuCOHfYA8xaE1DiDsKJryhjGo3InCGpCPiJOPetaWTm3jTRX/hzmXYxd5Ld
	 4CFIu04B+wB7/+v6+rY/kBNFe8B8ALiNp0I8/JvA=
Date: Thu, 18 Jan 2024 12:48:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 1/2] v4l2-ctl: Add --try-routing option
Message-ID: <20240118104857.GK4860@pendragon.ideasonboard.com>
References: <20240117130805.939312-1-dan.scally@ideasonboard.com>
 <20240117132150.GF4860@pendragon.ideasonboard.com>
 <b02a0566-d736-4479-ba81-3e6fa823e2cb@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b02a0566-d736-4479-ba81-3e6fa823e2cb@ideasonboard.com>

Hi Dan,

On Thu, Jan 18, 2024 at 10:27:45AM +0000, Dan Scally wrote:
> On 17/01/2024 13:21, Laurent Pinchart wrote:
> > On Wed, Jan 17, 2024 at 01:08:04PM +0000, Daniel Scally wrote:
> >> v4l2-ctl's --list-subdev-mbus-codes option sets the which flag to
> >> V4L2_SUBDEV_FORMAT_TRY, which is an entirely reasonable choice, but
> >> means it's currently impossible to list mbus codes for pads that are
> >> only part of inactive routes as the --set-routing option sets ACTIVE
> >> routing rather than TRY.
> >>
> >> Add a --try-routing option that has identical functionality to the
> >> existing --set-routing but which uses the TRY format instead.
> > I don't think this will help fixing your problem. They TRY context is
> > local to the file handle, v4l2-ctl will never seen the TRY routes you
> > set here.
> 
> It sees them provided you use both functions in the same run of the program. So for example this 
> won't work because the file is closed in between the two:
> 
> v4l2-ctl -d /dev/v4l-subdev2 --try-routing "0/0->1/0[0],2/0->1/0[1]"
> 
> v4l2-ctl -d /dev/v4l-subdev2 --list-subdev-mbus-codes pad=2
> 
> 
> But this works just fine, because it's kept open throughout:
> 
> 
> v4l2-ctl -d /dev/v4l-subdev2 --try-routing "0/0->1/0[0],2/0->1/0[1]" --list-subdev-mbus-codes pad=2

You're absolutely right. For some reason I thought this was for
media-ctl... I need to wake up before reviewing patches.

The only thing that bothers me a bit is that I think it would have been
nicer to add an option to select the TRY state globally instead of
ACTIVE, but as we already have --try-subdev-fmt and
--try-subdev-selection, I suppose I already missed the opportunity.

> >> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> >> ---
> >>   utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 11 +++++++----
> >>   utils/v4l2-ctl/v4l2-ctl.cpp        |  1 +
> >>   utils/v4l2-ctl/v4l2-ctl.h          |  1 +
> >>   3 files changed, 9 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> >> index 86e6c689..48b79288 100644
> >> --- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> >> +++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> >> @@ -96,7 +96,8 @@ void subdev_usage()
> >>   	       "  --set-subdev-fps pad=<pad>,stream=<stream>,fps=<fps> (for testing only, otherwise use media-ctl)\n"
> >>   	       "                     set the frame rate [VIDIOC_SUBDEV_S_FRAME_INTERVAL]\n"
> >>   	       "  --get-routing      Print the route topology\n"
> >> -	       "  --set-routing <routes>\n"
> >> +	       "  --set-routing      (for testing only, otherwise use media-ctl)\n"
> >> +	       "  --try-routing <routes>\n"
> >>   	       "                     Comma-separated list of route descriptors to setup\n"
> >>   	       "\n"
> >>   	       "Routes are defined as\n"
> >> @@ -458,14 +459,16 @@ void subdev_cmd(int ch, char *optarg)
> >>   			}
> >>   		}
> >>   		break;
> >> -	case OptSetRouting: {
> >> +	case OptSetRouting:
> >> +	case OptTryRouting: {
> >>   		struct v4l2_subdev_route *r;
> >>   		char *end, *ref, *tok;
> >>   		unsigned int flags;
> >>   
> >>   		memset(&routing, 0, sizeof(routing));
> >>   		memset(routes, 0, sizeof(routes[0]) * NUM_ROUTES_MAX);
> >> -		routing.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> >> +		routing.which = ch == OptSetRouting ? V4L2_SUBDEV_FORMAT_ACTIVE :
> >> +				      V4L2_SUBDEV_FORMAT_TRY;
> >>   		routing.num_routes = 0;
> >>   		routing.routes = (__u64)routes;
> >>   
> >> @@ -683,7 +686,7 @@ void subdev_set(cv4l_fd &_fd)
> >>   					fival.interval.denominator, fival.interval.numerator);
> >>   		}
> >>   	}
> >> -	if (options[OptSetRouting]) {
> >> +	if (options[OptSetRouting] || options[OptTryRouting]) {
> >>   		if (!_fd.has_streams()) {
> >>   			printf("Streams API not supported.\n");
> >>   			return;
> >> diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
> >> index e195ad8e..f9121284 100644
> >> --- a/utils/v4l2-ctl/v4l2-ctl.cpp
> >> +++ b/utils/v4l2-ctl/v4l2-ctl.cpp
> >> @@ -65,6 +65,7 @@ static struct option long_options[] = {
> >>   	{"set-fmt-video-out", required_argument, nullptr, OptSetVideoOutFormat},
> >>   	{"try-fmt-video-out", required_argument, nullptr, OptTryVideoOutFormat},
> >>   	{"get-routing", no_argument, 0, OptGetRouting},
> >> +	{"try-routing", required_argument, 0, OptTryRouting},
> >>   	{"set-routing", required_argument, 0, OptSetRouting},

I'd put try after set, like you do above.

> >>   	{"help", no_argument, nullptr, OptHelp},
> >>   	{"help-tuner", no_argument, nullptr, OptHelpTuner},
> >> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> >> index cc7f1184..6382619c 100644
> >> --- a/utils/v4l2-ctl/v4l2-ctl.h
> >> +++ b/utils/v4l2-ctl/v4l2-ctl.h
> >> @@ -193,6 +193,7 @@ enum Option {
> >>   	OptShowEdid,
> >>   	OptFixEdidChecksums,
> >>   	OptGetRouting,
> >> +	OptTryRouting,

Same here. With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I can push this patch with those small changes if you're fine with that.

> >>   	OptSetRouting,
> >>   	OptFreqSeek,
> >>   	OptEncoderCmd,

-- 
Regards,

Laurent Pinchart

