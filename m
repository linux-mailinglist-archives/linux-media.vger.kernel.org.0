Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD6769E290
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 15:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233358AbjBUOnW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 09:43:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232049AbjBUOnV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 09:43:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43E88A5D
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 06:43:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 50A96B80EF6
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 14:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB262C4339B;
        Tue, 21 Feb 2023 14:43:13 +0000 (UTC)
Message-ID: <0da1d7df-5ba5-c6ce-afa0-3450ea3e8ed3@xs4all.nl>
Date:   Tue, 21 Feb 2023 15:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [v4l-utils] [PATCH v9 3/7] Add support for meson building
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     gjasny@googlemail.com, kieran.bingham@ideasonboard.com,
        mchehab@kernel.org, nicolas@ndufresne.ca, p.zabel@pengutronix.de,
        rosenp@gmail.com, sakari.ailus@iki.fi, sean@mess.org,
        user.vdr@gmail.com, xavier.claessens@collabora.com,
        deborah.brouwer@collabora.com, ariel@vanguardiasur.com.ar,
        ezequiel@vanguardiasur.com.ar, tomi.valkeinen@ideasonboard.com
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
 <20230221143204.26591-4-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230221143204.26591-4-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/21/23 15:32, Laurent Pinchart wrote:
> From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> 
> Supports building libraries and tools found in contrib/, lib/ and
> utils/ directories, along with the implemented gettext translations.
> 
> Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Acked-by: Gregor Jasny <gjasny@googlemail.com>
> [Gregor: Control symbol visibility]
> Signed-off-by: Gregor Jasny <gjasny@googlemail.com>
> Tested-by: Gregor Jasny <gjasny@googlemail.com>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> ---
> Changes since v8:
> 
> - Fix LIBTRACER_PATH
> - Update project version to 1.22.0

I don't think this is right: 1.22.0 has already been released, see the
tags in the git repo: https://git.linuxtv.org/v4l-utils.git/

The current development version number is 1.23.0 (releases are even,
development has odd version numbers).

I wonder if we shouldn't make a 1.24 stable release first without this patch
series, then introduce meson with version 1.25. Besides, the last stable release
was 16 months ago, so I think it is high time for a new stable anyway.

Gregor, any opinion?

Regards,

	Hans

> - Update installation documentation to specify build directory in
>   command lines
> - Move '-I.' from common_arguments to v4l2_utils_incdir_arr
> 

