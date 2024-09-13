Return-Path: <linux-media+bounces-18268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E698A978911
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 21:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 911791F23497
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 19:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5CA146A69;
	Fri, 13 Sep 2024 19:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GPbi36mQ"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BC41369BC
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 19:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726256545; cv=none; b=A6aii5q+GfVjc1YyluvgayV4r+owIFIhkX0BPH1mA8cuYpjijt/D8zsgvAWZ9M/XTYtCKYU14fr9JpHLYZYfDp/rWZVzrmppXa9vqklt3e8fHc98BmGAtp0pmtlEg3R3tlyKdR3JLtm7ykMLGLX+kSs/p6/w7/I7w1O+gp+zp5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726256545; c=relaxed/simple;
	bh=nT/o85bPbQESho1PukvvrJYaEfTWT7auewFvshPq6No=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dc8B11/fm0CUNNoyHRWiq2qvfEuH0AV8xL+wIIYpWGT7KWxG8ZfOFsdvcRFXDfGZieLa8qM5ad0ONF4ooPhUJZEiKABB1h1P1FNMTRiFgsjCVQ7ljQ21CoaELnT7kKl6jiX6HDgon7ADSdNx19RYelvwczfFELU2aJyT2ES3cmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GPbi36mQ; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48DJgCLo088942;
	Fri, 13 Sep 2024 14:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726256532;
	bh=K599b9Aej5YbajynpSGeDnjt6gJ2s3Jv6FnyYXfsoZw=;
	h=From:To:Subject:Date;
	b=GPbi36mQpeuGY2JduBC53lGrsh88KaYHgzR6Xf5FfQcyExnd+n5sD9SWVtoXhsaP/
	 Ngjle3v/ZRQOZhBVyWSsZDMVY6ZkuS6XFROdMTKKMGVr4AHjOaYODb9voi5Gp81UUb
	 OvJ8lkN9AmrwrgFczE6IyMY76hFII8cE4/s4D6nA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48DJgCe9119832
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Sep 2024 14:42:12 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Sep 2024 14:42:11 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Sep 2024 14:42:11 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48DJgB69055466;
	Fri, 13 Sep 2024 14:42:11 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1spCBH-0003F4-PK; Fri, 13 Sep 2024 14:42:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <linux-media@vger.kernel.org>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
Subject: [master][PATCH] yavta: Fix 32-bit compile
Date: Fri, 13 Sep 2024 14:42:11 -0500
Message-ID: <20240913194211.12423-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

The format for printing various time elements are not working for 64bit
times on a 32bit compile.

../git/yavta.c:2195:51: error: format '%ld' expects argument of type 'long int', but argument 8 has type '__time64_t' {aka 'long long int'} [-Werror=format=]
 2195 |                 printf("%u (%u) [%c] %s %u %u B %ld.%06ld %ld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
      |                                                 ~~^
      |                                                   |
      |                                                   long int
      |                                                 %lld
......
 2199 |                         buf.timestamp.tv_sec, buf.timestamp.tv_usec,
      |                         ~~~~~~~~~~~~~~~~~~~~
      |                                      |
      |                                      __time64_t {aka long long int}

Change the formats to be lld/llu to accommodate the change for 32bit
compiles.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 yavta.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/yavta.c b/yavta.c
index 3bf82b3..0655311 100644
--- a/yavta.c
+++ b/yavta.c
@@ -2192,12 +2192,12 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
 
 		clock_gettime(CLOCK_MONOTONIC, &ts);
 		get_ts_flags(buf.flags, &ts_type, &ts_source);
-		printf("%u (%u) [%c] %s %u %u B %ld.%06ld %ld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
+		printf("%u (%u) [%c] %s %u %u B %lld.%06lld %lld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
 			(buf.flags & V4L2_BUF_FLAG_ERROR) ? 'E' : '-',
 			v4l2_field_name(buf.field),
 			buf.sequence, video_buffer_bytes_used(dev, &buf),
-			buf.timestamp.tv_sec, buf.timestamp.tv_usec,
-			ts.tv_sec, ts.tv_nsec/1000, fps,
+			(long long int) buf.timestamp.tv_sec, (long long int) buf.timestamp.tv_usec,
+			(long long int) ts.tv_sec, ts.tv_nsec/1000, fps,
 			ts_type, ts_source);
 
 		last = buf.timestamp;
@@ -2254,8 +2254,8 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
 	bps = size/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
 	fps = i/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
 
-	printf("Captured %u frames in %lu.%06lu seconds (%f fps, %f B/s).\n",
-		i, ts.tv_sec, ts.tv_nsec/1000, fps, bps);
+	printf("Captured %u frames in %llu.%06lu seconds (%f fps, %f B/s).\n",
+		i, (long long unsigned int) ts.tv_sec, ts.tv_nsec/1000, fps, bps);
 
 done:
 	video_free_buffers(dev);
-- 
2.17.1


