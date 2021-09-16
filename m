Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A1940D38B
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 08:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234755AbhIPG66 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 02:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234796AbhIPG6t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 02:58:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3C3C061768
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 23:57:28 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4ACD92A5;
        Thu, 16 Sep 2021 08:57:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1631775445;
        bh=d+TECPeHdBfHoBsmFP30RU2fIUhu3wc4WKeHCNSDajM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=JnRds8sm4FvmLoA/FxBbW0nsDJgk7SvDglmluSfufbYpOY8bhZlnUIH1nHlbtNQE7
         tsbOAQTUF8zfa+rG7GOKXKVIY2ZxhzuP2irGKyflFECqL2Hj6riDZReCNO0xMGjSIw
         RGLT3o1UiZvqWyrl8wzV0Z8KXHzmjxo4U7LZEZPk=
Subject: Re: [PATCH v8 28/36] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-29-tomi.valkeinen@ideasonboard.com>
 <20210915161034.h5hqxkfa53urdpwn@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <83d4950d-fdda-0ef1-c0b0-f82b5e49284c@ideasonboard.com>
Date:   Thu, 16 Sep 2021 09:57:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915161034.h5hqxkfa53urdpwn@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 15/09/2021 19:10, Jacopo Mondi wrote:

>> +#define V4L2_SUBDEV_ROUTE_FL_ACTIVE		BIT(0)
> 
> Am I wrong or BIT() is not available to userspace ?
> 
> ../../include/linux/v4l2-subdev.h:209:38: error: ‘BIT’ was not declared in this scope
>    209 | #define V4L2_SUBDEV_ROUTE_FL_ACTIVE  BIT(0)
> 
> Header was exported with headers_install.

Yes, I think you are correct. I see only two other BIT() uses in uapi 
headers, and those might be errors too.

  Tomi
