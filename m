Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B943E61367E
	for <lists+linux-media@lfdr.de>; Mon, 31 Oct 2022 13:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbiJaMge (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Oct 2022 08:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiJaMgc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Oct 2022 08:36:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72E5233
        for <linux-media@vger.kernel.org>; Mon, 31 Oct 2022 05:36:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 54785611F0
        for <linux-media@vger.kernel.org>; Mon, 31 Oct 2022 12:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07192C433D6;
        Mon, 31 Oct 2022 12:36:28 +0000 (UTC)
Message-ID: <ef887aa3-930b-4a35-8796-fee1a836538c@xs4all.nl>
Date:   Mon, 31 Oct 2022 13:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: V4L2_SUBDEV_FL_HAS_EVENTS and (un)subscribe_event for subdevice
 drivers
Content-Language: en-US
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
References: <CAPY8ntAO2UP669Ycfgz5sDfgSakgGCpy+JodQ=0kP3gLSSRDRw@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAPY8ntAO2UP669Ycfgz5sDfgSakgGCpy+JodQ=0kP3gLSSRDRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On 31/10/2022 13:27, Dave Stevenson wrote:
> Hi Hans & Sakari
> 
> A question raised from review of [1]:
> 
> Is it correct that any subdevice driver that supports any controls
> should advertise V4L2_SUBDEV_FL_HAS_EVENTS and have
> subscribe_event/unsubscribe_event core_ops?
> 
> I added that patch for ov9282 to resolve a v4l2-compliance failure:
> fail: v4l2-test-controls.cpp(835): subscribe event for control 'User
> Controls' failed
> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> but it surprised Jacopo, and he has observed that many of the current
> drivers with controls don't meet this requirement.
> 
> I just wanted confirmation from those in the know.

It should only be needed if V4L2_SUBDEV_FL_HAS_DEVNODE is also set in the
subdev driver. If HAS_DEVNODE is set, and there are controls, then HAS_EVENTS
must be set and you have to be able to (un)subscribe to events.

Because the controls can be exposed to userspace via a v4l-subdevX device, and
userspace has to be able to subscribe to control events so that it is
notified when the control changes value.

The compliance testing of v4l-subdev devices isn't that old, so a lot of older
subdev drivers where never checked for compliance.

Regards,

	Hans

> 
> Thanks
>   Dave
> 
> [1] https://patchwork.linuxtv.org/project/linux-media/patch/20221005152809.3785786-17-dave.stevenson@raspberrypi.com/

