Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0496F52E733
	for <lists+linux-media@lfdr.de>; Fri, 20 May 2022 10:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346933AbiETIW6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 May 2022 04:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346912AbiETIW4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 May 2022 04:22:56 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99EE2140423
        for <linux-media@vger.kernel.org>; Fri, 20 May 2022 01:22:54 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 81D176000B;
        Fri, 20 May 2022 08:22:51 +0000 (UTC)
Date:   Fri, 20 May 2022 10:22:48 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [ANN] Media Summit at ELCE Dublin: Request for Topics
Message-ID: <20220520082248.o6gzekapndo4lhgb@uno.localdomain>
References: <325cc388-6f65-0727-92ab-d9b87e7ade1c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <325cc388-6f65-0727-92ab-d9b87e7ade1c@xs4all.nl>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans,

On Fri, May 06, 2022 at 03:20:09PM +0200, Hans Verkuil wrote:
> Hi all,
>
> Since countries are opening up again and travel is (at least for now!) a lot easier,
> I am considering a media summit during the ELCE in Dublin (Sep 13-16).
>
> See here for more details about the conference:
>
> https://events.linuxfoundation.org/open-source-summit-europe/
>
> Of course, this only makes sense if there is something to talk about. So please reply
> with any suggestions for topics!
>
> Also please let me know if you would expect to be at such a media summit in person.
> If only a few people would be there, then there isn't much point to this.
>
>
> I have two topics:
>
> 1) Discussion of the media subsystem development process: any bottlenecks, any ideas
>    for improvements?
>
> 2) I can give a presentation on the work I've done in the CTA-861 standard (used by
>    HDMI) and the edid-decode utility.
>
> I'd like to make a decision on whether or not it is worthwhile to do this in a week
> or two. If we wait too long it might be difficult to get a room for the summit.

There are a few topics around image sensor support, especially
relevant for RAW sensor drivers

- Recently Dave posted an question about how to represent additional
  processing stages that happens on the sensor side, mostly
  additional subsampling/cropping that happen between the analogue cropping
  on the full pixel array and the final image sent on the wire.

  https://lore.kernel.org/linux-media/CAPY8ntA06L1Xsph79sv9t7MiDSNeSO2vADevuXZdXQdhWpSmow@mail.gmail.com/

  Dave made a good introduction of the issue his email which got
  largely unanswered.

  The issue is particularly relevant for RAW sensors, where applying
  subsampling has an impact on the sensor's sensitivity and requires
  to adjust the gains and exposure accordingly.

  The V4L2 selection API falls short on this and the only other
  solution I am aware of is registering additional subdevices as the
  CCS driver does.

- Probably less relevant for a media summit, but we recently got a few
  series trying to reconcile handling of regulators, gpios and clocks
  on OF and ACPI platforms all of them doing the usual "similar but
  slightly different" thing:

  https://lore.kernel.org/linux-media/20220425061022.1569480-1-paul.elder@ideasonboard.com/
  https://lore.kernel.org/linux-media/20220329090133.338073-1-jacopo@jmondi.org/
  https://lore.kernel.org/linux-media/20220509143226.531117-1-foss+kernel@0leil.net/
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0c2c7a1e0d69221b9d489bfd8cf53262d6f82446

  ACPI and OF handles clocks slightly differently, and it is not clear
  to me if ACPI based platform need explicit handling of
  clocks/regulator or ACPI does "the right thing" by itself (I'm
  afraid the answer is actually "it depends"). I'm ACPI illiterate
  so I cannot propose anything meaningful but if anyone is interested
  in discussing this further this might be a good time to do so ?

Let me know if those points might be of any interest and I can try to
prepare something about them.

Thanks
   j

>
> Regards,
>
> 	Hans
