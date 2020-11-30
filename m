Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D342C8983
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 17:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728866AbgK3Q3V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 11:29:21 -0500
Received: from gloria.sntech.de ([185.11.138.130]:45408 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728863AbgK3Q3U (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 11:29:20 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kjm2R-0003Mu-Bk; Mon, 30 Nov 2020 17:28:31 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     linux-media@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
        dafna.hirschfeld@collabora.com, devicetree@vger.kernel.org,
        karthik.poduval@gmail.com, zhengsq@rock-chips.com,
        linux-kernel@vger.kernel.org, robin.murphy@arm.com,
        linux-rockchip@lists.infradead.org, hverkuil-cisco@xs4all.nl,
        mark.rutland@arm.com, jbx6244@gmail.com,
        devel@driverdev.osuosl.org, eddie.cai.linux@gmail.com,
        robh+dt@kernel.org
Subject: Re: (subset) [PATCH v6 0/9] move Rockchip ISP bindings out of staging / add ISP DT nodes for RK3399
Date:   Mon, 30 Nov 2020 17:28:29 +0100
Message-Id: <160675369960.1150759.2276623622378204083.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201020193850.1460644-1-helen.koike@collabora.com>
References: <20201020193850.1460644-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 20 Oct 2020 16:38:41 -0300, Helen Koike wrote:
> Move the bindings out of drivers/staging and place them in
> Documentation/devicetree/bindings instead.
> 
> Also, add DT nodes for RK3399 and verify with make ARCH=arm64 dtbs_check
> and make ARCH=arm64 dt_binding_check.
> 
> Tested by verifying images streamed from Scarlet Chromebook
> 
> [...]

Applied, thanks!

[8/9] arm64: dts: rockchip: add isp0 node for rk3399
      commit: 97a0115cd96a173369ef30eee2290184921b3f24
[9/9] arm64: dts: rockchip: add isp and sensors for Scarlet
      commit: ef098edc9c245dd1c150001e22c78e6a3ffd7ff8

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
