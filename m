Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2794A36923D
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 14:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242312AbhDWMhm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 08:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbhDWMhl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 08:37:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94E2DC061574
        for <linux-media@vger.kernel.org>; Fri, 23 Apr 2021 05:37:05 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1715332;
        Fri, 23 Apr 2021 14:37:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619181424;
        bh=7HaU9tHJSXmhSbsZf7GFLucKNMvVowI2blJ67eM7MB8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jYzUUsT9UjXuUskl4+INDCWVS+fNOftTMTA1VI10/OCR1AftbrZfdukwFI0AMq813
         m4ZuuQLO4EmBCZVfe0d1AjKgQxZJmZkVBoq/pQUJLjbPbTKmtf06a/De0YRrdqM/7h
         3P9GOiya9xN0Qr2sM1U+26tosT8Qv+ozr64imuAY=
Subject: Re: [PATCH v5 11/24] media: entity: Skip link validation for pads to
 which there is no route to
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-12-tomi.valkeinen@ideasonboard.com>
 <YHx1E3AWm2mzD4Gs@pendragon.ideasonboard.com>
 <20210420114153.GM3@paasikivi.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <a6b24f1b-5e59-4622-de53-f2ae4beee6c6@ideasonboard.com>
Date:   Fri, 23 Apr 2021 15:37:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420114153.GM3@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2021 14:41, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Sun, Apr 18, 2021 at 09:06:11PM +0300, Laurent Pinchart wrote:
>> Hi Tomi and Sakari,
>>
>> Thank you for the patch.
>>
>> There's an extra "to" in the subject line.
>>
>> On Thu, Apr 15, 2021 at 04:04:37PM +0300, Tomi Valkeinen wrote:
>>> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>
>>> Links are validated along the pipeline which is about to start streaming.
>>> Not all the pads in entities that are traversed along that pipeline are
>>> part of the pipeline, however. Skip the link validation for such pads,
>>> and while at there rename "other_pad" to "local_pad" to convey the fact
>>> the route to be checked is internal to the entity.
>>
>> Both "pad" and "local_pad" are local. I would have kept the "other_pad"
> 
> The pad that in the remote entity is not local. The other one could be
> called remote_pad though.

I'm not sure what you mean here. Aren't both pad and local_pad pads of a 
single entity here? If so, I think Laurent's comment makes sense, and 
other_pad is a better name.

  Tomi
