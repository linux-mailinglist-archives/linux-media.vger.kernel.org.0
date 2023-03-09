Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDBAE6B24C6
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 13:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjCIM7X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 07:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbjCIM6r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 07:58:47 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 264531517C
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 04:57:57 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B866589;
        Thu,  9 Mar 2023 13:57:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1678366675;
        bh=JvOhM9k8ZaYPv2R3BT0/QH6aJC1Xmaz/r4Rsl8a7dRI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Evx2yQnpRifx3G9Fc75FTH2ODOsiTaleTyYJhX29eSI0Pk0hYZT1Ktnwyg93WcSqB
         2AVVSpwVR8QMfSxda7183DGeuClGfUcBZgsQSqMoKvS0gmdvGtYraaiPkLFjecR9R7
         MZEGJ71F5KNr0GDljh8tLb2kaHLS7bf/0X5Bp7wc=
Message-ID: <c1c67b80-1c7b-18c1-0d42-66978910db5b@ideasonboard.com>
Date:   Thu, 9 Mar 2023 14:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/1] media: v4l: subdev: Make link validation safer
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
References: <20230309122716.1624141-1-sakari.ailus@linux.intel.com>
 <89823804-7d23-334a-91b2-ea3c819232fd@redhat.com>
 <ZAnXe9H3xg3g/f55@kekkonen.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZAnXe9H3xg3g/f55@kekkonen.localdomain>
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

On 09/03/2023 14:56, Sakari Ailus wrote:
> On Thu, Mar 09, 2023 at 01:43:50PM +0100, Hans de Goede wrote:
>> Hi Sakari,
>>
>> On 3/9/23 13:27, Sakari Ailus wrote:
>>> Link validation currently accesses invalid pointers if the link passed to it
>>> is not between two sub-devices. This is of course a driver bug.
>>>
>>> Ignore the error but print a debug message, as this is how it used to work
>>> previously.
>>>
>>> Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
>>> Reported-by: Hans de Goede <hdegoede@redhat.com>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> Reported-and-tested-by: Hans de Goede <hdegoede@redhat.com>
>>
>> FWIW you have my Reported-by in there twice now ...
> 
> Ah, thanks. I'll drop the first tag.

$ git grep Reported-and-tested-by Documentation/
Documentation/process/maintainer-tip.rst:Please do not use combined tags, e.g. ``Reported-and-tested-by``, as

  Tomi

