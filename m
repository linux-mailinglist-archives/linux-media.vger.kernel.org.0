Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4235B359C59
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 12:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232854AbhDIKwf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 06:52:35 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:37595 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231127AbhDIKwf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 06:52:35 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id UokLlM9uD43ycUokPlUzwj; Fri, 09 Apr 2021 12:52:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617965541; bh=vihDzBit1BDvDULJG2hNzVWt7tmMyzLtk7VHrNrLXlg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DfvqWwQJDi4BHyyd1Jzcp9wZeE7FGb2R+Lhc3gG38PNlMtiNEFSsGmBAwoyVw2O+3
         /eTmDzgXktCW72zHuXbycFxAZs6ykuHqhiUHalX3EjHsZFUfL92DvAGF+49Wyqu5hG
         o9+OoQD8b4lKByPRkbcV6r8CEayQb7iPVLJZkWf814fRJ3iZT3w0OLst0XNmfXvZml
         xmv14Co8uVlHA1NQ/s3bxJdwG22wqHEy7kKV8PjUAjTGVJzi5xgou2ZSuOUnampURL
         AWilHI3oWqH6Ss6n9JgmTG5pYT1z+xARv0XeRX1TutRKoAG2yzO0fGXAoO/gGD/mXD
         ZhoYC4XAl3rHA==
Subject: Re: [RFC] media: v4l2: Variable length controls (for h265 slice
 headers)
To:     John Cox <jsc66@cam.ac.uk>, linux-media@vger.kernel.org
References: <o8sj5g9fq0jkganestl771ld2dqrp2fqu7@4ax.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8ff86418-5fa3-e1ae-51e4-b10788be7991@xs4all.nl>
Date:   Fri, 9 Apr 2021 12:52:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <o8sj5g9fq0jkganestl771ld2dqrp2fqu7@4ax.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIawizOwEwrW9mV+p7Cb5YjCdlvZKGaNiv25kABcMxqcwXtfBK/m/pfCyaPpc9Q02YOhj/uuZLpqYR3lkmsNGcig7jddWJ8u9AlYzEmiPRrN/hAVlnMP
 vsYg/y1rsk+MTOVV6v3t1UgJL/eaQr4t8yMvjXpnrfj1VQkWsWsPrHPHkX/skHu9iu1Zbg/Al9lLgsm8dUuihLTZOAzF8uy489xiGcRGxsszzy9HLcYWsS9K
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi John,

On 23/03/2021 15:12, John Cox wrote:
> Hi all
> 
> I am developing a H265 V4L2 stateless decoder. After some
> experimentation it looks like the best way to achieve performance would
> be to submit bitstream data for an entire frame in a single buffer with
> an array of slice headers that point into it. The number of slices in a
> frame can be very variable, often there will be just one, in nearly all
> cases there will be less than 16 but the worst case could be hundreds
> (actually theoretically it could be thousands but I'm prepared to, and
> it is probably sensible to, reject any stream that looks like this).
> 
> Given the large range of possible array sizes a (large) fixed length
> array is very wasteful and probably slow in nearly all cases. As it
> stands V4L2 has no variable length structure so there is a problem here.
> My experience with v4l2 controls in minimal so trying to add a variable
> length array control myself seems brave.  Luckily (in other channels) I
> was told "Hans offered multiple times to implement variable array
> controls himself, he just needs someone to send an RFC with details on
> what's needed." so here I am.
> 
> So as a suggestion for the interface:
> 
> From the user point of view:
> 
> Only the last dimension of the array can be dynamic (like a C array "int
> a[10][15][];")  Otherwise we add a lot of complexity.

I would limit this to single dimensional arrays for now.

I think it is the first (not the last) dimension that can be dynamic: if
you want 8 3x3 matrices, then you would set dims to [8][3][3]. So a variable
length array of 3x3 matrices would have the first dimension as the variable
one.

> 
> VIDIOC_S_EXT_CTRLS
> In v4l2_ext_control the user can pass in any size that is a multiple of
> the element size.  If greater than the max then .size is set to the max
> by the ioctl on return.
> 
> VIDIOC_G_EXT_CTRLS
> On entry .size contains the buffer size to receive the values and on
> return it contains the size actually wanted - if the buffer can contain
> the data then it is also the number filled in.
> 
> VIDIOC_QUERY_EXT_CTRLS
> Add a flag to indicate variable length and either use .maximum/.minimum
> or some of the currently reserved structure to give max/min sizes

dims[0] can set the maximum size of the array.

> 
> From the driver point of view - frankly anything will do as long as I
> can find out how many headers I have. I think it is probably a good idea
> to dynamically allocate the storage for such an array rather than having
> a fixed size block on the end of the ctrl structure to avoid unnecessary
> overallocation.

The hevc slice structures are quite large, so it definitely has to be a
dynamic allocation.

> 
> I imagine that I've missed many important details in the sketch above,
> but probably good to start the discussion and Hans, am I trying to take
> you up on an offer you didn't actually make?

So the uAPI part is fairly simple, the biggest problem is in the internal
implementation. As the control framework becomes ever more complex (esp.
with the requests support) it is getting harder and harder to add new features.

I think that this might be a good time to start refactoring code, but for
that I also need to add better testing in v4l2-compliance of esp. requests.

It will also make it more time consuming, but I don't feel comfortable
to continue hacking on the code without doing a cleanup first.

Regards,

	Hans
