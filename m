Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 079DE3DFE08
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 11:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236618AbhHDJbq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 05:31:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:37310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236599AbhHDJbp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Aug 2021 05:31:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67DB160EE5;
        Wed,  4 Aug 2021 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628069493;
        bh=ImLzJp0qR5RMF7abGLu47/n5IMgym2fH1/INNOJqCi8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T3X/NizRn7ThzigqHIDeWs0mNKHeDqCSxqOG2Jgkr0k0mnip/T8k1oSpX0EWaAZsB
         K/0lKlpEUtjnJz7JtoluIe66606niUiF1cLjojTkE1VA8R4ak9J6USlIhR2b5PMELV
         pRpPystji0zsOfFZxZBira/+8JwHm5oFeFCMUzMnY6X+rOFXctnJ0tJjyr3bg+zsAe
         hSFALn8zCN+eNGH+mARdhJUZL3MEW1UY6UUZg21zfkERnGvL7Jw7/zxbSLX0AIkK/M
         VxcsFLCB+ZQj1oygMtG6YugCjEXAgx1RhYiWhKPHpHSNSQB3oCez+9n91P56WapS3t
         PuSH4/+hDZgZQ==
Date:   Wed, 4 Aug 2021 17:31:26 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Martin Kepplinger <martin.kepplinger@puri.sm>,
        dafna.hirschfeld@collabora.com, devicetree@vger.kernel.org,
        festevam@gmail.com, kernel@pengutronix.de, kernel@puri.sm,
        krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        m.felsch@pengutronix.de, mchehab@kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org,
        slongerbeam@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v10 0/3] media: imx: add support for imx8mq MIPI RX
Message-ID: <20210804093125.GE30984@dragon>
References: <20210728091245.231043-1-martin.kepplinger@puri.sm>
 <YQFcfbrTmGw4kZvQ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQFcfbrTmGw4kZvQ@pendragon.ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 28, 2021 at 04:32:45PM +0300, Laurent Pinchart wrote:
> Hi Martin,
> 
> On Wed, Jul 28, 2021 at 11:12:42AM +0200, Martin Kepplinger wrote:
> > hi,
> > 
> > This patch series adds a driver for the i.MX8MQ CSI MIPI receiver / controller.
> > 
> > It includes the driver, the dt-bindings and the DT addition to the SoC dtsi.
> > I test it using libcamera. Thanks to Laurent who helped a lot. I'm happy for
> > any feedback,
> 
> Thank you for the series. I've submitted a pull request that contains
> patches 1/3 and 2/3.
> 
> Shawn, Sascha, how would you like to handle 3/3 ?

I picked up the 3/3 in v9, which I think is identical to this version.
Otherwise, please let me know.

Shawn
