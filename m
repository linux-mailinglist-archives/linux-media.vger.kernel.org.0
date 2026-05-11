Return-Path: <linux-media+bounces-61059-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI9QLBqhAWpKgwEAu9opvQ
	(envelope-from <linux-media+bounces-61059-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:27:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AF550ADBA
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CFE63243AE3
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3593BA237;
	Mon, 11 May 2026 09:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOjfRu1B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0CC377019
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490689; cv=none; b=Nu/3r4KsyAprmBBFS2dFxa5+GrM34qRoRgT3b9DtS0Ben5RtxT/WZXDJqbWIlWeXqeR7/Ek2xCrf6Saa+NFfvlgWAj4fg2b96u+/rwAT5KibqLbGDA1CaOUCQMEJ7P5UriBTAJfdSelADRdwn1PTgN1Du7SQU98axOIIXp3RbOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490689; c=relaxed/simple;
	bh=SZ8f9PPqWZU+1cRpq6Zl5ZieD1mgOP9e8yXexQ+jYTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g2ov32UxuXjif5rpl+ufbiz8xo5aYpDd8IELHNLNiaO+mQ15WhwvQ4nEuT8r6ZngMfsvKKGjY2ELVsAMkYA4IMbQ6s0o97k0eBsFLpL/5IQPUIIaXQcl/i4nNhkvKUEzrR8SzicWvwdJnpMZuH3CQmCHxyS3yGV7lYt7aBrE+L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOjfRu1B; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-834da62e52dso1687049b3a.3
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 02:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490688; x=1779095488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XdyyhEj4/v2ra5ngAxTRu5GNOcioukMe9KhLVuT3bms=;
        b=bOjfRu1Bvoe7Wpp3hwGZimC6PCp42e3xybWLG4AqTD9bxCi6UZbQ3Bh/8RuoAxhuBi
         Dxr8w+nArST6TcjRlLY/CWG2sVLbQYHSPcPhWXq1juGXRkLwPILNS6QwdkiLeqrCtkFO
         6l5XdQEURkX3xywRMxt49zaacUlg1qdpivScUdMpGE+BDa8kCodONSkO01QEn+Ew1O0u
         mZJvnMUujtfpZvQfQac5SruDN3opssBguusEf5eh6tHoc1pMnweXs/sIMWb5ZtoFk9o2
         +BFSYDD2dIfr/o58LHdxRqCcgxMUsXCWo21nnANyumOof11tfoiqhASZEORm29cZc38i
         KhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490688; x=1779095488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdyyhEj4/v2ra5ngAxTRu5GNOcioukMe9KhLVuT3bms=;
        b=dxtmHfzo3bGuxEX2hmHlGeA3YBjlF5L1rIS3vXyk8OOMB21q7kZCRcanDLKAFbcvUZ
         FzT5DlRNjNoijRLNqT1DvmEIi0nMZdtlCngDKfKJlZmPZbscJhGNJhovq1cMaQdGwuA2
         u87bTMMzHU8SUL9ur+tpaJUcXUi5fXI937Jz1PSk7/1wjoUWECAESxsyF5Mi7Pp9uiKW
         mJjksoWwtgyrK2K2sWQLxZPgFuk8zppkDd8dLkiO3THMsAUL9Q8UFgoFw9yzCMxr5DAH
         uONoLD43Z7P3HF3H263qfenbrTNIoyJdg5BRboDCGsz4nvVtGRxc0QnBwf01fSRbChjz
         vfoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xkABxsqm8HAKFM4hOfRgvhHn8h9Dijozba/UCGRpP1iXMFguCXl3RCE2HNgRYZ1z2+tAueAVs+YkSNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLKVa+1jiOPx4DZ5xzfW210mlyALAo6osP+XJBvYonUh8YBb9F
	uSzOj1e5B/sMqiqVfr8YtSAgwXNansGfiXQMWt7y28rMaA007M/sCFcg
X-Gm-Gg: Acq92OFBc4+cNv0VyB9zC4MypPnTxKkJZ5yCOas7YIin6l5wwzK+nVCRliaIM79U+AH
	mpC95IQzyrYl158UG4Dr8vzG99q22WKYZuhCbqhl4OpUjrH+qE41c82mrroT0KxGNXgJH0HCxOV
	3R7DA00V+f9i3cnwKCJOFLtSKq2kEGqvHcSCbULneapb09CaO9D7DDiApSmLQN55WqDulmfjfK1
	vvZNVFLACmgC+g6DhB7pbHi4rnoMfQyvAab60V2CjSwncMQUbhO8wJZkk0d3KI+9MEvrYC20Z2a
	xJSFUxim2YgFbWYD6cv15Rg+gzZwM6INOZmSMFIX/eqKfPLLhhiaQ3LoPMnGNls+t6G9Ikv2Re7
	OZ+llZrerjDKEwxtHwY3ZdTZUmlHCe+YnnFcJMwS4cqLtoUKj5OCxXZjkZAtSzqIlzJVQ+EtKjq
	K6qIrlo44a8tKAaFu4LHFZE4k=
X-Received: by 2002:a05:6a00:2d96:b0:837:acd7:a78 with SMTP id d2e1a72fcca58-83a5b9d8131mr21057954b3a.16.1778490687914;
        Mon, 11 May 2026 02:11:27 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f37:1974:abc5:99cd:a924:4e86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm24775517b3a.3.2026.05.11.02.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:11:27 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v3 0/5] fix and improve for Hi846
Date: Mon, 11 May 2026 17:09:19 +0800
Message-ID: <20260511090924.269106-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 46AF550ADBA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61059-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linux.intel.com,posteo.de,puri.sm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.958];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This series fixes errors blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v3:
- fix modes handling for different lane cases (Sebastian)
- fix header missing (the Media CI robot)
- Link to v2: https://lore.kernel.org/linux-media/20260501095433.1609309-1-mitltlatltl@gmail.com

Changes in v2:
- remove uncessary `else` (Sakari)
- fix link frequency (Sakari)
- correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com

Pengyu Luo (5):
  media: hi846: fix hi846_write_reg_16 handling
  media: hi846: fix link frequency handling
  media: hi846: fix modes handling for different lane cases
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 251 +++++++++++++++---
 2 files changed, 210 insertions(+), 43 deletions(-)

-- 
2.54.0


