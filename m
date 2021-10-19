Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E0943357F
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 14:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235356AbhJSMMv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 08:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235431AbhJSMMu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 08:12:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D500C06161C
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 05:10:38 -0700 (PDT)
Received: from [IPV6:2a01:e0a:169:7140:a5cd:559c:5613:9d87] (unknown [IPv6:2a01:e0a:169:7140:a5cd:559c:5613:9d87])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C331A12A;
        Tue, 19 Oct 2021 14:10:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634645434;
        bh=m8tYZqMP0vQ5LFHoNBct+hvp3gmdtmRXyzOahHUaXTA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=e4ZrJnsDAPnF8+Aw9WjbVoIfg9ForAnS2zweNYyk9EDFHvXVeqiGLKQth9tTnd6Q9
         wCplZ1QIPt9PRWyPIKE9ejzKzPdeK9jZ1Z6HgI70P6jVIWtM/mRjATtZ0vZz+lRP0T
         8vdFmJEzdgplq3i4w2pxL41/ZFVvn2SO1HHeJFwo=
Message-ID: <f38f829a-f1ff-2886-d8d3-6fcccc2650e1@ideasonboard.com>
Date:   Tue, 19 Oct 2021 14:10:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2] media: staging: ipu3-imgu: clarify the limitation of
 grid config
Content-Language: en-US
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com
Cc:     tfiga@chromium.org, bingbu.cao@linux.intel.com
References: <1634525295-1410-1-git-send-email-bingbu.cao@intel.com>
 <163463890722.1853916.13254760106889780500@Monstersaurus>
From:   Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
In-Reply-To: <163463890722.1853916.13254760106889780500@Monstersaurus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu !

On 19/10/2021 12:21, Kieran Bingham wrote:
> Quoting Bingbu Cao (2021-10-18 03:48:15)
>> There are some grid configuration limitations for ImgU, which was
>> not described clearly in current uAPI header file, add the description
>> to help user to set the grid configuration correctly.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks a lot, it helps :-) !

Reviewed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> 
>> ---
>>   drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
>> index fa3d6ee5adf2..6d3ebb880a64 100644
>> --- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
>> +++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
>> @@ -34,11 +34,17 @@
>>    * struct ipu3_uapi_grid_config - Grid plane config
>>    *
>>    * @width:     Grid horizontal dimensions, in number of grid blocks(cells).
>> + *             For AWB, the range is (16, 80).
>> + *             For AF/AE, the range is (16, 32).
>>    * @height:    Grid vertical dimensions, in number of grid cells.
>> + *             For AWB, the range is (16, 60).
>> + *             For AF/AE, the range is (16, 24).
>>    * @block_width_log2:  Log2 of the width of each cell in pixels.
>> - *                     for (2^3, 2^4, 2^5, 2^6, 2^7), values [3, 7].
>> + *                     For AWB, the range is [3, 6].
>> + *                     For AF/AE, the range is [3, 7].
>>    * @block_height_log2: Log2 of the height of each cell in pixels.
>> - *                     for (2^3, 2^4, 2^5, 2^6, 2^7), values [3, 7].
>> + *                     For AWB, the range is [3, 6].
>> + *                     For AF/AE, the range is [3, 7].
>>    * @height_per_slice:  The number of blocks in vertical axis per slice.
>>    *                     Default 2.
>>    * @x_start: X value of top left corner of Region of Interest(ROI).
>> -- 
>> 2.7.4
>>
