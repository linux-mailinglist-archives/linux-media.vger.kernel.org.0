Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B0D4315DC
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 12:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbhJRKXt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 18 Oct 2021 06:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231524AbhJRKXH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 06:23:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B94C06161C
        for <linux-media@vger.kernel.org>; Mon, 18 Oct 2021 03:20:56 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mcPl9-0000HJ-96; Mon, 18 Oct 2021 12:20:47 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mcPl8-0005IX-SF; Mon, 18 Oct 2021 12:20:46 +0200
Message-ID: <f2011a5434a7c3fc8809c3cbde59891af6b13689.camel@pengutronix.de>
Subject: Re: [PATCHv2 2/4] media: imx: Store the type of hardware
 implementation
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@puri.sm, phone-devel@vger.kernel.org
Date:   Mon, 18 Oct 2021 12:20:46 +0200
In-Reply-To: <20211017102904.756408-2-dorota.czaplejewicz@puri.sm>
References: <20211017102904.756408-1-dorota.czaplejewicz@puri.sm>
         <20211017102904.756408-2-dorota.czaplejewicz@puri.sm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 2021-10-17 at 13:08 +0200, Dorota Czaplejewicz wrote:
> The driver covers i.MX5/6, as well as i.MX7/8 hardware.
> Those implementations differ, e.g. in the sizes of buffers they accept.
> 
> Some functionality should be abstracted, and storing type achieves that.
> 
> Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>

I'd call the enum imx_media_device_type, but that's just a slight
preference:

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
