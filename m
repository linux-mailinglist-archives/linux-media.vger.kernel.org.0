Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB164B2215
	for <lists+linux-media@lfdr.de>; Fri, 11 Feb 2022 10:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348667AbiBKJfu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Feb 2022 04:35:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348664AbiBKJft (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Feb 2022 04:35:49 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A2F1037
        for <linux-media@vger.kernel.org>; Fri, 11 Feb 2022 01:35:45 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 69F83C0010;
        Fri, 11 Feb 2022 09:35:40 +0000 (UTC)
Date:   Fri, 11 Feb 2022 10:36:46 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/23] media: ov5640: Rework the clock tree
 programming for MIPI
Message-ID: <20220211093646.vhrifvpl7jbf2i25@uno.localdomain>
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <5db6f493-ca45-311a-1f44-9138e01722a1@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5db6f493-ca45-311a-1f44-9138e01722a1@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Thu, Feb 10, 2022 at 03:00:21PM +0200, Tomi Valkeinen wrote:
> On 10/02/2022 13:04, Jacopo Mondi wrote:
> > v1:
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=7249
>
> You could rather point to lore.kernel.org, so that the intro letter and the
> discussions are also visible.
>
> > A branch for testing based on the most recent media-master is available at
> > https://git.sr.ht/~jmondi_/linux #jmondi/media-master/ov5640-v2
> >
> > If anyone with a DVP setup could verify I have not broken their use case
> > I would very much appreciate that :)
> >
> > v1 -> v2:
> > - rework the modes definition to process the full pixel array
> > - rework get_selection to report the correct BOUND and DEFAULT targets
> > - implement init_cfg
> > - minor style changes as suggested by Laurent
> > - test with 1 data lane
>
> Very nice! I tested this on TI's DRA76 EVM (CSI-2). UYVY and RGB565, with
> the following resolutions: 160 120, 176 144, 320 240, 640 480, 720 480, 720
> 576, 1024 768, 1280 720, 1920 1080.
>
> All work. The only issue I saw was that with 1024x768 and 1280x720 there's a
> thin vertical purple column on the right edge.

Thanks for spotting.

I've sent a v2.1 version of "media: ov5640: Rework analog crop rectangles"
where I have re-introduced the crop rectangles as they were defined in
the register tables for 1024x768 and 1280x720, which are closer to
what the datasheet suggests. The vertical purple column seems to be
gone now.

Thanks
   j
>
>  Tomi
