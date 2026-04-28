Return-Path: <linux-media+bounces-59772-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGf4Mc9q8GkITAEAu9opvQ
	(envelope-from <linux-media+bounces-59772-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:07:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 328D847F9DC
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE3A3301B146
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103BE33B6C8;
	Tue, 28 Apr 2026 08:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="jYjoDq4+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91F733985A;
	Tue, 28 Apr 2026 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363568; cv=none; b=UXEDbA8I0X6V0Tl4I2WMd/wDTx6ZM/xuxBkdzt05DwXQX6QcEB40GqiW4LiIkIpwABJxCTZQP2mVHe2fXGkR3cB8Rxhd2KK87YlML836SwMQoahCajsfcFGPclfH1al12N36RvM9X4aXs1K8JOVy6xchbj2gcyW0Z4s/kyYWUqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363568; c=relaxed/simple;
	bh=JbSqcxkaYXHgUsfWWuY3WHcuQAIZo2UEFrg9qOIkC8U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RQkwo28Z5t9s2ne9GgBnPyKR0jg3MiNiQ4NWdfTcdQkIa7ErprdOdScYwrBEJRFQaDzLt/JeXCE28xPzDoeikRs9NtSsWhEUbVnx8gLhLgKSmmcxPUjiGGkY6fep5yjaf17OrKZSX7tZP9nrjukyf4/D7OfOUwtReXxe8q+o1A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=jYjoDq4+; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777363526;
	bh=1oZ0slkLwD4j67eLDShCDG2y9VeH6lqUf5/OOWOsufM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=jYjoDq4+DfJH+Pq/PFTO2fv5Et2MCkpolR7sQ9Tg6yEKZ01GoPpQw9lfWFtVH20U7
	 okcUHyKP6dbzS+KA+k9CNoQSLfB30JfmMWwtINxoA8TncLBMRIjoJfcVMRCsGTvYTd
	 TNDSFiPBsfZIWUmtq2kVNbA73Y8o0Fr/5LZX5BLg=
X-QQ-mid: zesmtpip2t1777363521t2db94c03
X-QQ-Originating-IP: Ie7elhc98k7lO2cjZo6LQ5mzr3BaTb7Kt7Tdajuux0g=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Apr 2026 16:05:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10357052501825298574
EX-QQ-RecipientCnt: 10
From: Haowen Tu <tuhaowen@uniontech.com>
To: rafael@kernel.org
Cc: lenb@kernel.org,
	pavel@kernel.org,
	linux-pm@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haowen Tu <tuhaowen@uniontech.com>
Subject: [PATCH 0/2] PM: hibernate: add helper to detect image-write phase
Date: Tue, 28 Apr 2026 16:05:11 +0800
Message-Id: <20260428080513.1833515-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: ODYnFSf5iEkxYo68Z+HYUfMkA2XeKp6/miPRc8ykIEG8MU/wWLCofFOL
	8049Jo1Rf9zXsfXu5SSmmi2Oq2aQteqzYZXaEN+xusxYUZJ2MccP4C5zxUQacLfAtkM4PeQ
	rDul4vDhLCSpy0VWZbNJtZvCmltZoqKNg4COXkwioMcCEGX2ng33+aIYamsXPwtmhzaR7cp
	F+WxkNxs2OG9+WFtRYQ9lFPJvvXlTXgNxH82/VGIijlwiKRHjnjQpU5CsSaEIRkkVu7waeC
	My/7phhOZGEcUetizDiRhC37GvN1v9GqcVVeV7AQcZGhR7IXEyo2aFw8jll69RA0i+alymR
	XIVNOVA+hzf8RcaKPMBm1GEqmUdt0e26V5Z7TeHrCwvVlAG0Kdc29ouDY5SNkMjrWUC2kSp
	c1aNgp9LOqffJqecRf0oB4D6iL/ovR9zprH//7MK2pWSCfOCjHYF6Xpt0zK30+SabBcy9uY
	SHc6yu5iEG/w3eKeawFYcVKlhsv9vc+iQDsz03WM88ctNUK+MCuPf81/cQj6sN6O1KXZ9vP
	UIDNzThjemwbkLo8LL8ZidnYpK6xGGu5mu1xnIaNftvf8y0Z4MZzwgNsw4SK5i/EbZYbPLI
	fBTjS+DzDmO4YHvpoo2wZjK5wfulF94jZBEW9/hTUgVXLIe0qRm7FelY4y2rDDwcekXX5Uh
	UWuRx1+Ewg5J4VkCxNugeBAA8j8q1TRD4gBTaxgPCqkMOyU5TZr7lrRKv0BmvG4o3/7Tsxh
	o9BjtnIvR6tubHX4AQcQJSBQ7mP3sIsH6rNrEtMXAQzsXR6Gl3v2CJAe8EbSf/IgEMKY3aT
	MY+5W5qfrIWqJUqVWvz2DtPrLzlI+f1/QeTQL4XaQT85sFcL8XU+LNjsBGCDRaRK62/BGDA
	eIMeRd0df17zFEXYndhrjRFj6Xh4mIDuMKC99da7Cb6W+JAylP57SVH88FROkWDYqpHHU+D
	GD15WgUTOJdn90CJmR6Jz9ddk84MbmcPo/nCRpzEWSY8UIjBC6WQr//FreKYixksPPh8+/d
	iUAfgN0FUgTdu6zk4D
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 328D847F9DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59772-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tuhaowen@uniontech.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,uniontech.com:dkim,uniontech.com:mid]

During S4 hibernation, after create_image() saves the memory snapshot,
the kernel resumes devices with PMSG_THAW solely to write the hibernation
image to storage before final powerdown.  Drivers unrelated to storage I/O
have no reason to reinitialize during this transient phase.

Drivers using dev_pm_ops already have separate .thaw and .restore
callbacks and can handle this natively.  However, usb_driver.resume
takes no pm_message_t argument, so a USB driver cannot distinguish
PMSG_THAW from PMSG_RESTORE without an out-of-band query.

This series adds pm_hibernation_storing_image(), a small helper that
returns true during the image-write window.  As a first user, the UVC
driver uses it to skip resume in uvc_video_resume() until the real
PMSG_RESTORE wake-up.

Tested with hibernation image written to local storage and resumed from
disk on a system with a USB UVC camera attached.

Haowen Tu (2):
  pm/hibernate: add pm_hibernation_storing_image() helper
  media: uvcvideo: skip resume when writing hibernation image

 drivers/media/usb/uvc/uvc_video.c | 10 ++++++++++
 include/linux/suspend.h           |  2 ++
 kernel/power/hibernate.c          | 19 +++++++++++++++++++
 3 files changed, 31 insertions(+)

-- 
2.20.1


