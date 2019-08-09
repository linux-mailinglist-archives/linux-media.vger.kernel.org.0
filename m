Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA60D8797E
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 14:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406712AbfHIMMz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 08:12:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51782 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406623AbfHIMMy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Aug 2019 08:12:54 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F480CC;
        Fri,  9 Aug 2019 14:12:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565352771;
        bh=b3ehpFyRIHporL4C9D2FbmENdy4f6PnD3tdFWVqe4Pg=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=e91fdJSuL6QpZnI9fzg7yEvtMR43qi2n0SZzCj9pdQsPhrkJEPFXcTsgJ2lXrwQxV
         379JABNqfGAN3N6Md7JUJV/c8Q6cLdHQLLbfic9PhhjKIka5pqBJFwCFm+pGPkAzrD
         orCes9AAeHwKTPbk8SZYLCaH6MQzvRrsCjq7yHjo=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 2/2] max9286: Add MAX9286 driver
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20190809040558.10698-1-niklas.soderlund+renesas@ragnatech.se>
 <20190809040558.10698-3-niklas.soderlund+renesas@ragnatech.se>
 <5a640d94-799a-71ed-9f02-014adaabd595@ideasonboard.com>
 <20190809120429.GE24385@bigcity.dyn.berto.se>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <8f5ce55a-666a-2350-b557-c275a69218c0@ideasonboard.com>
Date:   Fri, 9 Aug 2019 13:12:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809120429.GE24385@bigcity.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/08/2019 13:04, Niklas Söderlund wrote:
> Hi Kieran,
> 
> Thanks for your feedback.
> 
> On 2019-08-09 09:09:43 +0100, Kieran Bingham wrote:
>> Hi Niklas,
>>
>> This should be at least v5.
> 
> I don't agree ;-) This is a "new" series where multiple streams are not 
> supported and there are no external dependencies. To indicate this I 

I'm afraid there's nothing new about a version of this series with
support for only a single stream.

See version 2 of my series:

https://lore.kernel.org/linux-media/20180808165559.29957-4-kieran.bingham@ideasonboard.com/


> reset the version. I don't feel strongly about this next submission can 
> remedy this if you do feel strongly about it.

I find it very confusing to have reset the version but kept exactly the
same patch title.

It's a fork of the series :D

>> Did you take the last v4 and work from there?
>> I have made changes since the last posting. Did you get an update from
>> my branches?
>>
>> What changes have you made to this posting compared to whichever
>> patch-base you have taken to start from?
> 
> I took my latest known good state and diffed it with all gmsl branches i 
> could find picked what seamed most recent. Then I removed multiplexed 
> stream support, fixed a few todos in error paths to clean up notifiers 
> and unified naming of the private data structure.


I'll diff your version with my latest.

There were other review comments worked on from Sakari too., and there
is an outstanding comment from Rob to complete on the bindings from v4.

--
Kieran



