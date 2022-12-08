Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D71E6469C9
	for <lists+linux-media@lfdr.de>; Thu,  8 Dec 2022 08:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiLHHkL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Dec 2022 02:40:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiLHHkJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Dec 2022 02:40:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F9A46674
        for <linux-media@vger.kernel.org>; Wed,  7 Dec 2022 23:40:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CCF3861952
        for <linux-media@vger.kernel.org>; Thu,  8 Dec 2022 07:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB93AC433C1;
        Thu,  8 Dec 2022 07:40:06 +0000 (UTC)
Message-ID: <51d24c79-867e-3e5b-df60-6ac4555e12bf@xs4all.nl>
Date:   Thu, 8 Dec 2022 08:40:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: "media: vb2: add (un)prepare_streaming queue ops" causes
 vb2_queue->streaming to be set earlier ?
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <545610e7-3446-2b82-60dc-7385fea3774f@redhat.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <545610e7-3446-2b82-60dc-7385fea3774f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 07/12/2022 22:23, Hans de Goede wrote:
> Hi Hans,
> 
> I just fixed a crash in the out of tree driver which is caused by:
> 
> a10b21532574 ("media: vb2: add (un)prepare_streaming queue ops")
> 
> I know that breaking out of tree code is fine / not our problem,
> but I wonder if this maybe affects some in tree code too ?
> 
> The problem with the out of tree driver is that it
> used vb2_queue->streaming inside the buf_queue() callback
> to determine if the buffer was being pre-queued (from
> vb2_start_streaming() calling __enqueue_in_driver()) before
> the start_streaming queue-op is called.
> 
> Or if it was being queued after the start_streaming queue-op
> has been called.
> 
> With vb2_queue->streaming now being set before the
>  __enqueue_in_driver() calls in vb2_start_streaming() this
> broke and it went down the route to see if there was
> space available in the hw-queue which NULL pointer deref-ed
> because the hw-queue had not been setup yet (more or less).
> 
> This is fixed now as far as the ipu6 driver is concerned,
> but I wonder if we may not have in tree drivers making
> similar assumptions about vb2_queue->streaming in their
> buf_queue() callbacks ?

I checked, and there is nobody else that's doing that.

It's definitely wrong to use q->streaming like that, it was never
meant as a check for whether or not the buffer was pre-queued.

Thanks for the heads-up, though! It is a real change in vb2 behavior
that I hadn't realized could cause problems.

It's a good change, since having buf_queue called when q->streaming is
false makes no sense. However, you can use q->start_streaming_called
instead if for some reason a driver needs to know.

Regards,

	Hans
