Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 898055F781C
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 14:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiJGMma (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 08:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiJGMm2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 08:42:28 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC887CA890
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 05:42:27 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id C16741C000A;
        Fri,  7 Oct 2022 12:42:24 +0000 (UTC)
Date:   Fri, 7 Oct 2022 14:42:23 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 03/10] media: ar0521: Set maximum resolution to 2592x1944
Message-ID: <20221007124223.efwyytczaodthygv@uno.localdomain>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-4-jacopo@jmondi.org>
 <m3mta85hbj.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3mta85hbj.fsf@t19.piap.pl>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 07, 2022 at 07:33:04AM +0200, Krzysztof Hałasa wrote:
> Jacopo Mondi <jacopo@jmondi.org> writes:
>
> > Change the largest visibile resolution to 2592x1944, which corresponds
> > to the active pixel array area size. Take into account the horizontal
> > and vertical limits when programming the visible sizes to skip
> > dummy/inactive pixels.
>
> I will need to test this, I don't remember the larger limits to
> be causing any problems, but it was 5 years ago.

For reference, from the sensor's developer guide:

ON Semiconductor’s AR0521/AR0522 image sensor is
capable of a maximum resolution of 2592 × 1944 at 60 fps
in linear mode and 10 bit outpu

However, I haven't found any diagram that clearly shows the
dummy/inactive/valid pixel array portions.

> --
> Krzysztof "Chris" Hałasa
>
> Sieć Badawcza Łukasiewicz
> Przemysłowy Instytut Automatyki i Pomiarów PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa
