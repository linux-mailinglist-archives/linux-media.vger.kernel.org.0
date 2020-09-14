Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D49432687E4
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 11:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgINJEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 05:04:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:37872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbgINJDg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 05:03:36 -0400
Received: from mail.kernel.org (ip5f5ad5d8.dynamic.kabel-deutschland.de [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A01E22242;
        Mon, 14 Sep 2020 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600074215;
        bh=rUom+ejH2KZs2/WGPKIpoScZ0HYybm2vQ1/DgHzt874=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Pgfeyt0zuR7H16d4cOPD/32sXIYPFFyKmxJgvYFlrPQvkrG9IABFDDd06GNtdpZlc
         lD15ZrkzhS70ci96pFmE4x7a/GevkXGXzWau2UiUHWkI9/JGYiO2kqGZLTt2ykcgeL
         Z8fStYZRGt5PBUm9uuBxfsHH7KedfAO2sINapFP8=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kHkOW-002dzg-4R; Mon, 14 Sep 2020 11:03:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH RFC 07/11] media: vidtv: remove a wrong endiannes check from s302m generator
Date:   Mon, 14 Sep 2020 11:03:22 +0200
Message-Id: <23a923f8ff24fe06565c4720572bef16b82ef03d.1600073975.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600073975.git.mchehab+huawei@kernel.org>
References: <cover.1600073975.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code there is already doing the right thing, as it uses
value & 0xff, value & 0xff00, which already ensures the
expected endiannes.

So, it doesn't make any sense to touch the order depending on
the CPU endiannes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_s302m.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index 5ae2ede951eb..1bab2e231a55 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -352,14 +352,6 @@ static u32 vidtv_s302m_write_frame(struct vidtv_encoder *e,
 	f.data[3] = (sample & 0x0FF0) >>  4;
 	f.data[4] = (sample & 0xF000) >> 12;
 
-	#ifdef __LITTLE_ENDIAN
-	f.data[0] = reverse[f.data[0]];
-	f.data[1] = reverse[f.data[1]];
-	f.data[2] = reverse[f.data[2]];
-	f.data[3] = reverse[f.data[3]];
-	f.data[4] = reverse[f.data[4]];
-	#endif
-
 	nbytes += vidtv_memcpy(e->encoder_buf,
 			       e->encoder_buf_offset,
 			       VIDTV_S302M_BUF_SZ,
-- 
2.26.2

