Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 251AB21B7BF
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 16:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgGJODs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 10:03:48 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:59965 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726977AbgGJODr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 10:03:47 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ttcsjnSyuJcNHttcvjsATS; Fri, 10 Jul 2020 16:03:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594389825; bh=NDC95T3jwgyRQm9t79CyGxFZg1jnV6RdARcbY0xZljQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LTzZgGmqZJO5pWLHujBRFyvIzDDSUD+jpEgL+9nVEGnG93A13/d4lN8XsihUEYSM5
         Kzi0to+aVeTchzpmha+0WLq6i+aajFAXAee1TNPXGU0hd4l5UcPSJrX5hh9Ci3+C9G
         G8Qr8P6BPHiQfk1rGxaqY37yNziRXyqA8kOm7z8wb4ima85TUnSBDwf1qPHGMUJAhM
         ST57ct2BTvTlhLtTIDmu4BGfTmz/DrzljehUB/eSaMVEQzsUz+Q+N8TKEl/16+2DQ4
         3/mobPnmsq28d/WVr64SXs/YYykKdBLuVcExt41ghqkBd+Kpq0I/nbzROwiLa7Hai3
         3/b4VvdWazaNw==
Subject: Re: [PATCH 1/2] v4l2-compliance: Add version command
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org
References: <20200710131813.452513-1-paul.elder@ideasonboard.com>
 <20200710132536.GX5964@pendragon.ideasonboard.com>
 <3b0dd8f8-00b0-2a94-f040-c9619a99e201@xs4all.nl>
 <20200710135142.GZ5964@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <adb05881-0e7d-fc1d-723c-6e74cfc4aeb3@xs4all.nl>
Date:   Fri, 10 Jul 2020 16:03:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200710135142.GZ5964@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKQeYr2l22rDyYWvsT+yfXJXWQsFiNHZbk+fBaK4Di4BlMAAgaO6ixdGusabF8AqCea7PHefH19mT2pgvcn7cddKIxFHUKtKx5ngQeAtU9HDmXd6M2Y3
 4mmmyFOlj1z9aFuQmcMWd97dwwwCdQh5TdLgFN6S6DQTeR24JVEub8Fi5dQCDqS1N7Jbmb05/R4THOmLcrFPPNlP4RnWrXdaL/b+alwfnTTrDPSHtOcFk96Y
 JPOYc+FNBv+200jO7nxuYfIxe7Ilb30Ayt1wqB7hPg4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/07/2020 15:51, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Fri, Jul 10, 2020 at 03:33:25PM +0200, Hans Verkuil wrote:
>> On 10/07/2020 15:25, Laurent Pinchart wrote:
>>> On Fri, Jul 10, 2020 at 10:18:12PM +0900, Paul Elder wrote:
>>>> Add a --version option to v4l2-compliance to retrieve the version of
>>>> v4l2-compliance.
>>>>
>>>> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>>>> ---
>>>>  utils/v4l2-compliance/v4l2-compliance.cpp | 11 +++++++++++
>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
>>>> index 4b45f110..72b9768f 100644
>>>> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
>>>> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
>>>> @@ -79,6 +79,7 @@ enum Option {
>>>>  	OptMediaBusInfo = 'z',
>>>>  	OptStreamFrom = 128,
>>>>  	OptStreamFromHdr,
>>>> +	OptVersion,
>>>>  	OptLast = 256
>>>>  };
>>>>  
>>>> @@ -153,9 +154,15 @@ static struct option long_options[] = {
>>>>  	{"stream-all-formats", optional_argument, 0, OptStreamAllFormats},
>>>>  	{"stream-all-io", no_argument, 0, OptStreamAllIO},
>>>>  	{"stream-all-color", required_argument, 0, OptStreamAllColorTest},
>>>> +	{"version", no_argument, 0, OptVersion},
>>>>  	{0, 0, 0, 0}
>>>>  };
>>>>  
>>>> +static void version()
>>>> +{
>>>> +	printf("v4l2-compliance " PACKAGE_VERSION "\n");
>>>
>>> Is it enough to rely on the v4l-utils package version, or should we add
>>> a git commit count as well ? The traditional version number will make it
>>> difficult to test for features added between two released versions.
>>
>> If you add a version option, then v4l2-compliance should also show the SHA.
>> It's already available (grep for SHA), so easy enough to add here.
> 
> The issue with the SHA is that, while it identifies the exact commit, it
> is useless to compare versions. We are using v4l2-compliance to test the
> libcamera V4L2 compatibility layer, and this depends on recent features
> merged in the master branch but not available in a release yet. We would
> like the test to be skipped if the v4l2-compliance is too old. Printing
> the package version is a good step forward, but would require waiting
> for the next release before the test can be enabled. That's probably OK
> overall, but it's a bit annoying during development. That's why I was
> wondering if a commit count (as output by git rev-list --count HEAD)
> would be useful too. In our case, the fact that v4l2-compliance supports
> the --version option will be enough to know it's recent enough, but I'm
> thinking about the future (for libcamera and other users).

That would work, then you would get this:

v4l2-compliance 1.21.0-4606
v4l2-compliance SHA: 3b22ab02b960e4d1e90618e9fce9b7c8a80d814a, 64 bits, 64-bit time_t

cec-compliance 1.21.0-4604
cec-compliance SHA: 3b22ab02b960e4d1e90618e9fce9b7c8a80d814a

I still want the SHA, though :-)

The problem with the commit count is that someone can fork v4l-utils and apply
its own patches. So the count does not sufficiently identify the version.

It's no doubt fine for libcamera, but for getting a new driver into mainline
I must know the exact version that is used for the compliance test.

Regards,

	Hans

> 
>> Also, if you add --version here, then it really should be added to most
>> other utils as well (certainly media-ctl and cec-follower/ctl/compliance).
>>
>>>> +}
>>>> +
>>>>  static void usage()
>>>>  {
>>>>  	printf("Usage:\n");
>>>> @@ -244,6 +251,7 @@ static void usage()
>>>>  	printf("  -P, --no-progress  Turn off progress messages.\n");
>>>>  	printf("  -T, --trace        Trace all called ioctls.\n");
>>>>  	printf("  -v, --verbose      Turn on verbose reporting.\n");
>>>> +	printf("  --version          Show version information.\n");
>>>>  #ifndef NO_LIBV4L2
>>>>  	printf("  -w, --wrapper      Use the libv4l2 wrapper library.\n");
>>>>  #endif
>>>> @@ -1664,6 +1672,9 @@ int main(int argc, char **argv)
>>>>  		case OptNoProgress:
>>>>  			no_progress = true;
>>>>  			break;
>>>> +		case OptVersion:
>>>> +			version();
>>>> +			std::exit(EXIT_SUCCESS);
>>>>  		case ':':
>>>>  			fprintf(stderr, "Option `%s' requires a value\n",
>>>>  				argv[optind]);
> 

