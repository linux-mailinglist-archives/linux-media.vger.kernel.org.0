Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71DCB597D86
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 06:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243364AbiHRE3i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 00:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238358AbiHRE3g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 00:29:36 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BAC671731
        for <linux-media@vger.kernel.org>; Wed, 17 Aug 2022 21:29:33 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id E77BD5C013B;
        Thu, 18 Aug 2022 00:29:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 18 Aug 2022 00:29:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1660796971; x=1660883371; bh=mitA3JOgxG
        VWWPO0mBM9chuIuxnyUAwknbDH7vRNOBM=; b=G1JZBCdpyJ4RCHe1EtHArHxfdn
        W7c9QUfUbVPTu51glL2A7co7RXHRaouQ0EBHJFvhjWgQpdE9yO8OHQm5QdMy0Oz6
        SUiTFFstFnyqUIBbABAScF+N31Hd6zCuxAD3frtO/fJ1p3AV6bv8FExPSiArChic
        8G5Lw3Mj9CMOvF84WRKU5qSS9TAiRKlRWwlZZ0NJ6RjygUdg9Ke7dXUvsEppYjlj
        eIiGQCdfJI+hajhpfTh7rStuy2iP5iOwf11MzzgAqdIDS9Sw0tZO448KQFxxRj1q
        dDUgBj6qmp0nqPfiBPge1uiYpPivRt/i0NbMGIrD2fwJaOp52ocmMvminS+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1660796971; x=1660883371; bh=mitA3JOgxGVWWPO0mBM9chuIuxny
        UAwknbDH7vRNOBM=; b=ypeThDiOQEGtUpNQhMu4xYV/jgfk0ioU1KhJQQd2v1wB
        ST41yLc3nRMoTqUJwWdO/6VRWR2zy/yikfH596+GQpTWQenqzfEmwHpZCjwmp4Ip
        4EdAu7awP36XQIzzUvjTUGOTZeF9UtlE5AabASAAUwB7bTem9goLcsuotfD11EXd
        /YClIKuoJ7mu2ck6/7hp7ICYDIMkmOgyUXOpOwRyEB1VtVpn9k3BSigaHpOArPR8
        00Iu0RoRALvNViPEkBx5BrnJKyM4EhEeJmXT8vrz5/bDImSuBbFnmwLMxCzP4Fd3
        Sh5betqO//blaPexhgPjhAXHNb2fev5rSNvA9W4tjA==
X-ME-Sender: <xms:K8D9Ynn0-1vsFJa1hE9zOOvhz9HJ9pqDiET9nV2ax-r8KQDgQ9PvTg>
    <xme:K8D9Yq3pbR2bLoAHck6-QkjKtnJUx-NvfN21qLHFdFNqi2eeLkAeMxre-CnhipUNS
    qfh5OyTTtqdtzsV9gc>
X-ME-Received: <xmr:K8D9YtpEmrBQ3qkda9k9gtpXA3FAORDaZte9xitg4qoPBLbaXsT-PQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehjedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:K8D9YvmYZpWIQxQhy8yt_D2lhBMfIKWWJ_tcTn7MsYX8fz7qhwsFcA>
    <xmx:K8D9Yl2c7vkN8-WIbR4X_idELiK29FJwOHqM7N9fS6J0gI-N8S08hA>
    <xmx:K8D9Yuu9thcubJ3LApbIxPbqI_-Xpl_GQuLDD7ORk8o9AcWEZPYGuw>
    <xmx:K8D9YjD4G4RnO9g5gzU4Do42OY5VKWj-44F7lT7g5ill_cydF493uw>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Aug 2022 00:29:30 -0400 (EDT)
Date:   Thu, 18 Aug 2022 07:29:27 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH 6/7] media: rkisp1: Don't pass the quantization to
 rkisp1_csm_config()
Message-ID: <20220818042927.jil7wf6iz7wfl3ti@guri>
References: <20220815065235.23797-1-laurent.pinchart@ideasonboard.com>
 <20220815065235.23797-7-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220815065235.23797-7-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15.08.2022 09:52, Laurent Pinchart wrote:
>The rkisp1_csm_config() function takes a pointer to the rkisp1_params
>structure which contains the quantization value. There's no need to pass
>it separately to the function. Drop it from the function parameters.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 10 +++-------
> 1 file changed, 3 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>index 8b4eea77af0d..163419624370 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>@@ -1076,7 +1076,7 @@ static void rkisp1_ie_enable(struct rkisp1_params *params, bool en)
> 	}
> }
>
>-static void rkisp1_csm_config(struct rkisp1_params *params, bool full_range)
>+static void rkisp1_csm_config(struct rkisp1_params *params)
> {
> 	static const u16 full_range_coeff[] = {
> 		0x0026, 0x004b, 0x000f,
>@@ -1090,7 +1090,7 @@ static void rkisp1_csm_config(struct rkisp1_params *params, bool full_range)
> 	};
> 	unsigned int i;
>
>-	if (full_range) {
>+	if (params->quantization == V4L2_QUANTIZATION_FULL_RANGE) {
> 		for (i = 0; i < ARRAY_SIZE(full_range_coeff); i++)
> 			rkisp1_write(params->rkisp1,
> 				     RKISP1_CIF_ISP_CC_COEFF_0 + i * 4,
>@@ -1562,11 +1562,7 @@ static void rkisp1_params_config_parameter(struct rkisp1_params *params)
> 	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_HIST_PROP_V10,
> 			      rkisp1_hst_params_default_config.mode);
>
>-	/* set the  range */
>-	if (params->quantization == V4L2_QUANTIZATION_FULL_RANGE)
>-		rkisp1_csm_config(params, true);
>-	else
>-		rkisp1_csm_config(params, false);
>+	rkisp1_csm_config(params);
>
> 	spin_lock_irq(&params->config_lock);
>
>-- 
>Regards,
>
>Laurent Pinchart
>
