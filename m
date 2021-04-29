Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD9836E4BF
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 08:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbhD2GQS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 02:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhD2GQR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 02:16:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3AAC06138B
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 23:15:31 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61AA8BC0;
        Thu, 29 Apr 2021 08:15:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619676922;
        bh=4W2jZzXcwfuLZJpRxKKK+uSbWkVixJ6XF+QsC3w8G/Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jQOrb4qNzEqDVJFDhnVDN0JobKgIwBJY3B7w+jc9jFvWiG3SCdvrPR/Ap/uorIHQ3
         dkIMl+jyaGZFiVAyEe0efEMZgLh4sMw9xsU9zNit5PWSiIPyzB05+3EylCM8f9mAr0
         jwkyGmQ3sNx4Anh8z+2W5UKqg0TTsedgdBYc5B4U=
Subject: Re: [PATCH v6 18/24] v4l: subdev: Add [GS]_ROUTING subdev ioctls and
 operations
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Michal Simek <michal.simek@xilinx.com>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
 <20210427124523.990938-19-tomi.valkeinen@ideasonboard.com>
 <YIoZteLxCX+A142n@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <75373c48-e908-893a-9e59-4b7460653136@ideasonboard.com>
Date:   Thu, 29 Apr 2021 09:15:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YIoZteLxCX+A142n@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/04/2021 05:28, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> For some reason, it seems the original authorship got lost. It was fine
> in v5. I haven't checked if other patches in the series are affected.
> 

Thanks for pointing this out. I found the issue in my tooling. I'll fix 
the authorship information.

  Tomi
