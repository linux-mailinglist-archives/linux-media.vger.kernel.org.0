Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37C915B32DB
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 11:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbiIIJEx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 05:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbiIIJEU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 05:04:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D818A12D54A
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 02:04:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C007A61F44
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 09:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03E1C433C1;
        Fri,  9 Sep 2022 09:03:58 +0000 (UTC)
Message-ID: <3ccd8058-abcf-669c-2ac6-b622c7129205@xs4all.nl>
Date:   Fri, 9 Sep 2022 11:03:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Media Summit] Finalizing the v4l-utils conversion to meson
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
        Gregor Jasny <gjasny@googlemail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <YwwXrJ2ajZvZhUk6@pendragon.ideasonboard.com>
 <3ed0fa60-ed41-3969-ee42-e7f6fa413505@xs4all.nl>
 <Yxms+sBJaxFWxqgd@pendragon.ideasonboard.com>
 <YxpYTkEcm/YfTE1o@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <YxpYTkEcm/YfTE1o@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/09/2022 23:02, Laurent Pinchart wrote:
> Also, if we already have a consensus among the audience of the media
> summit, we can remove this discussion point from the agenda and use the
> time for other topics.
> 
> Should I prepare a new version of the patches, removing
> autoconf/automake support on top ?

Yes, please. I'd like to see a version with the FIXUPs squashed in, and
that makes it easy to revert if needed.

BTW, I think patch 1 can just be applied regardless, although v4l-utils.spec.in
needs updating as well (README -> README.md).

Regards,

	Hans
