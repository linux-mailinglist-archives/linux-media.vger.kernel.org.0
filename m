Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F7C24D204
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 12:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbgHUKMd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 06:12:33 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:60673 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727791AbgHUKMc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 06:12:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 9428ktxFsuuXO9429kqCEW; Fri, 21 Aug 2020 12:12:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1598004749; bh=/r2O0JFEUxqJd2/tSjylCfQCSVud3VL6unTLsbJ8osE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=gzxuQ0QR0fRTz0sVxvhHXbC+x9exVHX659bjIS66c7PnNEtyd6qerZbCBqKFX05CT
         hkVRdcpMqFgkPW6FISV4FDPYMy6Il990MCoDb8yWPpNvv4MNpkDDR+aiwa6OZbb/c9
         fXZ3lHWdwId8m7R7vSogOvKfAUGNtHTogUAmKB4FEAiAHkT9j9xmYBHn8JSR/dRxFv
         tIYWOySXrLWWz6bd2CQ+owF+RAeWQ/3Dm7CKspgzVPl3E0wyYHrKusDcPpatv6lLUH
         ysKObsv9OfRNP6KeJwv2IzvZGJzWgTKSWEzMILJPJHgpJ37nbbi8ALHnLfzLzbVH6y
         lNRnyBeNQzGhw==
Subject: Re: [Linux-kernel-mentees] [PATCH] v4l2-tpg: Fix global-out-of-bounds
 read in precalculate_color()
To:     Peilin Ye <yepeilin.cs@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
References: <20200810050532.640075-1-yepeilin.cs@gmail.com>
 <774bcf2d-c8eb-086a-3569-c7e530d8a63d@xs4all.nl>
 <20200821094813.GB480216@PWN>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <eab860f3-5520-72cd-3bb1-f990f7f9ea6f@xs4all.nl>
Date:   Fri, 21 Aug 2020 12:12:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821094813.GB480216@PWN>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA51CrE3nRlCkBlPcn36s1XLf6uyxMROGsFL8NrhdAPFcp4HpESSGEspSg3O1UzdA4UP/rdQYypoyqy337WLUMv1IaEgP/JB1OQBHtrMAZvQBS77Xm2X
 a0UUFtXycB2zooXVrlZFiiYa0n3YM3/i2Fd1ClGeGYSY32U5uVrhVUozk5cAxl0IxOM6A9mGCRVkNbgRWMnulWOVBV7+9e59WVj0UryGMDfb2UoYseBap/s3
 MSFtVZkLrHPGfRp9gMlonBkl9znRrTwXs7vWQ74IwMQOIizSSOyDS1ZKdxYBC6DUav3ze4XScaQ29GkQUkKcn7nM90gb6O07xJ+t2yHbTwv0Mpz1v2y6DAid
 nNxtyyrD1NfjGDVrcPWTpnsc5eBqjg7sjV9tznwQDeOgrpNrN5fGbd0DptH6uVFd3JQVuKROdJBdUzdYH6DjBL+IH9Atxh9RnBnF1BWgAP1mLspumU0UdrWr
 fscTb3xwltnqG9T9EQkQ1g2vy8Sfaipj9ejFLg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/08/2020 11:48, Peilin Ye wrote:
> Hi Mr. Verkuil,
> 
> On Wed, Aug 19, 2020 at 04:26:28PM +0200, Hans Verkuil wrote:
>> Hi Peilin,
>>
>> On 10/08/2020 07:05, Peilin Ye wrote:
>>> precalculate_color() is reading out of `sin` since `tpg->hue` is not being
>>> properly checked. Fix it. `cos` is safe, as long as `tpg->hue` is higher
>>> than or equal to -192.
>>
>> Thank you for this patch, but there is something I don't understand, namely
>> just *how* tpg->hue can be out-of-range.
>>
>> From what I can see vivid sets hue via tpg_s_hue() when the V4L2_CID_HUE control
>> is set. But that control has a range of -128...128, so ctrl->val should always be in
>> that range.
>>
>> I would really like to know 1) what the value of tpg->hue actually is when it goes
>> out of range, and 2) who is changing it to that value. Can you do a bit more digging?
> 
> The value of `tpg->hue` was -20551. It came from the userspace, see the
> "\xb9\xaf" on line 500 of the reproducer:
> 
> https://syzkaller.appspot.com/text?tag=ReproC&x=14b49e71e00000
> 
>   NONFAILING(memcpy((void*)0x20000200, "/dev/video6\000\000", 13));
>   res = syscall(__NR_openat, 0xffffffffffffff9cul, 0x20000200ul, 2ul, 0ul);
>   if (res != -1)
>     r[0] = res;
>   NONFAILING(memcpy((void*)0x20000140,
>                     "\x4d\x43\x66\x34\xfd\x89\xb9\xaf\x0d\x59\xa2\x83\x4c\xfd"
>                      ^^^^    ^^^^    ^^^^    ^^^^^^^^
>                     "\x3e\x64\x7c\x96\xcd\x59\xf2\x3a\x18\xa3\x81\x49\x22\xc0"
>                     "\xc1\xbf\x02\xa5\x50\x5f\xcb\x48\x92\x0e\xf3\xdc\xff\x85"
>                     "\xb7\x84\x21\xab\xef\x31\x3d\xb1\xb6\x5d\xbf\x07\x8e\xee"
>                     "\x5e\x7c\x73\x32\xf4\x9d\x1e\x62\x6b\x6a\xa0\x74\x73\xe6"
>                     "\xca\x1b\xdb\x7a\xca\x76\xd8\x37\xb8\xd9",
>                     80));
>   syscall(__NR_write, r[0], 0x20000140ul, 8ul);
> 
> I guess the root cause is a race condition in the vivid test driver,
> which completely corrupted `tpg`. I see bytes like "\x4d", "\x66" and
> "\xfd" around `tpg->hue`, too.
> 
> The reproducer does two things: the above write() on /dev/video6, and a
> preadv() on /dev/video3:
> 
>   NONFAILING(*(uint64_t*)0x20000800 = 0x20000000);
>   NONFAILING(*(uint64_t*)0x20000808 = 0x1f);
>   NONFAILING(*(uint64_t*)0x20000810 = 0);
>   NONFAILING(*(uint64_t*)0x20000818 = 0);
>   NONFAILING(*(uint64_t*)0x20000820 = 0);
>   NONFAILING(*(uint64_t*)0x20000828 = 0);
>   NONFAILING(*(uint64_t*)0x20000830 = 0);
>   NONFAILING(*(uint64_t*)0x20000838 = 0);
>   NONFAILING(*(uint64_t*)0x20000840 = 0);
>   NONFAILING(*(uint64_t*)0x20000848 = 0);
>   syscall(__NR_preadv, r[1], 0x20000800ul, 5ul, 0ul);
> 
> I commented out this preadv(), then the reproducer didn't cause any
> crash. Unfortunately I don't know the code well enough in order to
> figure out exactly why...At this point of time I'd like to send you an
> v2 as you suggested, it should work as a mitigation.

Arrgh! I know what this is. /dev/video6 corresponds to the Metadata output
device of vivid, and that metadata format sets brightness, contrast,
saturation and hue:

struct vivid_meta_out_buf {
        u16     brightness;
        u16     contrast;
        u16     saturation;
        s16     hue;
};

vivid_meta_out_process() calls tpg_s_* functions to set these values. But
this is wrong, it should set the corresponding V4L2 controls instead since
calling these tpg_s_* functions bypasses all range checks. It also will
not update the controls themselves, so they are out-of-sync with the actual
values. I.e. the test pattern generator uses different values compared to
the values in the controls.

So two patches are needed:

1) a patch for include/media/tpg/v4l2-tpg.h where tpg_s_hue will clamp the
hue value to the valid range. This to prevent anyone else from setting invalid
hue values in the tpg.

2) a patch for drivers/media/test-drivers/vivid/vivid-meta-out.c where,
instead of calling the tpg_s_* functions in vivid_meta_out_process(), it
calls instead:

        v4l2_ctrl_s_ctrl(dev->brightness, meta->brightness);
        v4l2_ctrl_s_ctrl(dev->contrast, meta->contrast);
	etc.

Do patch 2 first and test with syzkaller to check that by going through the
controls this issue is resolved. Since with that approach the tpg should
always get valid hue values.

Regards,

	Hans

> 
> Thank you for the suggestion!
> 
> Peilin Ye
> 

