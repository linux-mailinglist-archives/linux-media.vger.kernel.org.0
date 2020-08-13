Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6F84243F19
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 21:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgHMTBZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 15:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHMTBY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 15:01:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99BE2C061757;
        Thu, 13 Aug 2020 12:01:24 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACDE2B8F;
        Thu, 13 Aug 2020 21:01:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597345270;
        bh=WEkPZuLQ3Yk3M0K2VRndc7Z3Rc4ZPMvM9CG/B6V3QvE=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GNrbWj8CEq2RF15ZYjarEVZ+0nUuHnr13JaHoqNOi/NBqnS0rj6cYllXe8Vb9TfSg
         z78freDQf3mVscR/eXfm3I/gXKEWC0PT0OfIZTpP8dEdDrVU5aSm44dEsRWcBGgtwv
         3O9eOobdoPME8opm7chwdPMzp0HVEgCkZgMEgNYw=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: linux-next: Tree for Aug 13 (drivers/media/i2c/max9286.c)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20200813165846.27887669@canb.auug.org.au>
 <17a1c5aa-2f38-c84d-bf2d-485862dc0615@infradead.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <3262a9fc-46e2-3109-3764-e7153edf486d@ideasonboard.com>
Date:   Thu, 13 Aug 2020 20:01:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <17a1c5aa-2f38-c84d-bf2d-485862dc0615@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Randy,

On 13/08/2020 19:35, Randy Dunlap wrote:
> On 8/12/20 11:58 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> News: The merge window has opened, so please do not add any v5.10
>> related material to your linux-next included branches until after the
>> merge window closes again.
>>
>> Changes since 20200812:
>>
> 
> on x86_64:
> 
> # CONFIG_GPIOLIB is not set
> 
> ../drivers/media/i2c/max9286.c: In function 'max9286_register_gpio':
> ../drivers/media/i2c/max9286.c:1033:6: error: 'struct gpio_chip' has no member named 'of_node'
>   gpio->of_node = dev->of_node;
> 

Thanks for the report, Sakari has already submitted a fix [0] for this.
I assume it just needs a nudge to get picked up via Mauro's tree.

[0]
https://lore.kernel.org/linux-media/20200803090935.23619-1-sakari.ailus@linux.intel.com/

Thanks
--
Kieran
