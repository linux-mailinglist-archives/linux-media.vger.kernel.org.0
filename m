Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82BE1A9937
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 11:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895786AbgDOJqY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 05:46:24 -0400
Received: from turbocat.net ([88.99.82.50]:60444 "EHLO mail.turbocat.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895787AbgDOJqV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 05:46:21 -0400
Received: from hps2020.home.selasky.org (unknown [62.141.129.235])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id C4129260282;
        Wed, 15 Apr 2020 11:46:17 +0200 (CEST)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
From:   Hans Petter Selasky <hps@selasky.org>
Subject: [PATCH] [V4L-UTILS] Fix for mismatched class/struct tags
Message-ID: <486af8b4-9feb-2f21-cfca-3f095db531f2@selasky.org>
Date:   Wed, 15 Apr 2020 11:45:17 +0200
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix for mismatched class/struct tags.

Signed-off-by: Hans Petter Selasky <hps@selasky.org>

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp 
b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 372bcfb8..a746410e 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -49,8 +49,8 @@
  #define VIVID_CID_QUEUE_ERROR		(VIVID_CID_VIVID_BASE + 70)
  #define VIVID_CID_REQ_VALIDATE_ERROR	(VIVID_CID_VIVID_BASE + 72)

-static struct cv4l_fmt cur_fmt;
-static struct cv4l_fmt cur_m2m_fmt;
+static cv4l_fmt cur_fmt;
+static cv4l_fmt cur_m2m_fmt;
  static int stream_from_fd = -1;
  static bool stream_use_hdr;
  static unsigned max_bytesused[VIDEO_MAX_PLANES];
@@ -357,7 +357,7 @@ int buffer::check(unsigned type, unsigned memory, 
unsigned index,
  	unsigned timestamp_src = g_timestamp_src();
  	unsigned frame_types = 0;
  	unsigned buf_states = 0;
-	const struct cv4l_fmt &fmt = is_m2m ? cur_m2m_fmt : cur_fmt;
+	const cv4l_fmt &fmt = is_m2m ? cur_m2m_fmt : cur_fmt;

  	fail_on_test(g_type() != type);
  	fail_on_test(g_memory() == 0);
-- 
2.25.0
