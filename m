Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987E23DFDA5
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 11:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236943AbhHDJIp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 05:08:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:52560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236932AbhHDJIo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Aug 2021 05:08:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05E8E60240;
        Wed,  4 Aug 2021 09:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628068111;
        bh=gfAOtMgy1zhnJcHxLDPXlUJEUMs0JUp013YInIpbWsY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=njsCDekBb+xm9B2mbLB/NC9RtbtJXADT85+pXdRF6oPgUa6WEK2JTC35ZSE7cSdxM
         dvn2KOsGbDIubQ5hWY9VhqmPIIoblNvjZ4KKfhsN02z17puLse0x8MB0xmqTghjNH0
         21LjiEeDgPD7wr5BBoIgeGupu4NB3qY1FN9NJUZ0Jawr/sGBXxA77R8lmyuRQs0Lv2
         elAr5EwqLsbzIYRCxmQfvLwN1aJY2u6t6XastxShJsqOlmA/STkdgMQBAh5EKtFiDB
         3R87766lWGVGkQv9disc4B/JNBXhl4AOhrZWPbWiClUwheDNEFe2cmAkSdC0Q219oz
         0RSEcm2+MepWg==
Date:   Wed, 4 Aug 2021 17:08:24 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        festevam@gmail.com, kernel@pengutronix.de, kernel@puri.sm,
        krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        m.felsch@pengutronix.de, mchehab@kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org, slongerbeam@gmail.com
Subject: Re: [PATCH v9 3/3] arm64: dts: imx8mq: add mipi csi phy and csi
 bridge descriptions
Message-ID: <20210804090823.GB30984@dragon>
References: <20210726082117.2423597-1-martin.kepplinger@puri.sm>
 <20210726082117.2423597-4-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726082117.2423597-4-martin.kepplinger@puri.sm>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 26, 2021 at 10:21:17AM +0200, Martin Kepplinger wrote:
> Describe the 2 available CSI interfaces on the i.MX8MQ with the MIPI-CSI2
> receiver (new driver) and the CSI Bridge that provides the user buffers
> (existing driver).
> 
> An image sensor is to be connected to the MIPIs' second port, to be described
> in board files.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>

Applied, thanks!
