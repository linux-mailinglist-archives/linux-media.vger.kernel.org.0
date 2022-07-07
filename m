Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 308D45696DC
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 02:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234642AbiGGAYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 20:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234274AbiGGAYW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 20:24:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4960C1CFEB
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 17:24:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9143D526;
        Thu,  7 Jul 2022 02:24:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657153460;
        bh=Vr9/BPHDVyWhjQMJ6LM/+w2RhG4KLt+Ay7Cur95euSg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WIuWOvt5OtMpt+Or9r1S9ToINhohs+DFjJwVvo0Po08fP6ny0LndkIXM3z0xw3Tu5
         hvkJB1FWjF0eGnq+g1PZ8VeDulv7L5+u4j+K2iB3erzVLfPx79KgLK762MKAfZZmV8
         PybH9FNs3P1xzCqfRXkvkXKkBKb+9F4zIV8S+SaA=
Date:   Thu, 7 Jul 2022 03:23:55 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: Re: (EXT) [PATCH 00/50] staging: media: imx: Prepare destaging of
 imx7-media-csi
Message-ID: <YsYnm46fqQx1WFxU@pendragon.ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
 <8064452.T7Z3S40VBb@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8064452.T7Z3S40VBb@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Wed, May 11, 2022 at 03:36:14PM +0200, Alexander Stein wrote:
> Hello Laurent,
> 
> thanks for pushing out this huge set.
> 
> Am Dienstag, 10. Mai 2022, 13:58:09 CEST schrieb Laurent Pinchart:
> > Hello,
> > 
> > This patch series prepares the imx7-media-csi for destaging by
> > decoupling it from the helpers shared with the i.MX6 IPUv3.
> > 
> > The strategy Paul and I have followed is to import copies of helper code
> > and, refactor it within the imx7-media-csi driver, and repeat until no
> > more shared helpers are used. There is still room for refactoring and
> > simplification of the imx7-media-csi driver, but I believe it is now in
> > a state clean enough to be moved out of staging.
> > 
> > The series also includes a few fixes or improvements in supported
> > formats that are now made possible thanks to this refactoring. See
> > patches 45/50 and 46/50 for details.
> > 
> > The code size has grown as a result. This is partly offset by code in
> > the shared helpers that can be removed or simplified, but I haven't
> > starting working on that. The helpers are now used for the i.MX6 IPUv3
> > only, so I will leave this exercise to anyone who would be interested in
> > destaging that driver as well.
> > 
> > Some of the items in the TODO file related to the imx7-media-csi driver
> > have been addressed. The two remaining items are frame interval monitor
> > support and restricting the list of supported formats to the SoC
> > version. The former isn't a destaging blocker in my opinion, as the
> > feature can be added later if desired (and frame interval monitoring
> > should then be moved to the V4L2 core). I believe the latter could also
> > be addressed after destaging the driver, but in any case, this is a
> > discussion for a future destaging series (which may come as soon as this
> > one is accepted).
> > 
> > Alexander, this also could greatly simplify your "[PATCH v3 0/8]
> > imx7/imx8mm media / csi patches" series.
> 
> Thanks for putting me on CC. I'll try to get my system running your patches 
> ASAP.

As only minor changes were needed, I ended up posting v1.1 of the
corresponding patches instead of spamming everybody with a full v2. For
your convenience, I've pushed the result to

	git://linuxtv.org/pinchartl/media.git imx7/destage

I know it's a bit of a short notice, but I'd like to send a pull request
in time for v5.20, when do you think you would be able to test the
series ?

-- 
Regards,

Laurent Pinchart
