Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F141D71220A
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 10:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242630AbjEZIT6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 04:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242297AbjEZIT4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 04:19:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31327D9
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 01:19:55 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF7A77F3;
        Fri, 26 May 2023 10:19:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685089175;
        bh=wXuinUO0nT9JEhC5ve8KRGSbXbP5le1eeoIo3nEpKvg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=vUQjalNpQIpiH9Z8XKG250yhBgogAib7a23WuNbhvoHoHJje3OvftxUt0JE3THFXO
         t4NjP49i0MAuk3jkRFGN//RIRRSiKZYER6L2I9Dbd/o6wM6PIzyZZ/nnLtLTMz7D0o
         GBk9vQo2l9NxKiW+j9lIgCBuIOAQ77jliFN1zG18=
Message-ID: <5348d13e-1c61-fd1c-43d1-a4b40cf7d312@ideasonboard.com>
Date:   Fri, 26 May 2023 11:19:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 5/8] HACK: include/linux: Add client capabilities
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        satish.nagireddy@getcruise.com
References: <20230421124428.393261-1-tomi.valkeinen@ideasonboard.com>
 <20230421124428.393261-6-tomi.valkeinen@ideasonboard.com>
 <20230424073237.GE4926@pendragon.ideasonboard.com>
 <1716ca05-d906-4535-8f5e-532596e7a5d8@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <1716ca05-d906-4535-8f5e-532596e7a5d8@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/05/2023 17:05, Hans Verkuil wrote:
> Hi Tomi,
> 
> On 24/04/2023 09:32, Laurent Pinchart wrote:
>> Hi Tomi,
>>
>> Thank you for the patch.
>>
>> On Fri, Apr 21, 2023 at 03:44:25PM +0300, Tomi Valkeinen wrote:
>>> Add client capabilities related hanges to include/linux/v4l2-subdev.h.
>>> This should be dropped when the v4l-utils kernel headers are updated to
>>> the version which contains client capabilities.
>>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>
>> The subdev client capabilities patch is now in the media tree, maybe you
>> can sync the headers already ? The media tree master branch should get
>> merged in v6.4-rc1 within two weeks.
> 
> I've just synced the headers for v4l-utils.
> 
> I think it is easiest if you post a v5, assuming everything that this series
> needs is now merged in the kernel. I'll pick it up.

Ok. There are comments in this thread which I haven't addressed yet. So 
I'll rebase on top of latest v4l-utils, address the comments and post v5.

  Tomi

