Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D18E821B726
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 15:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgGJNvv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 09:51:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49974 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbgGJNvv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 09:51:51 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D8C52C0;
        Fri, 10 Jul 2020 15:51:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594389109;
        bh=R+NM0nqLcR7Lr0Ysx7XNbWYyxhdl/5r9f5ggsf4vdLQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b7BJVkABDsAm++7bTgotzjcjmcA3/oDWdqaxtmMXrA5TXWOps2gfPGdCK0uvD54Xm
         85Jb+fsVapJFP6z3pi1v0/UcNbL4wZmcyg9LfcJDXZW7wgWqA1WzOdYI3mORiAGn9R
         wVAZznRjH2K3/NwiaNGh9nL9vPha7QyI2KlrAen8=
Date:   Fri, 10 Jul 2020 16:51:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] v4l2-compliance: Add version command
Message-ID: <20200710135142.GZ5964@pendragon.ideasonboard.com>
References: <20200710131813.452513-1-paul.elder@ideasonboard.com>
 <20200710132536.GX5964@pendragon.ideasonboard.com>
 <3b0dd8f8-00b0-2a94-f040-c9619a99e201@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3b0dd8f8-00b0-2a94-f040-c9619a99e201@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Jul 10, 2020 at 03:33:25PM +0200, Hans Verkuil wrote:
> On 10/07/2020 15:25, Laurent Pinchart wrote:
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
> 
> If you add a version option, then v4l2-compliance should also show the SHA.
> It's already available (grep for SHA), so easy enough to add here.

The issue with the SHA is that, while it identifies the exact commit, it
is useless to compare versions. We are using v4l2-compliance to test the
libcamera V4L2 compatibility layer, and this depends on recent features
merged in the master branch but not available in a release yet. We would
like the test to be skipped if the v4l2-compliance is too old. Printing
the package version is a good step forward, but would require waiting
for the next release before the test can be enabled. That's probably OK
overall, but it's a bit annoying during development. That's why I was
wondering if a commit count (as output by git rev-list --count HEAD)
would be useful too. In our case, the fact that v4l2-compliance supports
the --version option will be enough to know it's recent enough, but I'm
thinking about the future (for libcamera and other users).

> Also, if you add --version here, then it really should be added to most
> other utils as well (certainly media-ctl and cec-follower/ctl/compliance).
> 
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

-- 
Regards,

Laurent Pinchart
