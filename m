Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B207F590437
	for <lists+linux-media@lfdr.de>; Thu, 11 Aug 2022 18:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238650AbiHKQhY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Aug 2022 12:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238900AbiHKQd4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Aug 2022 12:33:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7102777560;
        Thu, 11 Aug 2022 09:11:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A8B72B821B0;
        Thu, 11 Aug 2022 16:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41ECFC433D7;
        Thu, 11 Aug 2022 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660234264;
        bh=OO8x2+4a0MfU5R0wgHThLSWrI2dTRD1AshgT6xMLU4A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qVGaNIRhDk8juL8OwnowrMCi3U+tsQg+VQza0eENgHsCsblclCXD18UVuPTgKIr8+
         ZGOFDZBxubpWgvZJ78kNFmUtm1IovGymaZFsixsPIlDXcU4wQz6EarnP03cqf0Uk5/
         bHx2sQ0fsqL3EXhzJdW6RgrmGfw8p+1dhfV9oej6qdJ6We4Zn9/ZFzGPmdSQDJz5VR
         zgX2+rpXN6v1u2LTTD0WgAwTf2hy+r+Le+M6Lp58mL87n16cZS/y9LuluJnE6jpUo6
         f+5npj4C8VlAobbaTLxDfYbwleYrXRp8MUTSb73Gf1lrqUKqfWkpktpIfmap+5oxY+
         Q7d+gwjjFEpCg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Yang Yingliang <yangyingliang@huawei.com>,
        Hulk Robot <hulkci@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sasha Levin <sashal@kernel.org>, johan@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart@ideasonboard.com, cai.huoqing@linux.dev,
        linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 04/14] media: davinci: vpif: add missing of_node_put() in vpif_probe()
Date:   Thu, 11 Aug 2022 12:10:33 -0400
Message-Id: <20220811161050.1543183-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811161050.1543183-1-sashal@kernel.org>
References: <20220811161050.1543183-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yang Yingliang <yangyingliang@huawei.com>

[ Upstream commit bb45f5433f23cf103ba29c9692ee553e061f2cb4 ]

of_graph_get_next_endpoint() returns an 'endpoint' node pointer
with refcount incremented. The refcount should be decremented
before returning from vpif_probe().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/davinci/vpif.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/davinci/vpif.c b/drivers/media/platform/davinci/vpif.c
index 4ac0893282f5..a46316f5467b 100644
--- a/drivers/media/platform/davinci/vpif.c
+++ b/drivers/media/platform/davinci/vpif.c
@@ -449,6 +449,7 @@ static int vpif_probe(struct platform_device *pdev)
 					      endpoint);
 	if (!endpoint)
 		return 0;
+	of_node_put(endpoint);
 
 	/*
 	 * For DT platforms, manually create platform_devices for
-- 
2.35.1

