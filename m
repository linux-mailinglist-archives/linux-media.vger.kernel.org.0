Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6307C6908
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 11:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235494AbjJLJJX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 05:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235408AbjJLJJX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 05:09:23 -0400
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5547BC6
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 02:09:21 -0700 (PDT)
Received: from [192.168.42.133] (host-178-72-203-68.ip.nej.cz [178.72.203.68])
        by mx.gpxsee.org (Postfix) with ESMTPSA id 7B13D3FD00;
        Thu, 12 Oct 2023 11:09:20 +0200 (CEST)
Message-ID: <1f672635-f63f-4c35-9530-689a2ba50a72@gpxsee.org>
Date:   Thu, 12 Oct 2023 11:09:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] media: pci: mgb4: fix potential spectre vulnerability
Content-Language: en-US
To:     Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Martin Tuma <martin.tuma@digiteqautomotive.com>
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
 <c83b7fffe1e087568f64aba786797d258279948e.1696586632.git.hverkuil-cisco@xs4all.nl>
 <d8726389-4354-499f-9114-eeff27231c7e@gpxsee.org>
 <20231011003549.y7nniiz26z2fcbhd@desk>
From:   =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <20231011003549.y7nniiz26z2fcbhd@desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11. 10. 23 2:35, Pawan Gupta wrote:
> On Tue, Oct 10, 2023 at 12:31:07PM +0200, Martin Tůma wrote:
>> On 06. 10. 23 12:08, Hans Verkuil wrote:
>>> Fix smatch warnings:
>>>
>>> drivers/media/pci/mgb4/mgb4_sysfs_out.c:118 video_source_store() warn: potential spectre issue 'mgbdev->vin' [r] (local cap)
>>> drivers/media/pci/mgb4/mgb4_sysfs_out.c:122 video_source_store() warn: possible spectre second half.  'loopin_new'
>>>
>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> CC: Martin Tuma <martin.tuma@digiteqautomotive.com>
>>> ---
>>>    drivers/media/pci/mgb4/mgb4_sysfs_out.c | 5 ++++-
>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/pci/mgb4/mgb4_sysfs_out.c b/drivers/media/pci/mgb4/mgb4_sysfs_out.c
>>> index 23a9aabf3915..9f6e81c57726 100644
>>> --- a/drivers/media/pci/mgb4/mgb4_sysfs_out.c
>>> +++ b/drivers/media/pci/mgb4/mgb4_sysfs_out.c
>>> @@ -8,6 +8,7 @@
>>>     */
>>>    #include <linux/device.h>
>>> +#include <linux/nospec.h>
>>>    #include "mgb4_core.h"
>>>    #include "mgb4_i2c.h"
>>>    #include "mgb4_vout.h"
>>> @@ -114,8 +115,10 @@ static ssize_t video_source_store(struct device *dev,
>>>    	if (((config & 0xc) >> 2) < MGB4_VIN_DEVICES)
>>>    		loopin_old = mgbdev->vin[(config & 0xc) >> 2];
>>> -	if (val < MGB4_VIN_DEVICES)
>>> +	if (val < MGB4_VIN_DEVICES) {
>>> +		val = array_index_nospec(val, MGB4_VIN_DEVICES);
>>>    		loopin_new = mgbdev->vin[val];
>>> +	}
>>>    	if (loopin_old && loopin_cnt(loopin_old) == 1)
>>>    		mgb4_mask_reg(&mgbdev->video, loopin_old->config->regs.config,
>>>    			      0x2, 0x0);
>>
>> Hi,
>> I had investigated the warning when it appeared here on the mailing list,
>> but IMHO it is a false-positive, so I didn't react to it. MGB4_VIN_DEVICES
>> in the condition is not a check for array bounds but a check whether the
>> input source (val) is one of the inputs. Valid "val" values are <0,3> and
>> only if the value is <0,1> it is used as an array index for the input
>> devices (vin) array.
> 
> I think when there are 2 branch mispredicts this is a valid problem.
> Below both branches can be trained with a val < 2. Then for a val > 3,
> both branches can mispredict:
> 
> video_source_store(buf)
> {
> ...
> 	ret = kstrtoul(buf, 10, &val);
> 	if (ret)
> 		return ret;
> 	if (val > 3)		     <------------- predicted as not taken
> 		return -EINVAL;
> 	...
> 
> 	if (val < MGB4_VIN_DEVICES)  <------------- predicted as taken
>   		loopin_new = mgbdev->vin[val];
> 
> The fix LGTM, although it can also possibly be fixed by masking the
> index after the first mispredicted branch, like:
> 
> 	ret = kstrtoul(buf, 10, &val);
> 	if (ret)
> 		return ret;
> 
> +	val = array_index_nospec(val, 4);
> 

Ok, thanks for the clarification.

> provided, mgbdev->vin[2] and mgbdev->vin[3] can't load a secret.

There is nothing secret there.

M.
