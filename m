Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581FC1ADCD1
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 14:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730547AbgDQMCV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 08:02:21 -0400
Received: from turbocat.net ([88.99.82.50]:38278 "EHLO mail.turbocat.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730483AbgDQMCU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 08:02:20 -0400
Received: from hps2020.home.selasky.org (unknown [62.141.129.235])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id 88B44260072;
        Fri, 17 Apr 2020 14:02:15 +0200 (CEST)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
From:   Hans Petter Selasky <hps@selasky.org>
Subject: [PATCH] [V4L-UTILS] Fix print formatting warning for clang.
Message-ID: <540157d4-36af-0b3d-cf15-82c5f0853e92@selasky.org>
Date:   Fri, 17 Apr 2020 14:01:19 +0200
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pixelclock is 64-bit and make sure the else case is also 64-bit.

Signed-off-by: Hans Petter Selasky <hps@selasky.org>
---
  utils/media-ctl/media-ctl.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
index 6661b487..455b92a3 100644
--- a/utils/media-ctl/media-ctl.c
+++ b/utils/media-ctl/media-ctl.c
@@ -213,7 +213,7 @@ static void v4l2_subdev_print_dv_timings(const 
struct v4l2_dv_timings *timings,

  		printf(" %ux%u%s%llu (%ux%u)",
  		       bt->width, bt->height, bt->interlaced ? "i" : "p",
-		       (htotal * vtotal) > 0 ? (bt->pixelclock / (htotal * vtotal)) : 0,
+		       (htotal * vtotal) > 0 ? (bt->pixelclock / (htotal * vtotal)) : 
0ULL,
  		       htotal, vtotal);

  		printf(" stds:");
-- 
2.26.0
