Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EEBFBE59F
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 21:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732040AbfIYT0t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 15:26:49 -0400
Received: from jp.dhs.org ([62.251.46.73]:60892 "EHLO jpvw.nl"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728788AbfIYT0t (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 15:26:49 -0400
X-Greylist: delayed 970 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Sep 2019 15:26:48 EDT
Received: from localhost ([127.0.0.1] helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1iDCgN-00049q-P1; Wed, 25 Sep 2019 21:10:35 +0200
Subject: Re: regression(?) in cxusb
To:     Frantisek Rysanek <Frantisek.Rysanek@post.cz>,
        Vincent McIntyre <vincent.mcintyre@gmail.com>,
        linux-media@vger.kernel.org
References: <CAEsFdVN99i0QV7eCVtxPYKcpjJTC=k+U7eoDQvhGGKKQyM5vqQ@mail.gmail.com>
 <CAEsFdVOwXiWTvNRPUiPhv4YL=kDA_Ft-ra_gLac2RuyOrwxUvg@mail.gmail.com>
 <5D8BAF97.227.3E39A624@Frantisek.Rysanek.post.cz>
From:   JP <jp@jpvw.nl>
Message-ID: <ec794150-9b37-4651-9a65-52a74e1ab489@jpvw.nl>
Date:   Wed, 25 Sep 2019 21:10:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5D8BAF97.227.3E39A624@Frantisek.Rysanek.post.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 9/25/19 8:19 PM, Frantisek Rysanek wrote:
> On 25 Sep 2019 at 20:31, Vincent McIntyre wrote:
>> Hi
>>
>> I am seeing strange behaviour with the dvb-usb-cxusb.ko module.
>> Things have been working fine until just recently.
>>
>> Target system is Ubuntu 16.04 LTS on amd64.
>> I am using their 'hwe' kernel series.
>>
>> Symptoms:
>>   * linux-image-4.15.0-58-generic + media-build from a few weeks ago works
>> fine
>>   * linux-image-4.15.0-64-generic without media-build works fine
>>   * linux-image-4.15.0-64-generic + media build fails
> ...
>> insmod
>> /lib/modules/4.15.0-64-generic/kernel/drivers/media/v4l2-core/v4l2-common.ko
>> modprobe: ERROR: could not insert 'dvb_usb_cxusb': Exec format error
>>
> Dear Vincent, I'm not a maitainer, just a fellow user who happens to
> keep an eye on this list.
> Excuse my somewhat off topic response:
>
> Would you consider compiling a fresh kernel?
> What hardware are you trying to use with the cxusb driver?
>
> The linux-media subsystem is pretty vibrant and fast-paced,
> fairly serious changes happen between vanilla kernel releases.
> In that context, 4.15 sounds oldish...
>
> In the recent past, I recall support for the Mygica "T230C v2" (aka
> T230C2) moving from cxusb.c to dvbsky.c, plus a debate about
> one or two unrelated fixes to that code (maybe one of them was a
> revert of a previous patch). I recall that one of the motivations for
> T230C2 to move from cxusb.c to dvbsky.c was better support for its IR
> sensor.
> I believe this stuff will be present in Linux 5.4 (just pulled into
> the vanilla master, within the merge window that's just now open),
> possibly hasn't made it into 5.3.
> Meanwhile, the directory structure of the source code keeps receiving
> "janitoring" changes etc...
> => I suggest that you test some newer kernel, possibly betatest some
> 5.4-pre/rc to see if those make a difference (if you cannot wait a
> few weeks for 5.4.0 release). Or try some 5.2 / 5.3 if you believe
> that the recent changes to cxusb/dvbsky are irrelevant to your HW.
>
> Frank Rysanek
>
>
Hi Vincent, Frank,

  Could be Ubuntu specific or quite possibly some corruption on local 
system.

Jan Pieter.
