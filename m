Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC70464729
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 07:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346915AbhLAGcL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 01:32:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbhLAGcL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 01:32:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B6DC061574
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 22:28:50 -0800 (PST)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6782A15;
        Wed,  1 Dec 2021 07:28:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638340128;
        bh=WzpBlX3fYt4YY3ahnL8djbvV79ygAjIFxv93QHLK518=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GwbppmSlPxqBd+QvGeYaQEvh/gbNaJiyeqkUcwjd4uj29Z/jZCTBYxu0BUAzPApMn
         lDv/O5bFGfL2w97jaz0Tlh9Be6X8aOZ0sK3NSLNoTJWVm01ib8FAPJmWOlL+94S6Uy
         ZfJFHtuogmEO9D0jrKZYjapIukDAXPzf9bPD+xzw=
Subject: Re: [PATCH v1 0/4] v4l-utils: support multiplexed streams
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211130141815.892354-1-tomi.valkeinen@ideasonboard.com>
 <YabwAzSJlAlYqFhb@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <84f10890-2318-c5ea-a1a6-51fb00964f75@ideasonboard.com>
Date:   Wed, 1 Dec 2021 08:28:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YabwAzSJlAlYqFhb@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/12/2021 05:46, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Nov 30, 2021 at 04:18:11PM +0200, Tomi Valkeinen wrote:
>> Hi,
>>
>> This series adds support to multiplexed streams.
>>
>> v4l2-ctl and media-ctl are updated to allow configuring routes and
>> setting configs per stream.
>>
>> v4l2-compliance is updated to always set the new stream field, and to do
>> some testing for multiplexed subdevs.
> 
> What device(s) have you tested this with ?

TI DRA76 EVM with fpdlink setup.

Later yesterday I realized I should also test without the kernel 
multiplexed streams series.

  Tomi
