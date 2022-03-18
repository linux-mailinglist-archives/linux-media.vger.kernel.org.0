Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C598B4DE356
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 22:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240990AbiCRVQ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 17:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbiCRVQ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 17:16:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66222D4456;
        Fri, 18 Mar 2022 14:15:09 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7855F8F;
        Fri, 18 Mar 2022 22:15:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647638108;
        bh=Na+Khdu7qpM+zNB7HPPlbKyuDqSEBJssmhgJhcSc78Q=;
        h=From:To:Cc:Subject:Date:From;
        b=Zhw1jOHrzgvCopfan+PsybiD4m1bPemUXKRNM0qRahNeYI5Zt+jrEMXOyjfJYytP8
         RXxxI+Jc/poNrMuYi7iz3ZsIn0nG3qPvd7lBTRZTmyYQSlQkuMHyZrFsrG0tUs/SMY
         FiSlg91dR17qJg1HTbkKYTr3IWqtIn5vZ+mYfiQ0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 0/3] media: videobuf2: Expose vb2_queue_is_busy() to drivers
Date:   Fri, 18 Mar 2022 23:14:43 +0200
Message-Id: <20220318211446.11543-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series exposes the vb2_queue_is_busy() function,
currently internal to videobuf2-v4l2.c, to drivers. The rationale is
explained in patch 1/3, and the first use case shown in 3/3: it allows
implementing additional checks at streamon time while keeping the owner
check first (as it's cheap, compared to other checks that can be more
expensive).

Patch 2/3 is a driver-by cleanup.

Laurent Pinchart (3):
  media: videobuf2-v4l2: Expose vb2_queue_is_busy() to drivers
  media: vsp1: Don't open-code vb2_fop_release()
  media: vsp1: Use vb2_queue_is_busy()

 .../media/common/videobuf2/videobuf2-v4l2.c   | 26 +++++++------------
 .../media/platform/renesas/vsp1/vsp1_video.c  | 12 ++-------
 include/media/videobuf2-v4l2.h                | 23 ++++++++++++++--
 3 files changed, 33 insertions(+), 28 deletions(-)


base-commit: 71e6d0608e4d1b79069990c7dacb3600ced28a3b
-- 
Regards,

Laurent Pinchart

