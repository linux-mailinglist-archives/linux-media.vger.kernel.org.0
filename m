Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67D7931D64C
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 09:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231929AbhBQIJQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 03:09:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:41740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231927AbhBQII6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 03:08:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 39B3A64DE9;
        Wed, 17 Feb 2021 08:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613549296;
        bh=C4GYwI6WcsErZN4W/obxdKpSWHSbu9N/1Dj7xZ1Mc4I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oPCAO0OtyIr1s5vZYDHw7kkZRjTB5PHP1tI1eYaC4Swu8rVvyuJM3AWH/1StSL6UU
         dlPbFzmiKuO/Z3E5z7kDgwDz/ewRFB2+zvPNVh4spnmXL1LTMz6pegEq+vH0pZqrU7
         bpypK3ANhJ0jqFTA+xrRRpytHngITnyNLbHYuL/U=
Date:   Wed, 17 Feb 2021 09:08:13 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, krzk@kernel.org, shengjiu.wang@nxp.com,
        adrian.ratiu@collabora.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        Anson.Huang@nxp.com, hverkuil-cisco@xs4all.nl,
        devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v1 00/18] Add HANTRO G2/HEVC decoder support for IMX8MQ
Message-ID: <YCzO7SRmBKzGeMUS@kroah.com>
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 17, 2021 at 09:02:48AM +0100, Benjamin Gaignard wrote:
> The IMX8MQ got two VPUs but until now only G1 has been enabled.
> This series aim to add the second VPU (aka G2) and provide basic 
> HEVC decoding support.

Why are you adding this directly to drivers/staging/media/ and not
drivers/media/?  Why can't this just go to the main location and not
live in staging?

thanks,

greg k-h
