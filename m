Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309E3466D22
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 23:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377504AbhLBWrc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 17:47:32 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40158 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377482AbhLBWrb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 17:47:31 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8F1EB7E;
        Thu,  2 Dec 2021 23:44:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638485046;
        bh=b9wmW+9lDgWgXKRDWJV/3oD6ffkkHYt53ZguaT9G4bs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aucSEzJMJAQuE46RaLeh+EjMqWJvC4xoEVG7/2H+NWQ4sQmQYJyY8VogXtm/JTFJb
         feGZyjqhILIbduaKtW/V2J6aQd56i9i6gsFol7Ba39KiVGj1VTf4YWBDFXdqT5IZyt
         gnRVzEu4rnzJUpfhDwhcrgs03NgOeYrKuWaVDHTc=
Date:   Fri, 3 Dec 2021 00:43:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: media: nxp,imx7-mipi-csi2: Drop bad if/then
 schema
Message-ID: <YalMHPsLzQ02v5uO@pendragon.ideasonboard.com>
References: <20211202023021.3655384-1-robh@kernel.org>
 <Yak1NLz2/X3TfeUM@pendragon.ideasonboard.com>
 <CAL_Jsq+u=Hr8_2WdqDEnu+wT8zZjngepY1-JqTrt7pazGFCTpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+u=Hr8_2WdqDEnu+wT8zZjngepY1-JqTrt7pazGFCTpQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Thu, Dec 02, 2021 at 04:26:23PM -0600, Rob Herring wrote:
> On Thu, Dec 2, 2021 at 3:06 PM Laurent Pinchart wrote:
> > On Wed, Dec 01, 2021 at 08:30:21PM -0600, Rob Herring wrote:
> > > The if/then schema for 'data-lanes' doesn't work as 'compatible' is at a
> > > different level than 'data-lanes'. To make it work, the if/then schema
> > > would have to be moved to the top level and then whole hierarchy of
> > > nodes down to 'data-lanes' created. I don't think it is worth the
> > > complexity to do that, so let's just drop it.
> >
> > Fair enough, but then shouldn't there be a comment in the data-lanes
> > property to tell that i.MX7 only supports up to 2 data lanes ?
> 
> I'll add this to data-lanes:
> 
> description: Note that 'fsl,imx7-mipi-csi2' only supports up to 2 data lines.

Looks good to me.

> I assume it is 1 or 2 and not only 2, right?

Correct.

-- 
Regards,

Laurent Pinchart
