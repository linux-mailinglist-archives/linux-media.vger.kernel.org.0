Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB5158333E
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 21:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236176AbiG0TNm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 15:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236859AbiG0TNV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 15:13:21 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F31710DE
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 11:57:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 879FACE2390
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 18:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8433BC433C1;
        Wed, 27 Jul 2022 18:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658948258;
        bh=7rVn2e2ycH/dpG3MO6wYxghPzwv8KnA5xjoW+iP8Ov0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=g2l1XGU2luJ0z71pnC8/kVMPH5uXRYp0IgPQEElrCeKqT+30QmF2io6ezkBInIh+u
         e0VmDC0zsH6Brr07QgVRS7hdBwsODvatqr7hm4FL7knkERFVVL69bAIeqYY2FtXHsJ
         W00AdSHUDFQe9wa30q0T6cW4tdPogVSMJ1kQ6FJy1LFeA3AyNGfDQNce5D4BnS1RvX
         uUgwzPGwzK1BedpJIt8uY7ASFdsa9YhZqYK9UvPvSH+Ce02yYCelC3qiMqXV0gMlB3
         mFoq9wniwQh8TrTnjxhir8kgKvci9LWPQ1iHY5SlyBegG7HIHryTk0t/WYQFkmHZub
         +JMeOhk9JqsfQ==
Date:   Wed, 27 Jul 2022 20:57:34 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [GIT PULL FOR v5.20] cedrus fix, hantro fixes and destaging
Message-ID: <20220727205734.77dba501@coco.lan>
In-Reply-To: <20220727203551.32901319@coco.lan>
References: <fe899b13-8e1c-4550-4b1a-a2b125e19cc9@xs4all.nl>
        <20220727203551.32901319@coco.lan>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 27 Jul 2022 20:35:51 +0200
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> Em Tue, 19 Jul 2022 11:34:55 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
> > Hi Mauro,
> > 
> > This PR has three cedrus/hantro fixes and destages hantro in the final patch.
> > That last patch just moves code into the new directory and has no other changes.
> > 
> > Ezequiel, I decided to postpone the v3 of the vb2_find_buffer series to 5.21.
> > It's just an improvement, and the cedrus changes are a bit larger than I'd like
> > so close to the code freeze. I'd like to have those tested first.  
> 
> It sounds too late to merge it for the upcoming merge window.
> 
> So, I applied only patch 1/4:
> 
> 	media: cedrus: hevc: Add check for invalid timestamp
> 
> Let's merge the remaining ones after -rc1.

Applied patch 4/4 as well, as this is actually a fix:

	hantro: Remove incorrect HEVC SPS validation

Regards,
Mauro
