Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81458729264
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 10:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239022AbjFIIPD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 04:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240071AbjFIIOy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 04:14:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2FC1FEC
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 01:14:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 64BBB6546F
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 08:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9138AC4339B;
        Fri,  9 Jun 2023 08:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686298492;
        bh=6Eh4wGj2/h1K955E4Nmred9zLLuMdbhHArZFrGx4HDw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TUJ+vFOYE7xU60GLIGLRY4vucgjKZdMwIkFRsBGyqKab44AzkHi1UpHc6Xeye8d31
         UW04mJghe7KLfb6aeVCvG+ZjCONIrMUl/FyX7HQ1mVhxW/5iEDRG3ZerEkNhZOpT6S
         TnHDyp3DQ0Xur+lQW6HRb5fO6FAGmSkBra6DjkEC6m2NjJWLgX5NMSWEh0EdI11hLm
         bjKlRGdjoA4y6nLUlbT1dAtKnrCiD38d5kHqXHBhwwoZfPqdmwjQhtvF6VcrV/kSB/
         Nhjh5wb7kfRQv0nb/760AalE0ViWl6Uyk/e7ihBxDjBummtu1IrK0HrlFiDmnBvVim
         N2BNtiCz/suEg==
Date:   Fri, 9 Jun 2023 09:14:47 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dmitry Perchanov <dmitry.perchanov@intel.com>,
        linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@intel.com>
Subject: Re: [GIT PULL FOR v6.5] uvcvideo changes
Message-ID: <20230609091442.14e2bbcc@sal.lan>
In-Reply-To: <20230607175629.GK5058@pendragon.ideasonboard.com>
References: <20230605183025.GA22339@pendragon.ideasonboard.com>
        <2e66f338213f828b6bc1d97e30da93da08cad8fe.camel@intel.com>
        <20230607172703.GE5058@pendragon.ideasonboard.com>
        <a9223377febd4a494c5fc6932865a1024d3cbadd.camel@intel.com>
        <20230607175629.GK5058@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 7 Jun 2023 20:56:29 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> On Wed, Jun 07, 2023 at 08:47:38PM +0300, Dmitry Perchanov wrote:
> > Hi Laurent,
> > I saw that Jenkins failed to apply this patch..
> >  =20
> > > FAILED: patch patch patches/0002-media-uapi-v4l-Intel-metadata-format=
-update.patch doesn't apply:
> > > Applying patch patches/0002-media-uapi-v4l-Intel-metadata-format-upda=
te.patch
> > > can't find file to patch at input line 21 =20
> >=20
> > =C2=AF\_(O_o)_/=C2=AF =20
>=20
> I suspect Jenkins may be trying to apply the patch to the wrong branch.

Jenkins always try to apply patches on the top of media-stage master.

One of the issues with PR e-mails is that they don't specify on
what tree/branch a patch should be applied. Ok, it would be doable
to have some heuristics logic to try a couple of different options
and/or use "since commit" to identify if the tree is the correct
one, but the current logic lacks that.

The error message seems to indicate that the patch didn't apply
cleanly there. It should have been preserved the build information,
though.

Regards,
Mauro
