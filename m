Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA1C65F750B
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 10:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiJGIIo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 04:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbiJGIIh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 04:08:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F046B7EFF
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 01:08:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECB754D3;
        Fri,  7 Oct 2022 10:08:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665130112;
        bh=y/VuyZPnHclHM5kRUsoJYk7QFjye2KhNEw8XsPPpfTs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VAZBOT/LndXAmtXo4TPvBu5zSk/S+wE0okrAvLtjKFKDBJemo5S7849jXH366KPeN
         CkkEnp747BzURIbjip0QLFz0+tW7kBroXfN/rCc1FEL4PIWDA2+/1pmJtxCfCqtbC2
         Duz0XjQGKHOKoedKuBKdkGNL852fwubYYwaTSvEI=
Date:   Fri, 7 Oct 2022 11:08:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 01/10] media: ar0521: Implement enum_frame_sizes
Message-ID: <Yz/ee7X+kSG7dACD@pendragon.ideasonboard.com>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-2-jacopo@jmondi.org>
 <Yz8DaZvFAOMKPlCQ@pendragon.ideasonboard.com>
 <m35ygw6xjk.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m35ygw6xjk.fsf@t19.piap.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Fri, Oct 07, 2022 at 06:57:19AM +0200, Krzysztof Hałasa wrote:
> Laurent Pinchart writes:
> 
> > This matches the driver implementation of .set_fmt(), but that's because
> > the driver is *really* wrong :-( It uses the format to configure the
> > crop rectangle, which is not right. This needs to be fixed.
> 
> How should it work?

The crop rectangle should be configured using .set_selection() ([1]).
Following the V4L2 subdev API to the latter, the pad format exposed by
the subdev should then be identical to the crop rectangle size.

Many sensor drivers however use .set_fmt() to configure binning or
skipping (after cropping), which in theory should be done by exposing a
second subdev (the CCS driver does that for instance, to my knowledge
it's the only sensor driver compliant with [1]). This is an area that
requires improvements in the API, the topic was on the agenda of the
media summit we held at the ELC-E conference a few weeks ago.

[1] https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/dev-subdev.html#types-of-selection-targets

-- 
Regards,

Laurent Pinchart
