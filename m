Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 149564B990F
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 07:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235451AbiBQGQI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 01:16:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235142AbiBQGQH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 01:16:07 -0500
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F552A229A
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 22:15:52 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id BD7E25801C4;
        Thu, 17 Feb 2022 01:08:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 17 Feb 2022 01:08:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:date:date:from:from:in-reply-to:in-reply-to:message-id
        :references:reply-to:sender:subject:subject:to:to; s=fm2; bh=ieG
        gSsTwYsmyQ38bDO+Pn6qhobl81m0tsA+TJpF4PKY=; b=hscWTBcn7IkPjDTYeM+
        7dRyK/PdvcFn7+bd8lnBmFpEh8A07YaQnUP/CVhpF2JyJNZUB6ldeCgS+WTv3wtV
        F2zTComzTuAXIIDpUuIn8HvlYk2nnl+neQzvq4hrvZ+qmuXSi/A2dt4wLmtQNtGc
        dcql3pfYyQEa7o9n7gwwo9FowhsRk1hxDMyuCyjA4FbSuMscBOCo/mujKDCy5TZ+
        FMndWwDdzLUd3w7fxJycC/BNlvumaDRKNwmpwGpDbCAFzn+2VPJ/HF4Be3XVGLTG
        oq4vZf7kFJfc9tVBR6ALYjn6rEZlMVXLK3G0riFNKcMmWdcFU0DR06cmcYq7uL9b
        fSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:date:date:from:from:in-reply-to
        :in-reply-to:message-id:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=ieGgSsTwYsmyQ38bDO+Pn6qhobl81m0tsA+TJpF4P
        KY=; b=BGP3ZFQ126Fq/s+DFV0YOmMcqcyp5djA5aNOPVJVSXGKKjKoOIvHwN3w8
        31Pzac83feP4lrzCuhuAQCXXlDNB0vY+ZjxwJA+tF9CJXNJyJN+dV2wtUIOEeBcs
        QTTv16crwmTZZVBcFz6pVAQwTipUSJQYCsKu/a80tubNVkQYXcXu8iUNSRFXG14r
        G8zcMshwEIZ8RuHjqPY33uzk/LeqP/fzTCsJ6Cb/ZDZQi4+DZW3PaT+bKbuVl7Eg
        Yv6nT5Pwo20vNT7BpBjdoYVReMwZGzVf5eQhOhVNCIjyxyi+ECA501BRNw+kxrmT
        RiUoQBLOudhL7eB0lONKxoJSLvyvg==
X-ME-Sender: <xms:RuYNYlBTM7XShqBM-QTWygK-TCmOSqRpYIsgIfVVxVi3Y6BXX2EvCw>
    <xme:RuYNYjh1arkAecthNKPA3XpCgYVbtN42qlTSmCEtEOLzHBpj7TshGfgRUpshf3Upf
    D6TFkI8RBdESsiloXE>
X-ME-Received: <xmr:RuYNYgmRpC5G1mrSraNZ4Loh-EfYBM6IToTyVotrDNgHhroe6HZpUM4Ne3y0K0heAS2rgVSIoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeejgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfsedttdertdertd
    dtnecuhfhrohhmpeffrghfnhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghs
    thhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepheduvdefhfeutdekhedvjeekve
    ejhedvheelfffftedvledvveeghfehhfffffdtnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:RuYNYvxCj33hG8aP2GKS2JWbR-RmixjlgPo23cbOT-V3unrWDOGEEg>
    <xmx:RuYNYqSxwbD2iU5HKrSw2_YTOxCS2yMwnXy7K0Jp9bWjB7YSV8GFig>
    <xmx:RuYNYiaXKMSmImJCrVnK8z01WVROGpTlUZpHQAG-3Cf9Ey_CX0u11w>
    <xmx:RuYNYr8aK_fH5pCtzlW29VLUhl9oyBuL_ZEfWw3N66Pd9r2Tli6a5Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Feb 2022 01:08:03 -0500 (EST)
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     ezequiel@vanguardiasur.com.ar
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, ribalda@chromium.org, tfiga@chromium.org,
        senozhatsky@google.com, hch@lst.de, dafna@fastmail.com,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com
Subject: [PATCH v3 1/4] media: stk1160: fix number of buffers in case not all buffers are created
Date:   Thu, 17 Feb 2022 08:07:21 +0200
Message-Id: <20220217060724.7763-2-dafna@fastmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220217060724.7763-1-dafna@fastmail.com>
References: <20220217060724.7763-1-dafna@fastmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

In case we fail to allocate a transfer_buffer then we
break the buffers creation loop and update the number of
buffers to the number of successfully allocated which should
be 'i' and not 'i - 1' nor 'i + 1'

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/media/usb/stk1160/stk1160-video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 202b084f65a2..92c8b1fba2b0 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -511,15 +511,15 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 	usb_free_urb(dev->isoc_ctl.urb[i]);
 	dev->isoc_ctl.urb[i] = NULL;
 
-	stk1160_warn("%d urbs allocated. Trying to continue...\n", i - 1);
+	stk1160_warn("%d urbs allocated. Trying to continue...\n", i);
 
-	dev->isoc_ctl.num_bufs = i - 1;
+	dev->isoc_ctl.num_bufs = i;
 
 	return 0;
 
 free_i_bufs:
 	/* Save the allocated buffers so far, so we can properly free them */
-	dev->isoc_ctl.num_bufs = i+1;
+	dev->isoc_ctl.num_bufs = i;
 	stk1160_free_isoc(dev);
 	return -ENOMEM;
 }
-- 
2.17.1

