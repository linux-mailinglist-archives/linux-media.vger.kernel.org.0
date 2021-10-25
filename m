Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F0E4394A2
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 13:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbhJYLUp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 07:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhJYLUo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 07:20:44 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 681AEC061745
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 04:18:22 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id exzemMRU6Uo2HexzfmIOD5; Mon, 25 Oct 2021 13:18:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1635160699; bh=eTDhIkzkcEw6HvoB5YSD03tfzviMUpGPWMkJ0gl/lM4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mFDWWpCMI0OBREqmF5Gv4AVs7DIf0Q0iu0KUCVehM08lzHBQYrYCCB8Z99QEypMXf
         LV14Wv/Vr38rPDigb6m8QtUx2EZdJTU7E6VsLkTu6tmQH11Eq/owJNoN52i0fAACX1
         xOKb6lV8Rs95A3xpKGXl/5HGYkxzE+qXxpKLzDByVKMZbQvQTLkBDKo7bXt8BoSr8R
         LPh3JcQwyimoyDG0ZFr3LBOAz1amRUkMGxX0MdUzvucMnEJC6q4B/2IFiQgNpYFv/w
         6PLFTSkihyrfsWpNfH+GO/SEh17wApmeLQvm5ZTTnBkhRV1E67iTuGfk57XdG3F2DL
         Tgfd1PWHMymjA==
Subject: Re: Userspace API for controlling the focus of the Surface Go [2]
 main/back-camera
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Dan Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org
References: <c7c94544-8af4-ad29-04ef-6131774e68b8@redhat.com>
 <YXaHMd3czQy0NKJn@pendragon.ideasonboard.com>
 <30ad631c-6c6e-6c1a-7b0a-d50d70a169d2@xs4all.nl>
 <YXaNFulQvs/P0iXC@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8b25aa66-d054-2313-446a-d999565e33b0@xs4all.nl>
Date:   Mon, 25 Oct 2021 13:18:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXaNFulQvs/P0iXC@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMgT4Eh9OTv+eD9EZiE49xWB8k4OvEvYVi08pn05vka8nEMyMJf2D3sztdCpZH5EbBMJwZdnprvmhXMB5VK+9HFq11V5ldg+3rsIn4IEQ2qMhmEbheNM
 9GRfvHjevXhLc9fWrXhycyb46qyGBgiZKwoaZE/4HTcd0nmPoTR3db5rkLNa8J2bmcYdnyqk3hcregXhYBrmNwqpQP32Ouzi7d4R8XKoPz0LpDakXXcCyS9c
 +VVX+J7XQH3TeUV+cjHnZvgwcEvmQN7fPwNU1EqCK25AG0es2w1HofldplmDpVHjZWmM/f7XFaTIJRrKu7tkInZf67l59bRKw6qYJEXcfHRRbUo24sbjwJAC
 qnlBgDW3H2H8QUK/vxjrmceYLg9z/rQCXJQPoBGFsc6oGdR5BRadCfZnHR07khOzybU6aoQYRW5uEjWnnbPFk8/2BIzTEJjVEmwGP98Zx8K4ygdNBEspYzR/
 Rj3jWLB156c15JRi0GJ/tswlEMImWXo2D/aTvCsrhrpcqbrBtT3wK6Es+pM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/10/2021 12:55, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Mon, Oct 25, 2021 at 12:47:05PM +0200, Hans Verkuil wrote:
>> On 25/10/2021 12:30, Laurent Pinchart wrote:
>>> On Mon, Oct 25, 2021 at 12:06:30PM +0200, Hans de Goede wrote:
>>>> Hi All,
>>>>
>>>> With my (and Dan's) kernel patch-series to enable the back camera on
>>>> the Surface Go shaping up (and hopefully going upstream soon),
>>>> the next step is to enable control of the focus lens for the back
>>>> camera.
>>>>
>>>> The focus is controlled through a separate i2c-client which is
>>>> described by a 2nd I2cSerialBusV2 resource entry in the ACPI
>>>> device for the ov8865 sensor. By default the kernel only instantiates
>>>> an i2c-client for the first I2cSerialBusV2 resource entry for an
>>>> ACPI device, getting an i2c-client for the 2nd one is easy and
>>>> out of scope for this discussion.
>>>>
>>>> The question which I have is, assuming we have the 2nd i2c-client
>>>> instantiated and we have a i2c-driver binding to it, how do we
>>>> represent the focus control to userspace.
>>>>
>>>> I see 2 possible directions we can go here:
>>>>
>>>> 1. Somehow inject an extra v4l2ctrl for this into the v4l2ctrl
>>>> list of the sensor. AFAIK we don't have infra for this atm, but
>>>> we could add some generic mechanism to do this to the v4l2-ctrls
>>>> core. IMHO from a userspace pov this is the cleanest, but at the
>>>> cost of some extra work / possible ugliness on the kernel side.
>>>>
>>>> 2. Register a separate v4l2_subdev for the focus-ctrl and in
>>>> some way provide information to userspace to which sensor this
>>>> belongs.
>>>
>>> The second approach is what V4L2 does already. We have a set of drivers
>>> for VCMs already (search for V4L2_CID_FOCUS_ABSOLUTE in
>>> drivers/media/i2c/).
>>>
>>>> I believe that both are valid approaches. So before diving into
>>>> this I wonder what others are thinking about this.
>>>>
>>>> Specific questions:
>>>>
>>>> 1. Hans Verkuil, what do you think about adding
>>>> support for another driver to inject ctrls into the ctrl
>>>> list of another v4l2(sub)dev ? Maybe something like this
>>>> already exists ? If not do you think this is feasible
>>>> and desirable to add ?
>>>>
>>>> 2. If we go with a separate v4l2_subdev, how do we communicate
>>>> to which sensor the focus-control belongs to userspace ?
>>>
>>> The information was initially envisioned to be conveyed to userspace
>>> through the media controller API, using the entity group ID to group the
>>> camera sensor, lens controller and flash controller, but the
>>> media_entity_desc.group_id field is now obsolete. No other mechanism
>>> exist to replace that as far as I know, so we'll have to create
>>> something. There have been some talks about using a special kind of link
>>> to expose the relationship between the camera sensor and other
>>> components.
>>
>> I thought this was implemented: there should be an interface link from the
>> sensor entity to the subdev for the flash or focus control.
> 
> Interface links are only meant to link entities to interfaces, not
> entities to entities. media_create_intf_link() is only called for that
> purpose today.
> 
>> To my knowledge, this is all available.
> 
> To my knowledge, it isn't :-) I'd be happy to be proven wrong though.
> 

I think you are correct. The link is there on the DT-level, but it is not
discoverable in the media topology.

I have used the DT information in the past, but that was for a video-centric
driver. And the focus controls were nicely inherited by the video device.

Regards,

	Hans
