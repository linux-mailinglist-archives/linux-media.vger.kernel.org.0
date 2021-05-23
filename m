Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17E3D38D83D
	for <lists+linux-media@lfdr.de>; Sun, 23 May 2021 04:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbhEWCWo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 May 2021 22:22:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:51892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231540AbhEWCWn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 May 2021 22:22:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D062661168;
        Sun, 23 May 2021 02:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621736477;
        bh=5SW/V2SnMAULmQy3X1DKK/jkScWHpb5YbZFTa/iHkbs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LuCMGAfRSW0+XmU17F2/e1GspBcbNH1fkrmRArbnaPzlLHFaP4L0K7ZUaH9KEzCO7
         lWT+UoFfJA3/5eW1E88owHy41fy+h2QxuxDTNwkZZlbp3wtLEGvt2j2n8DV+6uaKa4
         LwhWQPKXbb/1V9I22txEZBiWiP8WoDiaTPpS64ZVg7vS0tvDMOXevrVCgtM6y2uTim
         +1/rd+N8DfwquyyJbDm9YWuMw3y6tJ2XPJe/5pGwr/YkKRkvYm0BqC3K65HMvEOW3r
         uUnLEd+AMldvLbuEZbqPrmSk1+DIfFFa6Va2L/jKZqrIVNSqxdOlQZ1QHz054L+rvN
         TJOAdwcTruuKQ==
Date:   Sun, 23 May 2021 10:21:10 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     dillon.minfei@gmail.com
Cc:     festevam@gmail.com, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net, s.hauer@pengutronix.de,
        kernel@pengutronix.de, prabhakar.csengg@gmail.com,
        mchehab@kernel.org, mchehab+huawei@kernel.org,
        krzysztof.kozlowski@canonical.com, krzk@kernel.org,
        robh+dt@kernel.org, linux@rempel-privat.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: arm: imx: Add i.mx6q DaSheng COM-9XX
 SBC
Message-ID: <20210523022110.GI8194@dragon>
References: <1620104993-5850-1-git-send-email-dillon.minfei@gmail.com>
 <1620104993-5850-3-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620104993-5850-3-git-send-email-dillon.minfei@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 04, 2021 at 01:09:51PM +0800, dillon.minfei@gmail.com wrote:
> From: Dillon Min <dillon.minfei@gmail.com>
> 
> The DaSheng Com-9xx is and ARM based signle board computer (SBC)
> featuring:
> - i.MX6Q
> - 2GiB LPDDR3 DRAM
> - 8GiB eMMC 5.0 FLASH
> - 4MiB SPI Flash
> - USB 2.0 Host/Device
> - Multiple multi-protocol RS232/RS485 Serial ports
> - microSD socket
> - 5V DC power input
> - HDMI1.4a,1080p@60
> - RGMIIx1 Gigabit Ethernet
> - CSI0x1, connect with ov2659
> 
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied, thanks.
