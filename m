Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB2843AF8EA
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 01:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbhFUXGZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 19:06:25 -0400
Received: from gloria.sntech.de ([185.11.138.130]:39080 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229940AbhFUXGZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 19:06:25 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lvSxY-0000SO-3P; Tue, 22 Jun 2021 01:04:04 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>, linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alex Bee <knaerzche@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 00/12] Add support for older Rockchip SoCs to V4L2 hantro and rkvdec drivers
Date:   Tue, 22 Jun 2021 01:04:02 +0200
Message-Id: <162431663480.82957.13969853774662992128.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210527154455.358869-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com> <20210527154455.358869-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 27 May 2021 17:44:43 +0200, Alex Bee wrote:
> this series adds support for older Rockchip SoCs (RK3036, RK3066, RK3188
> and RK322x) to the existing V4L2 video decoder/-encoder drivers - namely
> hantro and rkvdec.
> They can be used as-is or with very little modifications.
> 
> In preparation to that patches 1,8 and 9 add power-controller support for
> RK3036 and RK322x, since both drivers rely on pm. The drivers for them
> exist already in the common Rockchip pm driver, they just haven't be added
> to the device trees yet.
> 
> [...]

Applied, thanks!

[10/12] ARM: dts: rockchip: add vpu node for RK3036
        commit: 9d34d4aa896d00d398d799caa839a1494ba7c018
[11/12] ARM: dts: rockchip: add vpu nodes for RK3066 and RK3188
        commit: db3fc8fa0fcfa481cd8087c2ee068d1d1988c3a2
[12/12] ARM: dts: rockchip: add vpu and vdec node for RK322x
        commit: 36e9534dfcb5b09b919d2831d6a19aa3856b95a1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
