Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D34C23316
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 13:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730773AbfETLzk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 07:55:40 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:38685 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730534AbfETLzk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 07:55:40 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id SgtDhrW8y3qlsSgtGhjXWA; Mon, 20 May 2019 13:55:38 +0200
Subject: Re: Bug#929262: libv4l-dev: pac207 cam(s) give frame decode errors
To:     Gregor Jasny <gjasny@googlemail.com>, folkert@vanheusden.com,
        929262@bugs.debian.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <155834073601.757.12828508994068038463.reportbug@scrollert>
 <c2d8869f-4ca5-7f70-1c0e-44d4c1e094f4@googlemail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d5e3d25f-4df3-9aee-a212-4ad64d3c1fd7@xs4all.nl>
Date:   Mon, 20 May 2019 13:55:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c2d8869f-4ca5-7f70-1c0e-44d4c1e094f4@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJ//8h6RrW+1uTIm9LdLoMy4IWti/rDUommRVIBEMl46SvXh9SE19SbLGTcLFmy+XwklRmKtWJR5lfTOj8yTs+0psQGGdJCUBFeTuX+8GLRSJAdoUEBM
 YNP97tCTKGY4b/ZlnQwcD22lK3yYKXvuKLrAXFnhSwgR/JvQTUy//MN9FunjGOGSDEZsEp8onJj7U9r8tDQbsmM5gs4604i6G1rge6Cq3dBr8Co7o570BzKU
 RzMUP5yOZiKJLC61CHIClmCDDGenKs1Vwbxcgj55kH0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/20/19 1:38 PM, Gregor Jasny wrote:
> Hello,
> 
> On 20.05.19 10:25, folkert@vanheusden.com wrote:
>> Trying to get a pac207 camera to work with constatus.
>>
>> 2019-05-20 10:22:34.864900  INFO constatus [1-1] source v4l2 thread started
>> libv4l2: error got 4 consecutive frame decode errors, last error: v4l-convert: error unknown pac207 row header: 0x0000
>> 2019-05-20 10:22:35.597949 ERROR cs:src_v4l2 [1-1] VIDIOC_DQBUF failed: Input/output error
>> ioctl(VIDIOC_QBUF) failed
>> errno: 22 (Invalid argument)
>>
>> To verify that it is not a constatus-problem I also tried a raspberry-pi camera via its video4linux-interface and that works fine.
> 
> According to the Linux Kernel Maintainers file the device driver is 
> maintained by Hans, which I CC'ed on this bug report:
> 
> GSPCA PAC207 SONIXB SUBDRIVER
> M:	Hans Verkuil <hverkuil@xs4all.nl>
> L:	linux-media@vger.kernel.org
> T:	git git://linuxtv.org/media_tree.git
> S:	Odd Fixes
> F:	drivers/media/usb/gspca/pac207.c
> 
> Did your camera ever work on another Kernel, CPU architecture, or 
> v4l-utils version? Do you have anything suspicious in dmesg output?

I strongly recommend that you buy a new webcam. This is ancient hardware.
Even the cheapest UVC webcams you can buy today will have far better
quality than a pac207. If you really, really need this to work, then I
need the full dmesg output and you also need to check if you can reproduce
this issue with the v4l2-ctl command:

v4l2-ctl -d /dev/videoX --stream-mmap

(it keeps capturing frames until you press ctrl-X)

I should have one of these webcams, but won't be able to test until next
week.

Regards,

	Hans
