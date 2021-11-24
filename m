Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4604645B8A8
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 11:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241602AbhKXKwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 05:52:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235858AbhKXKwV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 05:52:21 -0500
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4C7C061574
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 02:49:11 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id pppqmdwrSCMnAppptmvRRG; Wed, 24 Nov 2021 11:49:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637750950; bh=DHIYxLpPcyxDWbxjmVmPmfgDB77V6VkQ01Yz2N0g27A=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=p0UjoMFbXGwfVANTaGyfwwowjGBngzaL4bkfORyXRQS9F/Z81vsS1ulz8ia4LuWGf
         pRek5WQAJJIapebNUy7HUNsNfbCEDqTn1eJE+ZZIlp+o1TAzVzmIc2huKRqDM6bKg+
         VSi5guWizoQp2WekgEndquiN4qScoaJHxcTRDbyaqFPe0LzUBonc0JAZnmLpv6OHBJ
         LViqnq/Q3SJLW9hAPpf7jPrr39+lEkZmY7s52Hqm0nvC4q6yMro1jqdIDgYkD256CM
         KmyTR2t70Ct1eTZtHTkR/sbGAfjYqe7PYrFMyUEgBbuUBtNTl+3n+/cENitcUALjGd
         Z2FrBncQzMaQg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] uvc: fix sequence counting
Message-ID: <0d3ee0aa-0f1f-4670-a5cc-8dd982e2e3b0@xs4all.nl>
Date:   Wed, 24 Nov 2021 11:49:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfP8SCP6/8e6X2oUXFZcR3GJFtpCx9UoQBS7qvZqzu3umAotAw7i3wtl8Myj/J2aaaJla5NdTyjoIz5qy7+50gIfEw9HQLskt8ZkzZ5ZVw68TaHB5cLHo
 R+4+CzRSXN0/0T55ZGHpTbEDSpOfXMpWoRCLpeT5B+boCVnY6R+TYg8WUI5w5VXKpDWWJZnt8fpXBHDQihxUlHiRSj4YRmXs3avLyubF40as3fqfviVE7P/5
 zOyAv7snHQPYwSZfV3ff6M6RFAOPusGpglqpBbagVDqAQqc26D/Dh/8kFRyb3uIs
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When you start streaming from uvc, then the first buffer will
have sequence number 0 and the second buffer has sequence number
2. Fix the logic to ensure proper monotonically increasing sequence
numbers.

The root cause is not setting last_fid when you start streaming
and a new fid is found for the first time.

This patch also changes the initial last_fid value from -1 to 0xff.
Since last_fid is unsigned, it is better to stick to unsigned values.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 drivers/media/usb/uvc/uvc_video.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 9f37eaf28ce7..8ba8d25e2c4a 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1055,7 +1055,10 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 	 * that discontinuous sequence numbers always indicate lost frames.
 	 */
 	if (stream->last_fid != fid) {
-		stream->sequence++;
+		if (stream->last_fid > UVC_STREAM_FID)
+			stream->last_fid = fid;
+		else
+			stream->sequence++;
 		if (stream->sequence)
 			uvc_video_stats_update(stream);
 	}
@@ -1080,7 +1083,7 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,

 	/* Synchronize to the input stream by waiting for the FID bit to be
 	 * toggled when the the buffer state is not UVC_BUF_STATE_ACTIVE.
-	 * stream->last_fid is initialized to -1, so the first isochronous
+	 * stream->last_fid is initialized to 0xff, so the first isochronous
 	 * frame will always be in sync.
 	 *
 	 * If the device doesn't toggle the FID bit, invert stream->last_fid
@@ -1111,7 +1114,7 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 	 * last payload can be lost anyway). We thus must check if the FID has
 	 * been toggled.
 	 *
-	 * stream->last_fid is initialized to -1, so the first isochronous
+	 * stream->last_fid is initialized to 0xff, so the first isochronous
 	 * frame will never trigger an end of frame detection.
 	 *
 	 * Empty buffers (bytesused == 0) don't trigger end of frame detection
@@ -1895,7 +1898,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
 	int ret;

 	stream->sequence = -1;
-	stream->last_fid = -1;
+	stream->last_fid = 0xff;
 	stream->bulk.header_size = 0;
 	stream->bulk.skip_payload = 0;
 	stream->bulk.payload_size = 0;
-- 
2.33.0

