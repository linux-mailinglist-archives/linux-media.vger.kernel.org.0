Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF5B55B42EB
	for <lists+linux-media@lfdr.de>; Sat, 10 Sep 2022 01:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232237AbiIIXNL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 19:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231829AbiIIXMm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 19:12:42 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F441177A9;
        Fri,  9 Sep 2022 16:11:56 -0700 (PDT)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1oWn9J-0000Qa-J3; Sat, 10 Sep 2022 01:11:01 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Rob Herring <robh+dt@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Liang Chen <cl@rock-chips.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Peter Geis <pgwipeout@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Riesch <michael.riesch@wolfvision.net>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v5 0/3] Enable JPEG Encoder on RK3566/RK3568
Date:   Sat, 10 Sep 2022 01:10:55 +0200
Message-Id: <166276502653.27767.15225721064649466544.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220612155346.16288-1-frattaroli.nicolas@gmail.com>
References: <20220612155346.16288-1-frattaroli.nicolas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 12 Jun 2022 17:53:43 +0200, Nicolas Frattaroli wrote:
> this is v5 of my RK356x JPEG encoder patch set. It enables the Hantro
> hardware encoder of the RK3566 and RK3568 line of SoCs, with JPEG being
> the only format the driver currently supports encoding for.
> 
> The first patch adds a new binding, the rockchip,rk3568-vepu binding, to
> describe this kind of hardware. The reason for going with a new binding
> instead of modifying the vpu binding as the previous versions did is
> that the vpu binding is getting quite long, and Ezequiel Garcia suggested
> (on IRC) that we could document encoder only instances in their own
> binding. This makes sense to me, especially considering that RK3588 will
> have more Hantro instances like this to document.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: rockchip: Add Hantro encoder node to rk356x
      commit: 03d86fb5a56919ccf47e1cc5861bb5452017ab93

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
