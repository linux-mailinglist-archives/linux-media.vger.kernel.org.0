Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9CA4CD068
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 09:45:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234929AbiCDIqZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 03:46:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbiCDIqY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 03:46:24 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105AC527F3
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 00:45:36 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 9C66BFF805;
        Fri,  4 Mar 2022 08:45:31 +0000 (UTC)
Date:   Fri, 4 Mar 2022 09:45:29 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen.Hristev@microchip.com
Cc:     sakari.ailus@iki.fi, slongerbeam@gmail.com,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 00/27] media: ov5640: Rework the clock tree
 programming for MIPI
Message-ID: <20220304084529.52s34emzctcuthly@uno.localdomain>
References: <20220224094313.233347-1-jacopo@jmondi.org>
 <YiFY1UGvVHTEeVVu@valkosipuli.retiisi.eu>
 <6462a1b5-3a8d-7d6f-d8ae-85a751805866@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6462a1b5-3a8d-7d6f-d8ae-85a751805866@microchip.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen

On Fri, Mar 04, 2022 at 08:41:23AM +0000, Eugen.Hristev@microchip.com wrote:
> On 3/4/22 2:09 AM, Sakari Ailus wrote:
>
> > Hello folks,
> >
> > On Thu, Feb 24, 2022 at 10:42:46AM +0100, Jacopo Mondi wrote:
> >> A branch for testing based on the most recent media-master is available at
> >> https://git.sr.ht/~jmondi_/linux #jmondi/media-master/ov5640-v5
> >
> > The set has been around for quite some time without tangible functional
> > changes, please do let me know if you have concerns merging it.
> >
> > Thanks.
> >
> > --
> > Sakari Ailus
> >
>
>
> Hello Sakari, Jacopo,
>
> I retested this series and on my side, the regression in version 3 is
> gone, I can capture images fine now YUYV@1280x720 .
> I also retested 1920x1080 in RAW, and it works fine.
>

fiuuuu, I can breath again now :)

> You can add my :
> Tested-by: Eugen Hristev <eugen.hristev@microchip.com>
>
> I am not sure if you have to add it to the whole series, because I only
> tested parallel interface with atmel ISC controller on sama5d2_xplained.
> Up to your judgment to add it to the patches that impact the parallel
> interface.
>
> Thanks again Jacopo for improving the support for this sensor.

Thank you for testing with parallel mode, I would have made lot of
people unhappy otherwise!

>
> Eugen
