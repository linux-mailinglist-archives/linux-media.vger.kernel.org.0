Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF4A220EF6
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 16:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbgGOOOY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 10:14:24 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:40589 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727999AbgGOOOX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 10:14:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id viAljiKF3Z80HviAojSEmE; Wed, 15 Jul 2020 16:14:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594822461; bh=y4vZfGxi4CYdQ7fCe3iZg9TK9QU1wguK8Ztx4arTnro=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=O+L5WgH41sEsxwPZJbASlfw2dnOiIuZMkSTtGrne87QRPYA8fffwfBi8Xkih5BAQJ
         3pIY+hPEikcrqYpL36rys1tlazB03UtifVxjpZ6SCf9kU2vh40FWGev1epOo6tEaVc
         ut2cFfD/pFPqo2tVg71LeYZD1TGYjBvmObN3muG2JDypAxmwDx+N2rfRPfT+OcbPN6
         BV6+/wZKgwnLhjFhK6NgLm/IbRJNae+7o01g63TJO/o6JK8BCytLPOvQmi1txvhUvo
         piex5hA97MnnUaolFe6ya/qVSHFDqShNhnSA7uv8vY7rtGICN19zP0T4MiBwyeGVYT
         ayx0gkesA8WTQ==
Subject: Re: [PATCH 3/4] media: staging: rkisp1: set pads array of the resizer
 to size 2
To:     Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200629065754.26621-1-dafna.hirschfeld@collabora.com>
 <20200629065754.26621-4-dafna.hirschfeld@collabora.com>
 <09105e4b-7c02-28fd-58cc-ca947d6c5185@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <68dd74fa-f8d9-0f3b-38fe-10a590ffde4b@xs4all.nl>
Date:   Wed, 15 Jul 2020 16:14:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <09105e4b-7c02-28fd-58cc-ca947d6c5185@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBNWs47HhB8IQnW6Bah++zpwSyAM0LBf4691lxC0kwlxykH6qCQTa9gw2pIDrHsK1pkQnEiEuXbxWF4KMr5a0/iqqml9WmU9xLbIBzZd+amN5X04RwTi
 yIpQQtbUFrEAMxr/+b8I2MdNNtnSnsTab1JZP7he2ufl1qfyNVLv44Z5mEE3qrYerGKf/dhwSW8lyhbzDLU50uQuWMnYB6kpAZGLBUTgDyvOhkTliCqGoeEn
 P3LcMmZP4KJGmEk+C6R/9zDVJKZ5ROr3Do3ZMxXPmQAD+/VjlnUdaa+lV2OSahebI+dypxb2Hp/6kAbu4INpIBA5XWvg8RmKNA9mxL3ObGl3yqGUbJoB3xI7
 HPluE8BiC3PYga5v0GO3KTuHWvyFusrDrWh12Se/8+wQFmlhqxnnAkuL8Yp9KmSv7AXIcjYqL9HMC1FlQbSbrupWxYFXhNir7JwVeWvui7L9u1+JGhsDpWiX
 u82wxMWVwuqUgPd1n9MPW13LUEEQFgqHSRJetDtJRtg7z1YT8rJXzE3gsweSRC+8Az0fa3YmOnVjVeyG
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/07/2020 13:12, Helen Koike wrote:
> 
> 
> On 6/29/20 3:57 AM, Dafna Hirschfeld wrote:
>> Currently the 'pads' and 'pad_cfg' arries of the rkisp1_resizer
>> are of size 'RKISP1_ISP_PAD_MAX' which is 4. But the resizer
>> has only two pads. This patch change the size of the arries to 2
>> by adding and using 'RKISP1_RSZ_PAD_MAX' similar to the way it is
>> done in the isp entity.
> 
> s/arries/arrays
> 
> s/This patch change/Change
> 
> Hans, could you correct these when picking it up?

I can.

I'll take patches 1-3 and will take a v2 of patch 4/4 once it is posted.

Regards,

	Hans

> 
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> 
> Acked-by: Helen Koike <helen.koike@collabora.com>
> 
> Thanks
> Helen
> 
>> ---
>>  drivers/staging/media/rkisp1/rkisp1-common.h  | 5 +++--
>>  drivers/staging/media/rkisp1/rkisp1-resizer.c | 2 +-
>>  2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
>> index b7dc523dd8f0..4185487c520c 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
>> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
>> @@ -49,6 +49,7 @@
>>  enum rkisp1_rsz_pad {
>>  	RKISP1_RSZ_PAD_SINK,
>>  	RKISP1_RSZ_PAD_SRC,
>> +	RKISP1_RSZ_PAD_MAX
>>  };
>>  
>>  enum rkisp1_stream_id {
>> @@ -216,8 +217,8 @@ struct rkisp1_resizer {
>>  	struct v4l2_subdev sd;
>>  	enum rkisp1_stream_id id;
>>  	struct rkisp1_device *rkisp1;
>> -	struct media_pad pads[RKISP1_ISP_PAD_MAX];
>> -	struct v4l2_subdev_pad_config pad_cfg[RKISP1_ISP_PAD_MAX];
>> +	struct media_pad pads[RKISP1_RSZ_PAD_MAX];
>> +	struct v4l2_subdev_pad_config pad_cfg[RKISP1_RSZ_PAD_MAX];
>>  	const struct rkisp1_rsz_config *config;
>>  	enum v4l2_pixel_encoding pixel_enc;
>>  	struct mutex ops_lock;
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> index 26fb41053f56..d8ebe4422e77 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> @@ -735,7 +735,7 @@ static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
>>  	rsz->pixel_enc = RKISP1_DEF_PIXEL_ENC;
>>  
>>  	mutex_init(&rsz->ops_lock);
>> -	ret = media_entity_pads_init(&sd->entity, 2, pads);
>> +	ret = media_entity_pads_init(&sd->entity, RKISP1_RSZ_PAD_MAX, pads);
>>  	if (ret)
>>  		return ret;
>>  
>>

