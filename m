Return-Path: <linux-media+bounces-53699-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK/XG1uQoWlZuQQAu9opvQ
	(envelope-from <linux-media+bounces-53699-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 13:38:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A981B73A2
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 13:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A32FE30634EB
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 12:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4413AE6F4;
	Fri, 27 Feb 2026 12:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="QC7/1Sde"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC3D21772A;
	Fri, 27 Feb 2026 12:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772195701; cv=none; b=ZFubfu0jPUhs5KPcz5tXRzZ6kW/m67R+k1jERNMaSldbCPN26iaChWWApBS6LrxUhC8J/+dkumeOoAtaaYPE1dHor5Lbr9PA1KFWtwg8bYMf15SdHbxsxOPK51pUzpcmdgCev20NidH4o7GvjkQasDJ6noGAsvLXUc90f2VvQe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772195701; c=relaxed/simple;
	bh=PF+KLnHGLB4nY8I6vRi5QBVHE0+7l1mH+xftGEdB2k8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ow+EoAp+NTTjZiVRCBTeCdKetIEQV3KPNHtUn8YndCqhmgb1J5k97jweZHpRymsEfwU55Byzi3LqtWT2n5srz36PYZ6d3KggB7rI+tnPF96q+ApbH4Il4LPnYQq8dLn2bjO9saCO2cumcYkKe7fxe1eNAX0vhWMVx90xL7UXRzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=QC7/1Sde; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1772195135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=suZXatTYQjgVAeYejv328Jw4MDmakt3EYEveDE7v2sM=;
	b=QC7/1SdeQ2U/OwtRPyBbq+QhdGXuCy2oPPWMMOnAp/gtvVHu+x3tzMhp1ehh4Usg6P9t2b
	yBR4Q4xmkjoLHvGRjEErTln704sqbb//Lp7ILPeedall3qV9/Rr3/kab4nb8xm2kwYkFKw
	cQ2N1oRBJacJ+MVaS2Eqc+l5sW6JyUY=
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "Igor M. Liplianin" <liplianin@me.by>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	syzbot+d99f3a288cc7d8ef60fb@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] media: dw2102: Fix null-ptr-deref in su3000_i2c_transfer()
Date: Fri, 27 Feb 2026 15:25:33 +0300
Message-ID: <20260227122535.16232-1-arefev@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[swemel.ru,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[swemel.ru:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53699-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[swemel.ru:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arefev@swemel.ru,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media,d99f3a288cc7d8ef60fb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 90A981B73A2
X-Rspamd-Action: no action

general protection fault, probably for non-canonical address
KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
...
Call Trace:
 <TASK>
 __i2c_transfer+0x868/0x2080 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x250/0x390 drivers/i2c/i2c-core-base.c:2328
 i2cdev_ioctl_rdwr+0x3b0/0x690 drivers/i2c/i2c-dev.c:297
 i2cdev_ioctl+0x646/0x7e0 drivers/i2c/i2c-dev.c:458
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:871 [inline]
 __se_sys_ioctl+0xfd/0x170 fs/ioctl.c:857
 do_syscall_x64 arch/x86/entry/common.c:51 [inline]
 do_syscall_64+0x55/0xb0 arch/x86/entry/common.c:81
 entry_SYSCALL_64_after_hwframe+0x68/0xd2
RIP: 0033:0x7f1bc3f8ebe9

The user transmits messages of invalid length via ioctl, some of which may
be zero length. This causes the i2cdev_ioctl_rdwr() function to allocate 
zero-length memory for msgs[i].buf when executing memdup_user(), resulting
in a ZERO_SIZE_PTR error. The i2cdev_ioctl_rdwr() function does not handle
this situation for this adapter, resulting in a null-ptr-deref error when
accessing msgs[i].buf in su3000_i2c_transfer().

Adding the necessary checks to su3000_i2c_transfer() resolves the
ZERO_SIZE_PTR error.

Fixes: d2ffc447cabb ("[media] dw2102: add support for Geniatech SU3000 USB DVB-S2 card")
Reported-by: syzbot+d99f3a288cc7d8ef60fb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d99f3a288cc7d8ef60fb
Cc: stable@vger.kernel.org
Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/media/usb/dvb-usb/dw2102.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
index 4fecf2f965e9..ad9c0374b4cb 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -737,6 +737,10 @@ static int su3000_i2c_transfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 	while (j < num) {
 		switch (msg[j].addr) {
 		case SU3000_STREAM_CTRL:
+			if (msg[j].len < 1) {
+				num = -EOPNOTSUPP;
+				break;
+			}
 			state->data[0] = msg[j].buf[0] + 0x36;
 			state->data[1] = 3;
 			state->data[2] = 0;
@@ -745,6 +749,10 @@ static int su3000_i2c_transfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 				err("i2c transfer failed.");
 			break;
 		case DW2102_RC_QUERY:
+			if (msg[j].len < 2) {
+				num = -EOPNOTSUPP;
+				break;
+			}
 			state->data[0] = 0x10;
 			if (dvb_usb_generic_rw(d, state->data, 1,
 					       state->data, 2, 0) < 0)
-- 
2.43.0


