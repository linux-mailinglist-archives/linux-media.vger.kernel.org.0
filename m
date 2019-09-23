Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B186BAEF3
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 10:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405647AbfIWILP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 04:11:15 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:55977 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390655AbfIWILP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 04:11:15 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id CJR7ivF8BKKNGCJRAikJ2j; Mon, 23 Sep 2019 10:11:13 +0200
Subject: Re: [PATCHv4 0/3] v4l2-core: Add metadata type to vfl_devnode_type
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20190917133647.17533-1-hverkuil-cisco@xs4all.nl>
 <20190920234857.GM12672@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9ae7713a-c76c-cecd-165d-77dfe8eb0be0@xs4all.nl>
Date:   Mon, 23 Sep 2019 10:11:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920234857.GM12672@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNAZ+hvhoV+3gpjDnr1qCT9B4lSf2yqBuKyZhjBWKJFaOQ39CnnuuVE9dlSH67FMWw2i8g+Cr1y2VmUHslo6N5wFlyPpklX2U+leUumfd1e18ywHJijO
 s1QRhuPeSRZqXmGBd079TuAQW0XfqTQPTxH0czg1VFe6xl/aFTV1U4uqP17BZE96/A5j2ZfOD98fYq+wVnsty5yubmpSWOpc2YswjgxlSxmmoTaMvCLv7n0q
 xcgcaqj1lslUk23P9lqlGq5N+EZo2VfcbBtXnnn8n0PcRpxYh7nc0rvG38rQ19F0HAazRHLZ8BYqI9zTxzheRw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 9/21/19 1:48 AM, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Tue, Sep 17, 2019 at 03:36:44PM +0200, Hans Verkuil wrote:
>> This is a follow-up series from Vandana's "[v3] v4l2-core: Add metadata type to
>> vfl_devnode_type" patch: https://patchwork.linuxtv.org/patch/58755/
>>
>> While testing that v3 patch with a patched version of vivid that has metadata
>> capture support, I realized that metadata should be treated the same way as
>> vbi in determine_valid_ioctls(). That makes sense since vbi *is* effectively
>> metadata. So I changed Vandana's patch (hence my Co-Developed-by tag) to
>> correctly validate the ioctls for metadata.
>>
>> I also added two follow-up patches to simplify the SDR code in that function,
>> and to fix the code for v4l-touch devices (too many ioctls were enabled for
>> such devices). I think the final code is easier to read as well.
> 
> Quoting my reply to "[RFC] V4L2 & Metadata: switch to /dev/v4l-metaX
> instead of /dev/videoX]" as it may have fell through the cracks, and I
> don't want this series to be merged without addressing the issue,
> 
> One of the reason [we didn't introduce a metadata video node type] is
> CSI-2 sensors and CSI-2 receivers. A CSI-2 link often carries both video
> and metadata using two different datatypes. From the point of view of
> the CSI-2 receiver or the DMA engines, video and metadata are not
> distinguishable, the CSI-2 receiver receives one stream with two data
> types, demultiplexes them, and passes them to different DMA engines. A
> sensor could send two video datatypes, or even conceptually two metadata
> data types, and this would work the exact same way, with each of the two
> DMA engines capturing data to buffers without caring about the contents.
> Given that the datatype selection happens at runtime, a given DMA engine

'happens at runtime': what decides this? The user-specified topology?
Something else?

Is this documented somewhere?

To my knowledge there are no drivers that can do this in mainline code,
right? The current drivers all create dedicated metadata devices.

Also, this specific use-case is for capture only. Do you think this
might be needed for metadata output as well?

Regards,

	Hans

> is thus not dedicated to video or metadata, any of the DMA engines (and
> there could also be more than two) could handle any type of data. For
> this type of system we thus can't dedicate device nodes to video or
> metadata, they need to support either.
> 
>> Hans Verkuil (2):
>>   v4l2-dev: simplify the SDR checks
>>   v4l2-dev: fix is_tch checks
>>
>> Vandana BN (1):
>>   v4l2-core: Add metadata type to vfl_devnode_type
>>
>>  drivers/media/v4l2-core/v4l2-dev.c   | 97 ++++++++++++++++------------
>>  drivers/media/v4l2-core/v4l2-ioctl.c |  5 +-
>>  include/media/v4l2-dev.h             |  2 +
>>  3 files changed, 61 insertions(+), 43 deletions(-)
> 

