Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C8B3372C9
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 13:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232976AbhCKMgZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 07:36:25 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:44587 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233369AbhCKMgG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 07:36:06 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KKXnlOuiM5C8yKKXrleSpt; Thu, 11 Mar 2021 13:36:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615466163; bh=TUlMrkPWURG6SaN7sDAOZM/NJtu2oCrlq6DkC6AA3H0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Q8sZ3mJrvfvigW+Q1a7cST6piKqEEDhjd+DuOtOi9a3LSZctFjNqG71w1FJy04Q0b
         TtkKK27YmWbPazP/WEqfwel4mFFtcuritwG3q3tJrCrR6/ZXN4IC9Wpkn4ACKv17h7
         HJ+c44F1PL35AbE2lMMsqiONRCE6YNFlA7RB4VlNAsaoIsBYEezpa8HqrXYY9hrTXL
         mS7ICWZJGkfm/PrY3qRj4RghAqEa+nFuiorxvGVX22bXqLLFJ4IPdJhEfwNMiaXpDp
         td3Vveb27dKSP1l0emaEDSdGloRf8vrtcL8qxXoQ82hW25V4DkwkFLtxABo5UGA13S
         lkXB/yonz+KQQ==
Subject: Re: [PATCH 06/13] vsp1/vsp1_drm.h: add missing 'struct' kernel-doc
 keyword
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
 <20210311102022.96954-7-hverkuil-cisco@xs4all.nl>
 <YEoJIZp2MKe3hTgp@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <39a60b00-9ba6-076b-fa24-32fd724ff69c@xs4all.nl>
Date:   Thu, 11 Mar 2021 13:35:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YEoJIZp2MKe3hTgp@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPyqFKmYlbKuvJN925FZx/mrk8xq+WbUG0RnkSZ2LRcTByNxDo5CeSWIu/QqwrU2razI3CA59+kQZO+0xIVMq1XZO6eff69g1zZb7Iu8qmsL0G5fjQfe
 8U1PaSWQ/Zww290KLap26ojDmjd+kOEnuukdm9zixq598VU8jJDR7ZeFCuiTsignhjXUF2PN9TSJAef36h0B1iHKmdc6aUeu+tfzvRbwVt5Giue2sjASOL6P
 rC0vi4Rl/Ug+h9u9QAx4Gw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/03/2021 13:12, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Thu, Mar 11, 2021 at 11:20:15AM +0100, Hans Verkuil wrote:
>> The kernel-doc documentation for two structs was missing the
>> 'struct' keyword.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Should I take this in my tree, or will you merge them with your series ?

I'll take it.

Regards,

	Hans

> 
>> ---
>>  drivers/media/platform/vsp1/vsp1_drm.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/vsp1/vsp1_drm.h b/drivers/media/platform/vsp1/vsp1_drm.h
>> index e85ad4366fbb..ab8b7e3161a2 100644
>> --- a/drivers/media/platform/vsp1/vsp1_drm.h
>> +++ b/drivers/media/platform/vsp1/vsp1_drm.h
>> @@ -18,7 +18,7 @@
>>  #include "vsp1_pipe.h"
>>  
>>  /**
>> - * vsp1_drm_pipeline - State for the API exposed to the DRM driver
>> + * struct vsp1_drm_pipeline - State for the API exposed to the DRM driver
>>   * @pipe: the VSP1 pipeline used for display
>>   * @width: output display width
>>   * @height: output display height
>> @@ -47,7 +47,7 @@ struct vsp1_drm_pipeline {
>>  };
>>  
>>  /**
>> - * vsp1_drm - State for the API exposed to the DRM driver
>> + * struct vsp1_drm - State for the API exposed to the DRM driver
>>   * @pipe: the VSP1 DRM pipeline used for display
>>   * @lock: protects the BRU and BRS allocation
>>   * @inputs: source crop rectangle, destination compose rectangle and z-order
> 

