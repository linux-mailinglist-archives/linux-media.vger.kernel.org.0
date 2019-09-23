Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3196BB784
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 17:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfIWPHq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 11:07:46 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:59419 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726135AbfIWPHq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 11:07:46 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id CPwCiyENIKKNGCPwFimXkN; Mon, 23 Sep 2019 17:07:44 +0200
Subject: Re: [RFC PATCH v2 0/7] media: v4l2: Add extended fmt and buffer
 ioctls
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <m.chehab@samsung.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com
References: <20190404081700.30006-1-boris.brezillon@collabora.com>
 <9d53f065-da2c-9ab9-5e97-dbd48237d41e@xs4all.nl>
 <20190923164054.59792271@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ea8d4a53-ce8b-848e-dbcf-443bb164ce89@xs4all.nl>
Date:   Mon, 23 Sep 2019 17:07:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923164054.59792271@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfC9qNWCZdPg0RSRoIK81k41ZgzTwUUQGxiMuXAUj++AZgvgz6mv34JKAI3xaYIucwrEoK23h+NXptPCU94h48IVCuS7dgHjUygBj0QSlUW+ZX+2w99bP
 VoD7ocEFVJIsFppSA8h6fjyYVohQ8gxprm1kXF+1HODgWNy2X60ZSeWzJw+aoRiyE+7Y/2Wzud320xaUA0wKi+e/uSaQEWQ5GFASkatN+akLWlJV9gtlM4Oi
 KaPyI734b4a6TS+za22rnPKUFatGq9kRO5gBoUuTZHBLLcxnEb+Z6cKIks7ImkrmI7l2u21/f9LJCkFfwctpI52l/uNwbjOdFFFgAjztA0EFWbBKV8bWC2GB
 YKv0pQDQpTlkiEpVthpgTz7E9WIyDtXwMeAndv4QcjwRWV73PpnXyAd1d68wVcI/KE2T5KJw8B80ZooZ2nGvOTkEge380LzQlfUvFLgCG6KqPD/r4sU9TfNE
 oeWOLrbjL4U3XwRiAnyeXPM0dgOnGImaeUKOK94RhnSnzTsZ/utAtEc1igk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/23/19 4:40 PM, Boris Brezillon wrote:
> On Mon, 23 Sep 2019 13:41:07 +0200
> Hans Verkuil <hverkuil@xs4all.nl> wrote:
> 
>> Hi Boris,
>>
>> On 4/4/19 10:16 AM, Boris Brezillon wrote:
>>> Hello,
>>>
>>> This RFC follows the discussion started by Hans [1] a few months back.
>>> It does not try to address all the problem reported in this thread but
>>> instead focuses on the FMT and BUF(S) ioctls.
>>>
>>> Note that my primary goal is to unify handling for multiplanar and
>>> singleplanar formats and extend things to support the "single dmabuf
>>> storing all pixel planes" issue.
>>>
>>> This version received a bit more testing than the previous one (added
>>> new tests to v4l2-compliance [2] to make sure EXT ioctls work as
>>> expected and also checked that !ext -> ext wrappers work correctly by
>>> running the old tests). Note that I'm not planning to post those
>>> v4l-utils patches on the ML until we've settled down on the userspace
>>> API, unless I'm explicitly asked to do so.
>>>
>>> Right now I'm focusing on the case I was primarily interested in:
>>> single dmabuf storing all pixel planes (each being at a different
>>> offset), and it seems that patching the VB2 core to support that is
>>> not a trivial task.
>>>
>>> So here are a few questions for V4L/DMABUF experts:
>>> - Can the same dmabuf be mapped several times. I think it's okay apart
>>>   from the extra/needless time spent doing cache maintenance
>>>   operations, but there might be issues if an IOMMU is involved
>>>   (duplicate mappings?). If it's not okay, then we need to find a
>>>   solution to only attach/map the DMABUF once when it's used for
>>>   several planes (this is what I tried to do here [3], but I'm not
>>>   entirely happy with the implementation and started to investigate
>>>   another approach here [4]).
>>> - How should we pass the offset to drivers that were previously using
>>>   the get_cookie() (or the dma_sg wrapper) to retrieve an sg table.
>>>   Adding the offset to the dma_addr or vaddr for vmalloc or dma-contig
>>>   case can be done in the core, but for an sg-table it's a bit more
>>>   complicated. Should drivers access this piece of information
>>>   directly from vb2_plane->dbuf_offset? And in that case, how do we
>>>   make sure drivers don't simply ignore the offset and assume it's
>>>   always zero? 
>>>
>>> Few words about the feedback I got from Brian and Nicolas on my v1:
>>>
>>> - modifier field has been moved to v4l2_ext_format as suggested
>>> - v4l2_timecode is still not present in v4l2_ext_buffer, but can be
>>>   added back thanks to the extra reserved space
>>> - the ENUMFMT is left as is for now, because I think we want Maxime's
>>>   work on DRM/V4L format unification to land before reworking the
>>>   ioctl (exposing extra info about the format and not only the 4CC
>>>   code?). That also means that there's currently no way to know which
>>>   modifiers are supported
>>> - EXT_FMT/EXT_BUF capability flags to detect whether new ioctls are
>>>   supported or not have not been added yet  
>>
>> Can you post a v3, rebased on top of our current master branch? No other
>> changes needed, just a rebase.
> 
> Ok, I'll try to do that next week.
> 

Great. Then it's also best to wait until v5.4-rc1 has been merged back
into our tree.

Regards,

	Hans
