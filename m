Return-Path: <linux-media+bounces-62305-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGlgHqDIDWor3QUAu9opvQ
	(envelope-from <linux-media+bounces-62305-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:43:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E5C58FE52
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C0AD3020EF3
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269E33E9C1C;
	Wed, 20 May 2026 14:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=henrialfonso.com header.i=contact@henrialfonso.com header.b="FdrHMoef"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0167C3E92B1;
	Wed, 20 May 2026 14:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287206; cv=pass; b=mD01XU338+F8EhDlCRJWEcyLTee7+Vzud4mv+NmD+YQMu6sSwj/zcHGQNL/q/eL2yva4iQWeQLcrZjNCMYp2Lib+OTAoBl4miw7APmT3rpfUlkBrgXW9RQqlz9W3lYUJ+EDHEOmU8oQ3i4aJsarR4Fyqrf6dXNfsErykhXujKfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287206; c=relaxed/simple;
	bh=FLWjpjSLyPLHUYq0uzHx+to+uhKrRpU+XAn9gB90Fos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kl43dPbbSlbvxGrj4NHecvZl5EglzstSqlQyLTwzN17/eO8njnLG/BySy0iJFnjj1G+3NMTFjQL2sR6UOvxFWwjOOJnY4pt0kPExJrbhbYdEfUzX0xFs/k3GJmSgy2M3BZ9rTUqhozoKyym20npUr/vsdtmFBt30bQf+biJVriI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=henrialfonso.com; spf=pass smtp.mailfrom=henrialfonso.com; dkim=fail (0-bit key) header.d=henrialfonso.com header.i=contact@henrialfonso.com header.b=FdrHMoef reason="key not found in DNS"; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=henrialfonso.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=henrialfonso.com
ARC-Seal: i=1; a=rsa-sha256; t=1779287196; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mtQbOdoqCKKrNamRSzgxwUPz9NVzmmLaYQ2ztU+3UC9Ivttu6wXtqhOMI+wFB+NeuBnf9aGnU5V0e9ociogKfjUHoIluKRi2rp53LPe9rcgbV2FYTO0E6PycjwkPRW4fsCGjGu5RNLzMeE24J0QcqIF4oWcrwDD6TB3BueNA6ls=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779287196; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dITl8E964e0+WrBm/4BLIREdzeSuT1KAltnbmTB75Ww=; 
	b=AqgPIuSiw2e+hsnWVjJCYULhQmd2kAO+YomnS2l0ZbzWLXAPY4KdWllkINDfNRXNMNpBFM4xDT7lCTHHLqhhLoFNSTPk4V8JxL9BaaeiMDjD1nMpE1Rvw/vw1Jc8FxvIP+vtlbUni766k5LRNGnr/fGnuPqBbcF1gaBzoF2dkSE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=henrialfonso.com;
	spf=pass  smtp.mailfrom=contact@henrialfonso.com;
	dmarc=pass header.from=<contact@henrialfonso.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779287196;
	s=zmail; d=henrialfonso.com; i=contact@henrialfonso.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dITl8E964e0+WrBm/4BLIREdzeSuT1KAltnbmTB75Ww=;
	b=FdrHMoefzKorkkXz8gLRcayikNh25XDpfB7o1flYiCkNA1q1K/kRKty3QrYiMgyx
	rEZ6DcUv++VotTux6k7CcSqP/A4hlbLrfSJ9owUZPoin75m+9M6SxBRglOjRKn4ntoO
	1F2v5noItxGlg08Y2ta5qaiHaSHUf4TSD8H2OhSM=
Received: by mx.zohomail.com with SMTPS id 1779287193147786.5963817257244;
	Wed, 20 May 2026 07:26:33 -0700 (PDT)
From: Henri A <contact@henrialfonso.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+11f0e4f957c7c3bf3d51@syzkaller.appspotmail.com,
	Henri A <contact@henrialfonso.com>
Subject: [PATCH] media: rc: igorplugusb: fix control request setup packet
Date: Wed, 20 May 2026 10:25:44 -0400
Message-ID: <20260520142544.104309-1-contact@henrialfonso.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[henrialfonso.com : SPF not aligned (relaxed),quarantine,sampled_out];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62305-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	R_DKIM_PERMFAIL(0.00)[henrialfonso.com:s=zmail];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[contact@henrialfonso.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[henrialfonso.com:~];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,11f0e4f957c7c3bf3d51];
	NEURAL_SPAM(0.00)[0.995];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,appspotmail.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,henrialfonso.com:mid,henrialfonso.com:email]
X-Rspamd-Queue-Id: 37E5C58FE52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit eac69475b01f ("media: rc: igorplugusb: heed coherency
rules") changed the control request storage from an embedded struct to
an allocated pointer so it can obey DMA coherency rules.

However, the driver still passes &ir->request to usb_fill_control_urb().
That points the URB setup packet at the pointer field itself rather than
at the allocated struct usb_ctrlrequest.

USB core then interprets pointer bytes as the setup packet. This can
produce an invalid bRequestType and trigger the control direction warning
reported by syzbot:

  usb 2-1: BOGUS control dir, pipe 80003580 doesn't match bRequestType 0

Pass ir->request itself as the setup packet.

Fixes: eac69475b01f ("media: rc: igorplugusb: heed coherency rules")
Reported-by: syzbot+11f0e4f957c7c3bf3d51@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=11f0e4f957c7c3bf3d51
Tested-by: syzbot+11f0e4f957c7c3bf3d51@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5.5
Signed-off-by: Henri A <contact@henrialfonso.com>
---
 drivers/media/rc/igorplugusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
index 3e10f6fe8..b5117ee9f 100644
--- a/drivers/media/rc/igorplugusb.c
+++ b/drivers/media/rc/igorplugusb.c
@@ -184,7 +184,7 @@ static int igorplugusb_probe(struct usb_interface *intf,
 	if (!ir->buf_in)
 		goto fail;
 	usb_fill_control_urb(ir->urb, udev,
-		usb_rcvctrlpipe(udev, 0), (uint8_t *)&ir->request,
+		usb_rcvctrlpipe(udev, 0), (uint8_t *)ir->request,
 		ir->buf_in, MAX_PACKET, igorplugusb_callback, ir);
 
 	usb_make_path(udev, ir->phys, sizeof(ir->phys));
-- 
2.43.0


