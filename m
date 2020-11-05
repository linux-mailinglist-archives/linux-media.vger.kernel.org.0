Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B87412A85C6
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 19:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731060AbgKESLd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 13:11:33 -0500
Received: from foss.arm.com ([217.140.110.172]:39318 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725998AbgKESLb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 13:11:31 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10B8614BF;
        Thu,  5 Nov 2020 10:11:31 -0800 (PST)
Received: from [10.57.54.223] (unknown [10.57.54.223])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A76EE3F719;
        Thu,  5 Nov 2020 10:11:28 -0800 (PST)
Subject: Re: [PATCH v2 1/3] media: videodev2.h, v4l2-ioctl: add rkisp1 meta
 buffer format
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, dafna.hirschfeld@collabora.com,
        heiko@sntech.de, linux-kernel@vger.kernel.org, tfiga@chromium.org,
        linux-rockchip@lists.infradead.org,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kernel@collabora.com, zhengsq@rock-chips.com, ribalda@google.com
References: <20201030112225.2095909-1-helen.koike@collabora.com>
 <20201030112225.2095909-2-helen.koike@collabora.com>
 <89711cf3-fc1d-68e2-1de0-c6cc88c6f7d0@xs4all.nl>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <2e22fa70-28c8-8bd6-734c-ced1b5113726@arm.com>
Date:   Thu, 5 Nov 2020 18:11:28 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <89711cf3-fc1d-68e2-1de0-c6cc88c6f7d0@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-11-05 17:43, Hans Verkuil wrote:
> On 30/10/2020 12:22, Helen Koike wrote:
>> From: Shunqian Zheng <zhengsq@rock-chips.com>
>>
>> Add the Rockchip ISP1 specific processing parameter format
>> V4L2_META_FMT_RK_ISP1_PARAMS and metadata format
>> V4L2_META_FMT_RK_ISP1_STAT_3A for 3A.
>>
>> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
>> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> ---
>> Hello,
>>
>> This patch is a continuation of:
>>
>> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20191106120132.6876-2-helen.koike@collabora.com/
>>
>> These formats are already documented under
>> Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
>>
>> We had agreed to keep under
>> drivers/staging/media/rkisp1/uapi/rkisp1-config.h while the driver was
>> in staging, since we are moving it out of staging, I guess this is the
>> time :)
>>
>> Regards,
>> Helen
>> ---
>>   drivers/media/v4l2-core/v4l2-ioctl.c              | 2 ++
>>   drivers/staging/media/rkisp1/uapi/rkisp1-config.h | 4 ----
>>   include/uapi/linux/videodev2.h                    | 4 ++++
>>   3 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index eeff398fbdcc1..202597d031c6b 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1402,6 +1402,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>   	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
>>   	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
>>   	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
>> +	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A params"; break;
>> +	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A statistics"; break;
> 
> Use 'Params' and 'Statistics' to conform to the other descriptions.

Drive-by observation: "parameters" is the exact same length as 
"statistics". I could understand abbreviating both, or neither, but the 
mix just looks decidedly odd.

Robin.

> 
> Regards,
> 
> 	Hans
> 
>>   
>>   	default:
>>   		/* Compressed formats */
>> diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
>> index 8d906cc7da8fc..6e449e7842605 100644
>> --- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
>> +++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
>> @@ -9,10 +9,6 @@
>>   
>>   #include <linux/types.h>
>>   
>> -/* Vendor specific - used for RK_ISP1 camera sub-system */
>> -#define V4L2_META_FMT_RK_ISP1_PARAMS   v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 params */
>> -#define V4L2_META_FMT_RK_ISP1_STAT_3A  v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A statistics */
>> -
>>   /* Defect Pixel Cluster Detection */
>>   #define RKISP1_CIF_ISP_MODULE_DPCC		(1U << 0)
>>   /* Black Level Subtraction */
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 534eaa4d39bc8..c2e13ba81196b 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -770,6 +770,10 @@ struct v4l2_pix_format {
>>   #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
>>   #define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
>>   
>> +/* Vendor specific - used for RK_ISP1 camera sub-system */
>> +#define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 params */
>> +#define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A statistics */
>> +
>>   /* priv field value to indicates that subsequent fields are valid. */
>>   #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
>>   
>>
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 
