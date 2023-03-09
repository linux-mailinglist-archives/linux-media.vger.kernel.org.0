Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8B4D6B2BE3
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 18:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjCIRUI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 12:20:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbjCIRTo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 12:19:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC15E827D;
        Thu,  9 Mar 2023 09:18:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7284661C99;
        Thu,  9 Mar 2023 17:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CCFC433D2;
        Thu,  9 Mar 2023 17:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678382312;
        bh=VDUvCKXgdlfmi5khxJG01i6LsiSo+RszP4yfbG/org0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gIfx8jTrIcPKt4/viA1fAZz/3j860WMYLxO0QADRarWV3i0LAwpLUCozVg/L/TgQj
         0wT+3i06gPoy5TXBMk4NoFnm4GoI8vD/P72Bze1srOk8SDgve5ie0Kzo+g289DW/rn
         4Q0fh99fnKfrBmUq/0PPVqXosknUMOa3T17jREKN6UdPFRDQ3BxnJXQZA1LGyaASe6
         sY3iwXu52Prx4yvTGMa8BRurnkv3qGzAUaKodx/f1pkdkyNCmLCzY0X0QEy0GhTYQN
         I1nDSm0AC31PgZwbsJjHbtycaisIrU4jTnu/9udir6YAVRMS8urxGVXTCjUNU8JFkH
         QKWJhULgOFQoA==
Date:   Thu, 9 Mar 2023 17:18:27 +0000
From:   Lee Jones <lee@kernel.org>
To:     Hyunwoo Kim <v4bel@theori.io>
Cc:     mchehab@kernel.org, cai.huoqing@linux.dev, kernel@tuxforce.de,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        tiwai@suse.de, imv4bel@gmail.com
Subject: Re: [PATCH v3 0/4] Fix multiple race condition vulnerabilities in
 dvb-core and device driver
Message-ID: <20230309171827.GT9667@google.com>
References: <20221117045925.14297-1-imv4bel@gmail.com>
 <20230307134131.3a005bdb@coco.lan>
 <CADUEyCz=xuYjNQohgOi86vm4P4YyfO86AbM0cWdFrs1Y_6276g@mail.gmail.com>
 <20230309020650.GA47209@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230309020650.GA47209@ubuntu>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 08 Mar 2023, Hyunwoo Kim wrote:

> On Tue, Mar 07, 2023 at 09:57:13PM +0900, Hyunwoo Kim wrote:
> > ttusb_dec is a comment for patch #4 in the series.
> > And as102 is the #1 patch.
> >
> >
> > Regards,
> > Hyunwoo Kim
>
> I was using the wrong email client and the mailing list didn't get sent, sorry.
>
> Resend the mail for the mailing list.

Please can you reply in-line - below the quote(s) you are replying to.

Then snip the rest.

> > 2023년 3월 7일 (화) 오후 9:41, Mauro Carvalho Chehab <mchehab@kernel.org>님이 작성:
> >
> > > Em Wed, 16 Nov 2022 20:59:21 -0800
> > > Hyunwoo Kim <imv4bel@gmail.com> escreveu:
> > >
> > > > Dear,
> > > >
> > > > This patch set is a security patch for various race condition
> > > vulnerabilities that occur
> > > > in 'dvb-core' and 'ttusb_dec', a dvb-based device driver.
> > > >
> > > >
> > > > # 1. media: dvb-core: Fix use-after-free due to race condition occurring
> > > in dvb_frontend
> > > > This is a security patch for a race condition that occurs in the
> > > dvb_frontend system of dvb-core.
> > > >
> > > > The race condition that occurs here will occur with _any_ device driver
> > > using dvb_frontend.
> > > >
> > > > The race conditions that occur in dvb_frontend are as follows
> > > > (Description is based on drivers/media/usb/as102/as102_drv.c using
> > > dvb_frontend):
> > > > ```
> > > >                 cpu0                                                cpu1
> > > >        1. open()
> > > >           dvb_frontend_open()
> > > >           dvb_frontend_get()    // kref : 3
> > > >
> > > >
> > > >                                                              2.
> > > as102_usb_disconnect()
> > > >
> > >  as102_dvb_unregister()
> > > >
> > >  dvb_unregister_frontend()
> > > >
> > >  dvb_frontend_put()    // kref : 2
> > > >
> > >  dvb_frontend_detach()
> > > >
> > >  dvb_frontend_put()    // kref : 1
> > > >        3. close()
> > > >           __fput()
> > > >           dvb_frontend_release()
> > > >           dvb_frontend_put()    // kref : 0
> > > >           dvb_frontend_free()
> > > >           __dvb_frontend_free()
> > > >           dvb_free_device()
> > > >           kfree (dvbdev->fops);
> > > >           ...
> > > >           fops_put(file->f_op);    // UAF!!
> > >
> > > Hmm... you're mentioning ttusb_dec at the comment, but here you're showing
> > > the race for as102, which is a different driver.
> > >
> > > I'm confused.
> > >
> > >
> > > Thanks,
> > > Mauro
> > >

--
Lee Jones [李琼斯]
