Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB9951957
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 19:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732328AbfFXRLO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 13:11:14 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45540 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732325AbfFXRLO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 13:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=/iTMJD57KHo/L9NbSTMb1BtaYZU9WBXTvdeVbmej5vU=; b=TNVcWyvcUS/eVggZlMEDBox0d
        aE6vB42IEaaqul3lBve9H+wY3HGx80/6y6PmaMjMT2ji9hZceNezrX9KUzgSsqNOOf3tcC4x9qFXC
        Atw9Asnu2TIpbjrM3waIEQRoBuzDHy4Yz/JG0eotHRUBnTBs2+9vL1GBCOa32fHEWuEEZ0bIcQaq9
        dCnnZ9CuWT/CqW58S8BTlELWiCnYN8UoAUSCBOevZriTTLH/WxLaYlWjs43/YAvdzZBySyj/JVn8T
        GRAY9gzMiuxSfEUqBzWhPL3waq5fETI0LhkJ2yiIA98viKZ3TZ/3hPhOWHtcqJCz73GZEWa0YoEep
        fPEIS8okw==;
Received: from 177.205.71.220.dynamic.adsl.gvt.net.br ([177.205.71.220] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hfSUs-0001zc-3p; Mon, 24 Jun 2019 17:11:14 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hfSUp-00050a-7A; Mon, 24 Jun 2019 13:11:11 -0400
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] media: cafe-driver: mark an static var as such
Date:   Mon, 24 Jun 2019 13:11:10 -0400
Message-Id: <932952e525e5c8d38cf3df4a3265be5652d57c97.1561396268.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As warned by sparse:

	drivers/media/platform/marvell-ccic/cafe-driver.c:475:23:  warning: symbol 'ov7670_info' was not declared. Should it be static?

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/platform/marvell-ccic/cafe-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/marvell-ccic/cafe-driver.c b/drivers/media/platform/marvell-ccic/cafe-driver.c
index 16602628f895..37fdcc53a1c4 100644
--- a/drivers/media/platform/marvell-ccic/cafe-driver.c
+++ b/drivers/media/platform/marvell-ccic/cafe-driver.c
@@ -472,7 +472,7 @@ static struct ov7670_config sensor_cfg = {
 	.use_smbus = 1,
 };
 
-struct i2c_board_info ov7670_info = {
+static struct i2c_board_info ov7670_info = {
 	.type = "ov7670",
 	.addr = 0x42 >> 1,
 	.platform_data = &sensor_cfg,
-- 
2.21.0

