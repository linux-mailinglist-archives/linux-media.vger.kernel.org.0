Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1765A84F6
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 20:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbiHaSFC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 14:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbiHaSFA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 14:05:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200B5DF18
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 11:04:56 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98C23481;
        Wed, 31 Aug 2022 20:04:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661969094;
        bh=lPBayPBxrASAXkD6FL8O8XeHn8su+tEuGlI+QcV5mzo=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=JUVhsDmK9Xa7f05u9LSooE7eEWHXgzBfwlTnx3Mk1EgTiIujL4hnHeJSD16tpjYR9
         rVi75Sf/jlmLvkhM6GDM/3Uj0fUTYwWgvD+W5YPi6Np99sH9qbsEbYqNN/BWDO0eeD
         GZVlinje+3VSh5pB4eWa9W4LRp2mikY2ymw+UhU4=
Message-ID: <b8c979b1-6ce0-4692-f0f2-38abda89805c@ideasonboard.com>
Date:   Wed, 31 Aug 2022 21:04:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v14 25/34] media: subdev: add stream based configuration
Content-Language: en-US
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
 <20220831141357.1396081-26-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220831141357.1396081-26-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 31/08/2022 17:13, Tomi Valkeinen wrote:
> Add support to manage configurations (format, crop, compose) per stream,
> instead of per pad. This is accomplished with data structures that hold
> an array of all subdev's stream configurations.
> 
> The number of streams can vary at runtime based on routing. Every time
> the routing is changed, the stream configurations need to be
> re-initialized.

Intel's test bot says that this doesn't compile, and I can see that 
having CONFIG_MEDIA_CONTROLLER enabled but CONFIG_VIDEO_V4L2_SUBDEV_API 
disabled causes a build failure.

I need to find out (again) what exactly those defines mean, and do the 
necessary adjustments to the code.

  Tomi
