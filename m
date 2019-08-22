Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47EC99A032
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 21:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391686AbfHVTjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 15:39:41 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59206 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389332AbfHVTjl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 15:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=RSitoDJz4cp7sECCKIxCe+i7CBRQ0J6tJd1l3i9ahjw=; b=ryisBR1755MQF2JA8y7uWhGt7N
        qVp4VOrktmGNz11oGS1R5/levY1FvXHSPs2DTwuO6q6SdXg5DVdTY+nSw1+NiD49G/U/TnZ3i9WZi
        Q6QYOIXLvPhBl4LmaQB9jjvdivL8xUFFTFl2+IOcpWOOB2sj3MAeCiZ1XriXimu85FpEja+Cvgqn9
        xs9AfehXdxRNYsUI/our+3ct/UV2R7mDh7TmRws25xWGg7KomSZDhi2pPmEZNpypX5IYdzCCGN0at
        TkfX6Nrt8DSTbGN6owvB9mZdq79//VZVMRH+xFv60BIzOKEZiUXqSrdGPmlQXYypJYWimzhH7Ow//
        ZS99B7qQ==;
Received: from [177.133.63.56] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i0svr-0002lT-KY; Thu, 22 Aug 2019 19:39:39 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1i0svo-0007IN-Em; Thu, 22 Aug 2019 16:39:36 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Eddie James <eajames@linux.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH 3/7] media: aspeed-video: address a protential usage of an unit var
Date:   Thu, 22 Aug 2019 16:39:30 -0300
Message-Id: <7c85f7dc159927a7316dc13f52697f157fb6e2bd.1566502743.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <4a411ba155eb062b6575aba0824123c840806c0b.1566502743.git.mchehab+samsung@kernel.org>
References: <4a411ba155eb062b6575aba0824123c840806c0b.1566502743.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While this might not occur in practice, if the device is doing
the right thing, it would be teoretically be possible to have
both hsync_counter and vsync_counter negatives.

If this ever happen, ctrl will be undefined, but the driver
will still call:

	aspeed_video_update(video, VE_CTRL, 0, ctrl);

Change the code to prevent this to happen.

This was warned by cppcheck:

	[drivers/media/platform/aspeed-video.c:653]: (error) Uninitialized variable: ctrl

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/platform/aspeed-video.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index f899ac3b4a61..4ef37cfc8446 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -630,7 +630,7 @@ static void aspeed_video_check_and_set_polarity(struct aspeed_video *video)
 	}
 
 	if (hsync_counter < 0 || vsync_counter < 0) {
-		u32 ctrl;
+		u32 ctrl = 0;
 
 		if (hsync_counter < 0) {
 			ctrl = VE_CTRL_HSYNC_POL;
@@ -650,7 +650,8 @@ static void aspeed_video_check_and_set_polarity(struct aspeed_video *video)
 				V4L2_DV_VSYNC_POS_POL;
 		}
 
-		aspeed_video_update(video, VE_CTRL, 0, ctrl);
+		if (ctrl)
+			aspeed_video_update(video, VE_CTRL, 0, ctrl);
 	}
 }
 
-- 
2.21.0

