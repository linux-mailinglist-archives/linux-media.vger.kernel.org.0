Return-Path: <linux-media+bounces-52235-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6H5pNBtyhGnI2wMAu9opvQ
	(envelope-from <linux-media+bounces-52235-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 11:34:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0F3F1597
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 11:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C26F301E970
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 10:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87E03A63FB;
	Thu,  5 Feb 2026 10:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BPzSDVJ6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE472C859;
	Thu,  5 Feb 2026 10:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770287540; cv=none; b=E0s7y3ZG6NtGdYiQGn3o3/bLQODeYCVihvkHvhzxED0wa1O6+cr4+SgZRFXmNRLlvdsUMn1ggBZbdSKko/2uh89cr2E8HNL4l60i0QWP7CD1+xGZqYH+n83mv4AjWn7wB1VClpbiE9sTxcsVv4oAMJgmZ90siGzvnT9MU8TANgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770287540; c=relaxed/simple;
	bh=nqkEWE8u3v5K0zhn+hN7T3tGMkKmwjfDCb3TALTIHg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gNqqdY3XuE5PNYBsAZH7AloBZjVaRUBqiHoankAVi0Yj+Bn4JpEXpbVcy75dlePXTsj9q08n78NxLm0V0JLiO+fg+aGxBYT00gkEtXBkj+FJBX73TrlFDubRxQ1QmnDpM7eT8QMz6DM1umrMsmtlhKGRCTUnV9YXIfjMB5ncJKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BPzSDVJ6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from t16.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC222227;
	Thu,  5 Feb 2026 11:31:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770287495;
	bh=nqkEWE8u3v5K0zhn+hN7T3tGMkKmwjfDCb3TALTIHg4=;
	h=From:To:Cc:Subject:Date:From;
	b=BPzSDVJ6klyXqDn/csJXDVOLbr/DUNfsqsAvrA5xvhZC746pZJRUgWIuajhQ5x3og
	 K8axTc5h+bxwAS77rHPYgMdsPbTn+gbLYaEupBacicBS7OET0TpEfHEqxic9US7YKt
	 4JQAhyBaKVDzdGLo0kirHBtnu7pSRYCox7ESk6Zk=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v2 0/2] media: rkisp1: Add YUV bypass support for rkisp1
Date: Thu,  5 Feb 2026 10:32:05 +0000
Message-ID: <20260205103207.4020959-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[fastmail.com,ideasonboard.com,kernel.org,sntech.de,lists.infradead.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52235-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[isaac.scott@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:mid,ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D0F3F1597
X-Rspamd-Action: no action

Hi all,

"Smart" cameras that do all image processing on the camera module itself
may not have the ability to output image data in RAW formats. These
cameras would require the use of the ISI, which is sometimes not
included in the hardware.

In hotplug systems, it is also impossible to switch between the ISP and
ISI at runtime, meaning if a media pipeline was set up between the
sensor and the rkisp1 ISP capture device, it would not be possible to
switch from a sensor supporting RAW formats to one outputting only YUV.

Thankfully, the ISP can be configured to allow the incoming YUV stream
to "bypass" the ISP blocks, allowing these sensors to be used. It
bypasses all ISP blocks and passes through the resizer, with the input
image data being presented at the output of the ISP to be captured.

In bypass mode, stats buffers are not provided by the ISP.

This series adds support for "YUV bypass", allowing sensors which only
output YUV streams to be used through the rkisp1.

Tested on: v6.18
Compile-tested on: media/next

---

Changelog since v1:
- Dropped patches 1, 3, 4 and 5.
- Removed the in_bypass flag from patch 2, as it is not needed due to
  the removal of the other patches.

Isaac Scott (2):
  media: rkisp1-isp: Set correct data mode for YUV bypass
  media: rkisp1: Treat 8 bus width and 16 bus width formats the same

 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.43.0


