Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9287B562AD5
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 07:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233797AbiGAFWc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jul 2022 01:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233788AbiGAFWb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jul 2022 01:22:31 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90BB815708
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 22:22:30 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 3D2AA5C0084;
        Fri,  1 Jul 2022 01:22:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 01 Jul 2022 01:22:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656652948; x=1656739348; bh=xupKOXu9Wy
        6eOhZr6xO1GqLz9Qo5947UOVv/tG8j8XU=; b=blQ0qr/ZHM2tZF4cNVBG+J6MzI
        lF2Rg2dAJRV6DTscyz6Nv2PpE08hIzKodsqCICtSEWF7cocYRL+Ftj1Gy+Q3ke35
        RqLWrkvgZTdKJOLH99+BUgpt9PgEu3h/VWUB3vLdDETL9hd3Qw42QtFT6L1wdSfb
        XlKhgUJme+ZIOi0JuFJnxSDdG1yFnM4ioL1IgclO/sqQhIAtn4gdl2K893w+9JsG
        jM6nFcKNzJcyePBdMOczj6EQu268vr5U/+x7Ge5C4AB4qT4/ypdCdaIXq2C3xkHl
        9NDyY3YBtCsrpai5ixsH7+rFew8Ck0yV3KGM7Tpg4Xn5hPNtOmIzd0W0IhPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656652948; x=1656739348; bh=xupKOXu9Wy6eOhZr6xO1GqLz9Qo5
        947UOVv/tG8j8XU=; b=VGiWtLnAibS4Q/2DMn0DcRZYBedA4xNmLyJnAEQbrbcO
        YxTMuq0ZxsyNoDYMVSoMcchLwf4fvVqsqxZ767xKCQE3pvMaL1Ts1c8Z4aJ1mqZF
        1LIj2dAIoCpbXaEs8AQTQ+DRZNGD6p52T6LFlVtqqMy3UwG8xArOrPLPTW0lwm7B
        IEw07Oisy9gnRPBQLdCHoAgLbOP8XluD8uRO8UjHgBiQRokJ5zjC6TVeZ7OTEFwW
        hy8bg9WOsNegsyjpcTB9tebJYJ9lqdfUNmM1JslpqrWxZpQoNSuidh0rCdEbsZCU
        JlAQNL62ajWJuwB5OVRr7KhIxFjMmAJQVT1gjEVWgg==
X-ME-Sender: <xms:k4S-YrOhOpLgWLQX84H0YHQdtaj7gllOq75a-bPmsOaAKZKvdXBRSQ>
    <xme:k4S-Yl_HN4NB1BIfYeya6pu7F3cUTZTocK_vJULxSluWo805ugWR3KXZrGYU0FwF7
    O_8kOUZQy9W8weWtYA>
X-ME-Received: <xmr:k4S-YqSV0yD4S2SSCmsk-wMC2ab0WLBKI3CQYHneWzIj_J4qidn8hw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:k4S-Yvt6m4LOsN27pF7tH5WJX_9Smyj32iNojB99A76KHXNUWHtJPg>
    <xmx:k4S-YjejWJIBbHQYXO0fgX_t32LYDUarmzC8bMrfzTm8Q50DUDGixw>
    <xmx:k4S-Yr2E-5uje5pntAfUuh97jQgDpvZ2mSm8fIN26LgANequ4s_jlQ>
    <xmx:lIS-YlvnLarwbj6DSWCdY0lGOtE58FZ6o-3WJ_daLlcbo8dF9kV0tw>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 01:22:25 -0400 (EDT)
Date:   Fri, 1 Jul 2022 08:22:22 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, heiko@sntech.de,
        laurent.pinchart@ideasonboard.com,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 43/55] dt-bindings: media: rkisp1: Add port for parallel
 interface
Message-ID: <20220701052222.a7rtl5hivr4oy7bk@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-44-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-44-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15.06.2022 04:11, Paul Elder wrote:
>The rkisp1 can take an input on the parallel interface. Add a port for
>it, and update the required field. At least one port is required, and
>both may be specified.
>
>Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>---
> .../bindings/media/rockchip-isp1.yaml         | 23 +++++++++++++++++--
> 1 file changed, 21 insertions(+), 2 deletions(-)
>
>diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
>index d1489b177331..b3661d7d4357 100644
>--- a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
>+++ b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
>@@ -84,8 +84,27 @@ properties:
>                 minItems: 1
>                 maxItems: 4
>
>-    required:
>-      - port@0
>+      port@1:
>+        $ref: /schemas/graph.yaml#/$defs/port-base
>+        unevaluatedProperties: false
>+        description: connection point for input on the parallel interface
>+
>+        properties:
>+          bus-type:
>+            enum: [5, 6]
>+
>+          endpoint:
>+            $ref: video-interfaces.yaml#
>+            unevaluatedProperties: false
>+
>+        required:
>+          - bus-type
>+
>+    anyOf:
>+      - required:
>+          - port@0
>+      - required:
>+          - port@1
>
> required:
>   - compatible

Could be nice to add an example

thanks,
Dafna

>-- 
>2.30.2
>
