Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7676354DD1F
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 10:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbiFPInv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 04:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbiFPInu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 04:43:50 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7BEF5D1B3;
        Thu, 16 Jun 2022 01:43:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 97CCAB81E20;
        Thu, 16 Jun 2022 08:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF88C34114;
        Thu, 16 Jun 2022 08:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1655369027;
        bh=FUOFHUERQ4+1ugxx8bfKDTzFnWWaRzSvf059KSgJ42c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UDWES6CT+IJa8j8TvUxCWqqZW5bJLXAY/6MfF+p+CvJUEMGL9NLjRHX1MyOkKjPtL
         sD56ah7Aqq5YlvKtis3eUOwa1arPvyvvqkV6JtLya42fOqyGi81I/yoCAnekvt46pi
         0DlDl3L+6w7KUIYdXRqwl2upUmE1mtcUTxK9C7Fo=
Date:   Thu, 16 Jun 2022 10:43:43 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Dave Airlie <airlied@gmail.com>, linux-tegra@vger.kernel.org,
        heliang <windhl@126.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-serial@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] drivers: tty: serial: Add missing
 of_node_put() in serial-tegra.c
Message-ID: <YqrtP2jS0Gg4pBRe@kroah.com>
References: <20220615104833.3963552-1-windhl@126.com>
 <Yqm6LvDGqaRMaUHa@kroah.com>
 <CAPM=9twCiqyakgPLz0v=7-abUhzLb8ZZH7-U65PV8qtQOP7Xww@mail.gmail.com>
 <CAKMK7uG+TeATXctJaXBgSRxpinDdtOhGa+o2CMPaPtO1QyHtJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uG+TeATXctJaXBgSRxpinDdtOhGa+o2CMPaPtO1QyHtJA@mail.gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 15, 2022 at 10:30:47PM +0200, Daniel Vetter wrote:
> On Wed, 15 Jun 2022 at 22:23, Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Wed, 15 Jun 2022 at 20:53, Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Jun 15, 2022 at 06:48:33PM +0800, heliang wrote:
> > > > In tegra_uart_init(), of_find_matching_node() will return a node
> > > > pointer with refcount incremented. We should use of_node_put()
> > > > when it is not used anymore.
> > > >
> > > > Signed-off-by: heliang <windhl@126.com>
> > >
> > > We need a real name please, one you sign documents with.
> >
> > How do we enforce that? What if Wong, Adele or Beyonce submit a patch?
> >
> > What happens if that patch gets reposted, with S-o-b: He Liang
> > <windhl@126.com> or Hel Iang, Heli Ang? Do you know any of those are
> > real names? What happens if they post a real name in
> > Mandarin/Thai/Cyrillic, can you validate it?
> >
> > Really we require you have an identity attached to an email. If there
> > is a problem in the future, we'd prefer the email continues to work so
> > that you are contactable. If you are submitting a small amount of
> > changes it's probably never going to matter. If you are submitting
> > larger bodies of work of course it would be good to have a company or
> > larger org attached to track things down legally later, but again that
> > isn't always possible.
> >
> > I don't think alienating the numerous developers who no longer use
> > their legal names are identified by one name, but haven't changed
> > their legal one yet people who get married and change their legal name
> > but don't change their contribution name and I could run this sentence
> > on forever.
> 
> Yeah like absolute best case trying to "enforce" this just results in
> encouraging people to come up with entirely fake but English looking
> names for themselves. Which ... just no.

Agree, again, I'd prefer to take real names in native languages, our
tools can handle that just fine.  No need to make up anything.

thanks,

greg k-h
