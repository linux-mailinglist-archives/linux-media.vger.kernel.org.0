Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9711C55A6BB
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 06:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbiFYEDN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jun 2022 00:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiFYEDL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jun 2022 00:03:11 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987C663D4
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 21:03:10 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 5BC6A32004E7;
        Sat, 25 Jun 2022 00:03:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 25 Jun 2022 00:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656129788; x=1656216188; bh=eDPc9edfWJ
        l7U7jIsXeB84KOuiTkPKJVKr3f2vfYMZ4=; b=KNbaLJX7CqVmdUn4UAYcy4x6+G
        Sk8mrMuc1BsGoWfBhaXHOfKuEzfSPG20d3l1n7sKAYdmXwyQ0WwD64aDizKHHFwM
        ApLCEZ5rvaGz4j+gCZ8F1W1RtGCeYbw7oDDpSCM4SdZwuhVTCOAxiGi5B8mGe/dp
        wykZkg7MXRKWYnPNR71/vQx4hdiIvQQkVoDmErJTUeoMjgP0BgbXhIhoLLGWAdqL
        65ZfVqE7S27oNcR3rT8BtrCtCSGtS4EiEYyJyPKNfhDsXePoE4lwBkqk05t6rAGU
        m/jKgLnbNMgTZI+97jOwh9UUsPGffXgYHz2FwRKCZlmIBCkBQg0XaPzliLXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656129788; x=1656216188; bh=eDPc9edfWJl7U7jIsXeB84KOuiTk
        PKJVKr3f2vfYMZ4=; b=h7r2ZB5dQ//99vzjFiy4q0cMfGHbRtJLA3q0xcjIjCwW
        xN9nBy46NCQhNLC7cHACJJc3zhJ4BCOfp2bbA1BQqGdWTHAw8e6dCIf+B7uZY6Zs
        Wf63vXJwXejXvgdGQeVDlQoxckzyg6xOKqAaOSz2jW8rT9Aaw08Y58AP4Mgje8HO
        znSZTkhbAX3PRnjLrWey/xRL5VKfpNCg4kBXAok5bPaPPPaaujXLKeiahp50AZM0
        MuUEhLCclhVerBLCcdHshDzJsPBIw1m9eeSZPhJzwJo+OKUS8zaB1eY6iLt2hhfY
        0SynES1oofAas36rUHrA8thNDQ74qOvF1h2sFnze8Q==
X-ME-Sender: <xms:_Ii2YmHuP0XgVddjdRIE13lt2OzXgO8S-UAp8cgBAIp1L-CTXYX3RA>
    <xme:_Ii2YnXBxROUFXr79JMsDDu0K-MBBcYV94c4Oqs0UbAIthx5YPPRL0Uy3V0FYdxOC
    TGXnw2_u2ECutTLC-I>
X-ME-Received: <xmr:_Ii2YgLVPtxMeNZtxgSEd7SoWVNq14r2Mujo1xUuFHuS57BMJUojRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegtddgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:_Ii2YgHq25jcp4WZbLXZngP4PW33z6KukdZe2yZb9qytTyGu1LrYGg>
    <xmx:_Ii2YsVMD32t5HgV-SX5Ng5OFG8VlIsUyq8MkI5HxTlcQaBq6V4bpg>
    <xmx:_Ii2YjNK_xqCAdCezrnlroBqIDB0xMfXXvLWu3cV5sh3MtlQeWvoGA>
    <xmx:_Ii2YvGSJgzIkt--uVYQAJfQm2hBrIjCputxgrjkNrXdBOnVpMst6w>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jun 2022 00:03:05 -0400 (EDT)
Date:   Sat, 25 Jun 2022 07:03:03 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 21/55] media: rkisp1: csi: Rename CSI functions with a
 common rkisp1_csi prefix
Message-ID: <20220625040303.slwswsnbhxp5ff2n@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-22-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-22-paul.elder@ideasonboard.com>
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
>The CSI-related functions are not named consistently. Fix it by using a
>common rkisp1_csi prefix.

this fixes my comment few patches back

>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 +-
> .../platform/rockchip/rkisp1/rkisp1-csi.c     | 20 +++++++++----------
> .../platform/rockchip/rkisp1/rkisp1-csi.h     |  6 +++---
> .../platform/rockchip/rkisp1/rkisp1-dev.c     |  4 ++--
> .../platform/rockchip/rkisp1/rkisp1-isp.c     |  6 +++---
> 5 files changed, 19 insertions(+), 19 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>index a52fa9e0dd66..dbf1baca623a 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>@@ -555,7 +555,7 @@ void rkisp1_params_disable(struct rkisp1_params *params);
>
> /* irq handlers */
> irqreturn_t rkisp1_isp_isr(int irq, void *ctx);
>-irqreturn_t rkisp1_mipi_isr(int irq, void *ctx);
>+irqreturn_t rkisp1_csi_isr(int irq, void *ctx);
> irqreturn_t rkisp1_capture_isr(int irq, void *ctx);
> void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris);
> void rkisp1_params_isr(struct rkisp1_device *rkisp1);
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>index f19513a601e8..c1bb8c05543d 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>@@ -18,7 +18,7 @@
> #include "rkisp1-common.h"
> #include "rkisp1-csi.h"
>
>-static int rkisp1_config_mipi(struct rkisp1_csi *csi)
>+static int rkisp1_csi_config(struct rkisp1_csi *csi)
> {
> 	struct rkisp1_device *rkisp1 = csi->rkisp1;
> 	const struct rkisp1_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
>@@ -68,7 +68,7 @@ static int rkisp1_config_mipi(struct rkisp1_csi *csi)
> 	return 0;
> }
>
>-void rkisp1_mipi_start(struct rkisp1_csi *csi)
>+static void rkisp1_csi_enable(struct rkisp1_csi *csi)
> {
> 	struct rkisp1_device *rkisp1 = csi->rkisp1;
> 	u32 val;
>@@ -78,7 +78,7 @@ void rkisp1_mipi_start(struct rkisp1_csi *csi)
> 		     val | RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA);
> }
>
>-void rkisp1_mipi_stop(struct rkisp1_csi *csi)
>+static void rkisp1_csi_disable(struct rkisp1_csi *csi)
> {
> 	struct rkisp1_device *rkisp1 = csi->rkisp1;
> 	u32 val;
>@@ -92,8 +92,8 @@ void rkisp1_mipi_stop(struct rkisp1_csi *csi)
> 		     val & (~RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA));
> }
>
>-int rkisp1_mipi_csi2_start(struct rkisp1_csi *csi,
>-			   struct rkisp1_sensor_async *sensor)
>+int rkisp1_csi_start(struct rkisp1_csi *csi,
>+		     struct rkisp1_sensor_async *sensor)
> {
> 	struct rkisp1_device *rkisp1 = csi->rkisp1;
> 	union phy_configure_opts opts;
>@@ -101,7 +101,7 @@ int rkisp1_mipi_csi2_start(struct rkisp1_csi *csi,
> 	s64 pixel_clock;
> 	int ret;
>
>-	ret = rkisp1_config_mipi(csi);
>+	ret = rkisp1_csi_config(csi);
> 	if (ret)
> 		return ret;
>
>@@ -118,19 +118,19 @@ int rkisp1_mipi_csi2_start(struct rkisp1_csi *csi,
> 	phy_configure(csi->dphy, &opts);
> 	phy_power_on(csi->dphy);
>
>-	rkisp1_mipi_start(csi);
>+	rkisp1_csi_enable(csi);
>
> 	return 0;
> }
>
>-void rkisp1_mipi_csi2_stop(struct rkisp1_csi *csi)
>+void rkisp1_csi_stop(struct rkisp1_csi *csi)
> {
>-	rkisp1_mipi_stop(csi);
>+	rkisp1_csi_disable(csi);
>
> 	phy_power_off(csi->dphy);
> }
>
>-irqreturn_t rkisp1_mipi_isr(int irq, void *ctx)
>+irqreturn_t rkisp1_csi_isr(int irq, void *ctx)
> {
> 	struct device *dev = ctx;
> 	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
>index 1f921d534865..7d3f01cfb49f 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
>@@ -17,8 +17,8 @@ struct rkisp1_sensor_async;
> int rkisp1_csi_init(struct rkisp1_device *rkisp1);
> void rkisp1_csi_cleanup(struct rkisp1_device *rkisp1);
>
>-int rkisp1_mipi_csi2_start(struct rkisp1_csi *csi,
>-			   struct rkisp1_sensor_async *sensor);
>-void rkisp1_mipi_csi2_stop(struct rkisp1_csi *csi);
>+int rkisp1_csi_start(struct rkisp1_csi *csi,
>+		     struct rkisp1_sensor_async *sensor);
>+void rkisp1_csi_stop(struct rkisp1_csi *csi);
>
> #endif /* _RKISP1_CSI_H */
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>index 373a1f00c10a..253220188abd 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>@@ -383,7 +383,7 @@ static irqreturn_t rkisp1_isr(int irq, void *ctx)
> 	 */
> 	rkisp1_capture_isr(irq, ctx);
> 	rkisp1_isp_isr(irq, ctx);
>-	rkisp1_mipi_isr(irq, ctx);
>+	rkisp1_csi_isr(irq, ctx);
>
> 	return IRQ_HANDLED;
> }
>@@ -398,7 +398,7 @@ static const char * const px30_isp_clks[] = {
> static const struct rkisp1_isr_data px30_isp_isrs[] = {
> 	{ "isp", rkisp1_isp_isr },
> 	{ "mi", rkisp1_capture_isr },
>-	{ "mipi", rkisp1_mipi_isr },
>+	{ "mipi", rkisp1_csi_isr },
> };
>
> static const struct rkisp1_info px30_isp_info = {
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index 208c68aa52ea..ecb8ca0ad670 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -763,7 +763,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> 		v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
> 				 false);
>
>-		rkisp1_mipi_csi2_stop(&rkisp1->csi);
>+		rkisp1_csi_stop(&rkisp1->csi);
> 		rkisp1_isp_stop(rkisp1);
>
> 		return 0;
>@@ -789,7 +789,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
>
> 	rkisp1_isp_start(rkisp1);
>
>-	ret = rkisp1_mipi_csi2_start(&rkisp1->csi, rkisp1->active_sensor);
>+	ret = rkisp1_csi_start(&rkisp1->csi, rkisp1->active_sensor);
> 	if (ret) {
> 		rkisp1_isp_stop(rkisp1);
> 		goto mutex_unlock;
>@@ -799,7 +799,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> 			       true);
> 	if (ret) {
> 		rkisp1_isp_stop(rkisp1);
>-		rkisp1_mipi_csi2_stop(&rkisp1->csi);
>+		rkisp1_csi_stop(&rkisp1->csi);
> 		goto mutex_unlock;
> 	}
>
>-- 
>2.30.2
>
