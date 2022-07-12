Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF8B5722CB
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 20:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiGLSkO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 14:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiGLSkN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 14:40:13 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEFBBBFAD8
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 11:40:11 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id BFE8C320085B;
        Tue, 12 Jul 2022 14:40:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 12 Jul 2022 14:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1657651210; x=1657737610; bh=NFNE4MbAxB
        VPNePWdnmzXfx84AckvsRTsSxOKfaAQW8=; b=f0fVXog+nz0ZPON90vxMB5fDih
        d16tXIpLAFdhnoQjyhEI5cg6IRj9rhT7pEUE7ky5cgFYFnMHVgZOsXhOYOjBebp7
        hR1jhiPikeiWbr+BYwD1+fCmh/zqANX4Vj97T7z9IKtfNe5SmS+InZpIA/lyOouu
        qnt1+XX+q31PqfWPK4B/UtF1lNjMdXcY3Fnecum0wuFV0jbr6n8fPQ/7lpPPz/LH
        36VipkzpFzXRyyzhih1bFSpCL9GeO/OS93UUZlNaULZU5iraS6ExPm3ZI3QiUFHJ
        kW91Gyue5l8Bi/8cfiCQWBYXSrDlaKRxFYUaieBJmf8VbErWPI3jzYf0+7Jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657651210; x=1657737610; bh=NFNE4MbAxBVPNePWdnmzXfx84Ack
        vsRTsSxOKfaAQW8=; b=bmKVN7Q+S77C5W0S6ibS7EscXenH4hlSD59KlHf4xUXQ
        aGaQgRct3PdqVx7GlLImmOwQV5mTWEJYE9l0aswRXJ9VlZxKUMMoA2zl1ARNYAT8
        Bp+BXU6XBO0+YLMlhRQ0lFf9rEsY/CYzUhinYSX1PYpc0d8jTUynghF84LIGijA9
        iayQ/oy8acW9bs7JXaJA7n78rNTAaN6l9NIBqhcm9iuAccTeXuiQA5C0Ur6IEjan
        Ifk3rPx3ygUwqITo8keeu1PYeaqzD020ce+dTUkWDgAyDQueKsc/aeXOJgxGS1XD
        Mqnf/viWBy2WDmOpF//10mhzOV00Ty9ESKNZjWsD9A==
X-ME-Sender: <xms:CcDNYkTYPIFCU_gd0aO7K1PSMIbMIZzbFCiKq-Nd88PzGjIQK5iSpQ>
    <xme:CcDNYhxJ208kIc_QdM3uIZOcEGnEgX_ez0n57bUzEPZ0CIOgJBC77WHhaHRpuaItI
    8cCdbBNZrOJjGAVKjg>
X-ME-Received: <xmr:CcDNYh2hPampANgTlkZNJWzohfpcw4erLphj5MnCtivjYGEwH2pHVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepvdehtdeludekgeevleefuedvudejieetheekvdfhteekffdu
    jefhfedtudehvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:CcDNYoATnV8FON4OW7FKmzrhl6YYiJa3OwHTICJdeo65_G6nNJJ9Gg>
    <xmx:CcDNYtgRqgv2gQ0l0R-0alJvUzIKpLih46x6T7HcjluK6WNOsZqc-Q>
    <xmx:CcDNYkpFeAc8rcgZRoUqwKMxsB5EhVtjjQnBPlWjU0C8I07y5K4OBg>
    <xmx:CsDNYtfVDeY3kbvMnLqnneE6wIKg-cKElF4pbI5P0xaKL37PoaJDfA>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Jul 2022 14:40:08 -0400 (EDT)
Date:   Tue, 12 Jul 2022 21:40:05 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v3 38/46] media: rkisp1: isp: Disallow multiple active
 sources
Message-ID: <20220712184005.nwnlflsupgie6owf@guri>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
 <20220711124248.2683-39-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220711124248.2683-39-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11.07.2022 15:42, Laurent Pinchart wrote:
>The ISP supports multiple source subdevs, but can only capture from a
>single one at a time. The source is selected through link setup. The
>driver finds the active source in its .s_stream() handler using the
>media_entity_remote_pad() function. This fails to reject invalid
>configurations with multiple active sources. Fix it by using the
>media_pad_remote_pad_unique() helper instead, and inline
>rkisp1_isp_get_source() in rkisp1_isp_s_stream() as the function is
>small and has a single caller.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
>---
>Changes since v2:
>
>- Update media_pad_remote_pad_unique() function name in commit message
>---
> .../platform/rockchip/rkisp1/rkisp1-isp.c     | 30 ++++++++-----------
> 1 file changed, 13 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index 37623b73b1d9..d7e2802d11f5 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -58,20 +58,6 @@
>  * Helpers
>  */
>
>-static struct v4l2_subdev *rkisp1_isp_get_source(struct v4l2_subdev *sd)
>-{
>-	struct media_pad *local, *remote;
>-	struct media_entity *sensor_me;
>-
>-	local = &sd->entity.pads[RKISP1_ISP_PAD_SINK_VIDEO];
>-	remote = media_pad_remote_pad_first(local);
>-	if (!remote)
>-		return NULL;
>-
>-	sensor_me = remote->entity;
>-	return media_entity_to_v4l2_subdev(sensor_me);
>-}
>-
> static struct v4l2_mbus_framefmt *
> rkisp1_isp_get_pad_fmt(struct rkisp1_isp *isp,
> 		       struct v4l2_subdev_state *sd_state,
>@@ -743,6 +729,8 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> 	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
> 	struct rkisp1_device *rkisp1 = isp->rkisp1;
> 	const struct rkisp1_sensor_async *asd;
>+	struct media_pad *source_pad;
>+	struct media_pad *sink_pad;
> 	int ret;
>
> 	if (!enable) {
>@@ -754,10 +742,18 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> 		return 0;
> 	}
>
>-	rkisp1->source = rkisp1_isp_get_source(sd);

so 'rkisp1->source' is the source of the isp right? and in addition you later
add csi->source for the csi source. Maybe move rkisp1->source field to rkisp1_isp
to make it clear it is the isp source.
Just a suggestion. If you don't feel like, then:

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>+	sink_pad = &isp->pads[RKISP1_ISP_PAD_SINK_VIDEO];
>+	source_pad = media_pad_remote_pad_unique(sink_pad);
>+	if (IS_ERR(source_pad)) {
>+		dev_dbg(rkisp1->dev, "Failed to get source for ISP: %ld\n",
>+			PTR_ERR(source_pad));
>+		return -EPIPE;
>+	}
>+
>+	rkisp1->source = media_entity_to_v4l2_subdev(source_pad->entity);
> 	if (!rkisp1->source) {
>-		dev_warn(rkisp1->dev, "No link between isp and source\n");
>-		return -ENODEV;
>+		/* This should really not happen, so is not worth a message. */
>+		return -EPIPE;
> 	}
>
> 	asd = container_of(rkisp1->source->asd, struct rkisp1_sensor_async,
>-- 
>Regards,
>
>Laurent Pinchart
>
