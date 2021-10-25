Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5795C4393F9
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 12:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbhJYKtb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 06:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbhJYKta (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 06:49:30 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49FA3C061745
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 03:47:08 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id exVRmM9gfUo2HexVSmICHn; Mon, 25 Oct 2021 12:47:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1635158826; bh=ENT3wjheawqKlH8oh0yhpmzDfaDR3pK5N6C1vK95Bdg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vZCJ+WBuTPI75VZhPttqFyemc/7VwIBmKXl5Z09V3qW8zL1YMIj5+0DkmeiU47Na1
         3mm/wNPao7pjOrbIb5Kr+NTOrOJqNuyNlfSPbeTaqY/vfATpS1WR0+QWDCqXk6LQtF
         Cea6V2BRQyfXBrgiPtJ4c4fcGg2jae0KjJ+QL/WHLBnIFCzsJaeGlpFs2wVVUgeI5U
         QiydwS5Q3fh94r9ZXJMI0q09uLjo6NExtSDu1nISJ0HSTuLO+qns+JEHZSRee/ZwZu
         QL09eVHr778cGh6VjSxt4QnRagnBuYgSMLnY75rHJyrGfMNirdVfAxbI160bb6+uKZ
         S6W7cbs6LOHDA==
Subject: Re: Userspace API for controlling the focus of the Surface Go [2]
 main/back-camera
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Dan Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org
References: <c7c94544-8af4-ad29-04ef-6131774e68b8@redhat.com>
 <YXaHMd3czQy0NKJn@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <30ad631c-6c6e-6c1a-7b0a-d50d70a169d2@xs4all.nl>
Date:   Mon, 25 Oct 2021 12:47:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXaHMd3czQy0NKJn@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBUp1MLmZxgx9tMY1ZeYsPrL2J+kOqatgJ1gh3Juhs30PD4thUmhpSDk6geCTzD5cKPosQISy6AvlIOpyrSTLNSVdJ/jQPAMNkGStzzNeIZDw8iVG+z6
 EVubSz59POSXquNC9twmNRLfoZic/XliXPcNzo49THwOj6vF+t8w7AesPBDP61TWshqQJSoWp+c8c5T16EGmTTQGj18R4kKzvyu98hwSrf1LJjUmEkTCgjCH
 wgAn6beOs9QPSaJiw6eRVEoYYPdPNYx5yMUdR8T5MUQuBdCcJZTCFa36J3Qqrwpeq+BdYOFUqBILmNHXEgry76ZBWEIECjiOhln7a+cxBL+VxTPgJUBrD1DV
 BQ4WrPQ9gh4E7qfR52JsY2Iri1gw0kFAN1qocjYQ/zPRN1lBLieFdi0sr9Rd5aw/AwIdGWGeLpJFvc7b0Orkx0XvA6X5rXCdFjaC9KU2mJixnpTReMZcUge2
 Gf09/A9JymBkOHBONuLwOJefO6trBrk0F4ggTKYpd4j64EDsYjKwvALtSTE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/10/2021 12:30, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Mon, Oct 25, 2021 at 12:06:30PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> With my (and Dan's) kernel patch-series to enable the back camera on
>> the Surface Go shaping up (and hopefully going upstream soon),
>> the next step is to enable control of the focus lens for the back
>> camera.
>>
>> The focus is controlled through a separate i2c-client which is
>> described by a 2nd I2cSerialBusV2 resource entry in the ACPI
>> device for the ov8865 sensor. By default the kernel only instantiates
>> an i2c-client for the first I2cSerialBusV2 resource entry for an
>> ACPI device, getting an i2c-client for the 2nd one is easy and
>> out of scope for this discussion.
>>
>> The question which I have is, assuming we have the 2nd i2c-client
>> instantiated and we have a i2c-driver binding to it, how do we
>> represent the focus control to userspace.
>>
>> I see 2 possible directions we can go here:
>>
>> 1. Somehow inject an extra v4l2ctrl for this into the v4l2ctrl
>> list of the sensor. AFAIK we don't have infra for this atm, but
>> we could add some generic mechanism to do this to the v4l2-ctrls
>> core. IMHO from a userspace pov this is the cleanest, but at the
>> cost of some extra work / possible ugliness on the kernel side.
>>
>> 2. Register a separate v4l2_subdev for the focus-ctrl and in
>> some way provide information to userspace to which sensor this
>> belongs.
> 
> The second approach is what V4L2 does already. We have a set of drivers
> for VCMs already (search for V4L2_CID_FOCUS_ABSOLUTE in
> drivers/media/i2c/).
> 
>> I believe that both are valid approaches. So before diving into
>> this I wonder what others are thinking about this.
>>
>> Specific questions:
>>
>> 1. Hans Verkuil, what do you think about adding
>> support for another driver to inject ctrls into the ctrl
>> list of another v4l2(sub)dev ? Maybe something like this
>> already exists ? If not do you think this is feasible
>> and desirable to add ?
>>
>> 2. If we go with a separate v4l2_subdev, how do we communicate
>> to which sensor the focus-control belongs to userspace ?
> 
> The information was initially envisioned to be conveyed to userspace
> through the media controller API, using the entity group ID to group the
> camera sensor, lens controller and flash controller, but the
> media_entity_desc.group_id field is now obsolete. No other mechanism
> exist to replace that as far as I know, so we'll have to create
> something. There have been some talks about using a special kind of link
> to expose the relationship between the camera sensor and other
> components.
> 

I thought this was implemented: there should be an interface link from the
sensor entity to the subdev for the flash or focus control.

To my knowledge, this is all available.

Regards,

	Hans
