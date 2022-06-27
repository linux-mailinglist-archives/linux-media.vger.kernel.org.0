Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2451F55D5B9
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbiF0Mx6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 08:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232757AbiF0Mxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 08:53:55 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 328C1B85C
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 05:53:53 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25R96lQv019780;
        Mon, 27 Jun 2022 14:53:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=BfrcbyphL92wNGL5f2Cs5xfyme8A3kjpM20PQz3c3Qw=;
 b=DVeRjzK1Vw4M8nf83Yxz1oqL/5oaeUhGK/C9igqdaH/HsWgXTfS11nzrWUbmTZ4/9KkI
 RcKUwPuSbljTkkqZY1mzv4Ga03ky8L3rQgn7lPCztVoSBX207gAqDWE9vs3suuRLlGfE
 5+oJkC+NwbKtKJvDGmdzisIMVz/IOpU2xSfBA3iV6JQm0WqC4eq3bC/bty4JcWhSDUbG
 uKfxMn4BLR3ICGFN2dosKBVqcol/XJsZ0/d3J+iL5xVZxAchpxCFrxKLRM8XCPEuHyeZ
 MFiCjLeJgS0hv/+Gb7WUhc1b5v1V1BT2SWedR/q0TdovM2elUxHNLPtz60boCnHzZr5V Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gy9mr19au-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jun 2022 14:53:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 391E610002A;
        Mon, 27 Jun 2022 14:53:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 25AD421D3A5;
        Mon, 27 Jun 2022 14:53:40 +0200 (CEST)
Received: from [10.201.21.143] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 27 Jun
 2022 14:53:39 +0200
Message-ID: <733f9689-b4d7-8f23-37d3-920aa6a5a7ea@foss.st.com>
Date:   Mon, 27 Jun 2022 14:53:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] media: stm32: dcmi: Switch to __v4l2_subdev_state_alloc()
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20220618222442.478285-1-marex@denx.de>
 <Yq5c6dObTlmZr95P@pendragon.ideasonboard.com>
 <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
 <4d5b5c59-f3d5-ad5a-ae61-73277b4adefa@denx.de>
 <5ee6c0c0-8ab0-561c-e1f6-b26e4ec438af@foss.st.com>
 <39657445-e5ac-bfd6-c122-b18088fa4b41@denx.de>
From:   Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <39657445-e5ac-bfd6-c122-b18088fa4b41@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

Thanks for explanation, I understand now.

Please note that dcmi is not atmel-isi.c has same code structure, hence 
same problem:

static int isi_try_fmt(struct atmel_isi *isi, struct v4l2_format *f,
	struct v4l2_subdev_state pad_state = {
		.pads = &pad_cfg
		};
[...]
	ret = v4l2_subdev_call(isi->entity.subdev, pad, set_fmt,


Moreover, searching for __v4l2_subdev_state_alloc() I see those "FIXME":

drivers/media/platform/renesas/vsp1/vsp1_entity.c
	/*
	 * FIXME: Drop this call, drivers are not supposed to use
	 * __v4l2_subdev_state_alloc().
	 */
	entity->config = __v4l2_subdev_state_alloc(&entity->subdev,
						   "vsp1:config->lock", &key);


drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
	/*
	 * FIXME: Drop this call, drivers are not supposed to use
	 * __v4l2_subdev_state_alloc().
	 */
	sd_state = __v4l2_subdev_state_alloc(sd, "rvin:state->lock", &key);


So I wonder about introducing this new change in dcmi while it is marked 
as "FIXME" in other camera interface drivers ?

Best regards,
Hugues.

On 6/27/22 13:30, Marek Vasut wrote:
> On 6/27/22 11:14, Hugues FRUCHET wrote:
>> Hi Marek,
> 
> Hi,
> 
>>>>> On Sun, Jun 19, 2022 at 12:24:42AM +0200, Marek Vasut wrote:
>>>>>> Any local subdev state should be allocated and free'd using
>>>>>> __v4l2_subdev_state_alloc()/__v4l2_subdev_state_free(), which
>>>>>> takes care of calling .init_cfg() subdev op. Without this,
>>>>>> subdev internal state might be uninitialized by the time
>>>>>> any other subdev op is called.
>>>>
>>>> Does this fix a bug you have?
>>>
>>> Yes
>>
>> Which bug did you encounter exactly ?
> 
> The DCMI driver does set_fmt subdev call on the sensor driver instance.
> 
> The mt9p031 sensor driver set_fmt depends on crop rectangle to be 
> initialized _before_ set_fmt subdev call is made. Currently this 
> initialization is done in open callback, which is too late, so when the 
> DCMI does set_fmt subdev call, it operates on uninitialized private data.
> 
> There is patch to mt9p031 driver which move the initialization to the 
> right place in .init_cfg:
> [PATCH v2] media: mt9p031: Move open subdev op init code into init_cfg
> 
> However, the .init_cfg is not called by DCMI right now. For that to be 
> called in the right place, __v4l2_subdev_state_alloc() must be added, 
> hence this patch.
> 
> You won't trigger the problem on OV5640 because that one driver does not 
> implement .init_cfg v4l2_subdev_ops .
> 
>> This is strange that we have not yet encounter any problems around 
>> that through our tests campaigns... or we have to enforce with a new 
>> test, so better to know what your problem was exactly.
> 
> You need a sensor driver which implements struct v4l2_subdev_ops 
> .init_cfg and then have something in set_fmt depend on the 
> initialization done in the .init_cfg callback . Then you would see the 
> problem.
> 
>>>> Wasn't this broken even before the active state, as init_cfg was not 
>>>> called?
>>>
>>> Yes, this was always broken. I suspect nobody tested this mode of 
>>> operation before. In my case, I have this DCMI driver connected 
>>> directly to MT9P006 sensor.
>>
>> As far as I see, MT9P006 sensor is a 12 bits parallel interface sensor.
>> I don't see the difference with our OV5640 used in parallel mode which 
>> is a mainline config on our side, so one more time I wonder what the 
>> problem was.
> 
> See above.
