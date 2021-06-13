Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA5D3A5997
	for <lists+linux-media@lfdr.de>; Sun, 13 Jun 2021 18:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbhFMQ3c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Jun 2021 12:29:32 -0400
Received: from gloria.sntech.de ([185.11.138.130]:58844 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231932AbhFMQ3b (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Jun 2021 12:29:31 -0400
Received: from p508fc96c.dip0.t-ipconnect.de ([80.143.201.108] helo=phil.fritz.box)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lsSxK-0005DC-3b; Sun, 13 Jun 2021 18:27:26 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Alex Bee <knaerzche@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-rockchip@lists.infradead.org,
        Lee Jones <lee.jones@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 00/12] Add support for older Rockchip SoCs to V4L2 hantro and rkvdec drivers
Date:   Sun, 13 Jun 2021 18:27:21 +0200
Message-Id: <162360159829.3586115.11354348703050146117.b4-ty@sntech.de>
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

Removed some unnecessary added empty lines and

Applied, thanks!

[08/12] ARM: dts: rockchip: add power controller for RK3036
        commit: 1a4eb37f3174d3a54e40392abcfbb9b3949948bb
[09/12] ARM: dts: rockchip: add power controller for RK322x
        commit: 623ba75a5d6b8e196a21f3ed36d26a5f6db459ce

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
