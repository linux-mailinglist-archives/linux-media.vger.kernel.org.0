Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39701F816E
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 21:39:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbfKKUip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 15:38:45 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:49245 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbfKKUip (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 15:38:45 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MqqLB-1i7uDG1Fxp-00mv3t; Mon, 11 Nov 2019 21:38:39 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
        y2038@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v4 1/8] media: documentation: fix video_event description
Date:   Mon, 11 Nov 2019 21:38:28 +0100
Message-Id: <20191111203835.2260382-2-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191111203835.2260382-1-arnd@arndb.de>
References: <20191111203835.2260382-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5zY86Zg2X7OpNRN+ymwONVDbgqel0wnkoWEwvm3mpfHV4abDbbv
 J4JgHP55At7vExyyNfizEhDB3c9UO7e5sChRli0Gskpb1Va8zPq209ZiJY8yAsD4IcxNBAc
 /K983IG/2HElRxP8bP9w9JzQHaiAwXnPOzDOgyl/DfiaDESZhezreYIJmNTBmJHuoolC0Gj
 JqY9KOwyRr7WYfJmnOWsA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WtBLRW8rGO0=:EJoxFI9//tF52eUhaE/+Ix
 Gz/ScRgBG4lUhddk/4of/+cdRpakodA7+uWeRf1VbRxW6hJS7UbcMU8Vs32qTHDE9vMp/IZXc
 Cuj56PjoewPgM36OjOSG62gggxztKsDpOdL3Cp0CvLp2spa9pD6mgkiaPKHApSrNatIa1fZdV
 lXUUg3796V+loZT6hoe7ibM8SSo646Zk5ED0gl+v09Wj3XHff5gjFcbOGjMIg8GL49h0aNN+Q
 vDTVu82yTXOoLoeBoPQXpBfm4lERWva1hUIsrTHDS64wo3M7QhAXESbFGDuh3D/jZWmKeYPpJ
 zYLOjHWxt8disX5RN0SK9E28L7gCY1t0cp5Z9+OkMw3eJXzYXL4IZ7g7ILYvU6PSDVYWkLZoh
 CzBhCKrsV7rwSDWuUZIrjQ7DIN/t/YZnh4n0gwDpZJLT1Qub+H6bBb+vfNNUDqxjVOymgXp1b
 +GFuQXyjsnUZxad1RxiES0+p3YSilykybiWA7woW1hG9WGqoa1MWaSQsYSZcJJsv/RoK7K296
 N7CycwgcLB2S9QONQGcrzGgsAM0hgS7clZFy2Dw9yFyMEATWdpiCSZxGMrfSVBU1Y1wDnzTNL
 0EdzljOVBJY1Vt1GYBoqURDQ/lbOk0vmhFDVrrqMPdOwK1XxsKGiscdTRjPDiNULpQmnTZ04m
 FPhg/AtXzv5EWQS8XUwDNY3PyovUpq+ZBs6E2En5inMdpodCtqYW9taXRK7+2CWDLXlwx2Yk4
 A7dkQCF6mHKxxxXDQCJX3ZmgZkh4Cq4URKUkqe1X5soW0VMyExuVBtHvdeXYMQLAkDqJ863Pz
 4ti67AysEwEH9KBu2HTCJ6kvO/pW/eeOGCsHDYtbUsxguvhHue42iH8h5IY9V+mTJeOB9x8qo
 XmIxbD+IXhMWMyoru8bw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The type for the timestamp in video_event was changed to
'long' a long time ago, change the documentation to match.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/media/uapi/dvb/video-get-event.rst | 2 +-
 Documentation/media/uapi/dvb/video_types.rst     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/uapi/dvb/video-get-event.rst b/Documentation/media/uapi/dvb/video-get-event.rst
index def6c40db601..7f03fbe3d3b0 100644
--- a/Documentation/media/uapi/dvb/video-get-event.rst
+++ b/Documentation/media/uapi/dvb/video-get-event.rst
@@ -81,7 +81,7 @@ for this ioctl call.
 	#define VIDEO_EVENT_FRAME_RATE_CHANGED	2
 	#define VIDEO_EVENT_DECODER_STOPPED 	3
 	#define VIDEO_EVENT_VSYNC 		4
-		__kernel_time_t timestamp;
+		long timestamp;
 		union {
 			video_size_t size;
 			unsigned int frame_rate;	/* in frames per 1000sec */
diff --git a/Documentation/media/uapi/dvb/video_types.rst b/Documentation/media/uapi/dvb/video_types.rst
index 479942ce6fb8..2697400ccf62 100644
--- a/Documentation/media/uapi/dvb/video_types.rst
+++ b/Documentation/media/uapi/dvb/video_types.rst
@@ -170,7 +170,7 @@ VIDEO_GET_EVENT call.
     #define VIDEO_EVENT_FRAME_RATE_CHANGED  2
     #define VIDEO_EVENT_DECODER_STOPPED     3
     #define VIDEO_EVENT_VSYNC       4
-	__kernel_time_t timestamp;
+	long timestamp;
 	union {
 	    video_size_t size;
 	    unsigned int frame_rate;    /* in frames per 1000sec */
-- 
2.20.0

