Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9994941AF1A
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 14:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240553AbhI1MfD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 08:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240528AbhI1MfC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 08:35:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDF3C061575
        for <linux-media@vger.kernel.org>; Tue, 28 Sep 2021 05:33:23 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32B633F1;
        Tue, 28 Sep 2021 14:33:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632832401;
        bh=h9xsLqGI5F842oPjy1JRtrrI3blKZcNwZDVhx4c5doI=;
        h=From:To:Cc:References:Subject:Date:In-Reply-To:From;
        b=nHm6QkU1gKUCsdwErh5g6oU1LuVcbi5w+bbBwSFsPNOdD8T9qXCJOs0c930Z37nj6
         JsauekhkwTYbUllWd2+Jii7aM/V2tav0PN0OXCYJIe8P2KYrU2b72HqzC6vdPhKldw
         ay8fKGjWFoo0ON86EO7HmHEvRTULUB6yUa3S9Ll4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-3-tomi.valkeinen@ideasonboard.com>
 <20210915094403.cazj7bjampnes4ba@uno.localdomain>
 <8e322af6-c010-f906-f733-6d3f770a48fc@ideasonboard.com>
 <f0f4bc4b-7594-28ab-8e8a-2819ce82df47@ideasonboard.com>
 <20210916080802.rznseum57gniplqp@uno.localdomain>
 <627ede43-090f-7440-57ed-fde9bc55fa5d@ideasonboard.com>
 <YVEJJWLv9fyG1Tw7@pendragon.ideasonboard.com>
 <8b8d3bc4-80a0-e901-e417-20e0c8b7a4c6@ideasonboard.com>
 <YVGRRfea+YaijluM@pendragon.ideasonboard.com>
 <0118cbf0-6024-aea3-95b3-4129d3330931@ideasonboard.com>
Subject: Re: [PATCH v8 02/36] media: subdev: add active state to struct
 v4l2_subdev
Message-ID: <8179624e-3a15-f3f3-0cc1-8f3282197b09@ideasonboard.com>
Date:   Tue, 28 Sep 2021 15:33:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0118cbf0-6024-aea3-95b3-4129d3330931@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/09/2021 08:14, Tomi Valkeinen wrote:

> Yes. I'm not 100% sure yet if it's possible to get rid of which from 
> init_cfg, but I'll try it out.
> 
>> As ACTIVE state support is opt-in, it seems to me that we won't need to
>> mass-fix drivers as part of this series if we go for this option. Am I
> 
> Yes, I think so. I'll be wiser after I've worked on this a bit =). I 
> think the routing needs the biggest change, as the routing table 
> contains 'which'. But routing won't affect the current drivers.
> 
> However, 'which' is quite ingrained to v4l2, I won't be too surprised if 
> I keep finding new 'whiches' while removing it from the init_cfg call 
> paths.

It was rather easy to get rid of 'which'. I now have 
v4l2_subdev_routing, which is the struct used in the uAPI:

struct v4l2_subdev_routing {
	__u32 which;
	__u64 routes;
	__u32 num_routes;
	__u32 reserved[5];
};

Then I have v4l2_subdev_krouting, which is used when calling the subdev 
set_routing op:

struct v4l2_subdev_krouting {
	u32 which;
	struct v4l2_subdev_routing_table table;
};

And I have v4l2_subdev_routing_table, which is used in the various 
helper functions, and stored in the state:

struct v4l2_subdev_routing_table {
	unsigned int num_routes;
	struct v4l2_subdev_route *routes;
};

As the only use of v4l2_subdev_krouting is when calling the subdev's 
set_routing, I think we should just drop it and pass 'which' as a 
parameter to subdev's set_routing(). That is a different style compared 
to the other ops, which have the 'which' inside the passed struct.

Any opinions?

  Tomi
