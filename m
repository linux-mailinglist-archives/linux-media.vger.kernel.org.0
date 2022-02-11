Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB2F4B1FCD
	for <lists+linux-media@lfdr.de>; Fri, 11 Feb 2022 09:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245247AbiBKIBT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Feb 2022 03:01:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241534AbiBKIBR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Feb 2022 03:01:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 584FFBC4
        for <linux-media@vger.kernel.org>; Fri, 11 Feb 2022 00:01:16 -0800 (PST)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D33F93;
        Fri, 11 Feb 2022 09:01:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644566475;
        bh=xTSAgvTasyZRMlZ5lROLojZ2VfLx7NGgN468LJdCbVM=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=dvZFpNWECTrvZPif7u9vg+jvJHp/EzGeokDPSbZdv4LpfR8kab936TUy5hJRY1BgJ
         751ldYOh/YM5w8GmDz5X70D81eTrwZG3VLemku7u5cAb1I/BM5O6ztFOH+zdDqucLO
         ENoZUI294tXRAXsnMCvEi/OQQlenj1WkkctFy4+I=
Message-ID: <862f9e9d-4f98-a314-579f-4e782ee3ff94@ideasonboard.com>
Date:   Fri, 11 Feb 2022 10:01:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/23] media: ov5640: Rework the clock tree programming
 for MIPI
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <5db6f493-ca45-311a-1f44-9138e01722a1@ideasonboard.com>
 <20220210171123.oi54lq47eyjucwpk@uno.localdomain>
 <a77642fc-648e-b12e-b6e0-8090b5cb2d83@ideasonboard.com>
In-Reply-To: <a77642fc-648e-b12e-b6e0-8090b5cb2d83@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/02/2022 09:55, Tomi Valkeinen wrote:
> On 10/02/2022 19:11, Jacopo Mondi wrote:
>> Hi Tomi
>>
>> On Thu, Feb 10, 2022 at 03:00:21PM +0200, Tomi Valkeinen wrote:
>>> On 10/02/2022 13:04, Jacopo Mondi wrote:
>>>> v1:
>>>> https://patchwork.linuxtv.org/project/linux-media/list/?series=7249
>>>
>>> You could rather point to lore.kernel.org, so that the intro letter 
>>> and the
>>> discussions are also visible.
>>
>> Sure, here you go!
>> https://lore.kernel.org/linux-media/20220131143245.128089-1-jacopo@jmondi.org/ 
>>
>>
>>>
>>>> A branch for testing based on the most recent media-master is 
>>>> available at
>>>> https://git.sr.ht/~jmondi_/linux #jmondi/media-master/ov5640-v2
>>>>
>>>> If anyone with a DVP setup could verify I have not broken their use 
>>>> case
>>>> I would very much appreciate that :)
>>>>
>>>> v1 -> v2:
>>>> - rework the modes definition to process the full pixel array
>>>> - rework get_selection to report the correct BOUND and DEFAULT targets
>>>> - implement init_cfg
>>>> - minor style changes as suggested by Laurent
>>>> - test with 1 data lane
>>>
>>> Very nice! I tested this on TI's DRA76 EVM (CSI-2). UYVY and RGB565, 
>>> with
>>> the following resolutions: 160 120, 176 144, 320 240, 640 480, 720 
>>> 480, 720
>>> 576, 1024 768, 1280 720, 1920 1080.
>>
>> Great! A 2 data lanes setup I assume ? Have you been able to test the
>> framerate as well ?
> 
> Yes, 2 data lanes. I can see that with 640x480 and 1024x768 I get ~30fps.
> 
> Why does ov5640_enum_frame_interval() return an error if ov5640 is a csi 
> sensor?

Ah, never mind. I see the patch 18.

  Tomi
