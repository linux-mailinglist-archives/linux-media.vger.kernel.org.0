Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F05A4AD3E8
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 09:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349558AbiBHIsZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 03:48:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349512AbiBHIsX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 03:48:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA5AAC0401F6
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 00:48:22 -0800 (PST)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC768480;
        Tue,  8 Feb 2022 09:48:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644310101;
        bh=RIvpUuX1mIZMoVvNPTMN1O2neIiX4c2EMTywAS9Cz80=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=v8sOh5/SoDVOZDCZbwygje3eGu/wPMAyBOyn0JutKYxjLsJg+dlKZuoRjQcpAWzJ6
         Z5mpWdDHtXb0YtLUe0p4bVHq5wXaB3D+MQi+Yqq2qRJmde5rn4LpnfeAaBE1D4B6vQ
         1pa8AtGR5Jpvaqdvf2nOVs32z+MYyK1hN8ktO2pk=
Message-ID: <8eccd7b8-ba33-2f36-054f-efd873bdf2fe@ideasonboard.com>
Date:   Tue, 8 Feb 2022 10:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 0/7] v4l: subdev active state
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220207161107.1166376-1-tomi.valkeinen@ideasonboard.com>
 <YgHWY380pK/YgGSt@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YgHWY380pK/YgGSt@pendragon.ideasonboard.com>
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

On 08/02/2022 04:33, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Mon, Feb 07, 2022 at 06:11:00PM +0200, Tomi Valkeinen wrote:
>> Hi,
>>
>> This is v3 of the subdev active state series. Changes since v2:
>>
>> - Doc improvements
>> - Allow state->lock to be set by the driver (similarly to v4l2_ctrl_handler)
> 
> While I think we need better in the longer term, this seems like a
> reasonable compromise to land this series and continue building on top.
> 
>> - Rename fields in 'struct v4l2_subdev_pad_config' and drop the try_ prefix.
>> - Add v4l2_subdev_get_locked_active_state(), which calls lockdep_assert_locked() and returns the state.
>> - Changed v4l2_subdev_get_active_state() to call lockdep_assert_not_locked()
>>
>> The idea with the v4l2_subdev_get_active_state /
>> v4l2_subdev_get_locked_active_state change is to have a lockdep_assert
>> called. Roughly I think there are two cases where the
>> v4l2_subdev_get_active_state could be called:
>>
>> - With the intention of just passing it forward to another subdev, in
>>    which case the state must _not_ be locked. Here
>>    v4l2_subdev_get_active_state() can be called.
>>
>> - With the intention of using the state in a case where the state is
>>    known to be already locked. Here v4l2_subdev_get_locked_active_state()
>>    can be called.
> 
> I'm not sure how this will work out, but it seems fine to me to start
> with.

So, a bit longer explanation:

After I added the state->lock change, and used it in a driver so that I 
share the ctrl and the state locks, I had a piece of code in a control 
handler function which needs the state. I had this in the function:

	state = v4l2_subdev_lock_active_state()
	...
	v4l2_subdev_unlock_state(state);

After sharing the lock with ctrls, I had to change it to:

	state = v4l2_subdev_get_active_state()

And my immediate thought was, is it really locked? So I added a 
lockdep_assert. Then I similarly added lockdep_assert in a few other 
drivers, after which I thought that this needs a helper. Then I realized 
that all the old places where v4l2_subdev_get_active_state() is used 
require that the state is _not_locked, so I added 
lockdep_assert_not_locked().

So, when you need the state, you must use one of:

- v4l2_subdev_lock_active_state() (lock the state and get it)
- v4l2_subdev_get_active_state() (get the currently unlocked state)
- v4l2_subdev_get_locked_active_state() (get the currently locked state)

which cover the possible cases and can implicitly do lockdep_assert. The 
first and last functions sound a bit similar, though, but I'm not sure 
how to name them better.

  Tomi
