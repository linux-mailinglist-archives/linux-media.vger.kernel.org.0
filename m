Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD151D0071
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 23:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731359AbgELVNf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 17:13:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:57278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731269AbgELVNf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 17:13:35 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F43420659;
        Tue, 12 May 2020 21:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589318014;
        bh=ah3PdDBco+3zTv9xUB/UM1YD/Pr1jnR3JXdj8wparF0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iV/KGfOY59MtJj5Ob3NsTxLpiOWQjsg1mRmMs2yjp7xAu48kFEvOkBgtLLq7hSHq0
         ms8bGIOtRVZoFPR+UVgpkf9MoTden6TFNlXTQo04J2nI+lGMHB6FGKpTv2Mg/WiMYY
         VIqdFaiPhP9v0UXQ4tcEnPmrINoQMcwY1c6ppnuw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200506120304.31550-1-geert+renesas@glider.be>
References: <20200506120304.31550-1-geert+renesas@glider.be>
Subject: Re: [PATCH] media: i2c: imx219: Drop <linux/clk-provider.h> and <linux/clkdev.h>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Date:   Tue, 12 May 2020 14:13:33 -0700
Message-ID: <158931801390.215346.6065473068389157307@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Geert Uytterhoeven (2020-05-06 05:03:04)
> The IMX219 camera driver is not a clock provider, but merely a clock
> consumer, and thus does not need to include <linux/clk-provider.h> and
> <linux/clkdev.h>.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
