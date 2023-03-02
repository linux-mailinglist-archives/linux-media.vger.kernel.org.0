Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E22B46A8091
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 11:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbjCBK7n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 05:59:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjCBK7i (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 05:59:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDED3D906
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 02:59:32 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5501C56A;
        Thu,  2 Mar 2023 11:59:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677754768;
        bh=hTe136sxg4rNjol4/pbFs1F7YjrGTGt7NVD1b7eadfw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=QZreXGEp8D0PPokKiVi+1lDzhCY76p6E1WWa512NEvwdH9RmxATMFuYzAKigEA3D6
         9SEHeNcMHt0+DsDNwz1XZFvdeGucI42bbQpq6y2rtkLepASd0wBDCxgRO38dAoJPym
         sfGIRgj7znk+kdnsWuw1iYh0TYhVVjikS4HTYWVw=
Message-ID: <06f9005d-3380-c650-29aa-9ee3749d0d00@ideasonboard.com>
Date:   Thu, 2 Mar 2023 12:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/5] media: ti: cal: Fix cal_camerarx_create() error
 handling
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>
References: <20230302100755.191164-1-tomi.valkeinen@ideasonboard.com>
 <20230302100755.191164-3-tomi.valkeinen@ideasonboard.com>
 <20230302105031.chuvor4zjk4li6vi@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230302105031.chuvor4zjk4li6vi@uno.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2023 12:50, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Thu, Mar 02, 2023 at 12:07:52PM +0200, Tomi Valkeinen wrote:
>> We don't do a proper job at freeing resources in cal_camerarx_create's
>> error paths.
>>
>> Fix these, and also switch the phy allcation from kzalloc to
>> devm_kzalloc to simplify the code further.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti/cal/cal-camerarx.c | 23 +++++++++++---------
>>   1 file changed, 13 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
>> index 267089b0fea0..97208d542f9e 100644
>> --- a/drivers/media/platform/ti/cal/cal-camerarx.c
>> +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
>> @@ -864,7 +864,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>>   	unsigned int i;
>>   	int ret;
>>
>> -	phy = kzalloc(sizeof(*phy), GFP_KERNEL);
>> +	phy = devm_kzalloc(cal->dev, sizeof(*phy), GFP_KERNEL);
>>   	if (!phy)
>>   		return ERR_PTR(-ENOMEM);
>>
>> @@ -882,7 +882,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>>   	if (IS_ERR(phy->base)) {
>>   		cal_err(cal, "failed to ioremap\n");
>>   		ret = PTR_ERR(phy->base);
>> -		goto error;
>> +		goto err_destroy_mutex;
> 
> I have your previous version applied, I'm probably on a different base
> as I don't see any phy->mutex at all!

The "media: ti: cal: Use subdev state" drops the mutex, but in v3 that 
patch comes after this one. So here we still have the mutex, but it'll 
go away in the next patch.

  Tomi

