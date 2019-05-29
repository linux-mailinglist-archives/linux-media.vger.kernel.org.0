Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A603B2DD1A
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 14:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbfE2MbH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 08:31:07 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:44325 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726828AbfE2MbH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 08:31:07 -0400
Received: from [IPv6:2001:983:e9a7:1:c843:3d28:cba4:8b6e] ([IPv6:2001:983:e9a7:1:c843:3d28:cba4:8b6e])
        by smtp-cloud7.xs4all.net with ESMTPA
        id VxjTh7zUO3qlsVxjUhtek4; Wed, 29 May 2019 14:31:04 +0200
Subject: Re: [PATCH v6 03/16] media: v4l2-common: Support custom imagesize in
 fill_pixfmt()
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20190528170232.2091-1-ezequiel@collabora.com>
 <20190528170232.2091-4-ezequiel@collabora.com>
 <20190529082809.0b9f3553@coco.lan>
 <cc51be76-81c3-1c54-2005-1b99d00a8ac1@xs4all.nl>
 <20190529085854.6c689f8d@coco.lan> <20190529141633.19c5079b@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <223a757d-f008-398c-64ce-18b0aaf390c5@xs4all.nl>
Date:   Wed, 29 May 2019 14:31:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529141633.19c5079b@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDbGRwgTRP9ZlhKPJMnc3QXzjA/ufakNcuv43ha1T5D7GofmP5sutC53MWCWGffoqggu5/iWBATsV0sCraCZvuGCFSW0qB8T/cRbBWmc/3dkd8E34IaF
 7f2uSgQkjmbEe0dhGlijTQlANlin9K3renr9r1qyc9QP74VKacAPQCp099PJv5Jlt13hHSG9mGj/AsI8Q+OPQkzZSPaHfzzzGPVP7FHrf7Xo8BrEETTqAdA9
 2i9Uf5+LkA8mJiNbgt0OIfEK2GJqzQiWyGQy9JYKGWsbpkU/OLw8b5lLFgvbd8B3shVjuM84W76kWtiFvJpwjOIYq4pmU1WNCfxvPnlRnt/vipp1+FbPZpf0
 Rpu3esmOmf8+LEEb/5h9wZE23+XxONAPzrEHXSxiJmeK5T2dWlPlCoDTUrFTaN2EutlH5x9QmO5//E69L5Ah6bmMqVIMN8Dbi3Ne3reIHfRGtzgQKE9Y5VTu
 ePEzHgpk1qF6fuwWXEIrcRltPvCGDlUmVG5bNQO6ormnsUajZDRFmlYRJ6hqrh5je8wgRVJYSCLbomoyu/xgZktzfmPdQY1EWmAmunKwhpi0orBOVtQ4vPpp
 oK8XsTmKbt/f8GQaU+pzxBTlVUp4Cm0jVrNj/lpiXOQCTEiUtIT27u/zw8w0hhA7C8rq7fk5Hyzvdxkz1Y5AUCR7
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/29/19 2:16 PM, Boris Brezillon wrote:
> On Wed, 29 May 2019 08:58:54 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
>> Em Wed, 29 May 2019 13:43:20 +0200
>> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
>>
>>> On 5/29/19 1:28 PM, Mauro Carvalho Chehab wrote:  
>>>> Em Tue, 28 May 2019 14:02:19 -0300
>>>> Ezequiel Garcia <ezequiel@collabora.com> escreveu:
>>>>     
>>>>> From: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>
>>>>> Users can define custom sizeimage as long as they're big enough to
>>>>> store the amount of pixels required for a specific width/height under a
>>>>> specific format. Avoid overriding those fields in this case.
>>>>>
>>>>> We could possibly do the same for bytesperline, but it gets tricky when
>>>>> dealing with !MPLANE definitions, so this case is omitted for now and    
>>>>> ->bytesperline is always overwritten with the value calculated in    
>>>>> fill_pixfmt().
>>>>>
>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>> ---
>>>>> Changes from v5:
>>>>> * Overwrite bytesperline with the value calculated in fill_pixfmt()
>>>>>
>>>>> Changes from v4:
>>>>> * New patch
>>>>>
>>>>>  drivers/media/v4l2-core/v4l2-common.c | 58 ++++++++++++++++++++-------
>>>>>  1 file changed, 43 insertions(+), 15 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>>>>> index b2d1e55d9561..fd286f6e17d7 100644
>>>>> --- a/drivers/media/v4l2-core/v4l2-common.c
>>>>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>>>>> @@ -585,9 +585,9 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
>>>>>  	pixfmt->num_planes = info->mem_planes;
>>>>>  
>>>>>  	if (info->mem_planes == 1) {
>>>>> +		u32 sizeimage = 0;
>>>>> +
>>>>>  		plane = &pixfmt->plane_fmt[0];
>>>>> -		plane->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
>>>>> -		plane->sizeimage = 0;
>>>>>  
>>>>>  		for (i = 0; i < info->comp_planes; i++) {
>>>>>  			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
>>>>> @@ -598,10 +598,21 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
>>>>>  			aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
>>>>>  			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
>>>>>  
>>>>> -			plane->sizeimage += info->bpp[i] *
>>>>> -				DIV_ROUND_UP(aligned_width, hdiv) *
>>>>> -				DIV_ROUND_UP(aligned_height, vdiv);
>>>>> +			sizeimage += info->bpp[i] *
>>>>> +				     DIV_ROUND_UP(aligned_width, hdiv) *
>>>>> +				     DIV_ROUND_UP(aligned_height, vdiv);
>>>>>  		}
>>>>> +
>>>>> +		/* Custom bytesperline value is not supported yet. */
>>>>> +		plane->bytesperline = ALIGN(width,
>>>>> +					    v4l2_format_block_width(info, 0)) *
>>>>> +				      info->bpp[0];
>>>>> +
>>>>> +		/*
>>>>> +		 * The user might have specified a custom sizeimage, only
>>>>> +		 * override it if it's not big enough.
>>>>> +		 */
>>>>> +		plane->sizeimage = max(sizeimage, plane->sizeimage);    
>>>>
>>>> No upper limit? That doesn't sound a good idea to me, specially since some
>>>> (broken) app might not be memset the format to zero before filling the ioctl
>>>> structure.
>>>>
>>>> Perhaps we could do something like:
>>>>
>>>> 		sizeimage = min (sizeimage, 2 * plane->sizeimage)
>>>>
>>>> or something similar that would be reasonable.    
>>>
>>> I've no idea what's sane.
>>>
>>> Buffers can be really large. The largest video resolution defined by CTA-861-G
>>> is 10240x4320, so at 4 bytes per pixel that's 0x0a8c0000. So perhaps we can
>>> use min(sizeimage, 0x10000000)? Although we should probably use the clamp function
>>> instead of min/max.  
>>
>> Well, the max is driver-specific. 
>>
>> For example, for a camera with a max resolution of 640x480 with 2 bytes
>> per pixel as the max format can only be
>>
>> 	max_size = 640*480*2 (plus some alignment value if pertinent)
>>
>> It sounds to me that the best would be to have a callback function
>> or value filled by the drivers that would support custom sizeimage.
>>
>> The core could actually calculate during init (by asking the driver
>> to a very big resolution and getting the returned value), but
>> it sounds better to let the drivers to explicitly calculate it.
> 
> If we want max_sizeimage to be driver specific I can add it as an extra
> arg to the fill_pixfmt() funcs.

Looking more closely, only compressed formats can accept a user-specified
sizeimage value, and this function is only called for uncompressed formats.

So doesn't that mean that this sizeimage override code can be dropped?

Regards,

	Hans

> 
> If that works for you, we'll send a new version of this patch alone
> (unless you want us to send the whole series again).
> 

