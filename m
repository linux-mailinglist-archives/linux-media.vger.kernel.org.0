Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94BFE6A0EE7
	for <lists+linux-media@lfdr.de>; Thu, 23 Feb 2023 18:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjBWRw5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Feb 2023 12:52:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjBWRw4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Feb 2023 12:52:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F0D977E
        for <linux-media@vger.kernel.org>; Thu, 23 Feb 2023 09:52:53 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F234496;
        Thu, 23 Feb 2023 18:52:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677174771;
        bh=a3wY6sx7vT/o9eAy+p4i2b8eWYJNzDeo4ODWAdagOWk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=GNLALscNbN+OtXXYz/TVZYQ4IANs0YbMUlT04F4DQbmD3Qb18J+hEBueWJlUes0Qw
         w2n1QT1ocVNvyAZ5ZIBb7FqBU4AN1Z1WvSmrYk7IDNwLDr4JJJwzUfB83XoO5C6XPh
         SPE+T5KPCn+DqZbDeS6dueiRe8rjBbsdR0h1RhzM=
Message-ID: <bca4cd33-eb4a-693f-5663-365459d89cc7@ideasonboard.com>
Date:   Thu, 23 Feb 2023 19:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 1/3] media: ti: cal: Add support for 1X16 mbus formats
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>
References: <20230222125630.421020-1-tomi.valkeinen@ideasonboard.com>
 <20230222125630.421020-2-tomi.valkeinen@ideasonboard.com>
 <20230223171021.ukttr2xwcuxlzdzu@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230223171021.ukttr2xwcuxlzdzu@uno.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/02/2023 19:10, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Wed, Feb 22, 2023 at 02:56:28PM +0200, Tomi Valkeinen wrote:
>> For legacy reasons the CAL driver uses 2X8 mbus formats for the CSI-2
>> link (e.g. MEDIA_BUS_FMT_YUYV8_2X8). 1X16 formats are more correct and
>> used by many drivers, so add 1X16 support to CAL.
>>
>> We keep the 2X8 formats for backward compatibility.
> 
> Eh, this is the usual question about what we should consider a
> to be a userspace breakage or not.
> 
> I presume the reason to maintain 2X8 formats is (assuming the CAL
> interface is CSI-2 only, right ?) because sensor drivers that only
> support 2X8 formats will then fail to link_validate() if you remove

Yes.

> all 2X8 formats here. I'm of the opinion that we should bite the
> bullet and move to 1X16. If any driver that used to work with CAL now
> breaks, the sensor driver will have to be fixed.
> 
> In my humble experience, that's what we did with the ov5640 sensor. We

Yes, you did.

> removed the 2X8 formats in CSI-2 mode and some platform driver broke
> and then had been fixed (it happened in the same release cycle), win win.

No, CAL is still broken =). OV5640 is the only sensor I have. I just 
haven't had time to look at this and fix it (and no one has complained).

> I know it's controversial, let's see what others think.

I'm all for dropping the 2X8 formats, if that's the consensus. It would 
keep the driver simpler, as we could keep the 1:1 relationship between 
pixel formats and mbus codes.

I'll look at your other comments tomorrow.

  Tomi

