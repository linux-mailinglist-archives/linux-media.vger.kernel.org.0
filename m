Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213EC41A6F1
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 07:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbhI1FP5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 01:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233279AbhI1FP5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 01:15:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22DA7C061575
        for <linux-media@vger.kernel.org>; Mon, 27 Sep 2021 22:14:18 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 008C33F1;
        Tue, 28 Sep 2021 07:14:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632806054;
        bh=NqeOjKS2JmsEF0mFGd99JFWz/1Gd5W6J4d3/FiA1G4M=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=FX+mSXdAu8/zlOjHrXpdbNBPvOMUe/kr0jHXX9RngEbmXf21r12f6y7obvmAyxsVW
         HiUyUVQ0U3EBk7WRSS9vM1iAW9YKyiq3yYaDVwz37a/aHeLQAWuXFutonbrbdzdS/R
         Uqt4b+C0sTcUF6WyGP4Rcl2dt9jVeGbsNNLrfHuk=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
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
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v8 02/36] media: subdev: add active state to struct
 v4l2_subdev
Message-ID: <0118cbf0-6024-aea3-95b3-4129d3330931@ideasonboard.com>
Date:   Tue, 28 Sep 2021 08:14:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVGRRfea+YaijluM@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/09/2021 12:39, Laurent Pinchart wrote:

>>> I'd like to propose a third approach (or at least I believe it's a third
>>> one). I agree with Jacopo that the state structure should not have a
>>> which field, that's a layering violation. The state is a state,
>>> regardless of whether it holds TRY or ACTIVE data. What are the current
>>> blockers that would prevent that ?
>>
>> Oh, I agree with that too. I didn't add the 'which' field to state
>> because I thought it's good =). It is supposed to be temporary solution.
>> init_cfg() is the issue here.
>>
>> It think I had these options:
>>
>> - Change init_cfg() to take 'which' as a parameter
>> - Change init_cfg() implementations to not use 'which'
>> - Add new version for new drivers, init_cfg_state() or such, which
>> either gets the which as a parameter or doesn't use which.
>> - Add 'which' to state.
>>
>> I chose the fourth one as it's a very small change, and can be removed
>> easily in the future when the underlying problem is solved.
>>
>>> However, I think .init_cfg() should be used to initialize *all* states,
>>> both TRY and ACTIVE. That will simplify driver implementation (but
>>> centralizing the initialization in a single place) and ensure that the
>>> default value for the ACTIVE state always matches the default value for
>>> the TRY state, which I think is important.
>>
>> I agree.
> 
> That's the second option from you list above, right ?

Yes. I'm not 100% sure yet if it's possible to get rid of which from 
init_cfg, but I'll try it out.

> As ACTIVE state support is opt-in, it seems to me that we won't need to
> mass-fix drivers as part of this series if we go for this option. Am I

Yes, I think so. I'll be wiser after I've worked on this a bit =). I 
think the routing needs the biggest change, as the routing table 
contains 'which'. But routing won't affect the current drivers.

However, 'which' is quite ingrained to v4l2, I won't be too surprised if 
I keep finding new 'whiches' while removing it from the init_cfg call paths.

  Tomi
