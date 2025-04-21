Return-Path: <linux-media+bounces-30633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0694A95419
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 18:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20BF63A97ED
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 16:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C634B1DFD8B;
	Mon, 21 Apr 2025 16:33:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D9319F461;
	Mon, 21 Apr 2025 16:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253191; cv=none; b=UB8LziaFcm5VSEcsOjOTqHivg9MigtnqNAirrUDwR6ED7a5MsP95qp+nCnKx8DA8Mv1ekS2lYNu0fRTYV0XU/DmR7LbWHrB9b4y6arPYInmr1BUF098Y4n5ih8s9nfCSsznAMOU5vZTLZF/F1PtgDtfvVrKuGJJZpGv/MaGbAZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253191; c=relaxed/simple;
	bh=DYbOqwvKIuQzgiBJkrvWL/SvUJ91pGTnSYDWTdMgRMU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Vid+Ozw+v8DK0wfZCQxwx++qy4rMRbyqueF9sG5HcWan8xwDDe6v5RbWIIcbvezHqcQqoQ3Kwi4+NxdWu4KeNJWdQoCGRVfA1qpqRKzztvDyC8BAI6o+cAKJJ5bmHxzs9rhgxmBmQO1GADzGX3sJgMqQU8hULqNcTpwg5rjSkBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from [127.0.1.1] (unknown [IPv6:2a01:e0a:3e8:c0d0:8e8c:c49a:b330:a587])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 4758744F12;
	Mon, 21 Apr 2025 16:33:07 +0000 (UTC)
Authentication-Results: Plesk;
        spf=pass (sender IP is 2a01:e0a:3e8:c0d0:8e8c:c49a:b330:a587) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=[127.0.1.1]
Received-SPF: pass (Plesk: connection is authenticated)
From: Arnaud Lecomte <contact@arnaud-lcm.com>
Subject: [PATCH 0/2] media: dvb-usbv2: Prevent usb race condition, buffer
 overflow az6007
Date: Mon, 21 Apr 2025 18:33:00 +0200
Message-Id: <20250421-ubsan-out-of-sub-v1-0-d9239a5af007@arnaud-lcm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADxzBmgC/x3MQQqAIBBA0avErBsosaKuEi20xpqNhpMRSHdPW
 r7F/xmEIpPAVGWIdLNw8AVtXcF6GL8T8lYMqlFdo1WLyYrxGNKFwaEki2NvVW/0sOlxhZKdkRw
 //3Je3vcDFtefNmIAAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+0192952caa411a3be209@syzkaller.appspotmail.com,
 contact@arnaud-lcm.com, skhan@linuxfoundation.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745253187; l=3114;
 i=contact@arnaud-lcm.com; s=20250405; h=from:subject:message-id;
 bh=DYbOqwvKIuQzgiBJkrvWL/SvUJ91pGTnSYDWTdMgRMU=;
 b=D9whOeaRb1lFtPci9oQlatWm8awDxGZasSloH2wtSlVeKE6NInb+hRK1LazVKlGhYrWmL9d9r
 RBZb0p7yRSMCXzMxCYjRJfq/wFOC82Z3WG1gcIv5zTn+MKdt1vprTvP
X-Developer-Key: i=contact@arnaud-lcm.com; a=ed25519;
 pk=Ct5pwYkf/5qSRyUpocKOdGc2XBlQoMYODwgtlFsDk7o=
X-PPP-Message-ID: <174525318763.30859.5630055609390566694@Plesk>
X-PPP-Vhost: arnaud-lcm.com

Hi,

Background
----------

The current implementation of the function az6007_i2c_xfer does not
check whether the I2C messages it receive are not larger than the
buffer used to transfer them to the related usb device.

Moreover, in a multi-threaded scenario where a thread disconnect the USB
device while an other thread is in az6007_i2c_xfer, we can end-up with
an use after-free of the device. The reproducer from syzbot is executing
his tests in this multi-threaded context:
[  156.847620][  T779] usb write operation failed. (-71)
[  156.852064][  T779] usb 2-1: dvb_usb_v2: will pass the complete MPEG2 transport stream to the software demuxer
[  156.853219][  T779] dvbdev: DVB: registering new adapter (Terratec H7)
[  156.853880][  T779] usb 2-1: media controller created
[  156.855421][  T779] usb read operation failed. (-71)
[  156.856123][  T779] usb write operation failed. (-71)
[  156.862775][  T779] dvb_usb_az6007 2-1:0.0: probe with driver dvb_usb_az6007 failed with error -5
[  156.865923][  T779] usb 2-1: USB disconnect, device number 28
[  157.008077][   T52] usb write operation failed. (-71)
[  157.011674][   T52] usb 4-1: dvb_usb_v2: will pass the complete MPEG2 transport stream to the software demuxer
[  157.012774][   T52] dvbdev: DVB: registering new adapter (Terratec H7)
[  157.013404][   T52] usb 4-1: media controller created
[  157.014212][   T52] usb read operation failed. (-71)
[  157.014915][   T52] usb write operation failed. (-71)
[  157.020729][   T52] dvb_usb_az6007 4-1:0.0: probe with driver dvb_usb_az6007 failed with error -5
[  157.025082][   T52] usb 4-1: USB disconnect, device number 28

The following serie of patch has been divided in 2 patches:
 - First patch: Add bound checking for i2c message length before filling
   the device buffer.
 - Second patch: Lock the usb device when starting the transfer to avoid
   the device being disconnected during it.

Considerations
----------
Concerning the upper bound checking for i2c messages, we could maybe be more
strict. I've currently set the limit to 4090 bytes to avoid the buffer
overflow but as mentionned, I2C messages are usually way more little. Be
more restrictive on this limit could be beneficial.

Concerning the race condition issue, maybe there is a more efficient
solution than locking the usb device.

Arnaud

Reported-by: syzbot+0192952caa411a3be209@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209
Fixes: ac71fabf1567 ("gcc-15: work around sequence-point warning")
Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
---
Arnaud Lecomte (2):
      media: dvb-usbv2: add bound checking for messages length in i2c_xfer
      media: dvb-usbv2: ensure safe USB transfers on disconnect in i2c_xfer

 drivers/media/usb/dvb-usb-v2/az6007.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)
---
base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
change-id: 20250421-ubsan-out-of-sub-96b26a47d49c

Best regards,
-- 
Arnaud Lecomte <contact@arnaud-lcm.com>


