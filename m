Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 893F82E162
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 17:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbfE2PnC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 11:43:02 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:34183 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726097AbfE2PnC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 11:43:02 -0400
Received: from [IPv6:2001:983:e9a7:1:c843:3d28:cba4:8b6e] ([IPv6:2001:983:e9a7:1:c843:3d28:cba4:8b6e])
        by smtp-cloud9.xs4all.net with ESMTPA
        id W0jChr6RPsDWyW0jEhi5bE; Wed, 29 May 2019 17:43:00 +0200
Subject: Re: [PATCH] media: v4l2: Initialize mpeg slice controls
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     kernel@collabora.com
References: <20190503114221.28469-1-boris.brezillon@collabora.com>
 <b025d972-b7a9-ae0d-a286-e0364d1b52ea@xs4all.nl>
 <100592967e3c3546b4dcbbb8a0369297b27fa8e8.camel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <70396bcf-7fdc-f69b-7b8a-f0d6958093dc@xs4all.nl>
Date:   Wed, 29 May 2019 17:42:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <100592967e3c3546b4dcbbb8a0369297b27fa8e8.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOSYV78ScT9JYjA4YFCk+JefqdjHaAb3Cx6Jyqh8coQPruuqDGDuEXuQKqMxwd2aFDvhEH+aWcQWy5ZXgBinxpur0dKWw1RuiysgPpIDXyfsMEUWSaHp
 A98zG6MAI61Tn2+w2uX45oe9QSqAnB2Nqm93vbx8P8swKWJTbN9/mX3VUn8k2OWFmvg475yBfONkFDKvndZMtaJR1UNUlMj4A5lPMniNHLk/dOanqtViQbpv
 0GtV3cf05h5DSfeFJ+SdfW0wfQYh8dzDZ8yG644K9OpFVV/bPxQs5JwIPaqaxEXo85Bfn9KJeDnV/C+FTXiyiPXCRM2riS8l1JrpO+ZrNxkt3qsVu8ZG091W
 xEYt1U0jkxQ2gsW+pB+klzGbkpC7g9g86crQn10Hd4ZNOXy+O5e9hgtu82aBkWvNGTpOfOlymUVMy6WEmZu5h/1BOkSwj0AVr+0KoPRi3fd7W+lfjLP9SEMx
 vs9+7oEs+WRat3er1pwcXka4YDGD1SbElTFxcHAXa0U7dm9jBxqATGnkBAo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/29/19 5:36 PM, Ezequiel Garcia wrote:
> On Wed, 2019-05-29 at 16:41 +0200, Hans Verkuil wrote:
>> On 5/3/19 1:42 PM, Boris Brezillon wrote:
>>> Make sure the default value at least passes the std_validate() tests.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>>  drivers/media/v4l2-core/v4l2-ctrls.c | 20 +++++++++++++++++++-
>>>  1 file changed, 19 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>>> index b1ae2e555c68..19d40cc6e565 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>> @@ -1461,7 +1461,14 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
>>>  static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
>>>  		     union v4l2_ctrl_ptr ptr)
>>>  {
>>> -	switch (ctrl->type) {
>>> +	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
>>> +
>>> +	/*
>>> +	 * The cast is needed to get rid of a gcc warning complaining that
>>> +	 * V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS is not part of the
>>> +	 * v4l2_ctrl_type enum.
>>> +	 */
>>> +	switch ((u32)ctrl->type) {
>>>  	case V4L2_CTRL_TYPE_STRING:
>>>  		idx *= ctrl->elem_size;
>>>  		memset(ptr.p_char + idx, ' ', ctrl->minimum);
>>> @@ -1486,6 +1493,17 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
>>>  	case V4L2_CTRL_TYPE_U32:
>>>  		ptr.p_u32[idx] = ctrl->default_value;
>>>  		break;
>>> +	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
>>> +		p_mpeg2_slice_params = ptr.p;
>>> +		/* 4:2:0 */
>>> +		p_mpeg2_slice_params->sequence.chroma_format = 1;
>>> +		/* 8 bits */
>>> +		p_mpeg2_slice_params->picture.intra_dc_precision = 0;
>>> +		/* interlaced top field */
>>> +		p_mpeg2_slice_params->picture.picture_structure = 1;
>>> +		p_mpeg2_slice_params->picture.picture_coding_type =
>>> +					V4L2_MPEG2_PICTURE_CODING_TYPE_I;
>>
>> Oops, this isn't complete. It should still zero the p_mpeg2_slice_params
>> struct first. Right now any fields not explicitly set just have whatever
>> was in memory.
>>
>> Can you post a patch fixing this?
>>
>>
> 
> 
> I was wondering if we want to zero all the cases, and not just
> the struct types ones.

The others either overwrite the data with the default_value, or memset
the whole control (default case). It's only for these compound controls
that something special needs to be done.

The code can be restructured, though: instead of break do return in all
the simple type cases.

Then call memset followed by a new switch for the compound types where you
need to set some fields to non-zero.

> 
> Or a different approach would be to define statically-allocated default
> structs, and init-assign to them. Although this take more space,
> and has no benefits, except maybe code clarity.
> 
> OTOH, I can push a quick fix if you want, just zeroing this struct.
> 

A quick fix is fine, but as we add new compound types here we need something
along the lines of what I described above. A statically-allocated default
struct isn't a bad idea either, but a bit overkill for the simple mpeg2_slice_params.

Regards,

	Hans
