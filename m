Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5146455EF1A
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 22:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232360AbiF1UQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 16:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232362AbiF1UQC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 16:16:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8211539B90;
        Tue, 28 Jun 2022 13:12:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E4034A8;
        Tue, 28 Jun 2022 22:12:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656447130;
        bh=1KFKpGabrPsLOZMg4bDsc1e3TNFDFyzj4rrD0GK8bsA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OzXjlrswPCXZTTzUNin7g5mBtc28rDF4mCZs8Bgiy82m4YNxEuByizuEF0RF2pbe1
         XAONtK07FoQ5TdnqG9tpXRqTbToyliQYIksOum4H2MguzqtFFDwUcvHVLddSfiJ8aj
         P7P/sFSA2bDxIu3PP6g9sFWB2CfopxO6baElfny4=
Date:   Tue, 28 Jun 2022 23:11:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Eugen Friedrich <efriedrich@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [RFC PATCH v2] media: renesas: vsp1: Add VSPD underrun detection
 & tracing
Message-ID: <YrtghyHkWZyj8hxL@pendragon.ideasonboard.com>
References: <1651584010-10156-1-git-send-email-erosca@de.adit-jv.com>
 <YripkuWiMOcOl8Qu@pendragon.ideasonboard.com>
 <20220628190534.GA22969@lxhi-065>
 <YrtbgUhNS8Z1pgVA@pendragon.ideasonboard.com>
 <CAMuHMdX7HzbUime4EOhtzcRV2YSA44qJRFXvu0LNtmpzgBJzRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdX7HzbUime4EOhtzcRV2YSA44qJRFXvu0LNtmpzgBJzRA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On Tue, Jun 28, 2022 at 10:08:28PM +0200, Geert Uytterhoeven wrote:
> On Tue, Jun 28, 2022 at 9:53 PM Laurent Pinchart wrote:
> > On Tue, Jun 28, 2022 at 09:05:34PM +0200, Eugeniu Rosca wrote:
> > > On So, Jun 26, 2022 at 09:46:42 +0300, Laurent Pinchart wrote:
> > > > On Tue, May 03, 2022 at 03:20:10PM +0200, Eugeniu Rosca wrote:
> > > > >
> > > > > Troubleshooting the above without the right tools becomes a nightmare.
> > > >
> > > > Having spent lots of time working in userspace recently, I can't agree
> > > > more.
> > >
> > > Thanks for the feedback and for endorsing the utility of this patch.
> > >
> > > > > +static int vspd_underrun[VSPD_MAX_NUM];
> > > > > +module_param_array(vspd_underrun, int, NULL, 0444);
> > > > > +MODULE_PARM_DESC(vspd_underrun, "VSPD underrun counter");
> > > >
> > > > Module parameters are not meant to convey information back to userspace.
> > > > This should be done through either a debugfs file or a sysfs file. Given
> > > > the debugging nature of this feature, I'd recommend the former.
> > >
> > > It is a bit unfortunate that we have to go the debugFS route, since I
> > > recall at least one Customer in the past, who disabled the debugFS in
> > > the end product, since it was the only available means to meet the
> > > stringent automotive requirements (w.r.t. KNL binary size). Anybody
> > > who has no choice but to disable debugFS will consequently not be able
> > > to take advantage of this patch in the production/release software.
> >
> > debugfs isn't meant to be enabled in production, so if you need a
> > solution for production environment, it's not an option indeed.
> >
> > > If there is no alternative, then for sure I can go this way.
> > >
> > > However, before submitting PATCH v3, would you consider SYSFS viable
> > > too, if keeping the module param is totally unacceptable?
> > >
> > > I was hoping to keep the number of external dependencies to the bare
> > > minimum, hence the initial choice of module param. Looking forward to
> > > your final suggestion/preference.
> >
> > sysfs would be my next recommendation. I don't think a Linux system can
> > meaningfully run without sysfs, so it shouldn't be an issue
> > dependency-wise.
> 
> Indeed, you can add a device attribute.
> But as that is not a debug feature, the attribute must be documented,
> and becomes ABI.

Thanks for the comment, that's correct

-- 
Regards,

Laurent Pinchart
