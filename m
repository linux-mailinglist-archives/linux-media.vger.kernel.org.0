Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 255C81B1139
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 18:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgDTQP3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 12:15:29 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:56459 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725958AbgDTQP3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 12:15:29 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id QZ4tjcd3tlKa1QZ4wjuUvp; Mon, 20 Apr 2020 18:15:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587399327; bh=wEmNVuyj683uDNJGlJlWTElHRqXqeKyvxmXZl6UkAvo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=anv+8DdI/sVFbjsFOFnjHjECms/cOcBmTknN9n8zY5nK/RJirmn54MKrQmPtCpngj
         3TKyMGRZZqyxXQn2egt9qmOmpxAtWaFgVEasy5kW2pf3vb0cFY/mfCzZSb/zCVFDHG
         iMBU0WipE/ptrAcqd+8+XfdRYGFOH1eJVi4BwlrR9v6u3lijv9cHfAAgr3IHrGyp+W
         Xo612gJrjc+3FXFoBdm6HclC+nmVEt1Zs2C6f7vMq4olCGevjX8Yzbj/i6oN6HXg2A
         mNwTR4tfYWXDf/9Vlfm9+kcdTCkT/wGCpMSmD7MP3HhIgvCFv+fTsYAy0DmOMJvI/i
         dU7h/cOE0Vrzw==
Subject: Re: decode sync frames only
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>
References: <9a58a501-8348-2230-2ab5-534471d866ca@linaro.org>
 <b4471541-aeaf-462b-ee36-14ac4e2845f8@xs4all.nl>
 <00202b06-1cfb-e3d1-bd1b-117789b031a1@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e5cacb73-64c0-3137-332c-ce9b3b24e672@xs4all.nl>
Date:   Mon, 20 Apr 2020 18:15:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <00202b06-1cfb-e3d1-bd1b-117789b031a1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBF542IXikGeJZUwvJNdMrx2yRXinTEMGfbnkFqkcXx79PkoHp9OsbclVmVV0s8mRHX0vZ8zhoaPArjHBN7lHexnGlgeu8gJ9XI0oKxL3l/E3+lWyd1b
 sZ2bv0ELOdYrIDyaxRRb2/gRUBbRNyn30X8RcRPISuI9/5Cvv5GR27eJHaBsA+8di8X0s5MbOUG75SW4uqqcJ567wXj1eBwN62Zfzb1MAT2nECKVW9ugd8dH
 UtACf3Uul9rCT8cflSpxiQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2020 17:39, Stanimir Varbanov wrote:
> Hi Hans,
> 
> On 4/20/20 5:48 PM, Hans Verkuil wrote:
>> On 20/04/2020 16:38, Stanimir Varbanov wrote:
>>> Hi,
>>>
>>> I need to port a decoder v4l2 control in mainline Venus driver which
>>> instructs the decoder to decode sync frames only (I frame/ IDR frame).
>>> In practice the usage of such control is to generate thumbnails for
>>> particular video.
>>>
>>> To do that I researched what we have currently in v4l2-controls.h and
>>> found something similar but for encoders:
>>>
>>> V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME
>>> "Force a key frame for the next queued buffer. Applicable to encoders.
>>> This is a general, codec-agnostic keyframe control."
>>>
>>> I think I have two options:
>>>
>>> 1. reuse V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME for the decoder and document it
>>>
>>> 2. create a new v4l control V4L2_CID_MPEG_VIDC_VIDEO_SYNC_FRAME_DECODE
>>
>> Make a new v4l control. The encoder control is for something quite different.
>>
>> How about V4L2_CID_MPEG_VIDEO_DEC_KEY_FRAMES_ONLY?
> 
> What you mean by "_DEC_" in the name - DECODER or DECODE?

DECODER

> 
> I've found
> V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE and
> V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER
> 
> in v4l2-controls.h which use the whole word "DECODER", thus I wonder
> what is proffered word to follow the v4l2-controls.h naming style.
> 

It's a bit long, but DECODER is unambiguous, so let's use that.

Regards,

	Hans
