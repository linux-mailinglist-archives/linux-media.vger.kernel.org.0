Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDB6C638850
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 12:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbiKYLLk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 06:11:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiKYLLj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 06:11:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2A923EAB;
        Fri, 25 Nov 2022 03:11:38 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9E41326;
        Fri, 25 Nov 2022 12:11:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669374697;
        bh=bu41QcnVwMcHpBwuRVSr+s2Hv7ITK8xRRwFmE1CEr00=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=sntsMVcQWfYqfc+4pJkKDLsRgTV5xhZbuxSbLe93OSkZq40WAUzHklnXinKTTNupP
         AcPM9FGhpwM+rwFELUrrQ3OhPlNgZQE7AAt12fUmkdT1weUgxsjQpwZmBlcJysVUFo
         LNfgBZqMBqU2LuHTSVm8e+YZNGGc0yJR4Ju44qpE=
Message-ID: <aa42a60b-fe34-a418-3ada-af55f260592e@ideasonboard.com>
Date:   Fri, 25 Nov 2022 11:11:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/3] platform/x86: int3472/discrete: Make it work with
 IPU6
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com>
 <Y4Cf5tLWsBDTndei@pendragon.ideasonboard.com>
 <Y4ChnCHkV9RufccT@smile.fi.intel.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <Y4ChnCHkV9RufccT@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 25/11/2022 11:06, Andy Shevchenko wrote:
> On Fri, Nov 25, 2022 at 12:58:46PM +0200, Laurent Pinchart wrote:
>> On Fri, Nov 25, 2022 at 10:17:17AM +0000, Dan Scally wrote:
> ...
>
>> Can the LED framework be used without having the LED exposed to
>> userspace ?
> I believe the correct question here is "can the states of some leds be
> read-only from user perspective" (this way any changes into led subsystems
> looks less intrusive, esp. taking into account that subsystem is de facto
> unmaintained).
>

I think the answer to that is yes:


https://elixir.bootlin.com/linux/latest/source/drivers/leds/led-class.c#L47

