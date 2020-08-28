Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB5A25555E
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 09:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbgH1Hcv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 28 Aug 2020 03:32:51 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:1155 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbgH1Hcu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 03:32:50 -0400
X-Originating-IP: 90.89.180.255
Received: from lhopital-XPS-13-9360 (lfbn-tou-1-1372-bdcst.w90-89.abo.wanadoo.fr [90.89.180.255])
        (Authenticated sender: kevin.lhopital@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E938124000A;
        Fri, 28 Aug 2020 07:32:47 +0000 (UTC)
Date:   Fri, 28 Aug 2020 09:32:47 +0200
From:   =?UTF-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org,
        yong.deng@magewell.com, p.zabel@pengutronix.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 5/7] media: sunxi: sun6i-csi: Add support of MIPI CSI-2
 for A83T
Message-ID: <20200828093247.2e10b561@lhopital-XPS-13-9360>
In-Reply-To: <20200827154119.ljxvjb2fe7xeg2xo@gilmour.lan>
References: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
        <20200821145935.20346-6-kevin.lhopital@bootlin.com>
        <20200825143704.qkg2re5bxm2cufnd@gilmour.lan>
        <20200826111728.21d52c34@lhopital-XPS-13-9360>
        <20200827154119.ljxvjb2fe7xeg2xo@gilmour.lan>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
Le Thu, 27 Aug 2020 17:41:19 +0200,
Maxime Ripard <maxime@cerno.tech> a écrit :

> On Wed, Aug 26, 2020 at 11:17:28AM +0200, Kévin L'hôpital wrote:
> > > > +	mdelay(10);    
> > > 
> > > Why do you need an mdelay here?  
> > 
> > yes a msleep could be more correct here.  
> 
> My question was more about whether/why you need one in the first place,
> not necessarily how you would implement that delay.
> 
> Maxime

It was a mistake, I have removed it.
Thanks for the answer.
Kévin

-- 
Kevin L'Hopital, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
