Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBA5559C64
	for <lists+linux-media@lfdr.de>; Fri, 24 Jun 2022 16:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232695AbiFXOgs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 10:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232749AbiFXOfv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 10:35:51 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2E860C5B
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 07:35:30 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id E40A9320091C;
        Fri, 24 Jun 2022 10:35:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 24 Jun 2022 10:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656081328; x=1656167728; bh=tcz65/MMAx
        i7w9JzUonZxPihwwNmyYf4cTMwzAEWYCE=; b=ERH3oWXAiGPnExA0xUWuJKq6T/
        5P56u27EzfcpPTTlXDIyqLiK0aH0I6PSFlN6mGwS6O4mTx/jyw6QvdQyFmVNeWhW
        ySmjs/qokdINLDKuxoWjH+PU2a2ZMHph1HQmtIK/QbSGBNi3KP/yDdtEnAqsEYF3
        +IZCYZobI0WLxzZOyYYNuhJ3Munyx2rY3rCMnoIlchu70+7ksPHUaBmYYzzYJzJe
        mMNcwCV2qGvU6AC0nJTkJ/l+LSAXyk/UglVYS0cdWuPgioJANZedDS+qtv7dtKih
        RZJIqiuk81NeUI9jcwg1DKfiSOLaRvgqb05FONS08/DmWD51dVBcQCzeRgBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656081328; x=1656167728; bh=tcz65/MMAxi7w9JzUonZxPihwwNm
        yYf4cTMwzAEWYCE=; b=RYEs/tAWjgiEd5wQuyson6peoCmm9MGQYvlvEa2zLwsz
        brD5mf/5j3ex2tu25wNC5kBG0obqXOt0jQfqikzOdQglStAEM5R9mZQ5IvzAsxAo
        Kp65QN+pUS6JFnfi958SVGwzqtd5lnQG0EN+PNCWncTsRqKUOnGcpcCW9CiCpvVj
        yYayAwobJt6En0gqSbkAiRR/JneEEPJsjwFyNM3TdLwxCDLVjcsEn16ehOWrs5Uj
        vkfZe6lJR6oE2OnVgYs2/ocb3vvnfTGJEwdguKA9F3wK/LOGBZ0Lq5Bz1Y76KmPX
        zmip0QH4VyufIGFcXuHFyeRER4O3mpNPyiH6+D7Qsw==
X-ME-Sender: <xms:sMu1YjTNiOMGiWjrETg56SiNv5xgq7mOelEkK-jii08CcgCNQIQKVg>
    <xme:sMu1YkwzglWaPKpvUgHHnfDK6qHq8kFgIg5Cw9w8F5lzgSQqix6xg_qkskhVAlcDe
    DmVDYqd0GdoU9-howk>
X-ME-Received: <xmr:sMu1Yo139ouQSpAdcpx7PQF96_PSJhKIBWVeuPt-q--UCf0Kackxqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefledgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:sMu1YjABOchUUO68Y1WdCHiTX4MyTByE-DAICZfLCzijkELglK-z_g>
    <xmx:sMu1Yshl2mvr9xCBB-y_6JadxxNZPa5KdE2k-JVUVj7ukG8SDLLEXw>
    <xmx:sMu1YnqitehkI9tXpXOHMo8nCLI5BYl59pAOn2-PsR8PWNC6MNLtDw>
    <xmx:sMu1YogoT2uItS5sjz60rFcj0hwVgYgSNAthBdyQn_M-_bc517kWSA>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jun 2022 10:35:25 -0400 (EDT)
Date:   Fri, 24 Jun 2022 17:35:22 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 08/55] media: rkisp1: Access ISP version from info pointer
Message-ID: <20220624143522.ap2wfg52j5jf5dg4@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-9-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-9-paul.elder@ideasonboard.com>
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
>The ISP version is stored in the media_device hw_revision field and
>access from there in the driver. Now that we store a pointer to the
>match data in the rkisp1_device structure, access the ISP version from
>there to make the code clearer and avoid depending on the media_device.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c    | 4 ++--
> drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 2 +-
> drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c  | 2 +-
> 3 files changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index 02968656f3c0..328e8fec14e9 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -417,7 +417,7 @@ static int rkisp1_config_mipi(struct rkisp1_device *rkisp1)
> 	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_CTRL, mipi_ctrl);
>
> 	/* V12 could also use a newer csi2-host, but we don't want that yet */
>-	if (rkisp1->media_dev.hw_revision == RKISP1_V12)
>+	if (rkisp1->info->isp_ver == RKISP1_V12)
> 		rkisp1_write(rkisp1, RKISP1_CIF_ISP_CSI0_CTRL0, 0);
>
> 	/* Configure Data Type and Virtual Channel */
>@@ -535,7 +535,7 @@ static void rkisp1_config_clk(struct rkisp1_device *rkisp1)
> 	rkisp1_write(rkisp1, RKISP1_CIF_VI_ICCL, val);
>
> 	/* ensure sp and mp can run at the same time in V12 */
>-	if (rkisp1->media_dev.hw_revision == RKISP1_V12) {
>+	if (rkisp1->info->isp_ver == RKISP1_V12) {
> 		val = RKISP1_CIF_CLK_CTRL_MI_Y12 | RKISP1_CIF_CLK_CTRL_MI_SP |
> 		      RKISP1_CIF_CLK_CTRL_MI_RAW0 | RKISP1_CIF_CLK_CTRL_MI_RAW1 |
> 		      RKISP1_CIF_CLK_CTRL_MI_READ | RKISP1_CIF_CLK_CTRL_MI_RAWRD |
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>index c88a9c0fa86e..9da7dc1bc690 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>@@ -1801,7 +1801,7 @@ static void rkisp1_init_params(struct rkisp1_params *params)
> 	params->vdev_fmt.fmt.meta.buffersize =
> 		sizeof(struct rkisp1_params_cfg);
>
>-	if (params->rkisp1->media_dev.hw_revision == RKISP1_V12)
>+	if (params->rkisp1->info->isp_ver == RKISP1_V12)
> 		params->ops = &rkisp1_v12_params_ops;
> 	else
> 		params->ops = &rkisp1_v10_params_ops;
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
>index b7ae9166c52f..7d82356b5345 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
>@@ -427,7 +427,7 @@ static void rkisp1_init_stats(struct rkisp1_stats *stats)
> 	stats->vdev_fmt.fmt.meta.buffersize =
> 		sizeof(struct rkisp1_stat_buffer);
>
>-	if (stats->rkisp1->media_dev.hw_revision == RKISP1_V12)
>+	if (stats->rkisp1->info->isp_ver == RKISP1_V12)
> 		stats->ops = &rkisp1_v12_stats_ops;
> 	else
> 		stats->ops = &rkisp1_v10_stats_ops;
>-- 
>2.30.2
>
