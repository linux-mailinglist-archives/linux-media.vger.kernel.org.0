Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCBD56D2A8
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 03:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbiGKBiV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jul 2022 21:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiGKBiU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jul 2022 21:38:20 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5D5175A0
        for <linux-media@vger.kernel.org>; Sun, 10 Jul 2022 18:38:17 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 3921E32002F9;
        Sun, 10 Jul 2022 21:38:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 10 Jul 2022 21:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1657503495; x=1657589895; bh=fU5pyebLqz
        JXq3xPC9UQRDzrTYaTazzmxNOCSIfErAk=; b=NULvAOlLRol7ahbPJu0RgRcjwy
        jftD19NQB0/E/hgonYssdQFpC49+j1FefqchmusPD5an6pF03dJ1DzAWUSg0oife
        xszge9tU5Zvpztk+QOab+38549dEVuzX60yPyi21Kvys1oJpd4JGK74xdM5tdl2O
        3y/ZMeyO7fDV+JGfIT9w5ee2DaHE3o1ET2iXD+Hf+FstILtZnDwfc1kh98jYtzkK
        QRpsueXlbWpVXozlm+9lXhqup1jqw7nJ2PcZ41WUQZ6tQVznMPQ6Pgl4LS861pJk
        PXHgn3g0qhNZgiSyLXk7+hz3O/dBF/1oUdMd5EH8ewGTO/cyNT3Zd60W7/2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657503495; x=1657589895; bh=fU5pyebLqzJXq3xPC9UQRDzrTYaT
        azzmxNOCSIfErAk=; b=O/XyNT1Lzvbfbi7ugzr+gATsboAFFjlbd5256LkGrHbi
        3DOxzz0+N0WmH2LQZ7zx2EwMptFuocRhx4TkD7e99OLYmX2JLSbKn3gcZ+cNgzBm
        G6235WLcGmuBGOPye/hPYNvQh+XmWv05VSxpOADCdQ8pYqPwKTGpsaTsCYQE4dbS
        jgfulm7XtYTl2FYUaCUXLs7RogLdgXAncEGmF9vbZGOGOdS9O4AspK7GUeU6otIb
        al4a2hY2pVYDw9qfF3CVbQnqIBXP7qiRjGQureLD4EHRQXDQCv6wwqRoINnqKuxz
        0WAQzuH6FAGmD0poowe0W85PA0W1R58FUsaXIVGbMw==
X-ME-Sender: <xms:B3_LYlZTSId27tkTnOHeTDKxoYAJ5c2Tu3P0kIqTrLd3LKlcidyV-A>
    <xme:B3_LYsbb6EPjRvJsbRhROepvwG0xnTkTshbn7ue1XQBaSY-YQ5Vc-U5N8IyFRQ1ol
    7wYaeGi08GC7yOZKvE>
X-ME-Received: <xmr:B3_LYn_PgWUntg9chDlG0IlIM3XF3RKfP4LUjlepU2ecDvDPD597mA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejvddghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeevtdffuedtvedugfehvdfhheevkefhheejvdffveffffdtgfdt
    feetffdvheejhfenucffohhmrghinhepsggrshgvrdhiugdpihhnfhhrrgguvggrugdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegu
    rghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:B3_LYjrfqIjgNWeJbI2dRH9y611PeWUwsJKCIjT2c95UsYA-GIxDew>
    <xmx:B3_LYgrsMDrOsUVAj4QqkJWVicN6oh8-1Hbd3ztf2g4c82KZVHexug>
    <xmx:B3_LYpQYBIGHjLaoBm0IFB8kgHqHebmymWzjrs1_XaMdORC37hdVGA>
    <xmx:B3_LYplWOuo9l58BOyrxLhskmQNwB3vuzcPBDdACdgp8abXkxPomuA>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Jul 2022 21:38:13 -0400 (EDT)
Date:   Mon, 11 Jul 2022 04:38:10 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 41/55] media: rkisp1: Use
 fwnode_graph_for_each_endpoint
Message-ID: <20220711013810.5pphbuzbekbccmfa@guri>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-42-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-42-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01.07.2022 02:06, Laurent Pinchart wrote:
>From: Paul Elder <paul.elder@ideasonboard.com>
>
>When registering the notifier, replace the manual while loop with
>fwnode_graph_for_each_endpoint. This simplifies error handling.
>
>Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../platform/rockchip/rkisp1/rkisp1-dev.c     | 44 +++++++++----------
> 1 file changed, 20 insertions(+), 24 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>index c3a7ab70bbef..0eb37ba557ce 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>@@ -168,29 +168,28 @@ static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops =
> static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> {
> 	struct v4l2_async_notifier *ntf = &rkisp1->notifier;
>-	unsigned int next_id = 0;
>+	struct fwnode_handle *fwnode = dev_fwnode(rkisp1->dev);
>+	struct fwnode_handle *ep;
> 	unsigned int index = 0;
>-	int ret;
>+	int ret = 0;
>
> 	v4l2_async_nf_init(ntf);
>
>-	while (1) {
>+	ntf->ops = &rkisp1_subdev_notifier_ops;
>+
>+	fwnode_graph_for_each_endpoint(fwnode, ep) {
> 		struct v4l2_fwnode_endpoint vep = {
> 			.bus_type = V4L2_MBUS_CSI2_DPHY
> 		};
> 		struct rkisp1_sensor_async *rk_asd;
>-		struct fwnode_handle *source = NULL;
>-		struct fwnode_handle *ep;
>-
>-		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
>-						     0, next_id,
>-						     FWNODE_GRAPH_ENDPOINT_NEXT);
>-		if (!ep)
>-			break;
>+		struct fwnode_handle *source;
>
> 		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>-		if (ret)
>-			goto err_parse;
>+		if (ret) {
>+			dev_err(rkisp1->dev, "failed to parse endpoint %pfw\n",
>+				ep);
>+			break;
>+		}
>
> 		source = fwnode_graph_get_remote_endpoint(ep);
> 		if (!source) {
>@@ -198,14 +197,15 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> 				"endpoint %pfw has no remote endpoint\n",
> 				ep);
> 			ret = -ENODEV;
>-			goto err_parse;
>+			break;
> 		}
>
> 		rk_asd = v4l2_async_nf_add_fwnode(ntf, source,
> 						  struct rkisp1_sensor_async);
> 		if (IS_ERR(rk_asd)) {
>+			fwnode_handle_put(source);
> 			ret = PTR_ERR(rk_asd);
>-			goto err_parse;
>+			break;
> 		}
>
> 		rk_asd->index = index++;
>@@ -216,27 +216,23 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>
> 		dev_dbg(rkisp1->dev, "registered ep id %d with %d lanes\n",
> 			vep.base.id, rk_asd->lanes);
>+	}
>
>-		next_id = vep.base.id + 1;
>-
>-		fwnode_handle_put(ep);
>-
>-		continue;
>-err_parse:
>+	if (ret) {
> 		fwnode_handle_put(ep);
>-		fwnode_handle_put(source);
> 		v4l2_async_nf_cleanup(ntf);
> 		return ret;
> 	}
>
>-	if (next_id == 0)
>+	if (!index)
> 		dev_dbg(rkisp1->dev, "no remote subdevice found\n");
>-	ntf->ops = &rkisp1_subdev_notifier_ops;
>+
> 	ret = v4l2_async_nf_register(&rkisp1->v4l2_dev, ntf);
> 	if (ret) {
> 		v4l2_async_nf_cleanup(ntf);
> 		return ret;
> 	}
>+
> 	return 0;
> }
>
>-- 
>Regards,
>
>Laurent Pinchart
>
>
>_______________________________________________
>Linux-rockchip mailing list
>Linux-rockchip@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-rockchip
