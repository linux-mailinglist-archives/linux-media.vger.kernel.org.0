Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39728F1F38
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 20:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731769AbfKFTrm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 14:47:42 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:52553 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728979AbfKFTrm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 14:47:42 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1Mgek6-1i16o70uBI-00h84C; Wed, 06 Nov 2019 20:47:27 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        y2038@lists.linaro.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Daniel Mentz <danielmentz@google.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 1/8] media: documentation: fix video_event description
Date:   Wed,  6 Nov 2019 20:47:08 +0100
Message-Id: <20191106194715.2238044-2-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191106194715.2238044-1-arnd@arndb.de>
References: <20191106194715.2238044-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:USd+zjGhsVQ171cwgzKSCGkCnuWKIcZHhQMm4T+G6SZpZ8lVk4K
 xKfhnhjlrTcXJZZz+0hJDMaKeeXqiIVlx8vdGH9QvhsT3LypB7Qruq89EEDFJro5KzjOG5+
 ayClBPWJi243PXXXZFuvRN9wsfO1n9koZ+57if+Terf9gd/MnXj5hs3w3K9vQlzUWJnVeAg
 4TZfPpNcwzERd4mh4UsBQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/rV5c7aC60k=:4snmqiZwLZVgaVDcBqJwUq
 rLcl4nD9asyN0+982ZlyNVGj0Pa1Bp3fR5rzKUBEdPkFgIjMlUUZWI3cRO0leoIZmboya7L9+
 kOu9WCrXCG8Y6868sSQeyMZQ480CMj5jgE/j37mI1Vi2ReteUoDMVL25YQ8JI33klf0pCsjFK
 3CJhfNc1JhrXLEH1sPFdJdd33DkujOv2ZgokGPqtPwKINrf49KGRgth1ItnH4/ZdKhk1d7E4C
 +oYcPCTDyKgy8+PU7n6iWeAlznSMj8H+GVatPMY3Cmyqmdtzk8nulI4ERTIehB+L9Gui0EBWk
 AaN97ZK0VczRMzj0PmYkxuLur5/CAZ6UFT/qaLCDPc8amNqeQ8oG0tGCEg9UI239aO+ZbmwCR
 ACShg2m7CWA7bYt1LeYF8XqJ01DORGwsprNfDk+PDOZvGPVaEGOy0Hg6eu68Ebpc04bi2TgWj
 O+OtLRWYpWcyN0pcU8s81wHnRZRDAJE8Nk/YXstD7s3FwZJM2OIqQLTvcGqCoR66ZmYc9vCX3
 s3uiSXGm1FIv1eJ6HpVTaBYTE6PKPM5DPwH6GTP2aa5adO93+ijVoCosXqgEt4NCQigZHy7Rp
 K35jo8gvcds0ZXEdjDbRm/YLjK9Jdg8zSq5gZsSQS0sTcpzNqpaUb+OhErG5Yjx840H/OfLrF
 YQ6Mk+R2vDhTedIfAqvv08q4JdkqcPOFyQR629EsdHNDVomAq4m8NGbJWCBRf+heH6a0bNVHS
 tIPOWRughb9KwmHht7OfOLwid8kKaMjCWZGl38of+rZ1wahbs9ZVB6t2A2qqcVBkKX4qDBI7H
 sxZJLbMKCOOHBGQAr5+lvm3WFh6vp7o56OHKAGdzyLmU38S499tb4O1v0a6GJqPiqrCEt4LJB
 d+S5cOD4NacuSfNL1+1g==
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

