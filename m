Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 058EC55DA89
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235413AbiF0Le3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 07:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236194AbiF0Ld0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 07:33:26 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986ABCE1A
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 04:30:32 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id C7A6C83C70;
        Mon, 27 Jun 2022 13:30:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656329430;
        bh=PNJWeluzCFC9fqpkPX1hueWxRzJxtppdWn2vMDgtqVo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=CX2LJjcpznGAa8VOWJF2DVYDku4/vBrvAw7aFP5BIMpfXZWho1Tv2Gwgks4Y9lKZj
         Kvohc3LTldK9Qq7ngliBJ+GBOuSY69eP1J07uYJHaSYJo2TETEmUsut5MVBnS4rGn5
         VAZ2h5QO80Ra2BBUCelZWXZDEx3My44KTc0IRxolkdIZeqVZcCVuglCJtm+phDfw6v
         kqLWsSVSL1ApkMDx+B7+zWHybHKcNkl1+gQIXXuj13oPDGJvc8H5Mx6d4BgwC2aPzb
         EItwg10yWbLBswty/k73cIKmzxuYX8Cw8B6CBeSvI7RCuw42V6wxk0T5XlzZxHnAiU
         yAKHYZK+ahZ7Q==
Message-ID: <39657445-e5ac-bfd6-c122-b18088fa4b41@denx.de>
Date:   Mon, 27 Jun 2022 13:30:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] media: stm32: dcmi: Switch to __v4l2_subdev_state_alloc()
Content-Language: en-US
To:     Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20220618222442.478285-1-marex@denx.de>
 <Yq5c6dObTlmZr95P@pendragon.ideasonboard.com>
 <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
 <4d5b5c59-f3d5-ad5a-ae61-73277b4adefa@denx.de>
 <5ee6c0c0-8ab0-561c-e1f6-b26e4ec438af@foss.st.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <5ee6c0c0-8ab0-561c-e1f6-b26e4ec438af@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/27/22 11:14, Hugues FRUCHET wrote:
> Hi Marek,

Hi,

>>>> On Sun, Jun 19, 2022 at 12:24:42AM +0200, Marek Vasut wrote:
>>>>> Any local subdev state should be allocated and free'd using
>>>>> __v4l2_subdev_state_alloc()/__v4l2_subdev_state_free(), which
>>>>> takes care of calling .init_cfg() subdev op. Without this,
>>>>> subdev internal state might be uninitialized by the time
>>>>> any other subdev op is called.
>>>
>>> Does this fix a bug you have?
>>
>> Yes
> 
> Which bug did you encounter exactly ?

The DCMI driver does set_fmt subdev call on the sensor driver instance.

The mt9p031 sensor driver set_fmt depends on crop rectangle to be 
initialized _before_ set_fmt subdev call is made. Currently this 
initialization is done in open callback, which is too late, so when the 
DCMI does set_fmt subdev call, it operates on uninitialized private data.

There is patch to mt9p031 driver which move the initialization to the 
right place in .init_cfg:
[PATCH v2] media: mt9p031: Move open subdev op init code into init_cfg

However, the .init_cfg is not called by DCMI right now. For that to be 
called in the right place, __v4l2_subdev_state_alloc() must be added, 
hence this patch.

You won't trigger the problem on OV5640 because that one driver does not 
implement .init_cfg v4l2_subdev_ops .

> This is strange that we have not yet encounter any problems around that 
> through our tests campaigns... or we have to enforce with a new test, so 
> better to know what your problem was exactly.

You need a sensor driver which implements struct v4l2_subdev_ops 
.init_cfg and then have something in set_fmt depend on the 
initialization done in the .init_cfg callback . Then you would see the 
problem.

>>> Wasn't this broken even before the active state, as init_cfg was not 
>>> called?
>>
>> Yes, this was always broken. I suspect nobody tested this mode of 
>> operation before. In my case, I have this DCMI driver connected 
>> directly to MT9P006 sensor.
> 
> As far as I see, MT9P006 sensor is a 12 bits parallel interface sensor.
> I don't see the difference with our OV5640 used in parallel mode which 
> is a mainline config on our side, so one more time I wonder what the 
> problem was.

See above.
