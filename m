Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 302C611E47A
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 14:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbfLMNVc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 08:21:32 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:38769 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726386AbfLMNVc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 08:21:32 -0500
Received: from [IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478]
 ([IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fksoihjoeGyJwfkspi1ER9; Fri, 13 Dec 2019 14:21:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576243289; bh=7EgWnmlezgqj/BVCt+K0pvVbA4FXbio5mhVaiZ5dfQs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=AdH5iv0YH+McIOrsn1DAaopGdWufZ29ioADupUDcGxWk1oLktScwdR5k9bi0JYjtg
         OEJK6H7Fs4R+OjlFrPBN4D0PRNP5Wlu8iyhe2rW2cTOe9a5r07vHBWpV+1CiGFxEit
         FDmKC4Ad2ub/oF4hqHsgOFOlZVxT1VPQmEfUvBA6OpYc84sg2ABsUu5DDgjqrLAGqi
         9P++BEXVdoVvRdzUPw/lz2ko24IEbZDeawl3d5bm1HVwMbvP/QFwC/h3KjwxcDEXKd
         dGTRPc7vl+n5+2qN5eSI/APzP226yXtfpxo8ojhRe2fG1eTM4qjmXWj6nUZtNOy5S3
         GnxofjNCHZf+w==
Subject: Re: [PATCH v3 2/4] media: vicodec: use v4l2-mem2mem draining, stopped
 and next-buf-is-last states handling
To:     Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Maxime Jourdan <mjourdan@baylibre.com>
References: <20191209122028.13714-1-narmstrong@baylibre.com>
 <20191209122028.13714-3-narmstrong@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0eb52de8-97a9-40cf-a926-262b1ecdc3e9@xs4all.nl>
Date:   Fri, 13 Dec 2019 14:21:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191209122028.13714-3-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCTmMw6UMTjLOJUPkCDlqks83iiillHmwdMzsgRBSoe9Hv36xB2m2JCtI2vE2e4HNUGyqznMLbJoF3O9tW1gv12rxYmLfCQHCIdKdX/s71xthDM0vOuU
 HptJYccltFJSVGvxkzTfO99gMJZGZHBu5Vaz88vywlnqQyIHp7vUCxeCldEda8taB9ZWImjzwda5M8IGmaVSwhVj/RtSopo8exf74kxYjqitarmaTOAGUEXy
 vrzJ4cE+GJJJMmriatdi6aScio5XLtqjkI02MJ3d+f/ClZOULw85BjGx+ORfwXifQSucKlUlhu/xQzwlpjCEAGZXUUFdP4dUcUqtZXKVCsKq6dC7S9BG2fib
 U2B6nyFsPBXuSCSUEXYE6U+PLxXEOBxttOov6+KYCDYkbns0RFk6rnSCz50+rb1qFMCepkIn8mY+WPW+tp+kCXYaMTbI7Wndg8mxwSJ5BgIxf+ZL3TiWviKE
 mphrMYzQ/VJUOTuejb9Z9e5J+hETayO1cXafObf1FnWicRf6w1sQNFZY5t2uDbKz4tzh1UjYQ+YeTUf1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/9/19 1:20 PM, Neil Armstrong wrote:
> Use the previously introduced v4l2-mem2mem core APIs to handle the drainig,
> stopped and next-buf-is-last states.
> 
> With these changes, the v4l2-compliance still passes with the following
> commands :
> # v4l2-ctl --stream-mmap --stream-out-mmap --stream-to-hdr out.comp --stream-from in.yuv
>>>>> <><><><><><><><><><><><><><><><>< 15.53 fps
>  15.53 fps
>> <><><><><><><><><><><><>< 13.99 fps
>  13.99 fps
>> <><><><><><><><><><><>< 13.52 fps
>  13.52 fps
>> <><><><><><><><><><><><>< 13.41 fps
>  13.41 fps
>> <><><><><><><><><><><><>< 13.21 fps
>  13.21 fps
>> <><><><><><><><><><><>< 13.09 fps
>  13.09 fps
>> <><><><><><><
> STOP ENCODER
> <<<
> EOS EVENT
> 
> # v4l2-compliance --stream-from in.yuv -s
> v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits
> [...]
> Total for vicodec device /dev/video0: 50, Succeeded: 50, Failed: 0, Warnings: 0
> 
> The full output is available at [1]
> 
> # v4l2-compliance -d1 --stream-from-hdr out.comp -s
> v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits
> [...]
> Total for vicodec device /dev/video1: 50, Succeeded: 50, Failed: 0, Warnings: 0
> 
> The full output is available at [2]
> 
> No functional changes should be noticed.

Ah, unfortunately there *are* functional changes.

There is a (much) more extensive test that is done in the test-media script.

In v4l-utils, go to contrib/test. Now run (as root): test-media vicodec

This test now fails on some tests for the stateful decoder:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
                fail: v4l2-test-buffers.cpp(943): ret == 0
                fail: v4l2-test-buffers.cpp(1353): captureBufs(node, node_m2m_cap, q, m2m_q, frame_count, pollmode, capture_count)
        test MMAP (select): FAIL
                fail: v4l2-test-buffers.cpp(951): ret == 0
                fail: v4l2-test-buffers.cpp(1353): captureBufs(node, node_m2m_cap, q, m2m_q, frame_count, pollmode, capture_count)
        test MMAP (epoll): FAIL
                fail: v4l2-test-buffers.cpp(943): ret == 0
                fail: v4l2-test-buffers.cpp(1607): captureBufs(node, node_m2m_cap, q, m2m_q, frame_count, pollmode, capture_count)
        test USERPTR (select): FAIL
                fail: v4l2-test-buffers.cpp(943): ret == 0
                fail: v4l2-test-buffers.cpp(1761): captureBufs(node, node_m2m_cap, q, m2m_q, frame_count, pollmode, capture_count)
        test DMABUF (select): FAIL

I also see this:

cmp: EOF on /tmp/tmp.7KAXKAIkVZ/raw.yu12.1280.24 after byte 23500800, in line 1

which shouldn't be there either.

I can recommend the test-media script: it can test all the virtual drivers and it is
part of the daily build to check for regressions.

Regards,

	Hans
