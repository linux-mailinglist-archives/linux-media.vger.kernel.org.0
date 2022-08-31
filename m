Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F365B5A7B16
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 12:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbiHaKLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 06:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbiHaKLk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 06:11:40 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9EEDCBD0B6;
        Wed, 31 Aug 2022 03:11:33 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,277,1654527600"; 
   d="scan'208";a="131214358"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 31 Aug 2022 19:11:32 +0900
Received: from localhost.localdomain (unknown [10.226.92.122])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 27D57400296B;
        Wed, 31 Aug 2022 19:11:27 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/3] Enable {fcpvd,vspd} on RZ/G2L SoC
Date:   Wed, 31 Aug 2022 11:11:24 +0100
Message-Id: <20220831101124.1731471-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series aims to enable {fcpvd,vspd} on RZ/G2L SoC.

patch[3] depend upon [1] and [2].
    [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20220831&id=17b5179ef6cd6430945c1da4174ceaf43c93cf1e
    [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20220831&id=882bda188f691320a001c6adc738c4a7ec102a8d

Biju Das (3):
  media: dt-bindings: media: renesas,fcp: Update maxItems for the clock
    property
  arm64: dts: renesas: r9a07g044: Add fcpvd node
  arm64: dts: renesas: r9a07g044: Add vspd node

 .../bindings/media/renesas,fcp.yaml           |  3 ++-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 23 +++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

-- 
2.25.1

