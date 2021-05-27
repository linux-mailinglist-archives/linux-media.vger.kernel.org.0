Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17E4139282A
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 09:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234478AbhE0HJY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 03:09:24 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:32821 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229706AbhE0HJX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 03:09:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id mA7Nla82kVN4kmA7QlNSYi; Thu, 27 May 2021 09:07:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622099268; bh=mqXMbZ22TdhQ+cqqt7vm6YDZqGmgH5WGiLbU308KxSg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OqdSbLIw25mnKaZSv+15gtlUO8W7LR5LqFrqqIdVA6zw4oLHJ5sONh3e/qdN69yGk
         n0p5QFys0s1hFPEN24n7YL/6n/Wq+4206RpKq/e7Tshew1BhOtLBFa+VcngxvP+Gg1
         xKfz8ZHUoX/DtOtcx8NHbGId0HIwdEMXSvzMB1MIiCljBKsYY9usfbNp14RgcSsOqP
         00GVtHFuGReCjiQWdXa7H/Ihplh13nL7nC39oSuOu7kHW35Dysglsmwei1gjcJb5vm
         xhEm7JQBWTMQ+5w2k9x38hkiK1ybXq0n2ACB6AqjMZhpe+4zuonqYlJDip1XQfmh82
         +tWVBSuYmNWOQ==
Subject: Re: [PATCH 0/2] New V4L2 controls V4L2_CID_NOTIFY_GAIN_XXX
To:     David Plowman <david.plowman@raspberrypi.com>,
        linux-media@vger.kernel.org
References: <20210517100240.3323-1-david.plowman@raspberrypi.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <50a9d04a-ecba-b288-5ffc-5ec022203874@xs4all.nl>
Date:   Thu, 27 May 2021 09:07:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210517100240.3323-1-david.plowman@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMqFM7v8hZlb4/VW6L8fBHGonIiqXR8iTnh+pKyIgJyo4DHMlSFq+g3fkwePmNBZbtaY5fXKea0s+ow9waWC+3wRmjodJa63RoOrO2O0n3EDxY1YL+B8
 Zh2cIpIFLZehF97syDLnIvBPsuXB5PI07+nrCzVgVRjHnr7GY1/t+fTY9ec1LzSG8LcHa7bBJaoW+62x3WcHKQ1VUQ8Cycl5RYZHa7kngYhzTovHCBugr2vu
 IUaBZy60lpFUb8N1DSUBbA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David,

On 17/05/2021 12:02, David Plowman wrote:
> Hi
> 
> I'd like to propose some new V4L2 controls as defined in the attached
> patches. The controls are:
> 
> V4L2_CID_NOTIFY_GAIN_RED
> V4L2_CID_NOTIFY_GAIN_GREENR
> V4L2_CID_NOTIFY_GAIN_BLUE
> V4L2_CID_NOTIFY_GAIN_GREENB
> 
> The purpose of these controls is to be able to notify a raw sensor
> what colour gains will be applied by subsequent processing (such as by
> an ISP). Equivalently we can think of them as telling the sensor what
> the white point is. Note that the sensor is told these gains but does
> not apply them - which the choice of name is trying to convey.
> 
> Some sensors need to know these numbers for the processing that they
> perform. Here I'm thinking in particular of so-called "quad Bayer"
> (also sometimes "tetracell") sensors that have a special read-out mode
> that converts the non-standard Bayer pattern into a standard one, also
> at full resolution.
> 
> Sensors of this type are becoming quite common on cell phones where,
> for example, a 48MP sensor may be able to deliver multiple exposures
> at 12MP (for HDR processing perhaps) but they may also have a mode as
> described above where they can generate a standard Bayer output at
> 48MP. This processing works better - we might expect less colour
> aliasing? - when the sensor knows what values correspond to "white".
> 
> One question in my mind is whether it's worth having a control for
> each green channel. The sensor I'm currently looking at only wants a
> single green gain, but perhaps it's one of those instances where it
> would be annoying to put in a single gain and discover, sometime
> later, a sensor that wants both. Opinions on the matter always
> appreciated!

I think I would like to see this series in combination with an actual
sensor driver + ISP that uses them.

I am a bit concerned about the fact that the units are sensor-specific,
so how would an ISP driver be able to set them in a sensor-independent
manner? It seems that this would require knowledge about the sensor
internals, which is something you want to avoid in a ISP driver.

Perhaps this should be a multiplication factor instead? I.e. if the
value is X, then the ISP calculated red as the original red value times
(X / 100). So if X = 212, then the red gain factor is 2.12.

It's probably best to have two controls for green IMHO.

Regards,

	Hans

> 
> Thanks very much and best regards
> 
> David
> 
> David Plowman (2):
>   media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAIN_XXX controls
>   media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAIN_XXX controls
> 
>  .../media/v4l/ext-ctrls-image-source.rst      | 28 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  4 +++
>  include/uapi/linux/v4l2-controls.h            |  4 +++
>  3 files changed, 36 insertions(+)
> 

