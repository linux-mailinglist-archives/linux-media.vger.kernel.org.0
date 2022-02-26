Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D948C4C55AD
	for <lists+linux-media@lfdr.de>; Sat, 26 Feb 2022 12:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbiBZLgn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Feb 2022 06:36:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiBZLgm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Feb 2022 06:36:42 -0500
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684771EDA00
        for <linux-media@vger.kernel.org>; Sat, 26 Feb 2022 03:36:07 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 7E6F85C0194;
        Sat, 26 Feb 2022 06:36:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 26 Feb 2022 06:36:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:date:date:from:from:in-reply-to:message-id:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=ohZb+aX0XGcuJ9Rni8OCAsvvRBTcZp
        dmMTxXQqisB5E=; b=cB4xNfsbysQ1XsBhc1K/AOfK/Jw0s5CzzPWX9Nd/GaaVNP
        W/qTqdBVLpFBvbghnsvWgAjWE24Xe33WQANc4y5YeHyA3ql3aF4vHbGkiV2UMeue
        fPEya1e7h86nwXcSdzg+YvrJ/m9Mj0R0d7KWIHg3ycbungY3xwIz+JiBw611yPbh
        iezA3PN4L6zJ7CkQaZ/O2RWYqXHRxtHl2rZwgjqo6mAi4JuSjloR3QbkPLevvwFk
        7Ci/21c800u32nYMQ5KHHlVFB+SZ/MSkfJqCWCTgkfcJ5JYnn9FCK/R4mYPsWpSY
        zQgwftHpdicdQIcCdFm6eoR4AHjjYujBEakBolHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:date:date:from:from:in-reply-to
        :message-id:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ohZb+a
        X0XGcuJ9Rni8OCAsvvRBTcZpdmMTxXQqisB5E=; b=Mi9qa/cI5QRlUo2TWLLCkI
        5wpV85ZdEK8wcjMwdu7SAo0gWrZi5eBHr2SVpg2OVEgBkxUd/KDoiLW3sq3LVwkj
        hg3YdwFfhfxXA1JZtl0ABekmNbMp+erFdtn71ILodNo7Izbr8NvfPGmexk38Zgn0
        UssZBoGTH6BcAz20dsCDGKpMRoKu601p/s6BMwE0VPXqZF0zYGSrY/XkFn+GXOFk
        X/2JIeii77Ko3YGS7DmY1sB2OFxLvnKUPN8zDzs29TZmJ31BXZ8m6TK7fYNYWrru
        /JzQMJGKzm8+9qNOaAUlsbIm2mQLLii6ULgMPiXZKn/ojsDkknFoJ7ZfUSbpdZSg
        ==
X-ME-Sender: <xms:oRAaYvJaB1MNnRT4_c1908sMotrrHO7QZCyz9T7aG42MtXEUkL1fQg>
    <xme:oRAaYjJB5fDMtPGVgqN7Yega-Gw3MkMvg487CbpKZj6vdyCIrHE69mBMjajjsUmlc
    Pl38aZGiOQywkjwdpM>
X-ME-Received: <xmr:oRAaYnsGqPeqmNjtFm7Ks85EnVx0n1a-ISCKvzvTW380jOJyiKRuUElVr0bctm2xFyHrkeDAJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeigddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffosedttdertdertddtne
    cuhfhrohhmpeffrghfnhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhm
    rghilhdrtghomheqnecuggftrfgrthhtvghrnhepgedvkedvueeikeehgeekffeifeeuff
    ekffelhfeljeejheekieegheeujedvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:oRAaYoawpFAbb6wfk5jf4Q6p4MbkKcfMj288XxldCPThbsMxIqW8mA>
    <xmx:oRAaYmZRg3h5bXjFtK_LjrUzCjN4zRYnGG3S8WQKmNAzJvqY8L9Ljw>
    <xmx:oRAaYsDo-UmhEGzFtzDhB_EZLgCX1e-OvKvPk0ZxsKdnZRlT4vXJmg>
    <xmx:ohAaYtwa2iVc6iozh7nTjUTR38KtifOlIdHeW9T9LcZE_GVyvqHBGQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Feb 2022 06:36:00 -0500 (EST)
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        tfiga@chromium.org, dafna@fastmail.com, helen.fornazier@gmail.com,
        kernel@collabora.com
Subject: [PATCH] media: MAINTAINERS: update rksip1 maintainers info
Date:   Sat, 26 Feb 2022 13:35:38 +0200
Message-Id: <20220226113538.13105-1-dafna@fastmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Due to changes in maintainers info/position

Signed-off-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 83d27b57016f..2d6682e6d86c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16621,8 +16621,7 @@ F:	Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
 F:	sound/soc/rockchip/rockchip_i2s_tdm.*
 
 ROCKCHIP ISP V1 DRIVER
-M:	Helen Koike <helen.koike@collabora.com>
-M:	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
+M:	Dafna Hirschfeld <dafna@fastmail.com>
 L:	linux-media@vger.kernel.org
 L:	linux-rockchip@lists.infradead.org
 S:	Maintained
-- 
2.17.1

