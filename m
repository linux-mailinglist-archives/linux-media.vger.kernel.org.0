Return-Path: <linux-media+bounces-20316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A15359B0350
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 15:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2726DB21CCF
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 13:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FA570809;
	Fri, 25 Oct 2024 13:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NFapoBFS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE24F206500
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 13:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729861407; cv=none; b=BQ1L8Kvgwkp2MXetJCpk2p0kIHtapDtQ5sL6AovzUHlRV+uKGNPlYSQfVlWc9rxek2UFr0uvAPWGK3gzYG1budgO5yGX4ROFlxiFsnFCiCIv2fPHWsum0jb2dpp9+EXESn83nzhfYbQwzqpTkeiv6nvMkZ3V0ebJH1fQxy1tZjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729861407; c=relaxed/simple;
	bh=Bifk+jE1WunCg65HBGm/KqkzAgaA8iNwDTwL+jGd1MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nwsQa3MIZE8ChG1sYJtenoQ7SWKhi+x2tZaWVyyrT2rOLlnLWb7GDks+qGb2cz1nQXGy6VFfaV196HtSQQ7wxgDSguGlJhDsXfgzi3dR7o/Y0LRsLq5cNwI/spA73VYHHGR3ApwmC+UHQ50cByqbcjAJp+JvXSeVW1Tu01fy4nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NFapoBFS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3DFA229;
	Fri, 25 Oct 2024 15:01:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729861289;
	bh=Bifk+jE1WunCg65HBGm/KqkzAgaA8iNwDTwL+jGd1MQ=;
	h=From:To:Cc:Subject:Date:From;
	b=NFapoBFSxAY773H7mbmKWBa7IIuT30pQ/rqTAnv4kj0a9zrllhSaRNAVGRyFZ5MCY
	 fDUHhc6ykYeYKzkzzhuoVEYhAHtnB97aSjq2K9shRy2m5qGMPx2twW2wrcpbbsj5MG
	 ux3HKAHHtm4qF8hu032wNU34ANxb3lFXEaBf48hs=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH] media: dw100: Rectify rounding error
Date: Fri, 25 Oct 2024 18:33:00 +0530
Message-ID: <20241025130300.227817-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Klug <stefan.klug@ideasonboard.com>

The current scaler code fails in many cases which can be validated
by the following python script:

```
error_count = 0
valid_count = 0

def check_scaling_error(src_w, dst_w, add_point_five):
    global error_count
    global valid_count

    qscale = (dst_w << 16) // src_w

    if (add_point_five):
        delta = 1 << 15; # 0.5 in Q16.16
    else:
        delta = 0

    scaled_w = ((((src_w << 16) + delta) * qscale) >> 32)
    if dst_w != scaled_w:
        print(f'scale_error: src_w: {src_w} | dst_w:{dst_w} | scaled_w:{scaled_w}')
        error_count += 1
    else:
        valid_count += 1

print(f'==== Test without delta=0.5 ====\n')
for i in range(1000, 1920):
    check_scaling_error(1920, i, False)
print(f'Error: {error_count} | Valid: {valid_count}\n\n')

error_count = 0
print(f'==== Test with delta=0.5 ====')
for i in range(1000, 1920):
    check_scaling_error(1920, i, True)
print(f'Error: {error_count} | Valid: {valid_count}\n\n')
```

Excerpt of the output is retrieved:
```
	==== Test without delta=0.5 ====
	...
	...
	scale_error: src_w: 1920 | dst_w:1915 | scaled_w:1914
	scale_error: src_w: 1920 | dst_w:1916 | scaled_w:1915
	scale_error: src_w: 1920 | dst_w:1917 | scaled_w:1916
	scale_error: src_w: 1920 | dst_w:1918 | scaled_w:1917
	scale_error: src_w: 1920 | dst_w:1919 | scaled_w:1918
	Error: 859 | Valid: 61

	==== Test with delta=0.5 ====
	Error: 0 | Valid: 981
```
Hence, fixing the scaling rounding error by adding 0.5 to the
frame dimensions before applying the scale.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/media/platform/nxp/dw100/dw100.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 42712ccff754..541706f0aec4 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -984,6 +984,7 @@ static int dw100_s_selection(struct file *file, void *fh,
 	u32 qscalex, qscaley, qscale;
 	int x, y, w, h;
 	unsigned int wframe, hframe;
+	uint32_t zero_point_five;
 
 	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
@@ -1032,8 +1033,9 @@ static int dw100_s_selection(struct file *file, void *fh,
 			}
 		}
 
-		w = (u32)((((u64)wframe << 16) * qscale) >> 32);
-		h = (u32)((((u64)hframe << 16) * qscale) >> 32);
+		zero_point_five = 1 << 15;
+		w = (u32)(((((u64)wframe << 16)+zero_point_five) * qscale) >> 32);
+		h = (u32)(((((u64)hframe << 16)+zero_point_five) * qscale) >> 32);
 		x = x + (sel->r.width  - w) / 2;
 		y = y + (sel->r.height  - h) / 2;
 		x = min(wframe - w, (unsigned int)max(0, x));
-- 
2.45.2


