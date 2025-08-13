Return-Path: <linux-media+bounces-39717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7A0B24016
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 07:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54B5672693A
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 05:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D4228DF0B;
	Wed, 13 Aug 2025 05:19:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575302110E
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 05:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755062348; cv=none; b=e+lhpEGUjKDlZJAwZCJdBYr01tFRBeSqa/ZuRpNneuV/ctTgVQDFVALhA87bDdC90QJ9ZGlIsBTQ4UQsazVZddGS8MDCV+mo/h1XG82E21ZjJs8+N5DGfWJBJs0M5945XjlYzU0mhtKjpeQ4iVBaqplF1rU8/lgDmwBfzggQMu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755062348; c=relaxed/simple;
	bh=gsVDURhUfTh4yjDRSkssQSNtPVWxuG4KDDtgm37hlEM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=rETt+874iexbqyeLAq0BMGU7YL74daIIXBxdyiV96F27fUUzmInFd/5PEZsgJAY/57+0ebZTvVSTX420Jjjs+lhoUJG8rEWy0hDoAGn2i6bYDx4P7L7jcIp0urwROgmUjqx6oqfb+2F34+foAZrEkOSzcvzutCMLYKzMfNRf2bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 57D5IxLS088842;
	Wed, 13 Aug 2025 14:18:59 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.10] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 57D5Ixfa088838
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 13 Aug 2025 14:18:59 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <39afbeed-727e-4c0a-bc92-64a1f0feb541@I-love.SAKURA.ne.jp>
Date: Wed, 13 Aug 2025 14:19:00 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-media@vger.kernel.org, Sean Young <sean@mess.org>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH (REPOST)] media: imon: grab lock earlier in
 imon_ir_change_protocol()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav405.rs.sakura.ne.jp

Move mutex_trylock() in imon_ir_change_protocol() to the beginning,
for memcpy() which modifies ictx->usb_tx_buf should be protected by
ictx->lock.

Also, verify at the beginning of send_packet() that ictx->lock is held
in case send_packet() is by error called from imon_ir_change_protocol()
when mutex_trylock() failed due to concurrent requests.

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/media/rc/imon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index f5221b018808..7a28c37820f4 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -598,6 +598,8 @@ static int send_packet(struct imon_context *ictx)
 	int retval = 0;
 	struct usb_ctrlrequest *control_req = NULL;
 
+	lockdep_assert_held(&ictx->lock);
+
 	/* Check if we need to use control or interrupt urb */
 	if (!ictx->tx_control) {
 		pipe = usb_sndintpipe(ictx->usbdev_intf0,
@@ -1121,7 +1123,7 @@ static int imon_ir_change_protocol(struct rc_dev *rc, u64 *rc_proto)
 	int retval;
 	struct imon_context *ictx = rc->priv;
 	struct device *dev = ictx->dev;
-	bool unlock = false;
+	const bool unlock = mutex_trylock(&ictx->lock);
 	unsigned char ir_proto_packet[] = {
 		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x86 };
 
@@ -1148,8 +1150,6 @@ static int imon_ir_change_protocol(struct rc_dev *rc, u64 *rc_proto)
 
 	memcpy(ictx->usb_tx_buf, &ir_proto_packet, sizeof(ir_proto_packet));
 
-	unlock = mutex_trylock(&ictx->lock);
-
 	retval = send_packet(ictx);
 	if (retval)
 		goto out;
-- 
2.50.1

