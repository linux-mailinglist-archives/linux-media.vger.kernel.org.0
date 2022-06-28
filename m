Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E91355ED95
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 21:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234943AbiF1TGV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 15:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234922AbiF1TGB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 15:06:01 -0400
Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D792C668;
        Tue, 28 Jun 2022 12:05:45 -0700 (PDT)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hi1smtp01.de.adit-jv.com (Postfix) with ESMTPS id 1BBC15200D6;
        Tue, 28 Jun 2022 21:05:44 +0200 (CEST)
Received: from lxhi-065 (10.72.94.4) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Tue, 28 Jun
 2022 21:05:43 +0200
Date:   Tue, 28 Jun 2022 21:05:34 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Eugen Friedrich <efriedrich@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [RFC PATCH v2] media: renesas: vsp1: Add VSPD underrun detection
 & tracing
Message-ID: <20220628190534.GA22969@lxhi-065>
References: <1651584010-10156-1-git-send-email-erosca@de.adit-jv.com>
 <YripkuWiMOcOl8Qu@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YripkuWiMOcOl8Qu@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.94.4]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

On So, Jun 26, 2022 at 09:46:42 +0300, Laurent Pinchart wrote:
> On Tue, May 03, 2022 at 03:20:10PM +0200, Eugeniu Rosca wrote:
> > 
> > Troubleshooting the above without the right tools becomes a nightmare.
> 
> Having spent lots of time working in userspace recently, I can't agree
> more.

Thanks for the feedback and for endorsing the utility of this patch.

> > +static int vspd_underrun[VSPD_MAX_NUM];
> > +module_param_array(vspd_underrun, int, NULL, 0444);
> > +MODULE_PARM_DESC(vspd_underrun, "VSPD underrun counter");
> 
> Module parameters are not meant to convey information back to userspace.
> This should be done through either a debugfs file or a sysfs file. Given
> the debugging nature of this feature, I'd recommend the former.

It is a bit unfortunate that we have to go the debugFS route, since I
recall at least one Customer in the past, who disabled the debugFS in
the end product, since it was the only available means to meet the
stringent automotive requirements (w.r.t. KNL binary size). Anybody
who has no choice but to disable debugFS will consequently not be able
to take advantage of this patch in the production/release software.

If there is no alternative, then for sure I can go this way.

However, before submitting PATCH v3, would you consider SYSFS viable
too, if keeping the module param is totally unacceptable?

I was hoping to keep the number of external dependencies to the bare
minimum, hence the initial choice of module param. Looking forward to
your final suggestion/preference.

> > +	if (strstr(of_node_full_name(vsp1->dev->of_node), "vsp@fea20000")) {
> > +		vsp1->vspd_id = 0;
> > +	} else if (strstr(of_node_full_name(vsp1->dev->of_node), "vsp@fea28000")) {
> > +		vsp1->vspd_id = 1;
> > +	} else if (strstr(of_node_full_name(vsp1->dev->of_node), "vsp@fea30000")) {
> > +		vsp1->vspd_id = 2;
> > +	} else if (strstr(of_node_full_name(vsp1->dev->of_node), "vsp@fea38000")) {
> > +		vsp1->vspd_id = 3;
> > +	} else {
> > +		vsp1->vspd_id = -1;
> > +	}
> 
> You can drop the curly braces.

Fine.

> 
> Usage of addresses will make this very SoC-specific. With debugfs you
> can create one directory per VSP instance, which will scale better.

Since VSP underruns are only relevant to the VSP devices with an
interface to DU, we originally skipped any mem2mem VSP devices when
exposing the underrun info to the user.

Do I understand your feedback correctly that you would prefer to expose
the mem2mem VSP devices along with the VSPD devices (even if the former
will never experience a display underrun/flicker), for the sake of
1) skipping the address filtering in the C code and for the sake of
2) making the list of VSP instances in sysfs/debugFS less HW specific?

> -- 
> Regards,
> 
> Laurent Pinchart

Thanks again for the feedback and bear with me if the PATCH v3 is coming
a bit late due to the long-awaited vacation looming on the horizon.

BR, Eugeniu.
