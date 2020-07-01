Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA5EC210B0D
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 14:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730484AbgGAMbO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 08:31:14 -0400
Received: from gloria.sntech.de ([185.11.138.130]:53212 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730199AbgGAMbO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jul 2020 08:31:14 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1jqbtK-0006Ul-8a; Wed, 01 Jul 2020 14:31:06 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     linux-rockchip@lists.infradead.org,
        Helen Koike <helen.koike@collabora.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc:     Heiko Stuebner <heiko@sntech.de>, jbx6244@gmail.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        hverkuil-cisco@xs4all.nl, mark.rutland@arm.com,
        devel@driverdev.osuosl.org, ezequiel@collabora.com, kishon@ti.com,
        kernel@collabora.com, karthik.poduval@gmail.com,
        dafna.hirschfeld@collabora.com
Subject: Re: [PATCH v2 0/9] move Rockchip ISP bindings out of staging / add ISP DT nodes for RK3399
Date:   Wed,  1 Jul 2020 14:31:04 +0200
Message-Id: <159360661051.89349.4172793847996909407.b4-ty@sntech.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200403161538.1375908-1-helen.koike@collabora.com>
References: <20200403161538.1375908-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 3 Apr 2020 13:15:29 -0300, Helen Koike wrote:
> Move the bindings out of drivers/staging and place them in
> Documentation/devicetree/bindings instead.
> 
> Also, add DT nodes for RK3399 and verify with make ARCH=arm64 dtbs_check
> and make ARCH=arm64 dt_binding_check.
> 
> Tested by verifying images streamed from RockPi 4 board with imx219
> module.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: add rx0 mipi-phy for rk3399
      commit: e4bfde13e323f9ee5f2f38aa5cac0676dd656f8e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
