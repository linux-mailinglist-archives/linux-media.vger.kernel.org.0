Return-Path: <linux-media+bounces-59622-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH2NOcaj7WnTlwAAu9opvQ
	(envelope-from <linux-media+bounces-59622-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 07:33:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C207468C86
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 07:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71C2A301C3DA
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 05:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FAAC2DECBF;
	Sun, 26 Apr 2026 05:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="lHIochj7"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF00272803;
	Sun, 26 Apr 2026 05:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777181625; cv=none; b=fWHLdVY+mnhChRwvuqcbRYW7h9L5WIje29W1ad//xUgZkDOCeXMjk/JKbj3aLffnR1RUhoXc06Z2V7TmfecaUksdQ5KgUHFNX3GXfZIMZiD1Xx4ISM31A4pMblao0bOy2G3XAbAMDx9rufVlCTiubeN1AI0GNZHIwbLuZJuC7l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777181625; c=relaxed/simple;
	bh=0ee+RgfGlEFk+HS2uTbkZpt/MHHITc31yxXiaB5uc5M=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=hoqR/KQHhePPPZTMbczE+nwiZE4Bf06y2i0Ziap1g5Z2vSWRoQvqi8nUWlsO1sUhSEW6u+93gZCoy+iyMbbqlI1PhpHaL0ntob2JOWcPqVI+dhvrLSOGgWAO5GTnvWr3BUklbin4+Bluj4bnDm0upv6zSA28HobA3x5AcrSMPMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=lHIochj7; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777181618; bh=5Qdzl+HrFggOqp1LvfFadqlFmXw4USH2ZkxOzTpoeMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lHIochj7mZC2cVoStqFCIW0bhF4NRWKdjGlSXylWelWVWZXSCnh7M3u8O098mrhvI
	 TRSv969cw/ET+PKu5ClExRbyMp9G0ErEZE+51+CR40PMqbT4Z5nkFmWjRFkH9lxW5t
	 iiFgOQXcVCHJ7DtAFJEU3EMAmcruzEywULCQOs/0=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 8630D630; Sun, 26 Apr 2026 13:33:35 +0800
X-QQ-mid: xmsmtpt1777181615t8jp93sd6
Message-ID: <tencent_976475A176D367843CAF361A968E37D04B09@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GPJJ4Xbcg10fWb+ZaLneAEVQFYH+ooUAQPN4EwtYh3vmUrxUFKP
	 n6XD/+eDUvYjxaIABNLW9AyByB2ZKM4el0DV4gO337UadvMvSGob2Ui3Dge6mE3MMkU6X9mei0ES
	 Bkp6ltvrBTxJvYnH9sgk/H39zzGP4WKqCHJtU1P0LsSB7i7q0zfOCW1fMAJA28UXyIDvWxa0KDtp
	 d64UH67mJiArJltPcak603A1Ek2PnFVE4Hcw/gS/ANW/We2daWBvT2DTAUlrwwJ2WPJfmGboPrpi
	 Ijzjghb80HKDPud8GazSM00Go+ONEa0p+LlUAFrSCZai2nH66hBSZQ+nh6hHHv0Uf+64CEa76u8m
	 5z32t6MsLBrcn7HP7yTItD6VNI/L9elme1QakStFnEFF7SFquM77BWc0rn5y0i79NGgm8Qz+EB4t
	 3YIuHMS9V8n0MmYvg+3sZRXYbBqVCrpr8EcTv9sCGzBQu3aSIrPNVPY1BzK8cgFK4Lfb8XFWFyM5
	 QxmWrFXTmab7vu/XQ9WMHbjw1rr+ICtzl8IO9/OUuPZ07PlZ5hOuCLucXOKOtGiObJnR+nazDjD0
	 3iz8XxcZWfCinqf7qk1Vd585sCAswwaRF4qXRbvUscaxMJv7Wnn3Ov9qxb7OhSCByFCM2uo8rli5
	 2vgYr0LlyQ5BkSdy9OuOE5eniuSUTxlrLfnApuenCwRx1fJ5jw0t18rK180WvGCeNhjGmRBECNCU
	 vLyWWcKGE37udufa7yNB6Ul4W/ISSre8P+R2ZU7H598IuTRc+qyW50WcAchyMZJl9bFZgq3vWMUk
	 i4ZcXXaLN5FIvF99ed+oqRIY9sVGhK/haIeGDOjY2yXhuu720Iegho/EBXmZvtYqIjXYRamWp6UI
	 a++Oram5S+mNRlgDpH3xs+oL7ceCq5ywOKGxEbewCrBg3FAAG3vwFoEXi8yRpeougrx16ooasC7R
	 56TC2nt553LCzGaYJIScrzpY700735bEb26ngoLD2XroCqZwEvhwuNAXbSd8r3CXK1z4XfhXPxpQ
	 tRnyw7TO0gI8oXp/hkaD6Zkjh2NXc=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+ba83b7db8e644b8b7c19@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] media: dvb-core: release pid memory when set filter to sec
Date: Sun, 26 Apr 2026 13:33:35 +0800
X-OQ-MSGID: <20260426053334.157305-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <69ed5ace.170a0220.11de9.000b.GAE@google.com>
References: <69ed5ace.170a0220.11de9.000b.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4C207468C86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[qq.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59622-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eadavis@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,ba83b7db8e644b8b7c19];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url,appspotmail.com:email,qq.com:email,qq.com:dkim,qq.com:mid]

The user first executes set pes filter to create a PID, and subsequently
executes set filter to sec. Within dvb_dmxdev_filter_set(), however, only
the PES filter is stopped, and the memory associated with the PID is not
reclaimed. Consequently, when dvb_demux_release() is executed upon file
closure at which point the filter type has already been updated to
DMXDEV_TYPE_SEC, the memory consumed by the PID originally generated for
the PES filter is never reclaimed. This triggers the memory leak reported
in [1].

Added a call to dvb_dmxdev_filter_reset() during the execution of
dvb_dmxdev_filter_set() to free the PID memory.

[1]
BUG: memory leak
unreferenced object 0xffff88810b771800 (size 32):
  backtrace (crc 1a56a8d7):
    dvb_dmxdev_add_pid+0x9c/0x160 drivers/media/dvb-core/dmxdev.c:897
    dvb_dmxdev_pes_filter_set drivers/media/dvb-core/dmxdev.c:972 [inline]
    dvb_demux_do_ioctl+0x3c6/0x7d0 drivers/media/dvb-core/dmxdev.c:1092
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201

Reported-by: syzbot+ba83b7db8e644b8b7c19@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ba83b7db8e644b8b7c19
Tested-by: syzbot+ba83b7db8e644b8b7c19@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/media/dvb-core/dmxdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 3c8bc75e4d6c..62733859f639 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -937,6 +937,7 @@ static int dvb_dmxdev_filter_set(struct dmxdev *dmxdev,
 		__func__, params->pid, params->flags, params->timeout);
 
 	dvb_dmxdev_filter_stop(dmxdevfilter);
+	dvb_dmxdev_filter_reset(dmxdevfilter);
 
 	dmxdevfilter->type = DMXDEV_TYPE_SEC;
 	memcpy(&dmxdevfilter->params.sec,
-- 
2.43.0


