Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B70AA2AB795
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 12:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729570AbgKILyb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 06:54:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbgKILyb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 06:54:31 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17205C0613CF
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 03:54:30 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id q7so63745qvt.12
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 03:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=oH24vQ77nKmAQfj5En9OTOQy8UKIFEqTn+IPbckNbN8=;
        b=Mv1Xg4huiZou0vFwiCzqS7cPQV5ipJEJs3vAxL/ur71AAVHw2ItgQnVsH55YcDrN5Z
         dpzCwSWTvz0Q8sB2XGWgcI9/6vVDYL5iNmfLvGkxZ24a2n00qr9mKmqE82gl+bhZU/7l
         dGaGr0hFa3ghOaeUlxgnQeynl4R8/DSfEd39MafdJv57rE9EJrQjmcSaGz/mUf9cjsti
         imUCUyw6Fg2Ahxafwb8FwxNl3f7s5+a8eXWXF1HTtv2uNaIrN6uv8QOqmQZlXpSIMlNy
         eH4iooevw2NBqZsSQ+j2JcYxgqd5hBxv0/QTVPJiQ1gZSveZ9oSFRJxNr84BRZ1Nxa32
         zdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=oH24vQ77nKmAQfj5En9OTOQy8UKIFEqTn+IPbckNbN8=;
        b=BwKlFthyPc9eext21K1sJTxyGJFpuGFwgSryo34+F5swKuFzrc1ZNMfMte73MFs1+U
         HjT7HUoCv4VWSZIihjsCiBfqLewuqERlXapwE8ryvHvJekTwrPmkfetU+0YBOfm71TzT
         nBG7d8qS9oHVS0rOCUHsE9wS8Cc7Uq7hPqJK0PArOTJIoNbLbwGI/h9KI3KVM6DTtwrJ
         aodE8YzuRgLtI9nAn6udac65E4msavJb/z3/SJuXU6CGfT9n7WkImMVpdqOpbcNuhLy6
         Um1EXjeosUGJKkLJE1JtI+DGJXNdfLyzWQgFCZqg3DO31vSlw3Zuls6CCSNMRO9VVUO0
         k8Iw==
X-Gm-Message-State: AOAM533liXQQgigElXYDiMoP4O+w5+47S2C6Ft1NQA1UeWHdKfFyrgaj
        OjqYBsHZ8feqkOOhFrtkQVj0/v2jRsVmzA==
X-Google-Smtp-Source: ABdhPJzU1mrn9kEMxgcLgBcJdVrbTZruhHzreOhdAOSm001f/TJCyFdz01+9ne7tr78sHMwqmrrA2A==
X-Received: by 2002:ad4:5888:: with SMTP id dz8mr2298242qvb.34.1604922869162;
        Mon, 09 Nov 2020 03:54:29 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac? ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id z134sm6102351qka.21.2020.11.09.03.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 03:54:28 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>, hverkuil@xs4all.nl
Cc:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: On test-media script integration for vidtv
Message-ID: <838fdbcc-87b1-a40a-ebd3-59fce07f2d51@gmail.com>
Date:   Mon, 9 Nov 2020 08:54:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans & Mauro.

Well I now have some more time to work on vidtv so I'd like to start off 
with the test-media script integration as mentioned by Hans some time ago.

Let's recap:



> For regression testing of vidtv during the daily build it would be great if
> the contrib/test/test-media script can be enhanced to include vidtv.
> 
> This is run during the daily build with a kernel that has lockdep and many
> other checks enabled, so it is very helpful to verify that no regressions
> happened.
> 
> Note that this script relies on the /dev/mediaX devices to run the tests. I
> noticed that vidtv doesn't appear to create a /dev/mediaX device, even though
> CONFIG_MEDIA_CONTROLLER_DVB=y. This is definitely something that would be good
> to support in vidtv.
> 
> Regards,
> 
> Hans


So I have been looking at the documentation for a bit, i.e.

> https://www.kernel.org/doc/html/v4.14/media/uapi/mediactl/media-controller-intro.html

What I understood from that is that entities and interfaces under 
/dev/media/ are created to model actual hardware, but vidtv is a virtual 
driver. Can this be clarified?

Is this separate from the files created by the dvb core as part of the 
driver initialization?
e.g. (for a single adapter):

/dev/adapter0/frontend0
/dev/adapter0/demux0
/dev/adapter0/dvr0

Btw I noticed some drivers call dvb_create_media_graph() as part of 
their initialization, e.g. au0828-dvb.c, em28xx-dvb.c, cx231xx-dvb.c, 
but some (most) do not, why is this?


> Daniel, if you look at the test-media script, then you'll see that it has
> separate sections for each virtual driver. It's probably best to look at
> the vim2m driver tests since that's the easiest.
> 
> It loads the module, then it starts v4l2-compliance to test the API. This
> utility basically tries all V4L2 APIs and checks that the driver conforms to
> the spec.
> 
> Note that you see options like '-m platform:vim2m' that selects which /dev/media
> device to use based on the name and v4l2-compliance (or v4l2-ctl with the -z option)
> then walks the topology of the media device and tests all interfaces it finds.
> 
> Hence my question about media controller support in vidtv: this should be
> supported there as well since it allows you to write these test sequences without
> having to know which /dev/fooX device should be used.
> 
> After the compliance test is run the script tests unbind/bind (always a nasty test)
> and checks for memory leaks (if enabled in the kernel).
> 
> Much of this test sequence can be copied for vidtv, but you need something else for
> the compliance test. It would for now be enough to have some quick check with the
> existing dvb utils from v4l-utils to see that the basics work.
> 
> IMHO I think a dtv-compliance utility along the lines of v4l2-compliance and
> cec-compliance should be created.
> 
> I'm actually wondering whether the dtv compliance tests shouldn't be part of
> v4l2-compliance (which would have to be renamed to media-compliance in that case)
> since there are hybrid drivers supporting both in the same media topology.
> 
> This would make compliance tests possible where analog/digital TV mode handling
> is tested (i.e. if analog TV is in use, then trying to use digital TV would return
> EBUSY and vice versa).
> 
> It would require some work in v4l2-compliance.cpp to make this possible, but I
> can do that myself.
> 
> Compliance tests have proven to be a great method of testing for regressions and
> testing drivers in general.
> 
> Note that it takes a lot of time to create good compliance tests, but you just start
> with some simple tests and expand it over time.
> 
> Regards,
> 
> Hans


Well, I checked the test-media script and it seems to be easy to add 
support for vidtv there, as Hans said most of the sequence there can be 
copied from the other drivers. However..

 >It would for now be enough to have some quick check with the existing 
dvb utils from v4l-utils to see that the basics work.

Can we discuss this in further depth please? Maybe a few examples?

What I currently do is:

1. zap the stream & open it in dvbinspector, manually check for mistakes
2. manually check dmesg for errors
3. maybe play the stream using vlc or Kaffeine

-- thanks
-- Daniel
