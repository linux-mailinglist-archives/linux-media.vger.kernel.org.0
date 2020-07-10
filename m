Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4588421B6CD
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 15:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbgGJNo0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 09:44:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49928 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbgGJNo0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 09:44:26 -0400
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6E022C0;
        Fri, 10 Jul 2020 15:44:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594388664;
        bh=xQwut5EL8VsEwh3IqmqoQV3kffL8RFLWvdCS54pbTSo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rvnyagY4YeKvpK8GTo2JbEVr68VLWncDD/Ade7KKyw7C2LcLg04HUe38NT+T3a0NA
         OXIvMfjXtjki9bN9T/P8wusoXyPyad46mJS1HLn+RtnGit58v4wo2iieDi6+QUzNq7
         E0S8WoWvOA4XLJIO8CGMQdNpaPZn2cAw+ezWtTO0=
Date:   Fri, 10 Jul 2020 22:44:16 +0900
From:   paul.elder@ideasonboard.com
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] v4l2-compliance: Add version command
Message-ID: <20200710134416.GG66701@pyrite.rasen.tech>
References: <20200710131813.452513-1-paul.elder@ideasonboard.com>
 <20200710132536.GX5964@pendragon.ideasonboard.com>
 <3b0dd8f8-00b0-2a94-f040-c9619a99e201@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b0dd8f8-00b0-2a94-f040-c9619a99e201@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 10, 2020 at 03:33:25PM +0200, Hans Verkuil wrote:
> On 10/07/2020 15:25, Laurent Pinchart wrote:
> > Hi Paul,
> > 
> > Thank you for the patch.
> > 
> > On Fri, Jul 10, 2020 at 10:18:12PM +0900, Paul Elder wrote:
> >> Add a --version option to v4l2-compliance to retrieve the version of
> >> v4l2-compliance.
> >>
> >> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> >> ---
> >>  utils/v4l2-compliance/v4l2-compliance.cpp | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> >> index 4b45f110..72b9768f 100644
> >> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> >> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> >> @@ -79,6 +79,7 @@ enum Option {
> >>  	OptMediaBusInfo = 'z',
> >>  	OptStreamFrom = 128,
> >>  	OptStreamFromHdr,
> >> +	OptVersion,
> >>  	OptLast = 256
> >>  };
> >>  
> >> @@ -153,9 +154,15 @@ static struct option long_options[] = {
> >>  	{"stream-all-formats", optional_argument, 0, OptStreamAllFormats},
> >>  	{"stream-all-io", no_argument, 0, OptStreamAllIO},
> >>  	{"stream-all-color", required_argument, 0, OptStreamAllColorTest},
> >> +	{"version", no_argument, 0, OptVersion},
> >>  	{0, 0, 0, 0}
> >>  };
> >>  
> >> +static void version()
> >> +{
> >> +	printf("v4l2-compliance " PACKAGE_VERSION "\n");
> > 
> > Is it enough to rely on the v4l-utils package version, or should we add
> > a git commit count as well ? The traditional version number will make it
> > difficult to test for features added between two released versions.

Yeah, it might be useful.

> If you add a version option, then v4l2-compliance should also show the SHA.
> It's already available (grep for SHA), so easy enough to add here.

Oh yeah we could use that.

> Also, if you add --version here, then it really should be added to most
> other utils as well (certainly media-ctl and cec-follower/ctl/compliance).

Okay, I can add that.

For v4l2-ctl and the other tools, would it be better like:

v4l2-ctl 1.21.0-deadbeef

Or like what v4l2-compliance has:

v4l2-compliance SHA: 3b22ab02b960e4d1e90618e9fce9b7c8a80d814a, 64 bits, 64-bit time_t

v4l2-compliance 1.21.0





Thanks,

Paul

> >> +}
> >> +
> >>  static void usage()
> >>  {
> >>  	printf("Usage:\n");
> >> @@ -244,6 +251,7 @@ static void usage()
> >>  	printf("  -P, --no-progress  Turn off progress messages.\n");
> >>  	printf("  -T, --trace        Trace all called ioctls.\n");
> >>  	printf("  -v, --verbose      Turn on verbose reporting.\n");
> >> +	printf("  --version          Show version information.\n");
> >>  #ifndef NO_LIBV4L2
> >>  	printf("  -w, --wrapper      Use the libv4l2 wrapper library.\n");
> >>  #endif
> >> @@ -1664,6 +1672,9 @@ int main(int argc, char **argv)
> >>  		case OptNoProgress:
> >>  			no_progress = true;
> >>  			break;
> >> +		case OptVersion:
> >> +			version();
> >> +			std::exit(EXIT_SUCCESS);
> >>  		case ':':
> >>  			fprintf(stderr, "Option `%s' requires a value\n",
> >>  				argv[optind]);
> > 
> 
