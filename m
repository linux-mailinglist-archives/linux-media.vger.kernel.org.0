Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1760C701901
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 20:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237200AbjEMSJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 14:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237273AbjEMSJO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 14:09:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91FEE46A0;
        Sat, 13 May 2023 11:09:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2320D60B4A;
        Sat, 13 May 2023 18:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5A8C4339B;
        Sat, 13 May 2023 18:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684001346;
        bh=wT2fUHM1k0O+v6UkjWQ+uwgWRy1V21/bwijOGAblZx4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AiPGMkDLmhVSDOe4TCDo2/fwNXnNQeZqRFER9UzpG2T894t8U/bbnBPoXAOaIl9Jm
         la7moPigivxNlMK+6rlG+QK15wKjBP31FtoE1ocTndMMKubJy1AdBT/VRs+oGDkN/t
         hRqDyePsXASImLXxKkwYhl+PYpIiKiZLhRKosk8wcEUv3PfKRLAaTcgBjyifCDJu0K
         OgJ5GsU8cCtVMPSQt+O1k79Sm++Mq64GSgDHNvjnQ/5om0TVhKI36/JLJ2Vb4BCqh9
         5qtHqWkArtVY8OLKvdwSfUy8xvP9EZWKORv6F5DwvlqFhdHUBArBsI9rsgXSstw67R
         CmSqv+sF1GVVw==
Date:   Sat, 13 May 2023 19:09:01 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Lee Jones <lee@kernel.org>
Cc:     Takashi Iwai <tiwai@suse.de>, Hyunwoo Kim <imv4bel@gmail.com>,
        kernel@tuxforce.de, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, cai.huoqing@linux.dev
Subject: Re: [PATCH v3 0/4] Fix multiple race condition vulnerabilities in
 dvb-core and device driver
Message-ID: <20230513190901.0f403933@sal.lan>
In-Reply-To: <20230309171714.GS9667@google.com>
References: <20221117045925.14297-1-imv4bel@gmail.com>
        <87lema8ocn.wl-tiwai@suse.de>
        <Y/YXbNgBhhWhfjwS@google.com>
        <Y/3mT9uSsuviT+sa@google.com>
        <20230307103659.GA347928@google.com>
        <20230309011525.49ac3399@coco.lan>
        <20230309171714.GS9667@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lee,

Em Thu, 9 Mar 2023 17:17:14 +0000
Lee Jones <lee@kernel.org> escreveu:

> > > Still nothing heard from the author or any maintainer.  
> >
> > We're currently lacking a sub-maintainer for dvb. Changes at the
> > DVB mutexes have been problematic and require tests on some
> > devices, specially on those with multiple frontends.
> >
> > I'll try to find some time to review and test those patches.  
> 
> Thank you Mauro, I fully appreciate the struggles and the effort.

It took more time than I originally anticipated, as I had to setup
a way to test it here with some DVB-T devices, but I reviewed the
code and tested it.

I'm placing the patches I picked at this series:

	https://lore.kernel.org/lkml/53558de2b5c4f4ee6bfcfbe34e27071c2d0073d5.1684000646.git.mchehab@kernel.org/T/#t

They seemed to work fine. I tested using two devices:

	USB ID 2013:0246 PCTV Systems PCTV 74E
	USB ID 2040:5200 Hauppauge NovaT 500Stick

The second one has two DVB-T independent devices on it.

I did some tests of removing and re-inserting them with the
devices closed and with the device opened and streamed. I didn't
find any regressions. I didn't try to use kmemleak or KASAN to
detect UAF conditions, though.

Regards,
Mauro
