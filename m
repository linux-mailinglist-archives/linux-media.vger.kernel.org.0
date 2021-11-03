Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A44444196
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 13:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbhKCMfS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 3 Nov 2021 08:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbhKCMfS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 08:35:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB6FC061714
        for <linux-media@vger.kernel.org>; Wed,  3 Nov 2021 05:32:41 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1miFRL-0004xx-V4; Wed, 03 Nov 2021 13:32:27 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1miFRL-000BSX-DO; Wed, 03 Nov 2021 13:32:27 +0100
Message-ID: <6d6feb1ac100bb68f9e090582af2278a2e407104.camel@pengutronix.de>
Subject: Re: [PATCHv3 1/4] media: imx: Remove unused functions
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
Date:   Wed, 03 Nov 2021 13:32:27 +0100
In-Reply-To: <20211019120047.827915-1-dorota.czaplejewicz@puri.sm>
References: <20211019120047.827915-1-dorota.czaplejewicz@puri.sm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-10-19 at 14:13 +0200, Dorota Czaplejewicz wrote:
> Neither imx_media_mbus_fmt_to_ipu_image nor imx_media_ipu_image_to_mbus_fmt
> were used anywhere.
> 
> Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
