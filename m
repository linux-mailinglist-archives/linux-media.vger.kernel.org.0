Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82FA53E4893
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 17:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234454AbhHIPUs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 11:20:48 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53480 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232717AbhHIPUq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 11:20:46 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: evelikov)
        with ESMTPSA id 5C6D61F42D13
Date:   Mon, 9 Aug 2021 16:20:19 +0100
From:   Emil Velikov <emil.velikov@collabora.com>
To:     Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: hantro: Fix check for single irq
Message-ID: <YRFHs7ppCxKJS+vH@arch-x1c3>
References: <20210805190416.332563-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805190416.332563-1-jernej.skrabec@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021/08/05, Jernej Skrabec wrote:
> Some cores use only one interrupt and in such case interrupt name in DT
> is not needed. Driver supposedly accounted that, but due to the wrong
> field check it never worked. Fix that.
> 
> Fixes: 18d6c8b7b4c9 ("media: hantro: add fallback handling for single irq/clk")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

D'oh thanks for catching that. This commit is:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
