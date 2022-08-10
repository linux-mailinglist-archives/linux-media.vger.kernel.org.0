Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59C8458F12A
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 19:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233190AbiHJRF0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 13:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232713AbiHJRFX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 13:05:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09FC526AD7
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 10:05:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9999B612BF
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 17:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A91CC433D6;
        Wed, 10 Aug 2022 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660151122;
        bh=+uStbnTfZ8exWFia8Y8s1kz7F3EsfadfMqfmyApxLAA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JZ6CU52saRTmaP85bYKcq8QXpcGGBIq/TVzbaKsB0AvTW83odExvx+2gR1mkkdVNk
         lXBPu/QPnbW7SyDgGSpGdpVKnbmjFHzNAwZozoHZzAzPzd9gOWTHbqnOKP/xr9iipo
         wB+1TPkbHtQppj24TBCnOapRviWXCUN75cPXnzoe9NMi+76PcByDLu/ksnK28jUaCG
         kTkDCPgEhfrqonwTbfDDNonGZNXFEkvEO48oI8+R3KB0FXPgJQv8EetA8Kmum2Gd9R
         fhzkxJfFD9RvHT+/pYRcBk7Vbhzix4SRIvR63fm1MrqiI8PkclkyL1gAUt5TK2xQ2E
         M1cBvSEuA5w2w==
Date:   Wed, 10 Aug 2022 19:05:16 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Subject: Re: Proposal: removal of old vb1 or custom streaming I/O drivers
Message-ID: <20220810190516.466cfca2@coco.lan>
In-Reply-To: <630bf451-28a0-91d2-5e55-b95bcbde82d0@redhat.com>
References: <1ca14c26-2e47-b144-1f5a-02824e81269a@xs4all.nl>
        <ab206a11-0f96-2d97-c17f-1455527ece2a@xs4all.nl>
        <YvJa5znh+5Rj5xTt@pendragon.ideasonboard.com>
        <a071cf35-3ed6-3c1b-4546-d4536f1fb6f3@xs4all.nl>
        <20220810122409.5303e8f9@coco.lan>
        <630bf451-28a0-91d2-5e55-b95bcbde82d0@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 10 Aug 2022 16:27:03 +0200
Hans de Goede <hdegoede@redhat.com> escreveu:

> >> And for bt8xx I would probably be willing to convert it to vb2 as well,
> >> provided we can strip the overlay support from the driver (since, if memory
> >> serves, vb2 doesn't support that) and convert it to vb2. It's a big job, though.  
> > 
> > It sounds OK on my eyes to remove overlay support from bt8xx during VB2
> > conversion. We should probably add a warning about such removal before
> > that (see below).  
> 
> About bt8xx support. At least in the Netherlands the cable companies have
> stopped sending analog TV over the cable (only DVB now) so I've remove
> my bt8xx tv-card from my machine after many years of using it.
> 
> I believe something similar is happening in most of the rest of Europe
> at least.

This has nothing to do with analog TV. There are several bt8xx, saa713x
and cx18 products focused on video surveillance systems. Basically,
analog cameras connected to the capture boards using coaxial cables,
like those:

	https://www.camsecure.co.uk/Camsecure_video_capture_cards.html

Yeah, those are also being deprecated with time with IP-based cameras,
but still there are a lot of such products using analog ones out there.

Funny enough, even analog TV seems to still be used on some places. We
recently merged some patches addressing some issues with PAL/N' on
some drivers.

Thanks,
Mauro
