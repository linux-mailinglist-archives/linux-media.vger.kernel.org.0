Return-Path: <linux-media+bounces-56498-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFSfL/gRvWlf6QIAu9opvQ
	(envelope-from <linux-media+bounces-56498-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:23:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AB52D7ED7
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DB6E3014417
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F9035BDAF;
	Fri, 20 Mar 2026 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="aeWALAkB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF0131B11E;
	Fri, 20 Mar 2026 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998579; cv=none; b=hCafBPVVzS9oMPfrAIraF2MflsD1rnZKQlaSTF3Fxaakk6TGdCLMsYUBahSTe7MPd4e4HbHC8h0BUVtUhYqRJZV5mVigWJkirX5bcv9ZzREK3VY9/8RwVYAZFzAZ99s0A7y4JS6UxbxbL6mr8FxFKfOKyB8Q1QzIyeasDmH5kWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998579; c=relaxed/simple;
	bh=uvt7eL4Jq19faM7egA1KrphuuIDdpSBt1JSRf3YV6Sk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=B2zmfRUUxDeqDPtQIdN1vNXum+M90DLJ4a5jDAbqtWjmjVs2NAHIa8AHs1Cmn+6U7se6nSMTT5I6QNOUZrOKHjcTLVuvT7OJkYQiSRdoF/xrvJyfI+s1FOGlZJmTj5kyp6MT/RdlCqd6VvMDdBT40mx2ruSjrHruKskTQqLBrWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=aeWALAkB; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1773998570; x=1774257770;
	bh=1+6+OuqLNU5W3FgsGLC7SVKlN36q2Rny0bniN4QvqU4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aeWALAkB2CHElJQXEFqvE5TiSepDXTUAQOkfhqQdiIp44Y5fq/8mfMQXQv4pDliYW
	 h3Ub2xZpdC9K5RRyTTz+TX1pOLJKIHAaGddjyXtfV+J/+GGsShLddGmyHiX1ZJuuF7
	 v/S7+bpxqhPR6Wbz1AutK2ETVc/NG4BvvQKdhARoxOTOmF+nKBrAEgNghfFvkU47ic
	 kYoUT4f17jEjMh89LVc+0/nBWDfahyBPdINftbqCGyL9uRdCo9P2Jz9jE4a3vDCdcp
	 n6lyrQ/+RHIzMuEkMyQRk0E6LCoZFT7ouWm4n2FtE1NIOjjuW4baOmy+E75TtkOIOc
	 PIvWQUtFGvSbg==
Date: Fri, 20 Mar 2026 09:22:45 +0000
To: Arec Kao <arec.kao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Antoine Bernard <zalnir@proton.me>
Cc: "~postmarketos/upstreaming@lists.sr.ht" <~postmarketos/upstreaming@lists.sr.ht>
Subject: [PATCH 0/3] Add dvdd, dovdd and dt support to OV13B10
Message-ID: <S-aTRAGCAJIG5fKj0dhR7YI1RgL2Q1sbAiLQFKciU4yNuGHwUcukxDGjYilT43Bs1VXFTvi9NSb3W9z-raiOscEYSshOTEr5MvA3TxICHlw=@proton.me>
Feedback-ID: 152853527:user:proton
X-Pm-Message-ID: 5efd933e43521df97088a077b927d5f8b895ee5c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56498-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[intel.com,kernel.org,linux.intel.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[proton.me:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zalnir@proton.me,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 83AB52D7ED7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series add support for the dvdd/dovdd voltage regulators
and introduce devicetree bindings for the OV13B10 image sensor.

Signed-off-by: Antoine Bernard <zalnir@proton.me>
---
Antoine Bernard (3):
  media: i2c: ov13b10: Add dvdd, dovdd and device tree support
  media: dt-bindings: Add OmniVision OV13B10
  MAINTAINERS: Add dt-bindings documentation for OV13B10

 .../bindings/media/i2c/ovti,ov13b10.yaml      | 99 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 drivers/media/i2c/ov13b10.c                   | 53 ++++++++++
 3 files changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov13b1=
0.yaml

--=20
2.52.0


