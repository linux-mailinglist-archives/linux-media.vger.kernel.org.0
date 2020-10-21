Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6B129546E
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 23:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408362AbgJUVoJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 17:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394979AbgJUVoJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 17:44:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C4DC0613CE;
        Wed, 21 Oct 2020 14:44:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E694BB5;
        Wed, 21 Oct 2020 23:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1603316645;
        bh=r0/BVPZ5sYVVho5+0WlZ2bZmHakc+j3/4PoZO26YsPo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uwwGogVaXjwO/Qh/wuPtihQDvUYwbC7+tx6/DSUXBWLgk71RrMo2tmlI458TitAmr
         VRdGUQkfHPNg8/n+1UidSvKnu3RY0Gc4wBsFzJaqx7dHDo4LqnmneSQmvhNG36m1gG
         CairNRMVulN4Fx2XynWZOsZh3eRrmadKkPHqW/E4=
Date:   Thu, 22 Oct 2020 00:43:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 0/5] Add r8a77965 DRIF support
Message-ID: <20201021214319.GO3942@pendragon.ideasonboard.com>
References: <20201021135332.4928-1-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201021135332.4928-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabrizio,

On Wed, Oct 21, 2020 at 02:53:27PM +0100, Fabrizio Castro wrote:
> Dear All,
> 
> this series is to add DRIF support for the r8a77965
> (a.k.a. R-Car M3-N). Version 5 fixes a warning reported
> by 'make dt_binding_check', as reported by Rob.

Patch 1/5 to 4/5 taken in my tree, I'll send a pull request to
linux-media when the merge window closes. I expect Geert to handle 5/5.

> Fabrizio Castro (5):
>   MAINTAINERS: Update MAINTAINERS for Renesas DRIF driver
>   media: dt-bindings: media: renesas,drif: Convert to json-schema
>   media: dt-bindings: media: renesas,drif: Add r8a77990 support
>   media: dt-bindings: media: renesas,drif: Add r8a77965 support
>   arm64: dts: r8a77965: Add DRIF support
> 
>  .../bindings/media/renesas,drif.txt           | 177 -----------
>  .../bindings/media/renesas,drif.yaml          | 279 ++++++++++++++++++
>  MAINTAINERS                                   |   4 +-
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 120 ++++++++
>  4 files changed, 401 insertions(+), 179 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,drif.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,drif.yaml

-- 
Regards,

Laurent Pinchart
