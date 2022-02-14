Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC894B458C
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 10:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbiBNJXD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 04:23:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbiBNJXD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 04:23:03 -0500
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66EDC60A85
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 01:22:55 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id E2B76200003;
        Mon, 14 Feb 2022 09:22:49 +0000 (UTC)
Date:   Mon, 14 Feb 2022 10:23:58 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        xavier.roumegue@oss.nxp.com, Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] media: imx: De-stage imx7-mipi-csis
Message-ID: <20220214092358.mu5vvfkzn2zfvokm@uno.localdomain>
References: <20220211180216.290133-1-jacopo@jmondi.org>
 <20220211180216.290133-2-jacopo@jmondi.org>
 <CAOMZO5A09VWLGTbqggVJOh4LeLotty8s6VZB0Jq9SL2M0+P6rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOMZO5A09VWLGTbqggVJOh4LeLotty8s6VZB0Jq9SL2M0+P6rw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio

On Fri, Feb 11, 2022 at 03:32:31PM -0300, Fabio Estevam wrote:
> Hi Jacopo,
>
> On Fri, Feb 11, 2022 at 3:01 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > The imx7-mipi-csis driver is in a good state and can be staged.
>
> I think you meant de-staged :-)
>

Indeed :)

> > Move the imx7-mipi-csis.c driver to the newly created
> > drivers/media/platform/imx directory and plumb the related
> > options in Kconfig and in Makefile.
>
> What about the comments in drivers/staging/media/imx/TODO?

I found nothing there that applies to this driver.
Have I missed any point ?
