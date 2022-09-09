Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 837715B42EA
	for <lists+linux-media@lfdr.de>; Sat, 10 Sep 2022 01:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbiIIXMw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 19:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbiIIXMg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 19:12:36 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C65135D4D
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 16:11:56 -0700 (PDT)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1oWn9K-0000Qa-Qe; Sat, 10 Sep 2022 01:11:02 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     linux-media@vger.kernel.org, Linux-rockchip@lists.infradead.org,
        Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>
Subject: Re: (subset) [PATCH v2 1/3] media: hantro: Add support for Hantro G1 on RK356x
Date:   Sat, 10 Sep 2022 01:10:58 +0200
Message-Id: <166276502654.27767.16487805522519550521.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214212955.1178947-1-piotr.oniszczuk@gmail.com>
References: <20220214212955.1178947-1-piotr.oniszczuk@gmail.com>
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

On Mon, 14 Feb 2022 22:29:53 +0100, Piotr Oniszczuk wrote:
> RK356x has Hantro G1 video decoder capable to decode MPEG2/H.264/VP8
> video formats.
> 
> This patch adds support for RK356x family in existing Hantro
> video decoder kernel driver.
> 
> Tested on [1] with FFmpeg v4l2_request code taken from [2]
> with MPEG2, H.642 and VP8 samples with results [3].
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: rockchip: Add VPU support for RK3568/RK3566
      commit: 944be6fba401639e5bf2a8bc9f5e781e6cc4b4d4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
