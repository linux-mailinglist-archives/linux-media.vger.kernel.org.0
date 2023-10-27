Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE3487D92A1
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 10:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345352AbjJ0IvF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 04:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235079AbjJ0IvE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 04:51:04 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E263C4
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 01:51:02 -0700 (PDT)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sebastianfricke)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id B37F56607322
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 09:51:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1698396660;
        bh=7wl7ilZDNx+PU8N916hEXNoO3+bMZpxYn2i1rR+g3jw=;
        h=Date:From:To:Subject:From;
        b=PDTeifIIQtxNre/kaxIUvEywbVO930/r5QYyKY2km96WzlZAxoWswJtrRHVnYONk/
         BW5pf1hxCFNgZPUyC0aFDGDxgCCRFaus7NEXgyP1vkiG74VgNemIWJJ6wX3vc1JPU7
         LAeL4Wb09D5pzuFEDE323vUQMTPJbOQGPe/1hweJpsRmBKSIHPTIHJMsRVcgLnfytL
         61P3UFe+7UgP52fQj6qdGqak9JBS7NGlIDhitiil9LmwB/dfmej6clTDBSSckMSk7o
         tCbmqJrVwpwN7t4SbZLh5iTdjJsieiGZmk1weJ/oMsLpH8vMxoCvZBDjJoiEhCXKCb
         n1PXAJBTo4PNw==
Date:   Fri, 27 Oct 2023 10:50:58 +0200
From:   Sebastian Fricke <sebastian.fricke@collabora.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.7] Mediatek Vcodec: Codec profile and level setting
Message-ID: <20231027085058.k65rwgxepmx5ivu5@basti-XPS-13-9310>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Mauro and Hans,

first attempt at doing a PR, could you please check and pull this?

The following changes since commit 19e67e01eb1e84f3529770d084b93f16a4894c42:

   media: venus: Fix firmware path for resources (2023-10-23 12:24:53 +0200)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux tags/for-6.7-signed

for you to fetch changes up to ccd08a80f5e1844819874b01c5ff61e18aa9e133:

   media: mediatek: vcodec: Set the supported vp9 profile for each platform (2023-10-26 09:09:21 +0200)

----------------------------------------------------------------
Mediatek Codec patches for 6.7

----------------------------------------------------------------
Yunfei Dong (7):
       media: mediatek: vcodec: Get the chip name for each platform
       media: mediatek: vcodec: Set the supported h264 level for each platform
       media: mediatek: vcodec: Set the supported h265 level for each platform
       media: mediatek: vcodec: Set the supported h264 profile for each platform
       media: mediatek: vcodec: Set the supported h265 profile for each platform
       media: mediatek: vcodec: Set the supported vp9 level for each platform
       media: mediatek: vcodec: Set the supported vp9 profile for each platform

  drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c           |  24 +-----------------
  drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c       |  26 ++++++++++++++++++++
  drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h       |  14 +++++++++++
  drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c | 168 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
  4 files changed, 208 insertions(+), 24 deletions(-)

Greetings,
Sebastian
