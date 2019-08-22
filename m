Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C78698FD2
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 11:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731976AbfHVJg6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 05:36:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38486 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbfHVJg5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 05:36:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id BFA71C08C33E;
        Thu, 22 Aug 2019 09:36:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com [10.36.116.60])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1B1BD5D712;
        Thu, 22 Aug 2019 09:36:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 6A16297A1; Thu, 22 Aug 2019 11:36:54 +0200 (CEST)
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     dri-devel@lists.freedesktop.org
Cc:     laurent.pinchart@ideasonboard.com, daniel@ffwll.ch,
        Gerd Hoffmann <kraxel@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] udmabuf: check that flags has no unsupported bits set
Date:   Thu, 22 Aug 2019 11:36:54 +0200
Message-Id: <20190822093654.23752-4-kraxel@redhat.com>
In-Reply-To: <20190822093654.23752-1-kraxel@redhat.com>
References: <20190822093654.23752-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 22 Aug 2019 09:36:57 +0000 (UTC)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reported-by: Yann Droneaud <ydroneaud@opteya.com>
---
 drivers/dma-buf/udmabuf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 6c3ec8fcef01..ca1364102b18 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -131,6 +131,9 @@ static long udmabuf_create(const struct udmabuf_create_list *head,
 	int seals, ret = -EINVAL;
 	u32 i, flags;
 
+	if (head->flags & ~UDMABUF_FLAGS_CLOEXEC)
+		return -EINVAL;
+
 	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
 	if (!ubuf)
 		return -ENOMEM;
-- 
2.18.1

