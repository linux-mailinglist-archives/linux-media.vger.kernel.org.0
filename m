Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 686CF55EE5F
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 21:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232330AbiF1Tx1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 15:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232953AbiF1Tvf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 15:51:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3619C117;
        Tue, 28 Jun 2022 12:50:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E46B94A8;
        Tue, 28 Jun 2022 21:50:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656445845;
        bh=OlpiP+HgWNzhiZpgyOTlk/YNDcsXgQdSvp4L6NqFtWc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W9B0Kph5wpuQDsJy5iwKU53ZWL1A0t9S0s1Jebo/o2yBoes+vORwkZgV+lf7r018C
         YQIvsJhfsRVltSMAPthun+KR/qGTTQtswF1aMPR2gHUEbqm6+JpKPeNKsd/jvgi5ix
         T8YJuJtvrvQUchbeHpJwGLrRz1iMzXGa6dW8zFyA=
Date:   Tue, 28 Jun 2022 22:50:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Eugen Friedrich <efriedrich@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [RFC PATCH v2] media: renesas: vsp1: Add VSPD underrun detection
 & tracing
Message-ID: <YrtbgUhNS8Z1pgVA@pendragon.ideasonboard.com>
References: <1651584010-10156-1-git-send-email-erosca@de.adit-jv.com>
 <YripkuWiMOcOl8Qu@pendragon.ideasonboard.com>
 <20220628190534.GA22969@lxhi-065>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220628190534.GA22969@lxhi-065>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugeniu,

On Tue, Jun 28, 2022 at 09:05:34PM +0200, Eugeniu Rosca wrote:
> On So, Jun 26, 2022 at 09:46:42 +0300, Laurent Pinchart wrote:
> > On Tue, May 03, 2022 at 03:20:10PM +0200, Eugeniu Rosca wrote:
> > > 
> > > Troubleshooting the above without the right tools becomes a nightmare.
> > 
> > Having spent lots of time working in userspace recently, I can't agree
> > more.
> 
> Thanks for the feedback and for endorsing the utility of this patch.
> 
> > > +static int vspd_underrun[VSPD_MAX_NUM];
> > > +module_param_array(vspd_underrun, int, NULL, 0444);
> > > +MODULE_PARM_DESC(vspd_underrun, "VSPD underrun counter");
> > 
> > Module parameters are not meant to convey information back to userspace.
> > This should be done through either a debugfs file or a sysfs file. Given
> > the debugging nature of this feature, I'd recommend the former.
> 
> It is a bit unfortunate that we have to go the debugFS route, since I
> recall at least one Customer in the past, who disabled the debugFS in
> the end product, since it was the only available means to meet the
> stringent automotive requirements (w.r.t. KNL binary size). Anybody
> who has no choice but to disable debugFS will consequently not be able
> to take advantage of this patch in the production/release software.

debugfs isn't meant to be enabled in production, so if you need a
solution for production environment, it's not an option indeed.

> If there is no alternative, then for sure I can go this way.
> 
> However, before submitting PATCH v3, would you consider SYSFS viable
> too, if keeping the module param is totally unacceptable?
> 
> I was hoping to keep the number of external dependencies to the bare
> minimum, hence the initial choice of module param. Looking forward to
> your final suggestion/preference.

sysfs would be my next recommendation. I don't think a Linux system can
meaningfully run without sysfs, so it shouldn't be an issue
dependency-wise.

> > > +	if (strstr(of_node_full_name(vsp1->dev->of_node), "vsp@fea20000")) {
> > > +		vsp1->vspd_id = 0;
> > > +	} else if (strstr(of_node_full_name(vsp1->dev->of_node), "vsp@fea28000")) {
> > > +		vsp1->vspd_id = 1;
> > > +	} else if (strstr(of_node_full_name(vsp1->dev->of_node), "vsp@fea30000")) {
> > > +		vsp1->vspd_id = 2;
> > > +	} else if (strstr(of_node_full_name(vsp1->dev->of_node), "vsp@fea38000")) {
> > > +		vsp1->vspd_id = 3;
> > > +	} else {
> > > +		vsp1->vspd_id = -1;
> > > +	}
> > 
> > You can drop the curly braces.
> 
> Fine.
> 
> > Usage of addresses will make this very SoC-specific. With debugfs you
> > can create one directory per VSP instance, which will scale better.
> 
> Since VSP underruns are only relevant to the VSP devices with an
> interface to DU, we originally skipped any mem2mem VSP devices when
> exposing the underrun info to the user.
> 
> Do I understand your feedback correctly that you would prefer to expose
> the mem2mem VSP devices along with the VSPD devices (even if the former
> will never experience a display underrun/flicker), for the sake of
> 1) skipping the address filtering in the C code and for the sake of
> 2) making the list of VSP instances in sysfs/debugFS less HW specific?

You don't have to expose this in every VSP device, but the addresses
above are specific to the VSPD integration in particular R-Car SoCs.
There could be other R-Car SoCs that have their VSPD at different
addresses, either existing devices, or future devices.

The whole point of describing the SoC integration in the device tree is
to free drivers from having to hardcode addresses, which makes them more
portable across different SoCs. I'd like to preserve that. Using sysfs
will solve the issue.

> > -- 
> > Regards,
> > 
> > Laurent Pinchart
> 
> Thanks again for the feedback and bear with me if the PATCH v3 is coming
> a bit late due to the long-awaited vacation looming on the horizon.

I'm the one who should apologize for delays, I'm trully ashamed by how
long it took me to reply to your v2. Please rest assured that your work
is truly appreciated.

-- 
Regards,

Laurent Pinchart
