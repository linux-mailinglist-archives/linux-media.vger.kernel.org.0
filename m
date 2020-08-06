Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97A623DD88
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730275AbgHFRL1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:11:27 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:38614 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729357AbgHFRLX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 13:11:23 -0400
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id B382C3B2BA2;
        Thu,  6 Aug 2020 14:50:12 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D8F3024000C;
        Thu,  6 Aug 2020 14:44:48 +0000 (UTC)
Date:   Thu, 6 Aug 2020 16:48:28 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/4] media: i2c: ov5640 feature enhancement and fixes
Message-ID: <20200806144828.bflbpla2x4sjfsbp@uno.localdomain>
References: <1596465107-14251-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1596465107-14251-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Mon, Aug 03, 2020 at 03:31:43PM +0100, Lad Prabhakar wrote:
> Hi All,
>
> This patch series fixes DVP support and enables BT656 mode in
> the driver.
>
> @Jacopo Mondi - patch 1/4 will collide with your patch series [1],
> feel free to merge it as part of your v2.

This would actually make my life simpler, as one of the issues I had
was trying to make bus-type required to be able to differentiate
between different properties.

>
> [1] https://www.spinics.net/lists/linux-renesas-soc/msg51236.html
>
> Cheers,
> Prabhakar
>
> Changes for v2:
> * Added support to fallback in parallel mode
> * Documented bus-type property
> * Added descriptive commit message for patch 2/4 as pointed
>   by Sakari
> * Fixed review comments pointed by Laurent to have separate functions
>   for mipi and dvp setup
> * Made sure the sensor is in power down mode during startup too for
>   DVP mode
>
> Lad Prabhakar (4):
>   dt-bindings: media: i2c: ov5640: Document bus-type property
>   media: i2c: ov5640: Enable data pins on poweron for DVP mode
>   media: i2c: ov5640: Add support for BT656 mode
>   media: i2c: ov5640: Fallback to parallel mode
>
>  .../devicetree/bindings/media/i2c/ov5640.txt  |   9 +-
>  drivers/media/i2c/ov5640.c                    | 333 ++++++++++--------
>  2 files changed, 198 insertions(+), 144 deletions(-)
>
> --
> 2.17.1
>
