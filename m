Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 763E42AD0E6
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 09:10:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730302AbgKJIK6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 03:10:58 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:33589 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729564AbgKJIK5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 03:10:57 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id cOjrkgSkFRiwVcOjvkXlBN; Tue, 10 Nov 2020 09:10:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604995855; bh=blpVm819dBiwUwf0QFD+gCt5GW53ZlRmzlF2FqFZ9lo=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=HuhfuzprG/pu/cpsDCwHzOlWDpHGQmqV/HRyRv6qrI6x+HekwzuO3AsIz5qjN0v2/
         g37ZeCWyouA5LT9F/DNT+PSRF84l+k5dceAbCJJtERvGl182JGTpB/do78hOtzC6DW
         jxzEY9HERyZDqDVaXELDFH/TfxNUwJfirhkLiY+Q6XPTGWeCHEuUpHyBQd8LXJLmM6
         LcQuCnHKhHLv2LhtHi1zdvG67Vwr1W5Y7/dg2Gte/QQSICPUnfSdqrbmxnKQAYqT35
         Pqd7HnYu/ktoi5hBPkAuI9nkCiRb3C6gCV/aQhM9C47lALR1VThX7LFTwUsIEbvcAd
         tfFlBhD7V6bvw==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] saa7134: fix smatch error
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <22c95835-960d-d0af-b171-55c9d590676f@xs4all.nl>
Date:   Tue, 10 Nov 2020 09:10:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEgOUXNPg5TQQi7cTnV/VYiEYmClqIZ4aLN+s7c7EYNAQzIk46WiKWaUKpWAGcW+nkpI66IMXRjn5Qu8Tj8ELXSKT/y21h2yIUyXy44xlHszOk+DrTxG
 IdPSt2ELZAnHoDdgronj3Cghi+lncFo08OvnQg9NL+sM7wdNdFWAMF6cdcbJ8Unws/S4CIm+lLjaba2drHVe6AmCq9Tl5q+21/g=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix this smatch error:

saa7134-video.c:1286 saa7134_g_fmt_vid_overlay() error: we previously assumed 'f->fmt.win.clips' could be null (see line 1279)

This is actually a false error since if f->fmt.win.clips is NULL, clipcount
will be set to 0, so the clips array won't be touched, but it doesn't hurt
to make this explicit in the code.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/saa7134/saa7134-video.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index c24716f4ce23..0f9d6b9edb90 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -1276,8 +1276,10 @@ static int saa7134_g_fmt_vid_overlay(struct file *file, void *priv,
 		return -EINVAL;
 	}
 	f->fmt.win = dev->win;
-	if (!f->fmt.win.clips)
-		clipcount = 0;
+	if (!f->fmt.win.clips) {
+		f->fmt.win.clipcount = 0;
+		return 0;
+	}
 	if (dev->nclips < clipcount)
 		clipcount = dev->nclips;
 	f->fmt.win.clipcount = clipcount;
-- 
2.28.0

