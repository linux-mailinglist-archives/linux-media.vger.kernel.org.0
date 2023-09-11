Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8CD779BA44
	for <lists+linux-media@lfdr.de>; Tue, 12 Sep 2023 02:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234790AbjIKUsu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Sep 2023 16:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236366AbjIKKaK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Sep 2023 06:30:10 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35902CD2;
        Mon, 11 Sep 2023 03:30:05 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 087A11007F4; Mon, 11 Sep 2023 11:30:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1694428202; bh=C5p79trdszxhTp7l4miBmtFH2djt9s/BNEVz7vucdGo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XTUf/QEnG6qzsYG5+vFdadVDn4/IwdyuBe0bT6RTlMeBz1YjK/Vo/IScYcisbTRsx
         WnHxZ4UA60YcdOpPARgb6E2ZhavbJneG2YRJyO7F0ASqWwnFyMh19qsJHnD5TYkhDl
         ImVF5H0idaeG3tf8LZXpE+hGfBr+fncAHGK+pu3+PS8kW/nGmEVU6J0urBoBt1fo8E
         4MK87aZLh4BQppOL/zjC/s7cJovk2Jz1yF9dV4nBTCT6P5IiwRkLjNVdxWq9h7GDjl
         tuN4Eu0K5mdnhMKnIyuDiE2g2pQUAmoVc0khKS3TFQK1FHO2pWU8oq+OkvUed2G2ED
         Sdm0dV3w5xarA==
Date:   Mon, 11 Sep 2023 11:30:01 +0100
From:   Sean Young <sean@mess.org>
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        zelong dong <zelong.dong@amlogic.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
Subject: Re: (subset) [PATCH 0/3] This patchset adds IR controller driver
 support for
Message-ID: <ZP7sKdvAWQQSrTmX@gofer.mess.org>
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <169442559302.3235506.15361466537260729684.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169442559302.3235506.15361466537260729684.b4-ty@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 11, 2023 at 11:46:33AM +0200, Neil Armstrong wrote:
> On Fri, 25 Aug 2023 19:53:07 +0800, zelong dong wrote:
> > From: Zelong Dong <zelong.dong@amlogic.com>
> > 
> > Meson IR Controller supports hardware decoder in Meson-S4 and later
> > SoC. So far, protocol NEC could be decoded by hardware decoder.
> > 
> > Zelong Dong (3):
> >   media: rc: meson-ir: support rc driver type RC_DRIVER_SCANCODE
> >   dt-bindings: media: Add compatible for Meson-S4 IR Controller
> >   arm64: dts: meson: add IR controller for Meson-S4 SoC
> > 
> > [...]
> 
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)
> 
> [3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
>       https://git.kernel.org/amlogic/c/dc8bc779feb5e855421215384f23de90a4fcd622

Would make more sense to have all three patches go in together through a single
tree? I was about to apply all three of these patches to the media_stage
tree.


Sean
