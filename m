Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBB4701B57
	for <lists+linux-media@lfdr.de>; Sun, 14 May 2023 05:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbjENDN2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 23:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjENDN0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 23:13:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7E42688;
        Sat, 13 May 2023 20:13:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A0E4A60025;
        Sun, 14 May 2023 03:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03535C433EF;
        Sun, 14 May 2023 03:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684034005;
        bh=T4Z1Mucagli9Vdn/lgmYd5gAynEurH9HjV85hUxN/tg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=onH2WPW954YdBWX0lkRjwjkPsZrCfoFeC51VZufTzYvooX1aIXMrut9qCMEym+Er9
         Uq1SmxweNJtHAfspmLwHZ6CJ5x744HUB8R/b5+NaMz60cAC9S7ckX5eDtW0atSHQEY
         gfV0A3hmnZyBHivnZifdVUv8V64ho9lzA3NRn9seGrMeoNVHB3HUWk3JM6D2Mw2lxI
         DgCg2eCbFnovnBGPYyIcWWiOneL/f/nXe4i7PkTElBfE/UKX9lPAy1Es83H2GfYoIZ
         bIpgAxHgYm6acc2U2BP6UJLq9+jyq8l2gtwZF2pG9a2HDc/Sb32ajer6isilO3lcd8
         mRsrvs0SyiPbg==
Date:   Sun, 14 May 2023 11:13:14 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: Re: [PATCH v2 0/2]  arm64: dts: imx8mp: Enable CSIS and ISI in DT
Message-ID: <20230514031314.GM727834@dragon>
References: <20230418153104.21337-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418153104.21337-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 18, 2023 at 06:31:02PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This small patch series adds the CSIS and ISI devices in the i.MX8MP DT
> to support cameras. The ISI DT bindings have just been merged and will
> appear in v6.4, making this series a candidate for v6.5.
> 
> With these two patches, a board overlay can enable camera support by
> instantiating the camera sensor, connecting it to a CSIS instance, and
> enabling the CSIS and ISI nodes. The camera pipeline is supported by
> V4L2 drivers.
> 
> Laurent Pinchart (2):
>   arm64: dts: imx8mp: Add CSIS DT nodes
>   arm64: dts: imx8mp: Add ISI DT node

Applied both, thanks!
