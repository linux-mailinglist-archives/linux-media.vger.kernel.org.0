Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6E0363D6C
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 10:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237770AbhDSIYh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 04:24:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44450 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234712AbhDSIYc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 04:24:32 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3957897;
        Mon, 19 Apr 2021 10:24:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618820642;
        bh=5k0cTSMlys0OdTX1L2O6RUtnwwLjkDr748/Yix8R448=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=exWNjb0SsHwZz37a5gBTMxqJFJiXfKitpRnBOEady+CkRKACyLE7XYByKZrOE8hi6
         RbpubOhfq9FvmNtkc+zUOCsx1+RQCToLxxuBOH8Jdv/KDKOP2MSdkUQG1gCIgKFaFn
         wvRAxjfcKbnQmn9YqJDEK1Rxf8eehC959CJoXSpo=
Subject: Re: [PATCH 02/28] media: ti-vpe: cal: fix error handling in
 cal_camerarx_create
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-3-tomi.valkeinen@ideasonboard.com>
 <YHtpnurWK0or8TfM@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <d813dc3b-8dd3-fa4a-64bc-d9394eff50c6@ideasonboard.com>
Date:   Mon, 19 Apr 2021 11:24:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHtpnurWK0or8TfM@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 02:05, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Apr 12, 2021 at 02:34:31PM +0300, Tomi Valkeinen wrote:
>> cal_camerarx_create() doesn't handle error returned from
>> cal_camerarx_sd_init_cfg()
> 
> This looks good.
> 
>> and it always runs all the cleanup/free
>> functions in the error code path. The latter doesn't cause any issues at
>> the moment as media_entity_cleanup() is an empty function.
> 
> But this was by design. Do you think we could keep
> media_entity_cleanup() idempotent ? That would simplify error paths (as
> shown here).

It isn't documented. I can change the doc for media_entity_cleanup to 
state it can be called multiple times, if that was the intention, and 
simplify the error handling here.

  Tomi
