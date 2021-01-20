Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184822FCE73
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387694AbhATKmZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:42:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38970 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728546AbhATKIH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 05:08:07 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF122813;
        Wed, 20 Jan 2021 11:07:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611137244;
        bh=fKEom3Dk6qQrh07LhsoTg6Y9oKVyFfBUEUUiB2LINeE=;
        h=Subject:To:References:Reply-To:From:Date:In-Reply-To:From;
        b=UePyYrqUq2Dj5yxzmkLkGPm3rs5egAfJ7MgWJH5nyXxzdqVh08JMepe8t8VDawkcO
         zMJZ44vuooqp7zfftqmrnUp6ubPdT48O7MQ69mafuiqKK5CAidxZ24EolgHJrWDPWG
         HH5bfkZ8mQxxfoz/OI5NYBXmV9N8c3xHaiYiJeak=
Subject: Re: V4L2 logging for multiple streams
To:     Fritz Koenig <frkoenig@google.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <CAMfZQbzay0+tyYvZmF_L=iYfp+F02iz3qz=a=J1Yuf55P=RebA@mail.gmail.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <211ad9f0-f888-61dc-656f-10c1c6c97aad@ideasonboard.com>
Date:   Wed, 20 Jan 2021 10:07:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMfZQbzay0+tyYvZmF_L=iYfp+F02iz3qz=a=J1Yuf55P=RebA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fritz,

On 16/01/2021 04:33, Fritz Koenig wrote:
> Hi,
> 
> I'm trying to sort some issues with regards to decoding multiple
> streams at once.  Logging can be helpful with messages like this:
> 
> [105188.500450] video2: VIDIOC_STREAMOFF: type=vid-out-mplane
> 

The type is telling you useful information there, is that what you are
after?

> but when I have:
> 
> [105188.498697] video2: VIDIOC_STREAMOFF: type=vid-out-mplane
> [105188.498715] video2: VIDIOC_STREAMOFF: type=vid-cap-mplane
> [105188.499116] video2: VIDIOC_UNSUBSCRIBE_EVENT: type=0x5, id=0x0, flags=0x0
> [105188.500450] video2: VIDIOC_STREAMOFF: type=vid-out-mplane
> [105188.500467] video2: VIDIOC_STREAMOFF: type=vid-cap-mplane
> [105188.500611] video2: VIDIOC_UNSUBSCRIBE_EVENT: type=0x5, id=0x0, flags=0x0
> [105188.501879] video2: VIDIOC_UNSUBSCRIBE_EVENT: type=0x5, id=0x0, flags=0x0
> [105188.502276] video2: VIDIOC_STREAMOFF: type=vid-out-mplane
> [105188.502331] video2: VIDIOC_STREAMOFF: type=vid-cap-mplane
> 
> I can't tell which stream VIDIOC_STREAMOFF is associated with.  Is
> there a logging option that I'm missing that would help indicate which
> stream that ioctl is associated with.

The type expresses if it's from an output queue or a capture queue.

  type=vid-out-mplane : Output queue
  type=vid-cap-mplane : Capture queue


That's not so helpful/useful on the UNSUBSCRIBE_EVENT lines though, but
your specific request is regarding STREAMOFF.

I hope that helps you read the logs a little.

--
Kieran
