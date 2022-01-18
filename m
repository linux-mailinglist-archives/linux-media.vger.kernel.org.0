Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC37491B00
	for <lists+linux-media@lfdr.de>; Tue, 18 Jan 2022 04:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348374AbiARDDX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jan 2022 22:03:23 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:35086 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349179AbiARCri (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jan 2022 21:47:38 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C7057612CC;
        Tue, 18 Jan 2022 02:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E52FC36AEF;
        Tue, 18 Jan 2022 02:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642474057;
        bh=Bom9tySjE4yaK810prdtgeNbiLhRB7EH8JZuDDgOKlw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NAIKIaJ0zzf5FRjwyNcLILmNsUp8Mhi7kQF7NNTP75M9BnQFKkPq7i1VmRGMg99Ni
         AOYjx7JbUk06rUFBPJ0qGHb0u02Z3DHDG+0Zn4bKdmhREAN3QTHKZzZS81Q/XltSv3
         aB/72jYkW5Bs71eAn1dt5wIR/1n8LgmayG8lDir7PgOlNFJ4agV7ZVTt3ADnyYwei5
         oNZPqqS3ZNdPuPRdNDcHl0l69VcyYgKevCCNWldlPm3W/23WcTbTP3kVD+yOAVhk7Q
         EKBSQoncKzmcXbgXsUy5SKRjSZpRAP99nfwa5/Y6afpEnXB4TVzyXbouYoZi9CspoR
         R23aRGFnTIDFQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     James Hilliard <james.hilliard1@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 17/59] media: uvcvideo: Increase UVC_CTRL_CONTROL_TIMEOUT to 5 seconds.
Date:   Mon, 17 Jan 2022 21:46:18 -0500
Message-Id: <20220118024701.1952911-17-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118024701.1952911-1-sashal@kernel.org>
References: <20220118024701.1952911-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: James Hilliard <james.hilliard1@gmail.com>

[ Upstream commit c8ed7d2f614cd8b315981d116c7a2fb01829500d ]

Some uvc devices appear to require the maximum allowed USB timeout
for GET_CUR/SET_CUR requests.

So lets just bump the UVC control timeout to 5 seconds which is the
same as the usb ctrl get/set defaults:
USB_CTRL_GET_TIMEOUT 5000
USB_CTRL_SET_TIMEOUT 5000

It fixes the following runtime warnings:
   Failed to query (GET_CUR) UVC control 11 on unit 2: -110 (exp. 1).
   Failed to query (SET_CUR) UVC control 3 on unit 2: -110 (exp. 2).

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvcvideo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index a738486fd9d64..839ba3cc53119 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -176,7 +176,7 @@
 /* Maximum status buffer size in bytes of interrupt URB. */
 #define UVC_MAX_STATUS_SIZE	16
 
-#define UVC_CTRL_CONTROL_TIMEOUT	500
+#define UVC_CTRL_CONTROL_TIMEOUT	5000
 #define UVC_CTRL_STREAMING_TIMEOUT	5000
 
 /* Maximum allowed number of control mappings per device */
-- 
2.34.1

