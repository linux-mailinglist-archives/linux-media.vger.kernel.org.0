Return-Path: <linux-media+bounces-55644-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCwQOGjss2mDdQAAu9opvQ
	(envelope-from <linux-media+bounces-55644-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:52:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 865CD281C3B
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04CAC3177394
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9220C38B14E;
	Fri, 13 Mar 2026 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JjWamFaQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1C936AB5E;
	Fri, 13 Mar 2026 10:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399032; cv=none; b=p5A3zBlpcX6HoqC/HYdNDY17I3Bdx+gks2MIoFimSFdbeAlfCl6A/eCKZiAhMl+CEsu3unrlMPGoZYhT5v4oo972NBcMvotbKz85SJW7K66QCdZoTe+Slc/xHh88auSOag0mX5Z2N6ejSk938w6dr3GIdvYcKxdvRI/ytuUJHB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399032; c=relaxed/simple;
	bh=wLGeUrCpQG3n2XgY0G5Irm3G56frjeImXwO7hwahduY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gWKXaDU+JtnxbX8RC4UBwDteIRCqmjFwyipFcFOzR6SKtmgZHYB7Jmer10juBkS2fPgiEQ7IoZVgnVcxzdhV8rKWWhOJoc7K4cLc7Yw1LUmRksM5IncA+AcekL9KQjmFjlQ/ouUzwNiN1RkyYnTEvWZtRCLl6iFiP38TbqWT8Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JjWamFaQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [91.80.67.247])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47BDCE70;
	Fri, 13 Mar 2026 11:49:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773398959;
	bh=wLGeUrCpQG3n2XgY0G5Irm3G56frjeImXwO7hwahduY=;
	h=From:Subject:Date:To:Cc:From;
	b=JjWamFaQX4NT8ceeUSKaG0alD+RYVArG0RvHkGosMzi02sH37t/IFyE3UY3lZMa2a
	 3Zl+9CefeMDz05LXGZAG6kmz6Vqn/5pJVQiTnzqLNur0U81xf2rPcEgRMWI+n1NexJ
	 sLl/PNXBE8HwObTpUIsUDiS/lFBsIuRZv+edb0mQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 0/6] media: mali-c55: Fix ISP reset and blocks bypass
Date: Fri, 13 Mar 2026 11:49:37 +0100
Message-Id: <20260313-mali-c55-fixes-v7-0-v1-0-21805b2b516b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMHrs2kC/x3LQQqAIBBA0avIrBtQy4quEi1MpxooCwUJorsnL
 R+f/0CiyJRgEA9Eypz4DAWqEuA2G1ZC9sWgpW5lrRQedmd0xuDCNyXMHUo0ftZWNmR71UM5r0h
 /LeM4ve8H9u7t92UAAAA=
X-Change-ID: 20260311-mali-c55-fixes-v7-0-5db2a04ea818
To: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <Nayden.Kanchev@arm.com>, 
 Konstantin Babin <Konstantin.Babin@arm.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=wLGeUrCpQG3n2XgY0G5Irm3G56frjeImXwO7hwahduY=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBps+vxIJ9RPRu8ENsbDsdDgwKkHTCtykKfBA/n0
 O2IOqQpj+SJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabPr8QAKCRByNAaPFqFW
 PE0dD/0QM1t3UNF9DZQ/HhSi9jfn78aL/0cJcCPy5yctAoSlkXAwRz1ziJoKeYtWELVXFb6jll6
 S2nolIYOAc69uh9RIswxc3M9Kq1sbhjt+N7FFi9joZA1G7sDe+db9tRpmWDSxv3bPRWnLXMd3L/
 cnJ/sGDStSTzkimrOjHq5U7+CdEBfL4a0jWibmcJaVDGEEWjRbfo++na78oEoz/s3tOIJnheZ7p
 zaMStKd1Sfq96LqWi8gTYA/nMT9f99nd4z2FwXMpfTo+ta7I/a/7RexXmggP09j9JVCViwF7MSC
 K36lk6bZ27iX2ogtsou8h1asN+9bHFEHszw16azrzEwNKsbkS0l8XU1vmCCYeFxMjXAGfAGuQCj
 BTPwGbK/mulN8jvXWVLIDngFXUprdrAE0qhep+3tUg4FHSj4PcaDD+LI0ZJJeSAFtRV6q/HqOeM
 5tcHwc5hJUTmCWmTu8muDuQUp9MsDdwZAK9eoizYkJnsjHTgzHrTdrmagpVdY1337AcEHHkmUR5
 zscn7HHxWkF6pVl9NAa1OuvBYeZonuXb1CeFKmELhFFmjEEgRzpJ6ydM/cvKLB7cFZaaybpIKAn
 qi4fuCvxnEkEh+gv2qpIlzwFehWXWhwsvRVbUMt1EWBvdkP0PTAqANDz2rwAbeZijkeySLgZ9G/
 xsM5avMeq9dZ/rw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55644-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 865CD281C3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The ISP is initialized in two different points (s_stream and probe).
This cause two consecutive start streaming to use settings from the
previous one.

Also, not all the blocks that userspace can configure are properly
reset.

Fix that and also bypass a few ISP blocks which if not bypassed might
interfere with the image processing.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
Daniel Scally (1):
      media: mali-c55: Fix Iridix bypass macros

Jacopo Mondi (5):
      media: mali-c55: Fix wrong comment of ISP block types
      media: mali-c55: Initialize the ISP in enable_streams()
      media: mali-c55: Fully reset the ISP configuration
      media: mali-c55: Bypass the Iridix Tonemap engine
      media: mali-c55: Bypass Purple Fringe Correction

 .../media/platform/arm/mali-c55/mali-c55-common.h  |   2 +
 .../media/platform/arm/mali-c55/mali-c55-core.c    |  35 ------
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c |  37 +-----
 .../media/platform/arm/mali-c55/mali-c55-params.c  | 134 ++++++++++++++++++++-
 .../platform/arm/mali-c55/mali-c55-registers.h     |   4 +-
 5 files changed, 140 insertions(+), 72 deletions(-)
---
base-commit: f6390408a846aacc2171c17d88b062e202d84e86
change-id: 20260311-mali-c55-fixes-v7-0-5db2a04ea818

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


