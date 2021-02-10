Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21DB5317024
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 20:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234437AbhBJTaF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 14:30:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:35484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233591AbhBJTaB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 14:30:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1FF464E74;
        Wed, 10 Feb 2021 19:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612985361;
        bh=f4eqWFuVO5ge+SyCC4GeWYJf01hOXe879q5QVVCru10=;
        h=Date:From:To:Cc:Subject:From;
        b=GaSmnmskgOV+nI0qH9DR293mu+sTX7buSqPxCvXaRdM1LL07DfgUWkpN8bu/uyrdl
         FtzZcipnivtvomxW3YmAeNn+k70pV1HBvEzuUZJnRcwT52pFIXT8WDfHRQRQksYPI6
         fky0J8ueuSedZShThRpiF89VjFDZi3B8XhG4/n0CuQYpGtQ0g3beHISI601xsMUtst
         b1Qq/R2URV3gUf0kZ95DHQrf4Q99tSKlYeLh02oYYhG41EvHhA83ZZZemrb5hWrAoJ
         LL420x9lM+9bLwO6pnQY7sqCJy7CMn5RpNBCovCyCiPSMcOusr8W6KK9NJSiee5HoQ
         dXfHeJqUB9oPg==
Date:   Wed, 10 Feb 2021 13:29:18 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH][next] media: uvcvideo: Remove duplicate assignment to
 pointer dma_dev
Message-ID: <20210210192918.GA838969@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove redundant assignment to pointer dma_dev.

Fixes: fdcd02a641e2 ("media: uvcvideo: Use dma_alloc_noncontiguos API")
Addressses-Coverity-ID: 1501703 ("Evaluation order violation")
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/media/usb/uvc/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index dc81f9a86eca..edf451a956d8 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1105,7 +1105,7 @@ static inline struct device *stream_to_dmadev(struct uvc_streaming *stream)
 
 static void uvc_urb_dma_sync(struct uvc_urb *uvc_urb, bool for_device)
 {
-	struct device *dma_dev = dma_dev = stream_to_dmadev(uvc_urb->stream);
+	struct device *dma_dev = stream_to_dmadev(uvc_urb->stream);
 
 	if (for_device) {
 		dma_sync_sgtable_for_device(dma_dev, uvc_urb->sgt,
-- 
2.27.0

