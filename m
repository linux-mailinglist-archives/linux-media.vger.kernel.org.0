Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDF475B4D40
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 12:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiIKKRh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 06:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbiIKKRc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 06:17:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED5936DE4
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 03:17:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CBC22B80B1D
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 10:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC9EC433D6;
        Sun, 11 Sep 2022 10:17:23 +0000 (UTC)
Message-ID: <d44f557a-1e67-b6db-64fa-603a469a6b53@xs4all.nl>
Date:   Sun, 11 Sep 2022 12:17:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Media Summit] Imaging Sensor functionality
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        Jacopo Mondi <jacopo@jmondi.org>
References: <CAPY8ntBGKkg=KOXaP9bBv6Y8c7Mgut0=w-LTsvKHZac=zzdJDQ@mail.gmail.com>
 <29b69b01-15c9-28dc-4e21-7e54be171059@xs4all.nl>
 <Yxy4ixiuevMf/fZW@pendragon.ideasonboard.com>
 <fdc0d9dd-b5d9-d054-2791-08a245d47d5e@xs4all.nl>
 <Yx2mw88LsixbURzd@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <Yx2mw88LsixbURzd@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-10.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/09/2022 11:13, Laurent Pinchart wrote:
> On Sun, Sep 11, 2022 at 09:12:15AM +0200, Hans Verkuil wrote:
>> On 10/09/2022 18:17, Laurent Pinchart wrote:
>>> On Sat, Sep 10, 2022 at 02:50:10PM +0200, Hans Verkuil wrote:
>>>> On 06/09/2022 18:14, Dave Stevenson wrote:
>>>>> Hi All.
>>>>>
>>>>> I realise that I'm in a slightly different position from many mainline
>>>>> Linux-media developers in that I see multiple use cases for the same
>>>>> sensor, rather than a driver predominantly being for one
>>>>> product/platform. I'm therefore wanting to look at generic solutions
>>>>> and fully featured drivers. Users get to decide the use cases, not the
>>>>> hardware designers.
>>>>>
>>>>> The issues I've raised are things that I've encountered and would
>>>>> benefit from a discussion to get views as to the direction that is
>>>>> perceived to be workable. I appreciate that some can not be solved
>>>>> immediately, but want to avoid too much bikeshedding in the first
>>>>> round of patches.
>>>>> What's realistic, and what pitfalls/limitations immediately jump out at people.
>>>>>
>>>>> Slides are at https://drive.google.com/file/d/1vjYJjTNRL1P3j6G4Nx2ZpjFtTBTNdeFG/view?usp=sharing
>>>>>
>>>>> See you on Monday.
>>>>>
>>>>>   Dave
>>>>
>>>> Some comments for the meeting on Monday:
>>>>
>>>> - On-sensor temperature sensing:
>>>>
>>>> If a control is used to read this, but the value is
>>>> not available yet, then -EACCES can be returned. That's already defined as a valid return
>>>> code in the API, it would just need to be extended for this use-case.
>>>>
>>>> - Sync sensors:
>>>>
>>>> Should it be part of the DT? That depends, I think, on whether this is a pure sw mechanism,
>>>> or whether the wiring dictates which sensor can be master and which can be slaves. I assume
>>>> that at the very least there has to be a way to group sensors that are/can be connected to
>>>> the same master sync signal.
>>>>
>>>> - Lens assemblies:
>>>>
>>>> For what it is worth, Cisco uses motor controlled lenses and irises. We extended the camera
>>>> controls with these new controls:
>>>>
>>>> #define V4L2_CID_FOCUS_CURRENT                  (V4L2_CID_CAMERA_CLASS_BASE+36)
>>>> #define V4L2_CID_IRIS_CURRENT                   (V4L2_CID_CAMERA_CLASS_BASE+38)
>>>> #define V4L2_CID_FOCUS_MOTOR_STATUS             (V4L2_CID_CAMERA_CLASS_BASE+41)
>>>> #define V4L2_CID_IRIS_MOTOR_STATUS              (V4L2_CID_CAMERA_CLASS_BASE+43)
>>>> enum v4l2_motor_status {
>>>>         V4L2_MOTOR_STATUS_IDLE                  = (0),
>>>>         V4L2_MOTOR_STATUS_MOVING                = (1 << 0),
>>>>         V4L2_MOTOR_STATUS_FAILED                = (1 << 1),
>>>>         V4L2_MOTOR_STATUS_NOTCALIBRATED         = (1 << 2),
>>>> };
>>>> #define V4L2_CID_FOCUS_MOTOR_SPEED              (V4L2_CID_CAMERA_CLASS_BASE+46)
>>>> #define V4L2_CID_IRIS_MOTOR_SPEED               (V4L2_CID_CAMERA_CLASS_BASE+48)
>>>>
>>>> This worked well for our use-case, but for us userspace has complete knowledge about
>>>> the camera assembly properties.
>>>
>>> Where does userspace get that information from ?
>>>
>>
>> From the software engineers :-) We designed the cameras, so we know how to operate them.
>>
>> I'm not entirely sure if that's what you meant, though.
> 
> :-)
> 
> I meant to ask if you have userspace software that can work with
> different camera modules, in which case it would need to identify the
> module and retrieve corresponding parameters. That leads to the question
> of camera module identification (i.e. if we have modules with the same
> sensor but with different lenses, how do we identify that, as typically
> in DT all we have is the sensor model), parameters format (can we
> standardize that, in order to have interoperability of different
> userspace software with different platforms) and storage (some systems
> have an NVM in the camera sensor or in the camera sensor module, can we
> meaningfully use that ?).
> 

Ah, no. These camera assemblies are part of the product itself. E.g. something
like this: https://projectworkplace.cisco.com/products/cisco-webex-dx80

Obviously the software knows the product as a whole, and so knows how the
camera assembly is made. Note that for most of these controls the device tree
will provide the ranges (depends on the number of steps of the stepper motor,
etc.)

I'm not up to speed on all the details (motor control is not my area of expertise),
but if there are specific questions I can probably dig them up (unless it is Cisco
proprietary code, of course).

Regards,

	Hans
