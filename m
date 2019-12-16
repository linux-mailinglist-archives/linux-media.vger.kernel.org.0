Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 714A612084B
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 15:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbfLPOPX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 09:15:23 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:46103 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727916AbfLPOPW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 09:15:22 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N5n81-1heC4G3ZV5-017ASQ; Mon, 16 Dec 2019 15:15:15 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        y2038@lists.linaro.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Subject: [PATCH v6 1/8] media: documentation: fix video_event description
Date:   Mon, 16 Dec 2019 15:14:59 +0100
Message-Id: <20191216141506.121728-2-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191216141506.121728-1-arnd@arndb.de>
References: <20191216141506.121728-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:l65Lc1/FkWPwDQ+nv9GAC8gMZdZcNTsq7qLr/PeIeNXZa9/XQIc
 oHOZWL23uwgQVPrt/tC03iMLEaz1Q8YX37wJOlKdHMvYQml0tfYFTVKH/lQfTPrrrssRplC
 Zzio32EYpfRM/kf69UDAq69KRnvoEHiIhv3jH2vnd9e50ftDVK2e+7QzOwq4/4goCKg8fz2
 w03lYTlYR2bcVMym+7abQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5tOPNtrtlPc=:JAPgd2SD6cMSpFBDwA1Kif
 mx8vcZ8aoyEoLc5X9F6yqyBxsf7Jch+idU7Ae1Mp7QLm1tBzaoG7a2hQ1OKDwfUNIldR1e1RU
 5JxOCJTQxGK6zGqk+HOL6iEIlJ9Jd1XsBXZWIYUUP5we4PCnL9eeSRZpkmi1Q0I2TaUVF9BF3
 KcAzvQc28zUA/rBpBuO6o2M1hhK+dFgrVwF6PK6Z+B1Pae2qOfgwfZNN0wYU63fTZwxOSqu7/
 2IZ91VZ2pEthdaayS+uFRriVOQ+CuRRCUiE78sXnsaP1pZmJDfOwuMRhpFZHyh0uoZ8ebcwa9
 X/ZLwgQd9+nQ20Eidplk5mb19UvNV0FXDG1ovj7qwdBEg9xv8WpVccpVWpoGormKoIUUk/To4
 1KBYIQVGx4Nzf3tucyG6uakdjo4kYWGOxejT+FJaH6mON47trvOb4qH9xaKDW9YPr78oy3Ew2
 cWOVeww4WrmVfx+a83VBG3sNalc6r4w/82F0KUzKQNOp4ZgEoaQiE2YR0CTlv711+a3ywAb+8
 o6YsR760R6EglHIUk57T/epBOTPgCk7mwVrcmnqGXosSBhikmn/9/XuBTFTPhHXYWbVvcCZeq
 aylAHL7X9gypw1Reb4DAK5TRAdIwW0CE4EDOUCACVrR5OAyArNZ0qvXL+fZZJK7A0TuwEg5Kh
 0rELkiK8nS2uLisbXLBvdc7edY7Hxes8DMOMAsV67yDQKEMQaKOG6+xymGzEbuNi8d0/Pdez4
 I8d7mvNpN80PIM26bRu/6+zoE5O5Dw46PINc8iRDGr4bX7saatIW/nrRHQan4SpUyqHSPUxBU
 Aqaec4SNhCtoX6/m/oqNrL3PMTfsAG7RSyHZkYiTM3U30mPU2DyYtZ7a/fgdqcv3gtw5JAR98
 wFEoTosBjaoxvhuVPG7g==
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

