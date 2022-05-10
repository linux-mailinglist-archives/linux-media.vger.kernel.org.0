Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398835220A8
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 18:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347044AbiEJQJG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 12:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348559AbiEJQId (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 12:08:33 -0400
Received: from mailgate1.beam.ltd.uk (mailgate1.beam.ltd.uk [88.96.138.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FD3C5E56
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 09:01:34 -0700 (PDT)
Received: by mailgate1.beam.ltd.uk (Postfix, from userid 900)
        id 005DA5C00DA; Tue, 10 May 2022 17:01:32 +0100 (BST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailgate1.beam.ltd.uk 005DA5C00DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=beam.ltd.uk;
        s=default; t=1652198493;
        bh=BK2JImpWiy/HPIkkPWxkV1ovzXB4EwbO0xEJBRaQZ8c=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=jX/Tgz5S9OlAz3PDbDDkNXAap2HGr4/GcAjw/80nRzAsQS56WqoqYGfjgndxE0W71
         Tp34NOmNBDP4b9GrA9Fuh0OKmnJmq+fPZKADv9NSA6OYp7laASXhh4JDt40N0tBA3D
         la1EPRQSp9CmOeozqo8DKMQ2tORCncuaTibLDET0=
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
Received: from [192.168.202.2] (king.beamweb.co.uk [82.69.10.222])
        by mailgate1.beam.ltd.uk (Postfix) with ESMTPSA id 902CD5C00D0;
        Tue, 10 May 2022 17:01:28 +0100 (BST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailgate1.beam.ltd.uk 902CD5C00D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=beam.ltd.uk;
        s=default; t=1652198488;
        bh=BK2JImpWiy/HPIkkPWxkV1ovzXB4EwbO0xEJBRaQZ8c=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=QP/q+L8B0W9A8tbrctVSi2AlrIcHMqcoKH7evzY3FCF3FybixkdVBAESAOnQjwod+
         s2I1WJ7T9v83WV+zfzwT02xW0vWkZT/3Xs5KFfqWsBuD7h29KlHBDcZQZhSA03vDjQ
         GCwXRcpyaRHk80gqh1Ym8Zo0oinbm/5C5od1XYiA=
Message-ID: <4048baf9-2a4a-8f8e-5457-16bf06868597@beam.ltd.uk>
Date:   Tue, 10 May 2022 17:01:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Video4Linux: Call an I2C subdev function to start a stream after
 a CSI2 driver has been started
Content-Language: en-GB
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Terry Barnaby <terry1@beam.ltd.uk>, linux-media@vger.kernel.org
References: <908eb507-677c-359e-154b-da3a7147af0d@beam.ltd.uk>
 <165219680369.2416244.9210617082672091187@Monstersaurus>
From:   Terry Barnaby <terry1@beam.ltd.uk>
In-Reply-To: <165219680369.2416244.9210617082672091187@Monstersaurus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/05/2022 16:33, Kieran Bingham wrote:
> Hi Terry,
>
> Quoting Terry Barnaby (2022-05-10 14:35:38)
>> Hi,
>>
>> We are working on a system that uses a NXP IMX8MP SOC with a TP2855
>> analogue video front end chip that can capture 1920x1080p25 or PAL
>> 720x576i25 analogue video streams which is generally working using
>> gstreamer as the higher level software driving this.
>>
>> We have an intermittent video stream start up problem which we believe
>> is down to:
>>
>> 1. The TP2855 is initialised first and its subdev *_s_stream() call is
>> called to start the video input.
>>
>> 2. The NXP CSI2 video input hardware is then started:
>> imx8-mipi-csi2-sam.c: mipi_csis_s_stream().
> I don't think I can see this file in the latest linux sources. Are you
> working on an out of tree BSP driver supported by a vendor?
>
> If so - you might be able to contact them directly for support, but if
> we don't have the source code it can be hard to support your issue.
>
> --
> Regards
>
> Kieran

Sorry, top posted in previous email (all different groups methods). I 
have repeated my response here.

Hi Kiera,

Thanks for you response. Yes its from the NXP Yocto distribution with 
kernel at: git://source.codeaurora.org/external/imx/linux-imx.git

But I wasn't after specific information/help with this platform, I was 
really trying to find out if there is a mechanism within the 
mainline/standard Video4Linux kernel API's such that a video front end 
subdev can get some function called once the video pipeline has been 
setup ie. All hardware modules configured and ready to run a video stream.

For example there is the s_stream() function pointer in 
v4l2_subdev_video_ops, but that function is called before the later (in 
pipeline) CSI2 module is started and I need a function to be called 
after all of the pipelines hardware has been initialised to get around 
this hardware feature/issue.

Terry

>
>
>> 3. The TP2855 enables the CSI2 clock after its *_s_stream() call,
>> probably in hardware after its PLL's have locked, by sending a CSI2
>> start sequence on the CSI2 clock pair. This clock is then a continuous
>> clock ie. it does not go into low power mode during horizontal/vertical
>> blanking.
>>
>> 4. The NXP CSI2 video input hardware, based on some Samsung IP, does not
>> see the CSI2 clock unless it sees the CSI2 start sequence and depending
>> on timings it may not see this at video pipeline startup and we get not
>> video stream from the CSI2 hardware.
>>
>> I was hoping the subdev *_s_stream() call would be after all of the
>> hardware's pipeline was setup so I could instigate a CSI2 clock restart
>> in the TP2855 driver, but unfortunately this is called before the CSI2
>> hardware is setup.
>>
>> I can add a one shot timer to do this in the TP2855 subdev *_s_stream()
>> call, but obviously this is not ideal. Is there anyway to get a subdev
>> function called in the video4linux API automatically once all of the
>> video streams hardware is setup ?
>>
>> Any ideas/recommendations ?
>>
>> Terry
>>
>>

