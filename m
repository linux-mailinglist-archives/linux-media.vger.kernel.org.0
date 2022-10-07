Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8225F77D6
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 14:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiJGMHm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 08:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiJGMHk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 08:07:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ABCF85AAE
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 05:07:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3F14BBE;
        Fri,  7 Oct 2022 14:07:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665144457;
        bh=KI4YJ7HZykLiT0V1plth7lprj9SQOMKsLCWJ2vuG6Dw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=anlRX8sriZJR2wH1nLkWH2Y8XOHnOl0kNWDaicM9gyPAsiYO6ObIgUV+RLqUw/1X4
         mnOql81yUdt2wZp/ulU930LVTWBPjcTe+zdQ7bE73FH86qVWBYy9rAWVQdbR2U0hKt
         q9Z+R2EGUizHbchzEEeL1YARN3O+GVFA855FbCNg=
Date:   Fri, 7 Oct 2022 15:07:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
Message-ID: <Y0AWhH3K6L/01U07@pendragon.ideasonboard.com>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-3-jacopo@jmondi.org>
 <m31qrk6wgc.fsf@t19.piap.pl>
 <20221007071725.zxcbx4kwwh2pt7ax@uno.localdomain>
 <Yz/jqA6ZACHOXxl/@pendragon.ideasonboard.com>
 <m3sfjz4zcg.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3sfjz4zcg.fsf@t19.piap.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 07, 2022 at 02:01:19PM +0200, Krzysztof Hałasa wrote:
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:
> 
> > I think Krzysztof meant caching the value in the ar0521_dev structure,
> > so it doesn't have to be read back. I2C is slow, let's avoid reads as
> > much as possible.
> 
> Right, ATM there is no I2C read function at all in this driver.
> 
> > This being said, if all gain controls are in the same cluster, you won't
> > need to read back or cache anything yourself, the control framework will
> > handle that for you.
> 
> Yep. Then there could be a common gain for all 3 colors, or a set of 3
> for R/G/B. I only don't know what should the former one return on read,
> if individual values are used.

That's an interesting question. We could make it a write-only control,
but that would complicate userspace applications that don't need the
per-color controls. This being said, I'm not sure I've seen any use case
for reading back gain controls (beside on sensors that implement AEGC).

-- 
Regards,

Laurent Pinchart
