Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8B6F55A748
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 07:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbiFYFIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jun 2022 01:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbiFYFIE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jun 2022 01:08:04 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF986144
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 22:08:03 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id CEEC33200901;
        Sat, 25 Jun 2022 01:08:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 25 Jun 2022 01:08:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656133681; x=1656220081; bh=83jX/0SUdl
        BTs/bpK1P0fOYDaEMH4ylrRkscDmeNOGo=; b=MlJ0YkV0WBtoTSXOWmjtl0aJDa
        jtZ750LcuBJc5ukQKA5XdgpxqUC9xLErM+xeZgte9LYxt58YPJ8U3eQhkK2qMVX/
        0SQjcBG2jR+OmQOrZ4+kPo9fcrwLeYAU2X9dzN/r5VqLiqznx9JTX9HU7mcAT7da
        CaWDotK6a1V3X1g76/+pImsc260/9Jc1mMQrZUsFI9B4eMTv20R3ovyVaZfIeVgb
        oc7UMb0yZLNXWfFq9h4JvFmMt2GiuWRC30sNt8iZe6ZUnN4exc8Ez4cOoZEGEEAN
        wbdJ+waDo8YY8LOaK8EDJQK/DgXoYH9n2ocvoup7cDyluv258WNxwckgU6hQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656133681; x=1656220081; bh=83jX/0SUdlBTs/bpK1P0fOYDaEMH
        4ylrRkscDmeNOGo=; b=XwFd0gCXyiEOqISlG40F2d2bhivkqS7uOaddURqVWZgh
        TgdtMaZZbO++DAsla99XAfNSrbxGetuLIQAh8hj8XDkPQTSR1gpllclDNDMQHLTb
        3C+90uYijzTDugzr6nwfM5HdtX+aJ3hqOruEjOFrBRrn2Bt9S9DWrb3XkLlhKK16
        fgCm3dxBpVvLIF7AzwL9DfEhJbtDYQxKWjILTF+CIxvFAEC/HhLQe7ZoUlsGKcLf
        ffNqzPlWo885p/0zCekA5R7n4Ku0UFRCC2Q/vFcHmAF4fdrC1p/aXtOCpzrKVnza
        E+96nNzg+a4+4OO/20ZMmVvUva4Xeya983fBAa2ckA==
X-ME-Sender: <xms:MZi2Ym7dJUjBfxROJ3LrWJPELa_KcD_Vnfz3CKv8j3hM_QkhdX1-nw>
    <xme:MZi2Yv43boqhPAHf6HfKaRUqTpAA5hOLnL_Mnll2GFWsalYXD4MD6h7UvByuhdA81
    kBXdx2oa1B-gavtBtI>
X-ME-Received: <xmr:MZi2YldjxNAbBdwfCkx-FSooZOwnTXp7XLGOsIplzmKAADtt9HOGPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegtddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:MZi2YjLi9Z_CI3p7Bp-1frOj727xzn3xdryT5ROuQTqqb6ek1X4z-w>
    <xmx:MZi2YqL_RSMvljQoinaUG3yB0iFAPkbMfkXx-w_VhuMdk14T8BSijw>
    <xmx:MZi2YkwAuI4FLGL8lbLRBX0ib5wIG8SRyxtclNaW2vca_e0JOl_hZg>
    <xmx:MZi2Yrq97ZN5xBtdpkp1jTfZ65OoVG5coif2pNfyI7_3GEcHLMU0fg>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jun 2022 01:07:58 -0400 (EDT)
Date:   Sat, 25 Jun 2022 08:07:55 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 35/55] media: rkisp1: isp: Constify various local
 variables
Message-ID: <20220625050755.evtlhxypb75cdd35@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-36-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-36-paul.elder@ideasonboard.com>
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
>From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>A set of local variables point to structure that are not meant to be
>modified. Constify them.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index 86d496855374..91b37f2dca91 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -113,7 +113,7 @@ rkisp1_isp_get_pad_crop(struct rkisp1_isp *isp,
>  */
> static void rkisp1_config_ism(struct rkisp1_isp *isp)
> {
>-	struct v4l2_rect *src_crop =
>+	const struct v4l2_rect *src_crop =
> 		rkisp1_isp_get_pad_crop(isp, NULL,
> 					RKISP1_ISP_PAD_SOURCE_VIDEO,
> 					V4L2_SUBDEV_FORMAT_ACTIVE);
>@@ -146,8 +146,8 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
> 	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, acq_prop = 0;
> 	const struct rkisp1_mbus_info *sink_fmt = isp->sink_fmt;
> 	const struct rkisp1_mbus_info *src_fmt = isp->src_fmt;
>-	struct v4l2_mbus_framefmt *sink_frm;
>-	struct v4l2_rect *sink_crop;
>+	const struct v4l2_mbus_framefmt *sink_frm;
>+	const struct v4l2_rect *sink_crop;
>
> 	sink_frm = rkisp1_isp_get_pad_fmt(isp, NULL,
> 					  RKISP1_ISP_PAD_SINK_VIDEO,
>@@ -557,7 +557,7 @@ static void rkisp1_isp_set_sink_crop(struct rkisp1_isp *isp,
> 				     struct v4l2_rect *r, unsigned int which)
> {
> 	struct v4l2_rect *sink_crop, *src_crop;
>-	struct v4l2_mbus_framefmt *sink_fmt;
>+	const struct v4l2_mbus_framefmt *sink_fmt;
>
> 	sink_crop = rkisp1_isp_get_pad_crop(isp, sd_state,
> 					    RKISP1_ISP_PAD_SINK_VIDEO,
>@@ -742,7 +742,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> {
> 	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
> 	struct rkisp1_device *rkisp1 = isp->rkisp1;
>-	struct rkisp1_sensor_async *asd;
>+	const struct rkisp1_sensor_async *asd;
> 	int ret;
>
> 	if (!enable) {
>-- 
>2.30.2
>
