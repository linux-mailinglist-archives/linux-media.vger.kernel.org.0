Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AED3A4B979C
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 05:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233702AbiBQETe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 23:19:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231372AbiBQETd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 23:19:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874EE1907C3
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 20:19:19 -0800 (PST)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 900D425B;
        Thu, 17 Feb 2022 05:19:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645071558;
        bh=9Q2Ul7TGMjSX+vcrVUxd6PItyslQd0cBIS5m97Zyl04=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=H7QGDv0yz72LHwpwKh0oiT9bk1D+rZQy0wy1QF+CfZVFw+HinpmGh9zdbALh7GiZ/
         05kXPqkIYK/6V3vVQ1jvULUSdwvOz8lCSdXZkYkDn4JJgWFGkZtwx8A7gcUVifo1jg
         S4gH3qwAZVm3INP8E39vs2/1MGDmYNKh5fg5vjOw=
Message-ID: <544bac78-715f-3db8-04f9-086f6fe49521@ideasonboard.com>
Date:   Thu, 17 Feb 2022 06:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 6/7] media: subdev: add v4l2_subdev_call_state_active()
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220216130049.508664-1-tomi.valkeinen@ideasonboard.com>
 <20220216130049.508664-7-tomi.valkeinen@ideasonboard.com>
 <Yg1tC0dLieuZLbXy@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Yg1tC0dLieuZLbXy@pendragon.ideasonboard.com>
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

On 16/02/2022 23:30, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Wed, Feb 16, 2022 at 03:00:48PM +0200, Tomi Valkeinen wrote:
>> Add v4l2_subdev_call_state_active() macro to help calling subdev ops
>> that take a subdev state as a parameter.
> 
> We should not encourage subdev drivers to call into each other. There
> may be some valid use cases for such a helper at this point, namely in
> the .start_streaming() implementation in a vb2 queue, but even then, I
> think it would be best to rework the pipeline start API to lock the
> states of all subdevs in the pipeline (I've already improved pipeline
> start on top of your streams series, the locking isn't there yet, but I
> could give it a try).
> 
> On the other hand, this macro could help identifying drivers that handle
> locking manually, helping reworking them once the pipeline start API
> handles locking too.

I use this in the cal-video.c to implement the legacy non-MC support. 
That is a bit special case, and I could do that with a CAL internal 
helper. So I'm fine with dropping this if there won't be other users.

  Tomi
