Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 693B4429F74
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 10:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234566AbhJLIOd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 12 Oct 2021 04:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234501AbhJLIOc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 04:14:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF65C061570
        for <linux-media@vger.kernel.org>; Tue, 12 Oct 2021 01:12:30 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1maCta-0002e4-Ow; Tue, 12 Oct 2021 10:12:22 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1maCtZ-0003zX-4a; Tue, 12 Oct 2021 10:12:21 +0200
Message-ID: <7542e44fdb0a86e26eab3331215694e286b54adc.camel@pengutronix.de>
Subject: Re: [PATCH v2] i.MX6: Support 16-bit BT.1120 video input
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date:   Tue, 12 Oct 2021 10:12:21 +0200
In-Reply-To: <3a638276-8a1b-835e-1728-669bbd49a1ac@xs4all.nl>
References: <m34k9uml6s.fsf@t19.piap.pl>
         <07f22ee105dd8d3eaa47cbb27428032f5b9e3043.camel@pengutronix.de>
         <3a638276-8a1b-835e-1728-669bbd49a1ac@xs4all.nl>
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

Hi Hans,

On Tue, 2021-10-12 at 09:51 +0200, Hans Verkuil wrote:
> Hi Philipp,
> 
> I can take this patch and merge it, right? Even though it mostly changes
> drivers/gpu/ipu-v3/ipu-csi.c, it is still something for the media tree to pick
> up, I think. Just checking to avoid this patch going in via two subsystems...

Yes, thank you.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

to merge via the media tree.

regards
Philipp
