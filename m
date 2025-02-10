Return-Path: <linux-media+bounces-25871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9E2A2E645
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 09:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 596993A3AAB
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 08:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885E91C3C0B;
	Mon, 10 Feb 2025 08:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="otoZTYf3"
X-Original-To: linux-media@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0970F1C1F2F
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 08:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175684; cv=none; b=K5IfAd62tN6yYCVDNJRCCOt2B+i8QMaMY3CsJL5enRmT6qf7R1f8lW9avI73TSbqdR1R7qMYPIwr6sZaYq++YHIhL2vphNiX3z7YVJAX/ob459bwkhv4C1clzjtvfA77tD9n8i3niVd2iwcZpITkSEZzu7xia+nfbf3rf6Rb68Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175684; c=relaxed/simple;
	bh=UM0DbDimYFH3Gji2t3ZWS6P7aLo3l+IWmHSrgZvIKtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RyzUieoz8EFI1MmYpeV/zSqyy9+4qO3Y1DsCgN8BOI1x4rQ0UwsthEs7pKngvzFkOg7//JBvkHcaXgHS930v9AIZl05UJ5/zDCYSUXJw4SLbCRpgB0r2CxCoaq/tiDtbzg9BzkRndtZdFXTjqMtPcUL+ao3k+8sC468950IZLRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=otoZTYf3; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1739175671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nZBgFwVHgTYbOiMhRkH4J+/3MKsIFRUIBov6j6esh4M=;
	b=otoZTYf33gGCcn7NTmOGhcccUNsSeF2X1uteJCrVttx9g249G8n3XgFGR28RzcqC/TRWrB
	zaHHrZO1H2Etik89Ob/UdXm1fTasEKdpxCOl6euV+BtTMg5/zY5b6Cl/E0Igo0KsL9XyuZ
	mh3jsPwCDfC8B5DWBtsVXst/Xlp3FZBScPQL/5E9nTfJL77ybX77PA+V+JpAKWa6CLwMAt
	oY98qIFctiPV+S+qNEeo68LE5LIiaPWuR5VEFlZ0LYEY6SQTk8pokPFGR5TAp/8iQwDTLo
	ThMUmrDHWqmVq4OS2Rn1hoW1D4xmiXTSywSDtGUDV5rpGwjV54LJuyoZKQxcWg==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Daniel Scally <djrscally@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] media: i2c: dw9719: add DT compatible and DW9718S support
Date: Mon, 10 Feb 2025 05:19:15 -0300
Message-ID: <20250210082035.8670-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The DW9718S voice coil motor is found on various smartphones like motorola-nora
that are currently being worked on in the postmarketOS community. Since the way
it operates is very similar to DW9719, this patch series adds support for it to
the existing dw9719 driver. Because that driver did not yet support DT, we also
add DT bindings and the dongwoon,dw9719 ofw compatible first. With DW9718S, the
driver was tested fully, including runtime PM.

Val Packett (5):
  media: dt-bindings: i2c: add DW9719/DW9718S VCM binding
  media: i2c: dw9719: add an of_match_table
  media: i2c: dw9719: increase tOPR wait time
  media: i2c: dw9719: update PM last busy time upon close
  media: i2c: dw9719: add support for dw9718s

 .../bindings/media/i2c/dongwoon,dw9719.yaml   | 110 ++++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/dw9719.c                    | 118 ++++++++++++++++--
 3 files changed, 220 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml

-- 
2.48.1


