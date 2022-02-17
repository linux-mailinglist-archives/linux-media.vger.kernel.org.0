Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCFDE4B990E
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 07:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235465AbiBQGQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 01:16:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235318AbiBQGQM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 01:16:12 -0500
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDABE2A2286
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 22:15:56 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id A512F5C019F;
        Thu, 17 Feb 2022 01:08:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 17 Feb 2022 01:08:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:date:date:from:from:in-reply-to:message-id:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=ZB1SmTVXb/DBhdIDoqv1RCdUqDPfDt
        /MGWSX4mbI5iU=; b=YoZd0mpozn8NZxKqRRFsVWgqaMx1WJZ895sgfrXET2qZYf
        uHUmpF18U2DkqbC5a4LLrbAq3TLejkP4SMdjF4wbJ8c32QHV2JIUbU87NYboxkXM
        ONbnG3zAkQYgSY2uIWD7ErE426FEWhfmopY8x9MFSXVFZtnwXjAhnIebA7cF3sZV
        qDlu0T4HbC3et9qTR4LAsX8PfHPajDCr1+0qjanlHTHQ+5/Ln9c46LivgfueUZAl
        WAueMTwdYwBwdTKjGcHBo7geUQOzaMQBjK0TJ8/qnw0UtUw6KwJhznoy0BX2W51k
        MRgCrs8iwY+U9uUKF+XC1aWX8LT5TqKD9ycPS8oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:date:date:from:from:in-reply-to
        :message-id:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZB1SmT
        VXb/DBhdIDoqv1RCdUqDPfDt/MGWSX4mbI5iU=; b=Nlyil9avCwCdv0rrOpJvyc
        XhsdflkGI3IpUK7vT51BptcwstRCwvpI8Ipv5UhNOf3wGGLVTJgNlgVzwyIKuqpr
        lL+r5Ms3MhkVYhcYrlKvKxgolx5c9ls7GS08piYVjjwhw8Y4kh9MbLLVHdR6GlNx
        EltcFmqkQGXv5sdgO7UK+yZ2+rRFiS8XG16IuclYv8h3ckfZ8lEBEwhBIOa6fVlY
        +JlyERC5cWsOPV0iB0X8pE6la3yqcOkBTXlaQu/lbf7EXmrq6QwyAQqxNZ3IeUbt
        u+c1D6sr0HxoeQ7UAcuypDS8DJvKGGbynYuOn6uCxIrXru1U9OWhCDLiK6Y5OOWQ
        ==
X-ME-Sender: <xms:Q-YNYiN2ZpCN4WiY647BtDbIQ9bY20HEbsaqRk5HRN8GaSBCITOURg>
    <xme:Q-YNYg_b_RN1UszxuMRzZ0PY7YdRiTrLqgPq1YtgjE1Tfjj88jUtsu9qdHoPH1fQ2
    eTXHske2xUdeO41E_Q>
X-ME-Received: <xmr:Q-YNYpQXGoEIMdUFVPDsqzo-dQYCeFpxe3nd-zQrKzXJM2-aCu292fUsP72xcm18TL8mNycGfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeejgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffosedttdertdertddtne
    cuhfhrohhmpeffrghfnhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhm
    rghilhdrtghomheqnecuggftrfgrthhtvghrnhephefftddtfeeljeehueeggfefieejfe
    ejffehffetiedugedvjedvtedvgedvleffnecuffhomhgrihhnpehlkhhmlhdrohhrghen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghfnh
    grsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:Q-YNYitunsKZGx4a2wfGeWgc60uZH1mLyaWorWEy3qDZ0C9Iw7TyDQ>
    <xmx:Q-YNYqdOV0rx6GYbuGothdanIrO3yskZ8kihWqher20WJMoZ0agA6g>
    <xmx:Q-YNYm0jseynqDHIwQ9K5gG-c9THvMDqjKQfvgZzb6jev23Z5j3Egw>
    <xmx:Q-YNYhwNjmLSp5MEo9pSWDv1Mj5CyJsaleIhGBLInL-iLv_9wjWYVw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Feb 2022 01:08:00 -0500 (EST)
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     ezequiel@vanguardiasur.com.ar
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, ribalda@chromium.org, tfiga@chromium.org,
        senozhatsky@google.com, hch@lst.de, dafna@fastmail.com,
        kernel@collabora.com
Subject: [PATCH v3 0/4] stk1160: allocate urb buffs with the DMA noncontiguous API
Date:   Thu, 17 Feb 2022 08:07:20 +0200
Message-Id: <20220217060724.7763-1-dafna@fastmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This set replaces urb buffers allocation to use the DMA
noncontiguous API. Similarly to a commit sent to uvc: [1]
This improves performance on ARM while not damaging performance
on other platforms. The cpu performance on ARM
improves because the new API does not cause the cache disable on ARM
while the coherent API do.
Measurements are shown in patch 4/4

[1] https://lkml.org/lkml/2021/3/12/1506

Patches Summary:
* patches 1+2 are bug fixes.
* patch 3 changes the way data is stored. This is a preparation
to patch 4.
* patch 4 is the change of API to use the noncontiguougs.

Since changes on v3 are minors, I only tested that the driver works but not tested performance again.

Changes since v2:
1. improve commit log for patch 4, and "s/stk_free_urb_buffer/stk1160_free_urb/"

Changes since v1:
1. reduce line length to be not too longer than 80 char
2. reformulate commit log of patch 4/4 and add measurements results
3. in patch 4, invalidate the vmap range before the direct mapping range.
4. test regressions for patches 1-3 (not including patch 4) and improve vars names
5. patch 2 is a new bug fix I found
6. patch 1 is extended to fix two cases of not allocating all intended urb buffers.

Dafna Hirschfeld (4):
  media: stk1160: fix number of buffers in case not all buffers are
    created
  media: stk1160: If start stream fails, return buffers with
    VB2_BUF_STATE_QUEUED
  media: stk1160: move transfer_buffer and urb to same struct
    'stk1160_urb'
  media: stk1160: use dma_alloc_noncontiguous API

 drivers/media/usb/stk1160/stk1160-core.c  |   2 +-
 drivers/media/usb/stk1160/stk1160-v4l.c   |  16 ++-
 drivers/media/usb/stk1160/stk1160-video.c | 142 ++++++++++++----------
 drivers/media/usb/stk1160/stk1160.h       |  23 +++-
 4 files changed, 104 insertions(+), 79 deletions(-)

-- 
2.17.1

