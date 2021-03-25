Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B602E348BE2
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 09:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbhCYItE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 04:49:04 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:53875 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbhCYIsz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 04:48:55 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 470BB1C0006;
        Thu, 25 Mar 2021 08:48:46 +0000 (UTC)
Date:   Thu, 25 Mar 2021 09:48:46 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     Emil Velikov <emil.l.velikov@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org,
        linux-rockchip <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v2 00/10] Microship SAMA5D4 VPU support et al
Message-ID: <YFxObibxqK23WTMf@piout.net>
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
 <5ecf1d3b8a8f88d6387a1549faeb4f4180cf5d4b.camel@collabora.com>
 <CACvgo51uNyQgzGdW=f-0wxvjv-+OD1p7E4DJXRzu1GvnAHbcCQ@mail.gmail.com>
 <50b3b4b3-6c5b-3f1e-3499-c88574ce9f74@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50b3b4b3-6c5b-3f1e-3499-c88574ce9f74@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/03/2021 14:44:14+0100, Nicolas Ferre wrote:
> Now, when we have the tag from Rob, how to coordinate these different
> pieces? Will it go through the media git tree? Will we benefit from a stable
> branch to share or will we just have to wait for the driver to hit Mainline
> before adding the defconfig and DT patches?
> 

I think the defconfig and dt patches can go through at91 as soon as we
get Rob's ack. There is no build dependency so it can be taken at any
time. Worst case, we end up with a selected config option that doesn't
exist.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
