Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36D91699936
	for <lists+linux-media@lfdr.de>; Thu, 16 Feb 2023 16:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbjBPPsj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Feb 2023 10:48:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbjBPPsj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Feb 2023 10:48:39 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AAA2A9B3
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 07:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676562475;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vu6texSzlf7BnimUK4lSULAK2ig2o3a3Uc0vY8JUZKQ=;
        b=SeVrsYVZBMD5nUGMCUjU/QtJvT61agojrWeaklT3H4oGLj9TKfyd60b4g1KXSrFJc+9gV3
        uNbsfKdsofde6f2Pg4BAWGDewoCCrYvIrwsh+CD/SwzHCz7YH0+cZErd23acN1V6qcoiU9
        jK7tB9Uuf/SUWXY48/lcGtWyzwuIjpk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-161-SLrAbmfNPRWj2rjNFMm5zg-1; Thu, 16 Feb 2023 10:47:54 -0500
X-MC-Unique: SLrAbmfNPRWj2rjNFMm5zg-1
Received: by mail-ed1-f72.google.com with SMTP id h10-20020a056402280a00b004acc6cf6322so2044418ede.18
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 07:47:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vu6texSzlf7BnimUK4lSULAK2ig2o3a3Uc0vY8JUZKQ=;
        b=l8Xmq0v4S7ns5cPmHe2TkPCjmMAflUN/mf9smkmCrub8rXSayp7zFwmhosKQg88JuP
         gFXp1AHgAuWgh4SVmsBULF5LEIlCp26qLbCESe3dOgX5Ob30uLM6tu/tE+jHOIgVFnYn
         R6hd1HKeb9euXsDMCzlFpjoa1cQGNZ1z1VVqX4nMGGOabFV52GAqDptb9Fy1lJ+VLTWH
         zihTOoyrY+fM2sDAM1SZ9Hw3eJeI6yM/5j0w1Fwcspo7WwUHYDME8TdDcVx7FQ5QFOIr
         fnULuCFrAhE/BEku4Q84meQ283kAUusC9sekOl5fBk9/aMjcXmaMUWF0negqDN7YUHv9
         08Bw==
X-Gm-Message-State: AO0yUKUx8A55/UMHjIG9QSFX1bYU4CcAgMDmf9R6eZkmyrsvif9m/jUA
        fg22ZDch6lLZDRT953tBzj3ek1wEg1bnYM1s9vlazZU+94UHeqFwSB4Rg/vpKaPIAdQgICj9+Yf
        iQ8nFEDaQD1dJoEx4Qq3sqsI=
X-Received: by 2002:aa7:d483:0:b0:4ad:5220:79f2 with SMTP id b3-20020aa7d483000000b004ad522079f2mr1439646edr.19.1676562472965;
        Thu, 16 Feb 2023 07:47:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9T4sEQHN60ePkdNFRD42aM6lTtW7PVVagbmBOWvKl2eSsZQawrdqUNIwhskIk+jt5AhPEjzw==
X-Received: by 2002:aa7:d483:0:b0:4ad:5220:79f2 with SMTP id b3-20020aa7d483000000b004ad522079f2mr1439630edr.19.1676562472622;
        Thu, 16 Feb 2023 07:47:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j17-20020a508a91000000b004a21c9facd5sm1037693edj.67.2023.02.16.07.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 07:47:51 -0800 (PST)
Message-ID: <c3dc3173-9bbd-c48a-80a7-ec6a86b6e360@redhat.com>
Date:   Thu, 16 Feb 2023 16:47:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: RFC: removing various special/obscure features from atomisp code
 ?
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dan Scally <djrscally@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <5309d845-063b-6dd9-529d-0f82654290f2@redhat.com>
 <Y+5CMkwHy9tuk6G2@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y+5CMkwHy9tuk6G2@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 2/16/23 15:48, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Thu, Feb 16, 2023 at 03:20:08PM +0100, Hans de Goede wrote:
>> Hi All,
>>
>> I have been looking into moving the sensor registration for atomisp2
>> over to v4l2-aysnc similar to how
>> drivers/media/pci/intel/ipu3/cio2-bridge.c does things.
>>
>> Together with some other smaller changes this should allow the atomisp
>> code use standard sensor drivers instead of having their own fork of
>> these drivers.
>>
>> While looking into this I realized that the current architecture of
>> the atomisp2 code where it registers 8 /dev/video# nodes + many
>> v4l2-subdevs is getting in the way of doing this.  At a minimum the
>> current convoluted media-ctl graph makes it harder then necessary to
>> make this change.
>>
>> So this makes me realize that it probably is time to make some changes
>> to the atomisp-code to remove a bunch of somewhat obscure (and
>> untested / unused) features. I have been thinking about removing these
>> for a long time already since they also get in the way of a bunch of
>> other things like allowing the /dev/video# nodes to be opened multiple
>> times.
>>
>> So my plan is to reduce the feature set to make atomisp work as more
>> or less a standard webcam (with front/back sensors) which is how most
>> hw is using it and also is how all our (my) current testing uses it.
>>
>> This means reducing the graph to a single /dev/video0 output node + 2
>> subdevs for the sensors I might put one more node in the graph for
>> selecting between the 3 CSI ports, or those could be 3 possible
>> sources for /dev/video0.
> 
> Could you briefly summarize the hardware architecture, and in particular
> what building blocks are present, and how they're connected ? That will
> help with the discussion.

I can try, but it is complicated. The atomisp appears to mainly be
some coprocessor thing (with I guess some hw-accel blocks on the side)
the way it works from the driver's pov is that the firmware file really
contains a a whole bunch of different binaries to run on the co-processor,
with a table describing the binaries including supported input and
output formats.

Each binary represents a complete camera pipeline, going from
directly reading from the CSI receiver on one end to DMA-ing
the fully finished ready to consume buffers in the requested
destination fmt on the other end. The driver picks a binary
based on the requested input + output formats and then uploads
+ starts that.

So basically it is one big black box, where we hookup a
sensor on one side and then on the other end say give my YUYV
or YU12, or ...   There are of course a whole bunch of
processing parameters we can set like lens shading correction
tables (format unknown), etc. But basically it is still
just a black box.

So from a mediactl pov as I see it the whole thing is a single
node in the graph.

>> So back to $subject, this means removing a bunch of stuff which
>> atomisp at point supported (but we don't know if it currently even
>> works). Before I start deleting all this code I wanted to give people
>> a chance to protest here :)
>>
>> So here we go the removal list:
>>
>> 1. Remove support for depth mode. This is a special mode where 2
>> streams (from 2 different sensors) can be setup and then
>> starting/stopping 1 will automatically also start/stop the other.
>> Like many of these special features I'm pretty sure that if the queue
>> setup is not done exactly right things will crash and burn, there is
>> no error checking for this.
>>
>> This seems to be for stereoscopic vision and the only hw I know of
>> which actually supports this is the Intel Aero board/SDK, all other
>> 1000+ byt/cht models don't need this.
>>
>> This definitely falls outside of the webcam use scenario and this
>> involves a bunch of hacks / special exceptions all over the code, so
>> lets remove this.
> 
> Is this implemented purely in software in the driver, or does the
> hardware/firmware also play a role there ? If it's a pure software
> implementation, sure, ditch it. If the hardware plays a role, I'd like
> to better understand what role it plays.

AFAICT there is no hw involved. To do this 2 separate binaries are
started on the co-proc an there seems to be be no real synchronisation
between the 2. So this seems to be purely a sw hack to start
the 2 streams more or less at once (do the 2 starts immediately
one after the other without leaving the kernel).

>> 2. Remove support for 2 streams at the same time, in theory the
>> atomisp supports streaming from 2 sensors at the same time outputting
>> something to 2 different /dev/video nodes. Downsides:
> 
> Here too I'd like to better understand how this is implemented.

See above, I guess in theory with low enough resolutions even
doing 3 streams at the same time by starting 3 binaries on
the co-processor at the same time is possible.

>> a. The atomisp is not really powerful enough for this. The DVFS code
>> has a special "go all out" mode for this to try and keep up.
>>
>> b. The BYT/CHT CPU also is not really powerful enough to do something
>> useful with 2 streams
> 
> That depends on the resolution, and what those two streams are used for.
> One could be displayed with zero-copy, making it essentially free from a
> CPU point of view.

True, but this hw is already approaching a point where it is
too slow for most modern sw. So I would really like to focus
on making the single stream case work well.

>> c. The code is full of ugly special casing for this where certain
>> cleanup on stream-stop needs to be skipped if the other stream is
>> still active since some bits are shared.
>>
>> d. This is not something which I see a lot of users actually using.
>>
>> So lets remove this.
>>
>>
>> 3. Remove having 4 separate video node (per stream, so 8 in total
>> until 2. is done/removed).
>>
>> The atomisp has 4 different modes / firmware-pipes it can setup:
>>
>> i.   Still camera preview aka viewfinder
>> ii.  Still camera capture aka capture
>> iii. Video preview aka preview
>> iv.  Video capture mode aka capture
>>
>> Downsides:
>>
>> a) This feels more like it should be some mode set on a single
>> /dev/video# node rather then having separate nodes for this
> 
> If they're mutually exclusive, I agree.

Generally speaking they are mutually exclusive, but there
are some hacks where if certain preconditions are met
(which are not checked and which are essentially unkown
to us) one should be able to do some still camera mode
captures at the same time as running the viewfinder.

I have not looked in detail yet how this hack works.

I would guess it would involve running 2 binaries, maybe
prepping 2 binaries and then stopping the viewfinder one
briefly, since I don't think 2 binaries can share the
CSI connection.

>> b) Only one mode and thus node can be active at the same time. The one
>> exception being a special mode where viewfinder + capture buffers can
>> be queued at the same time and then a trigger can be send to capture a
>> string of frames in capture mode while the viewfinder also keeps
>> streaming.
>>
>> In all other cases calling stream-on on multiple nodes is not
>> supported, but this is currently not enforced and trying to stream on
>> multiple nodes likely just goes boom
>>
>> c) it seems many of the modes have special pre-requisites, like
>> capture mode seems to only work if already streaming in viewfinder
>> mode.
>>
>> d) we only ever have gotten video-preview mode to actually work,
>> everything else is pretty much dead weight at this point
>>
>> e) there is all kind of ugly reference counting .  exceptions to e.g.
>> not turn off the sensor on stream-off if another /dev/video# node
>> which is part of the same "stream" (in the sense of the 2 supported
>> streams at once) is still active.
>>
>> f) the special ref-counting/exceptions are getting in the way of
>> allowing multiple opens of the /dev/video# node and generally get in
>> the way of using standard v4l2-core helpers for file open/close
>> handling.
>>
>> g) having 8 / 4 /dev/video nodes confuses userspace
>>
>> Thus from my pov ideally this should all go away too.
>>
>>
>> So any objections or shall I start working on removing all this so
>> that we end up with a much simpler driver?
> 
> I'll tell you once I get a better understanding of the hardware ;-)

Regards,

Hans


