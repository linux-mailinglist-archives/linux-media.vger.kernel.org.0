Return-Path: <linux-media+bounces-49245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EED71CD350C
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 19:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24AD53010FDF
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 18:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE28630F815;
	Sat, 20 Dec 2025 18:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=szymonwilczek@gmx.com header.b="sWt5kdsP"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC2A2CCC5;
	Sat, 20 Dec 2025 18:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766255113; cv=none; b=IQOXXlIgBbunlN0PKgDM80X2TOwp5QKaexxUZ2apxv0Ufm8bXPv4IytKYHbkqM0ovf3DHcYLw1xZKUYbXvWOUkCSUrfjP8/WkpNO8vq8VWzhNlD5qwEA/FV9cgNhgL1fRVpNk2IphN/BLk+wlQrtUyi/nLxypWeT7ruIkIIKy/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766255113; c=relaxed/simple;
	bh=521EJPpK/TRVxHpP8XX0HdQ68HoqfR8VgeLxVP61ANc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FZ1mukp+mklnxx3hJtC0R4VYI3hx0cRRP3+60EgJU+EEJ4CEktNve3IRG1w7EOmJiJxjtwm/nXjYEa8Wemk6zpxMhwD9EhAPYFXBX+PFdBhBuFA6Hhsjv046rzmP3ULjZyKJOq3r7sWJuStwW091NahiqBEJ3MX/tOCUZJ+0PZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=szymonwilczek@gmx.com header.b=sWt5kdsP; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1766255100; x=1766859900; i=szymonwilczek@gmx.com;
	bh=KP4jo9MpvJj6m5xTfXPKlC8//IYK8qFP5sN1ye8UvvM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sWt5kdsPKoHoCAZSnUpgKj52Y6s58SpQTmPocFeibScI+sAtMLmy/1ET/pucTna0
	 aZrgxeke8d7R0OH8yUQMa8N5WnD1VwBZBSdmp0FQZ8s4JOvWG3fb23T0wA+G7zFB/
	 8Qg/i4xU6jbHVQNFKXx0NQ61lLpAM6mcpXp/SvAwq8zP7cPFhzPGygvVCma6dBKkL
	 uz2dKNU3GHFX1mwDxBo6kUZ6swlquc2pOeMolJXqMw0kZ5XJ4EZ89RptbUxRwmfgD
	 O/uv3tfR/1EQ0bc5tKN9JnW6B6qWMDp6la9mzzb1ONVL5McI+cYlW9PQUnmrQI0vQ
	 mQhipWVTNpTatJ+VbQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from prometheus ([85.11.110.37]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N33Il-1vyYGU3vwL-016pfk; Sat, 20
 Dec 2025 19:25:00 +0100
From: Szymon Wilczek <szymonwilczek@gmx.com>
To: isely@pobox.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Szymon Wilczek <szymonwilczek@gmx.com>,
	syzbot+405dcd13121ff75a9e16@syzkaller.appspotmail.com
Subject: [PATCH] media: pvrusb2: fix URB leak in pvr2_send_request_ex
Date: Sat, 20 Dec 2025 19:24:19 +0100
Message-ID: <20251220182419.390675-1-szymonwilczek@gmx.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oqCIdFUK41tJXbI+/ClRahFsQ7EDj00rNle4QuRBIkwBS2fA6CZ
 5u79OFInYdmWSHj6VgSHG/7otpO0QDD/q3heXkF+9kZSJ2mmPwbmsngIdyp46yDVtrZR+F0
 AcGCCeelEjS4LvjPHAWwydz6wBokO3xHVTD3BoB1HH0g27iO19Ue8Ze0Ax+fBZLAYrtVTGr
 7J/ymMOk99Vp++Np2iJAA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:z9uF+jgm5Es=;/gG0hw69R5OsOno8Anz2VajbBof
 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

When pvr2_send_request_ex() submits a write URB successfully but fails to =
submit the read URB (e.g. returns -ENOMEM), it returns immediately without=
 waiting for the write URB to complete. Since the driver reuses the same U=
RB structure, a subsequent call to pvr2_send_request_ex() attempts to subm=
it the still-active write URB, triggering a 'URB submitted while active' w=
arning in usb_submit_urb().

Fix this by ensuring the write URB is unlinked and waited upon if the read=
 URB submission fails.

Reported-by: syzbot+405dcd13121ff75a9e16@syzkaller.appspotmail.com

Closes: https://syzkaller.appspot.com/bug?extid=3D405dcd13121ff75a9e16
Signed-off-by: Szymon Wilczek <szymonwilczek@gmx.com>
=2D--
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/p=
vrusb2/pvrusb2-hdw.c
index b32bb906a9de..5807734ae26c 100644
=2D-- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -3709,6 +3709,11 @@ status);
 				   "Failed to submit read-control URB status=3D%d",
 status);
 			hdw->ctl_read_pend_flag =3D 0;
+			if (hdw->ctl_write_pend_flag) {
+				usb_unlink_urb(hdw->ctl_write_urb);
+				while (hdw->ctl_write_pend_flag)
+					wait_for_completion(&hdw->ctl_done);
+			}
 			goto done;
 		}
 	}
=2D-=20
2.52.0


