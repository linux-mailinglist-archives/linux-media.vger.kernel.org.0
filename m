Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E002746F4E
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 13:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbjGDLCH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 07:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjGDLCG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 07:02:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F040A3
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 04:02:05 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B01F9B9;
        Tue,  4 Jul 2023 13:01:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688468479;
        bh=gEIyv6KsVqF+6adCH/8pt5GM6menuK3+rAm/fN/tyAM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jT+hOZrmr9SPz0cm26Vox0nrHNcOeCGjwJNBXvD1Ot/K4ZH+zxIipg0zJ8cXyysrj
         zNvRSFmFXqFA/1oqpJHPnE1WhMhjqsLVOq9mTtaciTc2CEq10q7c1tNvZ9VbRVOkfW
         r6fuUjN6v45Ejygd606MI664HyA1sVHJUDstc0r4=
Message-ID: <18b44c72-1873-4756-3fa3-55d6ca4c3984@ideasonboard.com>
Date:   Tue, 4 Jul 2023 12:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 01/15] media: ipu-bridge: Fix null pointer deref on
 SSDB/PLD parsing warnings
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        =?UTF-8?Q?Fabian_W=c3=bcthrich?= <me@fabwu.ch>
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-2-hdegoede@redhat.com>
 <CAHp75VdQAJyfYj63pU4DaD5EhWpW-k5jJ-AUv7QNyPM1MJ4-eA@mail.gmail.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <CAHp75VdQAJyfYj63pU4DaD5EhWpW-k5jJ-AUv7QNyPM1MJ4-eA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 30/06/2023 16:23, Andy Shevchenko wrote:
> On Fri, Jun 30, 2023 at 2:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> When ipu_bridge_parse_rotation() and ipu_bridge_parse_orientation() run
>> sensor->adev is not set yet.
>>
>> So if either of the dev_warn() calls about unknown values are hit this
>> will lead to a NULL pointer deref.
>>
>> Set sensor->adev earlier, with a borrowed ref to avoid making unrolling
>> on errors harder, to fix this.
> TBH, I don't like this approach, it seems a bit dirty to me.
>
> First of all, why do we need pci_dev to be a parameter in this function?
> Second, why don't we consistently use the ACPI handle (with respective
> acpi_handle_*() macros to print messages)?
>
> So, my proposal here is to actually save the ACPI device handle in the
> sensor object and use it for the messaging. It makes it consistent and
> doesn't require to rewrite adev field which seems the dirty part to
> me.


It's a bit finicky but I don't think it's so bad; the refcounting is all fine, the later 
acpi_dev_get() is only to hold a reference once the next loop iteration frees the existing one and 
the rewrite should store the exact same pointer...we could just not store the result of the 
acpi_dev_get() call to avoid that weird rewrite perhaps?

>
> --
> With Best Regards,
> Andy Shevchenko
