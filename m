Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98239398DD7
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 17:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbhFBPHM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 11:07:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:37148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231163AbhFBPHK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 11:07:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9E18613D8;
        Wed,  2 Jun 2021 15:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622646327;
        bh=/VW98BgUxBbnSJt1QxDOoQylKRCwxutfrTn0iL4Fd+c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fjab3ZAN6VOblK9+K+BfCs3qvRr83jIvsquOfOPwICcGmGj1wHAXxnigg8Nx73Hr/
         Iekz8fljMvBFTWhvt9ZvwY+rMl/CUtK+d1Z+C5nEkOGXnuFJSegQAbTnRPEylob7/B
         z76RTJVF512p3TUVYoX7MsELJu9UNOsXbF9XdGvzOCtB1ddUcgWUJ4ZSZBDKFrgHO1
         sekdekop49Pb6U9VV4cmp8FBl7+SB1hD8EBDNE7czMleN4E2Tdn/+p1x73Y85U9Ykv
         PcMHVH7vLfHKJqtp9NZey8xYwwAo1EXatXBtWGGQE6CeCcoi7/FHXGaYwMTTDMMBoj
         aqTr4TTTJ0t1w==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1loSQu-006War-Un; Wed, 02 Jun 2021 17:05:24 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 5/6] media: rc: ite-cir: replace some an EN DASH
Date:   Wed,  2 Jun 2021 17:05:22 +0200
Message-Id: <2b66c88a59b270f26c826e6eeb498a12168de7ef.1622646256.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622646256.git.mchehab+huawei@kernel.org>
References: <cover.1622646256.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of using U+2013 ('–'): EN DASH, let's just use an
hyphen there, as this was probably introduced by some cut-and-paste
from some other place.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/rc/ite-cir.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/ite-cir.h b/drivers/media/rc/ite-cir.h
index ce7a40b10828..4b4294d77555 100644
--- a/drivers/media/rc/ite-cir.h
+++ b/drivers/media/rc/ite-cir.h
@@ -167,7 +167,7 @@ struct ite_dev {
  * hardware data obtained from:
  *
  * IT8712F
- * Environment Control – Low Pin Count Input / Output
+ * Environment Control - Low Pin Count Input / Output
  * (EC - LPC I/O)
  * Preliminary Specification V0. 81
  */
-- 
2.31.1

