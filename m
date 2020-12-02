Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDCFA2CC11C
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 16:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgLBPnF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 2 Dec 2020 10:43:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727677AbgLBPnE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 10:43:04 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67354C0613CF
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 07:42:24 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kkUGq-00024S-7A; Wed, 02 Dec 2020 16:42:20 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kkUGp-0001Ms-MN; Wed, 02 Dec 2020 16:42:19 +0100
Message-ID: <35963d7fdedfe05b569ac0faa88699fd39b1a876.camel@pengutronix.de>
Subject: Re: [PATCH v4] media: coda: Convert the driver to DT-only
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl, andy.shevchenko@gmail.com,
        linux-kernel@vger.kernel.org
Date:   Wed, 02 Dec 2020 16:42:19 +0100
In-Reply-To: <20201202141326.32645-1-festevam@gmail.com>
References: <20201202141326.32645-1-festevam@gmail.com>
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

On Wed, 2020-12-02 at 11:13 -0300, Fabio Estevam wrote:
> Since 5.10-rc1 i.MX is a devicetree-only platform, so simplify the code
> by removing the unused non-DT support.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Thank you, this looks fine to me now.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
