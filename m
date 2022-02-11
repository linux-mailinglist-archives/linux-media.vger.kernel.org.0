Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50D604B2E5D
	for <lists+linux-media@lfdr.de>; Fri, 11 Feb 2022 21:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353186AbiBKUWI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Feb 2022 15:22:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239383AbiBKUWH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Feb 2022 15:22:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54EDCF9
        for <linux-media@vger.kernel.org>; Fri, 11 Feb 2022 12:22:05 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59D2E93;
        Fri, 11 Feb 2022 21:22:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644610923;
        bh=2LnkKOD3jbhUUEl0cyR4QD3GMkdu6tdHkHUu7rl5ogU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N8OzI7lZedijKfoJSZ96WK6ObAOpd4a74ZQeuRACzkCxBRbOweNt8uDylZkIHUCpw
         lyUFYxolj8D5xDY5YnI93Vk1UFu9JH0YQg0/LLBV9iUTcvu/TXOtGf7niNecAvJaBd
         HyZHT3wipcICkzr0dmL3wNDsYwicFJ97mcB0FuP8=
Date:   Fri, 11 Feb 2022 22:21:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        xavier.roumegue@oss.nxp.com, Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] media: imx: De-stage imx7-mipi-csis
Message-ID: <YgbFZgvB2bvK9WFE@pendragon.ideasonboard.com>
References: <20220211180216.290133-1-jacopo@jmondi.org>
 <20220211180216.290133-2-jacopo@jmondi.org>
 <CAOMZO5A09VWLGTbqggVJOh4LeLotty8s6VZB0Jq9SL2M0+P6rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOMZO5A09VWLGTbqggVJOh4LeLotty8s6VZB0Jq9SL2M0+P6rw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Fri, Feb 11, 2022 at 03:32:31PM -0300, Fabio Estevam wrote:
> On Fri, Feb 11, 2022 at 3:01 PM Jacopo Mondi wrote:
> >
> > The imx7-mipi-csis driver is in a good state and can be staged.
> 
> I think you meant de-staged :-)
> 
> > Move the imx7-mipi-csis.c driver to the newly created
> > drivers/media/platform/imx directory and plumb the related
> > options in Kconfig and in Makefile.
> 
> What about the comments in drivers/staging/media/imx/TODO?

As far as I can tell, they apply to the other drivers, not this one. Is
there any particular comment you're concerned about ?

-- 
Regards,

Laurent Pinchart
