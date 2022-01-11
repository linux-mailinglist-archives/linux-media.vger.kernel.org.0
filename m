Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E5948A800
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 07:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348344AbiAKG4L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 01:56:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348346AbiAKG4I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 01:56:08 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B92DEC061748
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 22:56:07 -0800 (PST)
Received: from localhost.localdomain (unknown [IPv6:2a00:c281:14a3:8100:8072:ec19:b639:c4ab])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9B4921F4409C;
        Tue, 11 Jan 2022 06:56:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1641884166;
        bh=j5OnR8ANVCgZqZsxw/wpEaZSyNAbRPFo6sD9S11Mreo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EBjsURxh3O4eMp+LHzEC4IgNJvfHN7F5wTBm2BVA09gNQZMwiEYmoR1GJ3InQYSAq
         zfaVv0xgHWFlHUMsPSCw16RC9YV2r89kKE7YhoZURNP+n6QFhb1n4UqQn93SnhkJZX
         hgHDyVLDr6QuQ4mxV39CnUoLt9jxcc0hAlxYV/XGGMdSyM1KuZOxxFrU4Z8C3L1+HW
         vkyjmtpE+UtICdPhirzAdvsW1LiX0+ODTVFf8y5R0t5OjTpgV8/BUD/A9FG23x+SV5
         wBkj0z72mV2k0CCPwF7DKmlufXQd4GUQ2BJgoGK5lBQ8RHnTGl6hdflX7ij5FT5hrA
         5dGykz1FXeQSw==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     ezequiel@vanguardiasur.com.ar
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, ribalda@chromium.org, tfiga@chromium.org,
        senozhatsky@google.com, hch@lst.de,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com
Subject: [PATCH 1/3] media: stk1160: fix number of buffers in case not all buffers are created
Date:   Tue, 11 Jan 2022 08:55:03 +0200
Message-Id: <20220111065505.6323-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220111065505.6323-1-dafna.hirschfeld@collabora.com>
References: <20220111065505.6323-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In case we fail to allocate a transfer_buffer then we
break the buffers creation loop and update the number of
buffers to the number of successfully allocated which should
be 'i' and not 'i - 1'

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/usb/stk1160/stk1160-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 202b084f65a2..91bd6adccdd1 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -511,9 +511,9 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 	usb_free_urb(dev->isoc_ctl.urb[i]);
 	dev->isoc_ctl.urb[i] = NULL;
 
-	stk1160_warn("%d urbs allocated. Trying to continue...\n", i - 1);
+	stk1160_warn("%d urbs allocated. Trying to continue...\n", i);
 
-	dev->isoc_ctl.num_bufs = i - 1;
+	dev->isoc_ctl.num_bufs = i;
 
 	return 0;
 
-- 
2.17.1

