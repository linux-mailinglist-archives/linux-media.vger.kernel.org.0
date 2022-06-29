Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D276555FEBA
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 13:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232583AbiF2Lgv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 07:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbiF2Lgu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 07:36:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA29B7F1;
        Wed, 29 Jun 2022 04:36:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 358323D7;
        Wed, 29 Jun 2022 13:36:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656502607;
        bh=X4fRMZUU5xp6YrMk9MRYXqtztsdFlRd5Rh3c6T+3ZHY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PxFDLKSLz1I3RbEF5XjDLVxqb905sLnxIxsPeseTwOVNfanumXUFMwsfcLRPmnBSE
         rbzW98vwR9ZjVN3CBSOXz7jAg7hp5VEGVLFRjx9C9LtyjR7LbauqD5GDjj4g2MW3f/
         XUSrKIH7QhSmCCOeNkk7w4uO8Fnmw/E8vIaSsvZI=
Date:   Wed, 29 Jun 2022 14:36:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Eugen Friedrich <efriedrich@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [RFC PATCH v2] media: renesas: vsp1: Add VSPD underrun detection
 & tracing
Message-ID: <Yrw5O3FwLaDbl13/@pendragon.ideasonboard.com>
References: <1651584010-10156-1-git-send-email-erosca@de.adit-jv.com>
 <YripkuWiMOcOl8Qu@pendragon.ideasonboard.com>
 <20220628190534.GA22969@lxhi-065>
 <YrtbgUhNS8Z1pgVA@pendragon.ideasonboard.com>
 <CAMuHMdX7HzbUime4EOhtzcRV2YSA44qJRFXvu0LNtmpzgBJzRA@mail.gmail.com>
 <YrtghyHkWZyj8hxL@pendragon.ideasonboard.com>
 <165649892469.1516045.14695489097805483568@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <165649892469.1516045.14695489097805483568@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Jun 29, 2022 at 11:35:24AM +0100, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2022-06-28 21:11:51)
> > On Tue, Jun 28, 2022 at 10:08:28PM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Jun 28, 2022 at 9:53 PM Laurent Pinchart wrote:
> > > > On Tue, Jun 28, 2022 at 09:05:34PM +0200, Eugeniu Rosca wrote:
> > > > > On So, Jun 26, 2022 at 09:46:42 +0300, Laurent Pinchart wrote:
> > > > > > On Tue, May 03, 2022 at 03:20:10PM +0200, Eugeniu Rosca wrote:
> > > > > > >
> > > > > > > Troubleshooting the above without the right tools becomes a nightmare.
> > > > > >
> > > > > > Having spent lots of time working in userspace recently, I can't agree
> > > > > > more.
> > > > >
> > > > > Thanks for the feedback and for endorsing the utility of this patch.
> > > > >
> > > > > > > +static int vspd_underrun[VSPD_MAX_NUM];
> > > > > > > +module_param_array(vspd_underrun, int, NULL, 0444);
> > > > > > > +MODULE_PARM_DESC(vspd_underrun, "VSPD underrun counter");
> > > > > >
> > > > > > Module parameters are not meant to convey information back to userspace.
> > > > > > This should be done through either a debugfs file or a sysfs file. Given
> > > > > > the debugging nature of this feature, I'd recommend the former.
> > > > >
> > > > > It is a bit unfortunate that we have to go the debugFS route, since I
> > > > > recall at least one Customer in the past, who disabled the debugFS in
> > > > > the end product, since it was the only available means to meet the
> > > > > stringent automotive requirements (w.r.t. KNL binary size). Anybody
> > > > > who has no choice but to disable debugFS will consequently not be able
> > > > > to take advantage of this patch in the production/release software.
> > > >
> > > > debugfs isn't meant to be enabled in production, so if you need a
> > > > solution for production environment, it's not an option indeed.
> 
> I have an out of tree patch set that I've kept around since I started
> working on VSP1 that adds a debugfs entry for VSPd so that I can extract
> information/stats when debugging.
> 
> Seems like I should probably have shared that in the past, so I'll do so
> now.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git/
> Branch: kbingham/vsp1/debugfs
> 
> 
> I'll post to the linux-media mailing list too separately.
> 
> Certainly for the patches I have, shouldn't be in sysfs they provide
> debug of registers and decoding and aren't expected to be an ABI.
> 
> I also added an underrun interrupt warning, but I think your
> implementation keeping a count is valid too, though anytime I've seen an
> underrun - that's been the 'end' - and the whole device has stalled.
> 
> Have you actually seen it occur, and continue?
> 
> 
> > > > > If there is no alternative, then for sure I can go this way.
> > > > >
> > > > > However, before submitting PATCH v3, would you consider SYSFS viable
> > > > > too, if keeping the module param is totally unacceptable?
> > > > >
> > > > > I was hoping to keep the number of external dependencies to the bare
> > > > > minimum, hence the initial choice of module param. Looking forward to
> > > > > your final suggestion/preference.
> > > >
> > > > sysfs would be my next recommendation. I don't think a Linux system can
> > > > meaningfully run without sysfs, so it shouldn't be an issue
> > > > dependency-wise.
> > > 
> > > Indeed, you can add a device attribute.
> > > But as that is not a debug feature, the attribute must be documented,
> > > and becomes ABI.
> > 
> > Thanks for the comment, that's correct
> 
> If we end up with a sysfs interface, I might like to see other frame
> counters added too I think. And that's my only worry about using sysfs
> for this ... it would become the defacto place to add debug info, rather
> than 'debugfs'.
> 
> Not a direct objection, but a worry. But perhaps exposing frame counters
> and basic device stats through sysfs is a win anyway.

I've been thinking some more about this. We should separate debugging
features, which should be exposed through debugfs, from production
monitoring features, which need a different API (and have a stable ABI).
sysfs is an interesting option, but I'm wondering in this case if
userspace would also need the ability to receive notifications in case
of errors. This isn't something the sysfs provides, polling would be
required in that case, which isn't ideal.

Are there other standard device monitoring APIs that we could use ?

-- 
Regards,

Laurent Pinchart
