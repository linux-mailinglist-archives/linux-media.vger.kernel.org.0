Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFBA3C7F91
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 09:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238346AbhGNHsx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 03:48:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:59776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238139AbhGNHsx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 03:48:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8BA1A60D07;
        Wed, 14 Jul 2021 07:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626248762;
        bh=HhD0WWK2GNeV7yXtYkbwwwAeUF60xe/nUuT5fDmEYVw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AhpHbVJDNz6omBhLT44b0ARXwDkdcVAAbeOTXrS6GwbjblD23+JKMC8pcXa8CzrzW
         pg4NoXMcPM1+cUz9wds3FQ8KssgHYBjeLP0f8GmH4SUPpES1obZocwrBOhqqVX695h
         HGS+vAH71xPLl7c5jLhD+Sz7ieHNHMz8YV7E7pM5SW0d2Hk89cqrt1iqzpDo6+j6U1
         Q5jgGMkpdP3F37rF8qWj3qP0sbuX+GF6RWCGfX/4m3hOu/hCgfhCvXKCD7vEQEIAEQ
         NJMtQiGRIegGLf6/qc5XvoojFdDGe4xexpGQNOlRA25GpXc4SyCLEEG/tC9OOlUpXZ
         mqgST/BJmvyzg==
Date:   Wed, 14 Jul 2021 15:45:54 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
Cc:     robh+dt@kernel.org, aisheng.dong@nxp.com, guoniu.zhou@nxp.com,
        linux-arm-kernel@lists.infradead.org, mchehab@kernel.org,
        peng.fan@nxp.com, s.hauer@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul.kocialkowski@bootlin.com, daniel.baluta@nxp.com,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com,
        p.zabel@pengutronix.de, ezequiel@collabora.com,
        kernel@pengutronix.de, Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: Re: [PATCH v14 0/2] Add dts and bindings update for i.MX8QM/QXP JPEG
 codec
Message-ID: <20210714074553.GG4419@dragon>
References: <20210619143611.17280-1-mirela.rabulea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210619143611.17280-1-mirela.rabulea@oss.nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jun 19, 2021 at 05:36:09PM +0300, Mirela Rabulea (OSS) wrote:
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> Add the dts files for i.MX8QM/QXP JPEG codec.
> The bindings for i.MX8QXP were already upstream, only update with i.MX8QM compatible.
> 
> Mirela Rabulea (2):
>   media: dt-bindings: imx-jpeg: Add compatible for i.MX8QM JPEG codec

I fixed the prefix as Aisheng suggested.

>   arm64: dts: imx8: Add jpeg encoder/decoder nodes

Applied both, thanks.

Shawn
