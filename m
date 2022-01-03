Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6BF482F84
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 10:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbiACJiZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 04:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbiACJiZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 04:38:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01D3C061761
        for <linux-media@vger.kernel.org>; Mon,  3 Jan 2022 01:38:24 -0800 (PST)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F2F6CC;
        Mon,  3 Jan 2022 10:38:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641202702;
        bh=Far9lyRMW1dbU+gbacFFd/R6OumnQ/P6d85JEevC2zs=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=k0HS6FBVKyM+M6CkTSs6crSObaw4IDTJwupv+4TG5s8JmTzn4p7dNPdnJeiDzPVIe
         AwCg57bQVHupjVQO/p0MqR+rj952moreRD5N2Zgr54hjSdtuElaghSlE+AN1w25vze
         v94+/wpyJpi1peS5U1TB2kvuxC3shnH+IRh6KAXE=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benoit Parrot <bparrot@ti.com>
References: <20211206230717.5836-1-laurent.pinchart@ideasonboard.com>
 <20211206230717.5836-3-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] media: i2c: Add OV1063x sensor driver
Message-ID: <2429f182-baea-1fd8-424c-9ad580e5904a@ideasonboard.com>
Date:   Mon, 3 Jan 2022 11:38:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211206230717.5836-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 07/12/2021 01:07, Laurent Pinchart wrote:
> Add a new V4L2 subdev driver for the OmniVision OV10633 and OV10635
> camera sensors. The work is based on the driver from the TI BSP, itself
> based on original work by Phil Edworthy posted to the linux-media
> mailing list ([1]). This version of the code is a large rewrite of many
> parts.
> 
> [1] http://www.spinics.net/lists/linux-media/msg64347.html
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Drop unneeded debug message
> - Fix MODULE_LICENSE
> - Fix priv pointer retrieval in remove()
> - Add more registers macros
> - Fix PLL calculation
> - Update to subdev state API
> - Fix test pattern when starting streaming

Looks good to me:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Jfyi, I tested this on my FPDLink setup. I, of course, needed to add the 
multiplexed streams and routing support, but aside that, there are two 
things I needed:

- The pclk has to be 96MHz, so I just hardcoded it to 96MHz in the 
ov1063x_pll_setup.

- I commented out the writing of the three registers in 
ov1063x_configure() under /* Sensor configuration */. If these are 
enabled, 96MHz pclk doesn't work for me. I have no idea about this.

  Tomi
