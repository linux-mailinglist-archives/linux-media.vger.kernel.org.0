Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8626A5E78D9
	for <lists+linux-media@lfdr.de>; Fri, 23 Sep 2022 12:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbiIWK4c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Sep 2022 06:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbiIWK4G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Sep 2022 06:56:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6D223BFC
        for <linux-media@vger.kernel.org>; Fri, 23 Sep 2022 03:54:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5ADB461D7F
        for <linux-media@vger.kernel.org>; Fri, 23 Sep 2022 10:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB76C433C1;
        Fri, 23 Sep 2022 10:54:36 +0000 (UTC)
Message-ID: <70f0700c-6fc3-e172-da52-25d484a5e824@xs4all.nl>
Date:   Fri, 23 Sep 2022 12:54:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, gjasny@googlemail.com,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com
References: <20220909134412.21934-1-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v7 0/5] Switch build system to meson
In-Reply-To: <20220909134412.21934-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 09/09/2022 15:44, Laurent Pinchart wrote:
> Hello everybody,
> 
> This series is the latest (and greatest) attempt to switch v4l-utils
> from autotools to meson.
> 
> Compared to v6, the first noticeable change is that fixups have been
> squashed into their corresponding commit. Detailed changelogs are now
> included in individual patches.
> 
> The second big change is that the last patch from v6 ("Makefile.am:
> Distribute meson related files") got replaced by 5/5 which drops
> autotools support, completing the switch from autotools to meson.
> 
> A branch that includes this series can be found at
> 
>         git://linuxtv.org/pinchartl/v4l-utils.git meson

I'm trying to use this new build system in our internal cross compilation
environment, and I am running into problems.

What we did with the autotools setup is to configure everything, but just
build a select set of utilities from the utils directory, without needing to
link to anything in lib. So basically: cd utils/v4l2-ctl; make; make install

Trying to cross compile in lib fails with strange errors, but I don't really
want to build anything in lib anyway, I don't need it at all.

Is there a way to tell ninja to build just one utility? Or are you forced to
build everything?

Regards,

	Hans
