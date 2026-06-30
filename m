Return-Path: <linux-media+bounces-66040-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PmxpLJpvQ2qZYQoAu9opvQ
	(envelope-from <linux-media+bounces-66040-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:26:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0372C6E11EC
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:26:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66040-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66040-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65263307C824
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 07:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCB039A7E1;
	Tue, 30 Jun 2026 07:21:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F5637DEA2;
	Tue, 30 Jun 2026 07:21:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804096; cv=none; b=T1245FEz5C6dQOZu0hX2bYr1C61tjx/U04lyGNL7c+ch4dcIRNchifaxVGUEp60+w2TvXWvO6IWV3URp1Xv7+Afm0ESLC3+uVzOBRUfwmCWNVyHWn3UZPp41Qz/5Un8TmpHIOAnmm0Qew/rnKCCjDWZWiFnLY0dnDjxKCJeqaZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804096; c=relaxed/simple;
	bh=VkuBAsJl9ZPr9WpzDTh3ZaAomyp3BX117NfVFNQjIw8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HUj1bh5Uz6vlSHC7rhJTylo1vwwzdC59cIjLDoOFbABZ+DuQKDJIn5G88GWRFuKzy0bSeisrOwLFauuPld5ZPgi7hpSE1lcMDTJ1eHawOTWb+OIE+zCrDrI30kGZVPxRZrE3DZvMHnPdsdGuzRQTRuRrk1DdI8qefT50Y7nt3Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from 0017-media-s2255-validate-firmware-trailer-size.eml (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAAnoPN7bkNqGE4kFg--.14444S2;
	Tue, 30 Jun 2026 15:21:31 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "open list:MEDIA INPUT INFRASTRUCTURE V4L/DVB" <linux-media@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] media: s2255: validate firmware trailer size
Date: Tue, 30 Jun 2026 15:20:20 +0800
Message-ID: <2026063008039694.3-ccfa108-0017-media-s2255-validate-firmwa-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAnoPN7bkNqGE4kFg--.14444S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw4kKF4kJF4DCrWDJryfCrg_yoWfKwcE9r
	15ur1kW3WjkFy5ur42kr1SvryrA397uFy8ZFn2qw45JFyvq3W3XrWqv3W3uw1UGF42kF1D
	J3s8XF4fuwn8WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbFAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8
	JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb3rc3UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66040-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0372C6E11EC

s2255_probe() reads the marker and version from the last eight bytes of
the firmware image.  A shorter image makes those trailer reads
underflow.

Reject firmware images shorter than the required trailer before reading
it.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 0b8182e..b19f541 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -2277,6 +2277,12 @@ static int s2255_probe(struct usb_interface *interface,
 	}
 	/* check the firmware is valid */
 	fw_size = dev->fw_data->fw->size;
+	if (fw_size < 8) {
+		dev_err(&interface->dev, "Firmware invalid.\n");
+		retval = -ENODEV;
+		goto errorFWMARKER;
+	}
+
 	pdata = (__le32 *) &dev->fw_data->fw->data[fw_size - 8];
 
 	if (*pdata != S2255_FW_MARKER) {


