Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8215B2B3E97
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 09:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgKPI0h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 03:26:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:54852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726837AbgKPI0h (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 03:26:37 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5F9C42068E;
        Mon, 16 Nov 2020 08:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605515196;
        bh=EkcsR10KqAOrOCrLmIwBfvmqHxgBwyjonp5JGXWTMGE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vPyjB3W3ymNjikFbnyOYZXQ8vfwNoBpzVJDO6dTxX4Ia+SlQMtWVD9nDSIHwkdgDk
         p+liTProgTDp/5Co32z7UWCFXkbynRdgoV4recD3viLKC/zdvYK7X/3VH/gQlkKEpg
         OXRQYUJf6oSTFvDNwWE7GP517kbLlEflrMGB5PpM=
Date:   Mon, 16 Nov 2020 16:26:27 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, robh+dt@kernel.org,
        p.zabel@pengutronix.de, paul.kocialkowski@bootlin.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com, s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: Re: [PATCH v5 02/10] firmware: imx: scu-pd: Add power domains for
 imx-jpeg
Message-ID: <20201116082626.GI5849@dragon>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
 <20201112030557.8540-3-mirela.rabulea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112030557.8540-3-mirela.rabulea@oss.nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 12, 2020 at 05:05:49AM +0200, Mirela Rabulea (OSS) wrote:
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> The power domains are for imx8qxp/imx8qm JPEG encoder & decoder.
> Each has 4 slots and a wrapper.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> Acked-by: Daniel Baluta <daniel.baluta@nxp.com>

Applied, thanks.
