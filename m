Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5E82ABE87
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 15:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730307AbgKIOVw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 09:21:52 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:57315 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729973AbgKIOVv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Nov 2020 09:21:51 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id c83CkyBtA1R0xc83GkX0pk; Mon, 09 Nov 2020 15:21:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604931706; bh=gowLr2v+tp3iKFSKQG+TrDi3wEyC3IlEykNqnRk+nJM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iPse7ovUa++b3XLXLHaXOHlvmY6CGRhe+XLnY3dDd+DwM7mkRP7JrQaflsdEvHkwr
         a/rd2aaDgDVuNRZqNGr5Q/l4gm/6nbn9G6XGB4b+7ZccZOgHb9wCuPW2YRwFdfbd4C
         i6+uiTOBtL4aJjKnEZFnfHQxbCLxyB890grdpfFiBB8k74UUTF4nHbU+3SSdfjlVtU
         PQ680MATmIzuBBV4J12eWQxz7sfXP+fSR5ms4wp/5mlElghDBMrz9yPV1kL5IeJW5D
         EgVGfRU6FhkRHl6P7+CxVDy+xOseFvbZi6fP0bwSKIAlt+EbMlQ3lrua0bRp07NNFS
         zo2nFwxQ82pHA==
Subject: Re: On test-media script integration for vidtv
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <838fdbcc-87b1-a40a-ebd3-59fce07f2d51@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6cd794fc-90f5-52fe-97d6-69692ec31333@xs4all.nl>
Date:   Mon, 9 Nov 2020 15:21:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <838fdbcc-87b1-a40a-ebd3-59fce07f2d51@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfF6cVYi/PoAvfJDQ2jDxWwZe3LmlktHnlitAM4Vzcw1r6HllTyixqgOMgKky87aom+2rGQUdxn42okXG8hnpK2EvrT8D6evQToiLjmoRV2htzvv7oItb
 2TXSAinBS/bHeXPCIt/znf4Ie9Ox85KQoDs2ypoZlh3CPC/rEoNwJYqeQcM8x/dYgBbom3o7OHMWJhz8MRzFu7sFSRNy0x72JouYG3AlRtzG1mNX/5i1orcU
 MIDk8uhfd3S/u+7FGwuVEjCKOZKsdvwPFqbakMbQ5XVJ4QAIB23zvKfUIL5ec6LyulByzVzJqYlXBYEtoUcFfhQ9i/fqQ1gICjRJE36O760=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/11/2020 12:54, Daniel W. S. Almeida wrote:
> Hi Hans & Mauro.
> 
> Well I now have some more time to work on vidtv so I'd like to start off 
> with the test-media script integration as mentioned by Hans some time ago.
> 
> Let's recap:
> 
> 
> 
>> For regression testing of vidtv during the daily build it would be great if
>> the contrib/test/test-media script can be enhanced to include vidtv.
>>
>> This is run during the daily build with a kernel that has lockdep and many
>> other checks enabled, so it is very helpful to verify that no regressions
>> happened.
>>
>> Note that this script relies on the /dev/mediaX devices to run the tests. I
>> noticed that vidtv doesn't appear to create a /dev/mediaX device, even though
>> CONFIG_MEDIA_CONTROLLER_DVB=y. This is definitely something that would be good
>> to support in vidtv.
>>
>> Regards,
>>
>> Hans
> 
> 
> So I have been looking at the documentation for a bit, i.e.
> 
>> https://www.kernel.org/doc/html/v4.14/media/uapi/mediactl/media-controller-intro.html
> 
> What I understood from that is that entities and interfaces under 
> /dev/media/ are created to model actual hardware, but vidtv is a virtual 
> driver. Can this be clarified?

For virtual drivers it models the virtual hardware. Userspace doesn't know
that it is actually all emulated, it just looks like real hardware.

> 
> Is this separate from the files created by the dvb core as part of the 
> driver initialization?
> e.g. (for a single adapter):
> 
> /dev/adapter0/frontend0
> /dev/adapter0/demux0
> /dev/adapter0/dvr0

Yes, it is separate. If CONFIG_MEDIA_CONTROLLER_DVB=y then an additional
device node /dev/media0 is created.

> 
> Btw I noticed some drivers call dvb_create_media_graph() as part of 
> their initialization, e.g. au0828-dvb.c, em28xx-dvb.c, cx231xx-dvb.c, 
> but some (most) do not, why is this?

I think that's because only a subset of DVB drivers support the media controller.

> 
> 
>> Daniel, if you look at the test-media script, then you'll see that it has
>> separate sections for each virtual driver. It's probably best to look at
>> the vim2m driver tests since that's the easiest.
>>
>> It loads the module, then it starts v4l2-compliance to test the API. This
>> utility basically tries all V4L2 APIs and checks that the driver conforms to
>> the spec.
>>
>> Note that you see options like '-m platform:vim2m' that selects which /dev/media
>> device to use based on the name and v4l2-compliance (or v4l2-ctl with the -z option)
>> then walks the topology of the media device and tests all interfaces it finds.
>>
>> Hence my question about media controller support in vidtv: this should be
>> supported there as well since it allows you to write these test sequences without
>> having to know which /dev/fooX device should be used.
>>
>> After the compliance test is run the script tests unbind/bind (always a nasty test)
>> and checks for memory leaks (if enabled in the kernel).
>>
>> Much of this test sequence can be copied for vidtv, but you need something else for
>> the compliance test. It would for now be enough to have some quick check with the
>> existing dvb utils from v4l-utils to see that the basics work.
>>
>> IMHO I think a dtv-compliance utility along the lines of v4l2-compliance and
>> cec-compliance should be created.
>>
>> I'm actually wondering whether the dtv compliance tests shouldn't be part of
>> v4l2-compliance (which would have to be renamed to media-compliance in that case)
>> since there are hybrid drivers supporting both in the same media topology.
>>
>> This would make compliance tests possible where analog/digital TV mode handling
>> is tested (i.e. if analog TV is in use, then trying to use digital TV would return
>> EBUSY and vice versa).
>>
>> It would require some work in v4l2-compliance.cpp to make this possible, but I
>> can do that myself.
>>
>> Compliance tests have proven to be a great method of testing for regressions and
>> testing drivers in general.
>>
>> Note that it takes a lot of time to create good compliance tests, but you just start
>> with some simple tests and expand it over time.
>>
>> Regards,
>>
>> Hans
> 
> 
> Well, I checked the test-media script and it seems to be easy to add 
> support for vidtv there, as Hans said most of the sequence there can be 
> copied from the other drivers. However..
> 
>  >It would for now be enough to have some quick check with the existing 
> dvb utils from v4l-utils to see that the basics work.
> 
> Can we discuss this in further depth please? Maybe a few examples?
> 
> What I currently do is:
> 
> 1. zap the stream & open it in dvbinspector, manually check for mistakes
> 2. manually check dmesg for errors
> 3. maybe play the stream using vlc or Kaffeine

I'm not a DVB expert, but I was thinking of testing if it can discover
channels, and perhaps just a test to stream data without checking if it is
actually valid video.

The problem is that I am not all that familiar with the DVB utilities so I
don't know if anything can be automated.

An alternative is to start adding dtv support to v4l2-compliance. That utility
already has media controller support, but it needs a bit of work to comfortably
integrate DTV support as well. I can help with that if you want to go in that
direction. v4l2-compliance would need a bit of refactoring, but it is nice to
have the tests there since that makes it easy to support hybrid devices with a
single compliance utility.

Regards,

	Hans
