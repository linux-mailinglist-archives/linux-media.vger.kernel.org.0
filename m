Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43CCE699715
	for <lists+linux-media@lfdr.de>; Thu, 16 Feb 2023 15:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjBPOVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Feb 2023 09:21:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjBPOVG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Feb 2023 09:21:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 292FD4A1D6
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 06:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676557212;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=hWnPZhOmtQ1OI3vBrQnoq9dkQN+RdX2+yUZisf6ZsT8=;
        b=RkdVdmgcLgMGv2uBAHOuJZaUTXgej5YCMlGVzL0GmYZuQb8qWy2Mh4LP9C4b92vjqbLwe3
        yBCwr01HQ6WiYOyKNuAh5EDsZyadUazhrwdiruNKwhX1R8pDiKtu33VCVQEWws2zxDgSa6
        EVO4yYCC/W6fUc0Txr6H7TDB+ksY7oo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-AWOpoA1sPLije6NIZezVoA-1; Thu, 16 Feb 2023 09:20:11 -0500
X-MC-Unique: AWOpoA1sPLije6NIZezVoA-1
Received: by mail-ed1-f70.google.com with SMTP id eo7-20020a056402530700b004aab4319cedso1741849edb.2
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 06:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hWnPZhOmtQ1OI3vBrQnoq9dkQN+RdX2+yUZisf6ZsT8=;
        b=s9FQX7y5egeXLf7VgMODbVRuX8PaStNKp9dR4+siAorHWOcmLu5vQVFNP5xE/j0+vj
         BIPGqQ7IWa9oA/oVFdMNpz+0V6g/qH+fdeT+2PsPkOd+4lK3FhryOQ+0Ia9kVvIDgzQ5
         3A/EZAilaeiK0NTuiPT3jfzMp/pGG/H6Ij6u1pYCck1XGAQ1+3cDGFTq+exHYzJo4oPW
         JvTK9Kol4LghqWzGkRfwiQNiuOajiLVbKxZ2M+yZTcBZM6LJ/R/cpSvBgpmwdC9hkBgL
         ZWNPXBc8k6rXGbxIxn1dJdG3xKL9f+kzxvmwxQIWZIMrSjU/omd3EmMhHF54qZx2HXFP
         C7gg==
X-Gm-Message-State: AO0yUKV/5acmaYAxIMWVz5K8/ghcP5vEX1C+QnUbjpGWTOVZaBQR7xYK
        nFFZa/cBy9vysZt5FDqaBTxh91kP8++Y7M5tnTOP1pasfkTqMCDevCuZ4kMmN92aWIX3r9z72G3
        XirFNd1yzPyT/Em9NJXsXva+a38iT
X-Received: by 2002:a17:907:c18:b0:8b1:7b12:2914 with SMTP id ga24-20020a1709070c1800b008b17b122914mr178721ejc.35.1676557209686;
        Thu, 16 Feb 2023 06:20:09 -0800 (PST)
X-Google-Smtp-Source: AK7set8VGJnPag35KJ3Lkq4L2z9lziM7G3BAKEExGqdhibFaMft+OTTFbcUSNUOcEFAo4v2srZJTuw==
X-Received: by 2002:a17:907:c18:b0:8b1:7b12:2914 with SMTP id ga24-20020a1709070c1800b008b17b122914mr178693ejc.35.1676557209407;
        Thu, 16 Feb 2023 06:20:09 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dk14-20020a170906f0ce00b0087bd2924e74sm849043ejb.205.2023.02.16.06.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 06:20:08 -0800 (PST)
Message-ID: <5309d845-063b-6dd9-529d-0f82654290f2@redhat.com>
Date:   Thu, 16 Feb 2023 15:20:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US, nl
To:     "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dan Scally <djrscally@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: RFC: removing various special/obscure features from atomisp code ?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

I have been looking into moving the sensor registration for
atomisp2 over to v4l2-aysnc similar to how
drivers/media/pci/intel/ipu3/cio2-bridge.c does things.

Together with some other smaller changes this should
allow the atomisp code use standard sensor drivers
instead of having their own fork of these drivers.

While looking into this I realized that the current
architecture of the atomisp2 code where it
registers 8 /dev/video# nodes + many v4l2-subdevs
is getting in the way of doing this.  At a minimum
the current convoluted media-ctl graph makes it
harder then necessary to make this change.

So this makes me realize that it probably is time to
make some changes to the atomisp-code to remove
a bunch of somewhat obscure (and untested / unused)
features. I have been thinking about removing these
for a long time already since they also get in the
way of a bunch of other things like allowing the
/dev/video# nodes to be opened multiple times.

So my plan is to reduce the feature set to make
atomisp work as more or less a standard webcam
(with front/back sensors) which is how most hw
is using it and also is how all our (my) current
testing uses it.

This means reducing the graph to a single
/dev/video0 output node + 2 subdevs for the sensors
I might put one more node in the graph for selecting
between the 3 CSI ports, or those could be 3 possible
sources for /dev/video0.

So back to $subject, this means removing a bunch
of stuff which atomisp at point supported (but we don't
know if it currently even works). Before I start
deleting all this code I wanted to give people
a chance to protest here :)

So here we go the removal list:

1. Remove support for depth mode. This is a special
mode where 2 streams (from 2 different sensors) can
be setup and then starting/stopping 1 will automatically
also start/stop the other.  Like many of these special
features I'm pretty sure that if the queue setup is
not done exactly right things will crash and burn,
there is no error checking for this.

This seems to be for stereoscopic vision and the only
hw I know of which actually supports this is
the Intel Aero board/SDK, all other 1000+ byt/cht
models don't need this.

This definitely falls outside of the webcam use
scenario and this involves a bunch of hacks / special
exceptions all over the code, so lets remove this.


2. Remove support for 2 streams at the same time,
in theory the atomisp supports streaming from 2
sensors at the same time outputting something
to 2 different /dev/video nodes. Downsides:

a. The atomisp is not really powerful enough
for this. The DVFS code has a special "go all out"
mode for this to try and keep up.

b. The BYT/CHT CPU also is not really powerful enough
to do something useful with 2 streams

c. The code is full of ugly special casing for
this where certain cleanup on stream-stop needs
to be skipped if the other stream is still active
since some bits are shared.

d. This is not something which I see a lot of users
actually using.

So lets remove this.


3. Remove having 4 separate video node (per stream,
so 8 in total until 2. is done/removed).

The atomisp has 4 different modes / firmware-pipes
it can setup:

i.   Still camera preview aka viewfinder
ii.  Still camera capture aka capture
iii. Video preview aka preview
iv.  Video capture mode aka capture

Downsides:

a) This feels more like it should be some mode set
on a single /dev/video# node rather then having
separate nodes for this

b) Only one mode and thus node can be active at
the same time. The one exception being a special
mode where viewfinder + capture buffers can
be queued at the same time and then a trigger
can be send to capture a string of frames in
capture mode while the viewfinder also keeps streaming.

In all other cases calling stream-on on multiple
nodes is not supported, but this is currently
not enforced and trying to stream on multiple
nodes likely just goes boom

c) it seems many of the modes have special
pre-requisites, like capture mode seems to
only work if already streaming in viewfinder
mode.

d) we only ever have gotten video-preview mode
to actually work, everything else is pretty
much dead weight at this point

e) there is all kind of ugly reference counting .
exceptions to e.g. not turn off the sensor on stream-off
if another /dev/video# node which is part of
the same "stream" (in the sense of the 2 supported
streams at once) is still active.

f) the special ref-counting/exceptions are getting
in the way of allowing multiple opens of the /dev/video#
node and generally get in the way of using standard
v4l2-core helpers for file open/close handling.

g) having 8 / 4 /dev/video nodes confuses userspace

Thus from my pov ideally this should all go away too.


So any objections or shall I start working on removing
all this so that we end up with a much simpler driver?

Regards,

Hans



