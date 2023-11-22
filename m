Return-Path: <linux-media+bounces-767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 120A37F42AF
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 10:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43DD51C20AB4
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 09:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95DF58118;
	Wed, 22 Nov 2023 09:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB3D56742
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 09:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB49C433C7;
	Wed, 22 Nov 2023 09:48:31 +0000 (UTC)
Message-ID: <d6685bdc-46af-4260-b166-1eba8b86c86b@xs4all.nl>
Date: Wed, 22 Nov 2023 10:48:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re:
Content-Language: en-US, nl
To: Thomas Devoogdt <thomas@devoogdt.com>, linux-media@vger.kernel.org
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
References: <CACXRmJg4vKSQsXyC15LdQ5A+7Yaf+AaHmQ4sdbXNkZJ05edeWg@mail.gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <CACXRmJg4vKSQsXyC15LdQ5A+7Yaf+AaHmQ4sdbXNkZJ05edeWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/11/2023 10:26, Thomas Devoogdt wrote:
> Hi all,
> 
> 
> I have two questions:
> 
> 1.
> When running v4l2-compliance on a proprietary driver, I get this error:
> 
> ```
> Input/Output configuration ioctls:
> fail: v4l2-test-io-config.cpp(227): fmt.fmt.pix.width >=
> enumtimings.timings.bt.width * 1.5
> fail: v4l2-test-io-config.cpp(386): Timings check failed for input 0.
> test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: FAIL
> ```
> 
> Which brings me here:
> https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-compliance/v4l2-test-io-config.cpp#n227
> 
> ```
> fail_on_test(fmt.fmt.pix.width < enumtimings.timings.bt.width);
> fail_on_test(fmt.fmt.pix.width >= enumtimings.timings.bt.width * 1.5);
> fail_on_test(fmt.fmt.pix.height * factor < enumtimings.timings.bt.height);
> fail_on_test(fmt.fmt.pix.height * factor >=
> enumtimings.timings.bt.height * 1.5);
> ```
> 
> The problem is that the driver supports VIDIOC_S_DV_TIMINGS but is not
> able to apply the specific format just returns the actual timings.
> This is from what I know, not a violation, so I'm not sure what the
> driver should return if it is not able to set a custom timing. Or is
> this check just a bit too strict?

This test enumerates all timings returned by VIDIOC_ENUM_DV_TIMINGS.
All these timings should be valid supported timings. For each returned
timing it calls S_DV_TIMINGS to set it. Then it call G_DV_TIMINGS to
verify that the width and height of the new timings match what was
requested. Apparently that worked, otherwise the test would have
failed there.

Next it gets the new format (G_FMT). The driver must update the format
when the timings are updated. In this case the width of the returned
format is more than 1.5 times the width of the requested timings.
That doesn't sound right.

Your claim that S_DV_TIMINGS can't set the new timings is dubious
since G_DV_TIMINGS apparently returns the new timings correctly.
Also, ENUM_DV_TIMINGS shouldn't return unsupported timings either.

> 
> 
> 2.
> For another driver, I get this error:
> 
> ```
> Input ioctls:
> fail: v4l2-test-input-output.cpp(443): use of deprecated digital video status
> fail: v4l2-test-input-output.cpp(496): invalid attributes for input 0
> test VIDIOC_G/S/ENUMINPUT: FAIL
> ```
> 
> It might be true that setting V4L2_IN_ST_NO_CARRIER is deprecated, but
> is that really an error, not better to just have it as a warning?
> After all, how can userspace know specific details if needed? Perhaps
> checking that V4L2_IN_ST_NO_SIGNAL has also been set is enough, and if
> V4L2_IN_ST_NO_CARRIER is set, but not V4L2_IN_ST_NO_SIGNAL, then it
> might be an error.

The NO_CARRIER, NO_EQU and NO_ACCESS status flags are DVB specific, but this
ioctl isn't used by DVB anymore. I think very old drivers in the past (long
since removed or changed) used this, but new drivers must not use this since
it makes no sense. Note that v4l2-compliance is often more strict than the
V4L2 spec itself: it is meant to ensure that drivers follow best practices.

Note that the error message is not very good: it should say "digital TV"
rather than "digital video". I'll fix that since that's confusing.

Regards,

	Hans

> 
> Thx in advance!
> 
> Kr,
> 
> Thomas Devoogdt
> 


