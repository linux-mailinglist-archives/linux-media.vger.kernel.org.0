Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5214773CB
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 14:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237316AbhLPN7q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 08:59:46 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:36303 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237296AbhLPN7q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 08:59:46 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 37CA74000B;
        Thu, 16 Dec 2021 13:59:41 +0000 (UTC)
Date:   Thu, 16 Dec 2021 15:00:34 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/2] max9271: Fix pclk detect silent failure
Message-ID: <20211216140034.u53ml2ph4ucdrfvd@uno.localdomain>
References: <20211108122043.49187-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211108122043.49187-1-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari, Mauro,
   is it too late to collect these patches for the next merge window ?

On Mon, Nov 08, 2021 at 01:20:41PM +0100, Jacopo Mondi wrote:
> Repeatedly reading register 0x15 to validate the incoming pixel clock
> causes sporadic read errors which went silently ignored, causing the camera
> module to fail to start streaming.
>
> Fix that by ignoring the read error and while at it rework the error message
> handling in all functions.
>
> v2->v3
> - Remove goto from 1/2 as suggested by Geert
> v1->v2:
> - Drop v1 [1/2]
> - [2/2] new patch. Handle all bus access errors in the call sites
>
> Jacopo Mondi (2):
>   media: max9271: Ignore busy loop read errors
>   media: max9271: Fail loud on bus errors in call sites
>
>  drivers/media/i2c/max9271.c | 116 +++++++++++++++++++++---------------
>  1 file changed, 68 insertions(+), 48 deletions(-)
>
> --
> 2.33.1
>
