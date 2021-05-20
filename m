Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6139A38B640
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 20:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235723AbhETSov (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 14:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232681AbhETSov (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 14:44:51 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F847C061574;
        Thu, 20 May 2021 11:43:29 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: evelikov)
        with ESMTPSA id 1650F1F4215F
Date:   Thu, 20 May 2021 19:43:22 +0100
From:   Emil Velikov <emil.velikov@collabora.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: hantro: test the correct variable in probe()
Message-ID: <YKatymPzAtKxpSOY@arch-x1c3>
References: <YKaIKXOcDb0nXguP@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKaIKXOcDb0nXguP@mwanda>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Thank you for the patch.

On 2021/05/20, Dan Carpenter wrote:
> This should be testing "vpu->clocks[0].clk" instead of "vpu->clocks".
> 
> Fixes: eb4cacdfb998 ("media: hantro: add fallback handling for single irq/clk")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
