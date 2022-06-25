Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB8D55A70E
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 06:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiFYE2j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jun 2022 00:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiFYE2i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jun 2022 00:28:38 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 748824DF68
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 21:28:38 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 339903200921;
        Sat, 25 Jun 2022 00:28:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 25 Jun 2022 00:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656131316; x=1656217716; bh=hvxEUS58aQ
        Bvi7at1sMVHl1T8q5rv+ulpWwzOT/w/RQ=; b=peRG6hFhbsT+haDqboR0CW8TTV
        46NWJrSSNBzrAoSDtHSoLiucO+koEg/Sj7kprPOfteVIhpgVmgVlfwZm9dmQLkoJ
        njWRckBODcYlGVIfSOts9A32fX+LQsKuLdLElJFgfEXXrqXvp3pj3jI4HTFA9isG
        LqeCZaYd57gwealZGFzdeRFhEuAuIhwxVUnqhGtkhjwBmvcaw697g6TpGqs4FMEd
        GkrGgSADo4KL02fwkgZGH7fqPC+IP/XgwHdrPx0g9l6bDDIOVBKLmrbD67QveHhq
        5Jsp/F/O3hbnsgv81ebjH9pjRN2iKhLihJBREkJiaVWGJnT9+hFUt6Lat51w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656131316; x=1656217716; bh=hvxEUS58aQBvi7at1sMVHl1T8q5r
        v+ulpWwzOT/w/RQ=; b=I+/yjxIq1DcDlFVhUvCNVxzb2pX5tgirCqejVya41vTT
        MNkTt9FD+QQ2TbxOojXOKo7G7DOLqB8f17/Ip6PTcbobpy3Pcr2hf3R47DwoS+/G
        wXGanoka1uJ/fMPBBTltotjIGtGmK7Ilu6UMVRQEmPpXSUaR26nFCr0/DOiSIKEe
        3z92J4kOxFEAJ4o6aL2xFMw9ElxCb9QfUYDPpWVMLMbTeFAWghkBflA+evu5/Ir2
        0keXTOnLCpsy4bF0w8g6lWvcvqmCMTGIMUVc7tWNPWuy16vNdbbOOcZ0Ex4b1Oje
        5ptDStVyH5RWpeZqHmWiXoAyGdXVDX4rD/bHitAHew==
X-ME-Sender: <xms:9I62Yqd3CIaf1N-27f-bLzURDROB0NR79MR0S2ImGl2f1RP4NgU81w>
    <xme:9I62YkMYBRW3CpUR9r-JfwV99WMMK7ktvCNrCHy3CufDaJYoTXN-A5wUMFodVVlNM
    otFFjA9optN6qEjw9I>
X-ME-Received: <xmr:9I62YrjeG_Zymdn_dDj2hG4MtW246eWkB3rhyT2BMVjAwJyQBISHFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegtddgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:9I62Yn-QevoQQrTE5LAM1Xi_gZ0CspD0H7pB4yqlFQnVqOL3OsRD7A>
    <xmx:9I62YmtkWVc9ezTbnAiZ9NpYxuPkasanz_M_58GuxRwloHNZa-MTPg>
    <xmx:9I62YuF_0l6Ae6R42t1PQo28NzATKhbG2wVjMNoFAbSBclr9J1-CBw>
    <xmx:9I62Yj85QXECJ1wKMVAEHudI4aNsI_z_TPbJStJeCJgDHHuJlTHmZQ>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jun 2022 00:28:33 -0400 (EDT)
Date:   Sat, 25 Jun 2022 07:28:30 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 23/55] media: rkisp1: csi: Pass sensor pointer to
 rkisp1_csi_config()
Message-ID: <20220625042830.rk5kjzguiepwwph6@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-24-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-24-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15.06.2022 04:10, Paul Elder wrote:
>From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>To prepare for the removal of the active_sensor field from the
>rkisp1_device structure, pass the sensor pointer to the
>rkisp1_csi_config() function instead of accessing it through
>active_sensor.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>index fcaffffd371b..925274b9a3c4 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>@@ -19,11 +19,12 @@
> #include "rkisp1-common.h"
> #include "rkisp1-csi.h"
>
>-static int rkisp1_csi_config(struct rkisp1_csi *csi)
>+static int rkisp1_csi_config(struct rkisp1_csi *csi,
>+			     struct rkisp1_sensor_async *sensor)
> {
> 	struct rkisp1_device *rkisp1 = csi->rkisp1;
> 	const struct rkisp1_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
>-	unsigned int lanes = rkisp1->active_sensor->lanes;
>+	unsigned int lanes = sensor->lanes;
> 	u32 mipi_ctrl;
>
> 	if (lanes < 1 || lanes > 4)
>@@ -102,7 +103,7 @@ int rkisp1_csi_start(struct rkisp1_csi *csi,
> 	s64 pixel_clock;
> 	int ret;
>
>-	ret = rkisp1_csi_config(csi);
>+	ret = rkisp1_csi_config(csi, sensor);
> 	if (ret)
> 		return ret;
>
>-- 
>2.30.2
>
