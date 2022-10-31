Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC1AC613843
	for <lists+linux-media@lfdr.de>; Mon, 31 Oct 2022 14:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbiJaNmJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Oct 2022 09:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbiJaNmI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Oct 2022 09:42:08 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D288D101F7
        for <linux-media@vger.kernel.org>; Mon, 31 Oct 2022 06:42:06 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 11210C0007;
        Mon, 31 Oct 2022 13:42:03 +0000 (UTC)
Date:   Mon, 31 Oct 2022 14:42:02 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: V4L2_SUBDEV_FL_HAS_EVENTS and (un)subscribe_event for subdevice
 drivers
Message-ID: <20221031134202.af3rsek7ejm3dxqb@uno.localdomain>
References: <CAPY8ntAO2UP669Ycfgz5sDfgSakgGCpy+JodQ=0kP3gLSSRDRw@mail.gmail.com>
 <ef887aa3-930b-4a35-8796-fee1a836538c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ef887aa3-930b-4a35-8796-fee1a836538c@xs4all.nl>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Oct 31, 2022 at 01:36:27PM +0100, Hans Verkuil wrote:
> Hi Dave,
>
> On 31/10/2022 13:27, Dave Stevenson wrote:
> > Hi Hans & Sakari
> >
> > A question raised from review of [1]:
> >
> > Is it correct that any subdevice driver that supports any controls
> > should advertise V4L2_SUBDEV_FL_HAS_EVENTS and have
> > subscribe_event/unsubscribe_event core_ops?
> >
> > I added that patch for ov9282 to resolve a v4l2-compliance failure:
> > fail: v4l2-test-controls.cpp(835): subscribe event for control 'User
> > Controls' failed
> > test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> > but it surprised Jacopo, and he has observed that many of the current
> > drivers with controls don't meet this requirement.
> >
> > I just wanted confirmation from those in the know.
>
> It should only be needed if V4L2_SUBDEV_FL_HAS_DEVNODE is also set in the
> subdev driver. If HAS_DEVNODE is set, and there are controls, then HAS_EVENTS
> must be set and you have to be able to (un)subscribe to events.

Most relatively recent sensor drivers have a devnode and register
controls. I wonder if the core could detect this and install the
callback handlers if the two flags are set, as relying on drivers
doing that clearly is not working well :)

>
> Because the controls can be exposed to userspace via a v4l-subdevX device, and
> userspace has to be able to subscribe to control events so that it is
> notified when the control changes value.
>
> The compliance testing of v4l-subdev devices isn't that old, so a lot of older
> subdev drivers where never checked for compliance.
>
> Regards,
>
> 	Hans
>
> >
> > Thanks
> >   Dave
> >
> > [1] https://patchwork.linuxtv.org/project/linux-media/patch/20221005152809.3785786-17-dave.stevenson@raspberrypi.com/
>
