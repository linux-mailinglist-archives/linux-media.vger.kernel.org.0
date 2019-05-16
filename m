Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80FB51FFB7
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 08:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfEPGlW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 02:41:22 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:47287 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726429AbfEPGlW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 02:41:22 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id RA4qhw0ew0YQeRA4uhjBwF; Thu, 16 May 2019 08:41:21 +0200
Subject: Re: media/master v4l2-compliance on vivid: 236 tests, 0 regressions
 (media_v5.1-2-16-gfc8670d1f72b)
To:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
References: <5cdc62d6.1c69fb81.31322.a901@mx.google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3c4680f6-b51b-5b91-72c9-7c63b3ef3643@xs4all.nl>
Date:   Thu, 16 May 2019 08:41:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5cdc62d6.1c69fb81.31322.a901@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOi6e/aBOpiVATORQsVRbHxUxYMQGAyjs3GMSzhij7ZL9hXYsVj0l9AUy3GuYWr1yWFVCjAXXS/u62Zf1kPU8d214DqjK3srnOikAysxnH01Id40bqc2
 N8SSYJGigc7EYidXCnm0hHtnpAvkoVYPghkYGIz2AhFUn7JWJh9wu7gAcQlmBqQJMxTX/hs3vT0SpCul6mXIk64ht+AjwWmRgM0K4KHTx27amnvrJfQKm1//
 pKZIY4J5QgMNiQLLR6/qqS7TV6fJzBTY95lAcj52ZIY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guillaume,

I have a few questions/suggestions:

On 5/15/19 9:04 PM, kernelci.org bot wrote:
> media/master v4l2-compliance on vivid: 236 tests, 0 regressions (media_v5.1-2-16-gfc8670d1f72b)
> 
> Test results summary
> --------------------
> 
> V4L2 Compliance on the vivid driver.
> 
> This test ran "v4l2-compliance -s" from v4l-utils:
> 
>     https://www.linuxtv.org/wiki/index.php/V4l2-utils

I'd just link directly to the git repo instead of the wiki: https://git.linuxtv.org/v4l-utils.git

You should add the v4l-utils commit that's used to compile v4l2-compliance.
That's important information to have. I assume that this test always uses the
latest version of v4l-utils?

> 
> See each detailed section in the report below to find out the git URL and
> particular revision that was used to build the test binaries.
> 
> 
>   Tree:    media
>   Branch:  master
>   Kernel:  media_v5.1-2-16-gfc8670d1f72b

I assume this is the version of the host kernel, right? Perhaps calling this
"Host Kernel:" would be less ambiguous.

>   URL:     https://git.linuxtv.org/media_tree.git
>   Commit:  fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f
> 
> 
> 1  | qemu                   | arm64 | 118 total: 118 PASS   0 FAIL   0 SKIP
> 2  | qemu                   | arm   | 118 total: 118 PASS   0 FAIL   0 SKIP  

Even if everything was OK, I think it would still be useful to have a link
to the full test report.

Regards,

	Hans
