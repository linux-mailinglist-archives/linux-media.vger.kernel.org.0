Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9248C63AA1B
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 14:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbiK1NxL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 08:53:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232234AbiK1Nwr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 08:52:47 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2152DDB9;
        Mon, 28 Nov 2022 05:52:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AB00C6118C;
        Mon, 28 Nov 2022 13:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A05DC433C1;
        Mon, 28 Nov 2022 13:52:30 +0000 (UTC)
Message-ID: <538d4c30-aa78-ed05-4c46-84018fd9afdd@xs4all.nl>
Date:   Mon, 28 Nov 2022 14:52:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 0/2] ov9282: Add ov9281 support
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
References: <20221124102959.1605202-1-alexander.stein@ew.tq-group.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221124102959.1605202-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On 11/24/22 11:29, Alexander Stein wrote:
> Hello all,
> 
> This is v5 of the ov9281 support series. Thanks for the feedback I received
> over the time.
> 
> Changes in v5:
> * Removed unrelated patches from the series
> * Squashed previous patch 3 & 6 (now patch 2)
> * Removed error handling for device_get_match_data() call
> * Added Kieran's r-b to patch 2
> 
> Best regards,
> Alexander
> 
> Alexander Stein (2):
>   media: dt-bindings: media: Add compatible for ov9281
>   media: i2c: ov9282: Add ov9281 compatible
> 
>  Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml | 5 ++++-
>  drivers/media/i2c/ov9282.c                                   | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 

With the latest staging tree I am now getting these smatch and sparse warnings:

sparse:

drivers/media/i2c/ov9282.c:267:24: warning: symbol 'common_regs_list' was not declared. Should it be static?
drivers/media/i2c/ov9282.c:145: warning: Function parameter or member 'crop' not described in 'ov9282_mode'
drivers/media/i2c/ov9282.c:190: warning: Function parameter or member 'supplies' not described in 'ov9282'
drivers/media/i2c/ov9282.c:190: warning: Function parameter or member 'pixel_rate' not described in 'ov9282'
drivers/media/i2c/ov9282.c:190: warning: Function parameter or member 'noncontinuous_clock' not described in 'ov9282'

smatch also has this:

drivers/media/i2c/ov9282.c:1262 ov9282_power_on() warn: 'ov9282->inclk' from clk_prepare_enable() not released on lines: 1252.

Can you take a look and post a patch on top fixing this?

Thanks!

	Hans
