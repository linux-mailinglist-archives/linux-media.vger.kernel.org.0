Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5AC55C979
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 14:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237739AbiF0PL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 11:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235052AbiF0PLy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 11:11:54 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D7FB658B
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 08:11:52 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RDMtP7021987;
        Mon, 27 Jun 2022 17:11:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yzvJykJCp0Imrq/QyPH9zItJev5YVbqvfDLjrOah5dU=;
 b=ZKQ4MONmyh56zgmCSgALXa3wNGVLTJYYxAPJx/Db99JOXis7Qd1cRYd39o8+ot8A223s
 e9CMi/CF6UiyawUPi2l8MoGEKTKIQvIt1i1b8OelaRVZyX5zXdJxigwant8e7WiZLSI9
 e/AC0k56v+KPRomsU/IPCF1KWJiWbvmslja2MWlV7/5zLOczPPYy8s+5+o23sy453SCl
 taQCDOJ9yCVvLgvWdvUfxy/A/4FTCqexMAwAHDE47NVMX44eD6W/RthcsSiFN1OMNPZB
 Yd3Koh4MAPb2n4b3tgomn3JjhjCSAQmArPsjjTN2mBXk9IxEjoCAf81qjE/JyAEqXw+Y KQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gydcu0jn8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jun 2022 17:11:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1AB5910002A;
        Mon, 27 Jun 2022 17:11:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D7322248A7;
        Mon, 27 Jun 2022 17:11:43 +0200 (CEST)
Received: from [10.201.21.143] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 27 Jun
 2022 17:11:42 +0200
Message-ID: <991ffe2d-fef3-0907-3f64-edcc5076762c@foss.st.com>
Date:   Mon, 27 Jun 2022 17:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] media: stm32: dcmi: Switch to __v4l2_subdev_state_alloc()
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Marek Vasut <marex@denx.de>,
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
 <733f9689-b4d7-8f23-37d3-920aa6a5a7ea@foss.st.com>
 <c92f1a8d-6439-d494-5779-70619ec94760@denx.de>
 <b9c450b1-96d2-1ac5-0dec-04387903ebf2@ideasonboard.com>
From:   Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <b9c450b1-96d2-1ac5-0dec-04387903ebf2@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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

Thanks Tomi for details,

OK for me with a FIXME on top, for the sake of uniformity with other 
drivers.

BR,
Hugues.

On 6/27/22 15:30, Tomi Valkeinen wrote:
> On 27/06/2022 16:01, Marek Vasut wrote:
>> On 6/27/22 14:53, Hugues FRUCHET wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> Thanks for explanation, I understand now.
>>>
>>> Please note that dcmi is not atmel-isi.c has same code structure, 
>>> hence same problem:
>>>
>>> static int isi_try_fmt(struct atmel_isi *isi, struct v4l2_format *f,
>>>      struct v4l2_subdev_state pad_state = {
>>>          .pads = &pad_cfg
>>>          };
>>> [...]
>>>      ret = v4l2_subdev_call(isi->entity.subdev, pad, set_fmt,
>>>
>>>
>>> Moreover, searching for __v4l2_subdev_state_alloc() I see those "FIXME":
>>>
>>> drivers/media/platform/renesas/vsp1/vsp1_entity.c
>>>      /*
>>>       * FIXME: Drop this call, drivers are not supposed to use
>>>       * __v4l2_subdev_state_alloc().
>>>       */
>>>      entity->config = __v4l2_subdev_state_alloc(&entity->subdev,
>>>                             "vsp1:config->lock", &key);
>>>
>>>
>>> drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
>>>      /*
>>>       * FIXME: Drop this call, drivers are not supposed to use
>>>       * __v4l2_subdev_state_alloc().
>>>       */
>>>      sd_state = __v4l2_subdev_state_alloc(sd, "rvin:state->lock", &key);
>>>
>>>
>>> So I wonder about introducing this new change in dcmi while it is 
>>> marked as "FIXME" in other camera interface drivers ?
>>
>> This is probably something Tomi/Laurent can answer better. It should 
>> be OK for this driver as far as I understand the discussion in this 
>> thread.
> 
> Yes and no. We shouldn't use __ funcs in the drivers. 
> __v4l2_subdev_state_alloc() calls exist in the current drivers as it 
> wasn't trivial to change the driver to do it otherwise while adding the 
> subdev state feature.
> 
> If I recall right, the other users (at least some of them) were storing 
> internal state in the state, not passing it forward. And, of course, the 
> drivers were themselves interested in the state stored there.
> 
> Here, we only need to allocate the state so that the driver is able to 
> call set_fmt on another subdev, so it's a bit different case.
> 
> Anyway, I think it's _not_ ok to add __v4l2_subdev_state_alloc() without 
> a FIXME comment. However, I think it's ok to add a helper func, similar 
> to v4l2_subdev_call_state_active(), which in turn uses 
> __v4l2_subdev_state_alloc.
> 
> However, if we end up in a situation where we think it's "normal" for 
> drivers to call __v4l2_subdev_state_alloc, we need to rename it and drop 
> the two underscores. But I think we're not there yet (and hopefully never).
> 
>   Tomi
