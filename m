Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C17536575A
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 13:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhDTLSN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 07:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbhDTLSM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 07:18:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269AEC06174A
        for <linux-media@vger.kernel.org>; Tue, 20 Apr 2021 04:17:41 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2EFE9470;
        Tue, 20 Apr 2021 13:17:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618917457;
        bh=8N2m7GEBkvvcLkDkeuFmNIiPgX37NLdJeUgg2vMJfHQ=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=QECOmlH89IFkd01kiSsuescKR6BXdyKURiLFrDASJvOtsBaQgvwnEd/K1os9danp0
         wQsecJIOxpsFQHyF+2lGL3vUvnoGKwRFARSpql4s/ioRHW26AABke8uHTJI8EjYSBi
         OcWaoShURdRKuDmRMeZqwBhAzSjkjvtErI2Wilv0=
Subject: Re: [PATCH 21/28] media: ti-vpe: cal: fix cal_ctx_v4l2_register error
 handling
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-22-tomi.valkeinen@ideasonboard.com>
 <YHwvfL885Qm0iD0/@pendragon.ideasonboard.com>
 <8fb0ee37-236e-3eaa-9e82-0d9bb8c94c39@ideasonboard.com>
Message-ID: <cfe378fb-5637-eee7-040b-c028bf2fc4cc@ideasonboard.com>
Date:   Tue, 20 Apr 2021 14:17:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <8fb0ee37-236e-3eaa-9e82-0d9bb8c94c39@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2021 13:50, Tomi Valkeinen wrote:
> On 18/04/2021 16:09, Laurent Pinchart wrote:
>> Hi Tomi,
>>
>> Thank you for the patch.
>>
>> On Mon, Apr 12, 2021 at 02:34:50PM +0300, Tomi Valkeinen wrote:
>>> cal_ctx_v4l2_register() returns an error code, but the returned error
>>> code is not handled anywhere. However, we can't really even handle the
>>> error in any proper way, so lets just drop the return value and make
>>> sure all error paths have an error print.
>>
>> Ouch. Doesn't this call for registering the video node earlier, at probe
>> time, instead of in the async notifier complete callback ?
> 
> Shouldn't we only register uAPI access points after the kernel has 
> probed (succesfully) the hardware? If we register the video nodes at 
> probe time I presume we would have to add checks to all the cal ioctl 
> handlers to check if we have actually probed.
> 
> v4l2_async_notifier_operations.complete can return an error, but it's 
> not quite clear to me what happens in that case and how the driver 
> should handle it.
> 
> I'll look at this a bit, maybe it's still better to handle the error in 
> complete callback and return the error from there, than ignoring the error.

Well, handling the error in complete callback seems to work fine. I'm 
not sure why I didn't do that and instead went with the approach in this 
patch.

  Tomi
