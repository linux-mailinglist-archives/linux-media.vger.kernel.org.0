Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 358AA622729
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 10:37:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbiKIJh1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 04:37:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbiKIJhZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 04:37:25 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 598BF19C2B
        for <linux-media@vger.kernel.org>; Wed,  9 Nov 2022 01:37:24 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1oshVx-0006zs-CE; Wed, 09 Nov 2022 10:36:57 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1oshVv-0005Qw-Br; Wed, 09 Nov 2022 10:36:55 +0100
Date:   Wed, 9 Nov 2022 10:36:55 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, kishon@ti.com, vkoul@kernel.org,
        laurent.pinchart@ideasonboard.com, jacopo@jmondi.org,
        hverkuil@xs4all.nl, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Add support for Toshiba TC358746
Message-ID: <20221109093655.eh4aa2cnak6zwc35@pengutronix.de>
References: <20220930124812.450332-1-m.felsch@pengutronix.de>
 <20221028134349.lxvo2jjvs6aehrbd@pengutronix.de>
 <Y2peJ+G7ho1HuJSl@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2peJ+G7ho1HuJSl@paasikivi.fi.intel.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 22-11-08, Sakari Ailus wrote:
> Hi Marco,
> 
> On Fri, Oct 28, 2022 at 03:43:49PM +0200, Marco Felsch wrote:
> > Hi,
> > 
> > gentle ping.
> 
> This is in my latest PR to Mauro:
> 
> <URL:https://patchwork.linuxtv.org/project/linux-media/patch/Y1uVp8hHo7DYUK82@valkosipuli.retiisi.eu/>

Thanks for the info. FTR: The fixing patch for the Kconfig is already
send.

Regards,
  Marco

> 
> -- 
> Sakari Ailus
> 
