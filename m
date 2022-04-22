Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 109F850B0C1
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 08:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444286AbiDVGou (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Apr 2022 02:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386580AbiDVGou (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Apr 2022 02:44:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E57B50B2F
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 23:41:56 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC1152F7;
        Fri, 22 Apr 2022 08:41:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650609714;
        bh=k+xoq4aY6J7AshJJHqqNs7XTw3fz9Z6YP1JPY17U5Ok=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ph/G5yNU+tPaCIQ5X92O/rDtjcP8eXNEucqHuH04nDD6yGwK5lnPUpnK1ZgEnuQGQ
         DZoWD9u2t9WIOme8fPzRG1+DxzZM0zWzZS4B7DSs+QrEDeRC0+V4xtpcCf5JR1oJd3
         heHYWZoY+LthDpKM9JEFBTgB2t/ARQVSoP+1z8/k=
Message-ID: <7a43e054-5e9d-2858-929b-874b7c6a0c86@ideasonboard.com>
Date:   Fri, 22 Apr 2022 09:41:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 4/6] media: ti: cal: use CSI-2 frame number for seq number
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220421143449.552312-1-tomi.valkeinen@ideasonboard.com>
 <20220421143449.552312-5-tomi.valkeinen@ideasonboard.com>
 <YmHuQ6bmBgDgt5ke@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YmHuQ6bmBgDgt5ke@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/04/2022 02:52, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Thu, Apr 21, 2022 at 05:34:47PM +0300, Tomi Valkeinen wrote:
>> The userspace needs a way to match received metadata buffers to pixel
>> data buffers. The obvious way to do this is to use the CSI-2 frame
>> number, as both the metadata and the pixel data have the same frame
>> number as they come from the same frame.
>>
>> However, we don't have means to convey the frame number to userspace. We
>> do have the 'sequence' field, which with a few tricks can be used for
>> this purpose.
>>
>> To achieve this, track the frame number for each virtual channel and
>> increase the sequence for each virtual channel by frame-number -
>> previous-frame-number, also taking into account the eventual wrap of the
>> CSI-2 frame number.
>>
>> This way we get a monotonically increasing sequence number which is
>> common to all streams using the same virtual channel.
> 
> I'd agree in principle, if it wasn't for the fact that sensors are not
> required to produce a frame number :-S

In that case the CAL hardware will increment the register every frame. 
 From CAL doc:

Frame number.
Matches the frame number sent by the camera when the
camera transmits it.
Otherwise, incremented by one on every FS short packet
for this context.
Reset when the context is enabled.

I'll add a note about that to the desc.

  Tomi
