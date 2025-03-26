Return-Path: <linux-media+bounces-28758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A44A70FF4
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 05:53:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9565F7A4E0C
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 04:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D7716DEB1;
	Wed, 26 Mar 2025 04:53:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from zewer.dizum.com (zewer.dizum.com [45.66.35.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F9AEEBB
	for <linux-media@vger.kernel.org>; Wed, 26 Mar 2025 04:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.66.35.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742964824; cv=none; b=TKxDsEssi4cswMeiGKMkMOvuvnaxDmuJXyWgFbdFHt6YycEGyR6Oeg2prGsZL+wrP8HR4n4wj+Ndzxigt1VLUjN+pMPiWabfVAvKsvjbhVPTUr/vuNk3QYysVB/42K2W6AsX0n7f0QEum45PQu/WPzijDVh54eNy18HNXJDMv2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742964824; c=relaxed/simple;
	bh=EOxF4fCcoTdbA2tQWVrxtKNA+BuQ707pfQUWKLhxf2E=;
	h=From:To:Subject:Message-ID:Date; b=tAUsBnm5XRj6BqoBcUOF6OrRGzI2811n4yIOBhbYPDqSoNWQrLzegX/VCYlRNJmU9pj9nFlAUf7Z5o6vFV8FkLPijVGXljjg5sxcCIqzlr9T2UaEByMzHwTSEUJc/JztAMJFY2c28WU02vL4LBTDtCxVMk27H/XPEg7znjQvpmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dizum.com; spf=none smtp.mailfrom=dizum.com; arc=none smtp.client-ip=45.66.35.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dizum.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dizum.com
Received: from sewer.dizum.com (remailer [10.10.252.221])
	by zewer.dizum.com (Postfix) with ESMTP id BED9120160
	for <linux-media@vger.kernel.org>; Wed, 26 Mar 2025 05:43:50 +0100 (CET)
Received: by sewer.dizum.com (Postfix, from userid 1001)
	id 361B66012E; Wed, 26 Mar 2025 05:43:50 +0100 (CET)
From: Nomen Nescio <nobody@dizum.com>
Comments: This message did not originate from the Sender address above.
	It was remailed automatically by anonymizing remailer software.
	Please report problems or inappropriate use to the
	remailer administrator at <abuse@dizum.com>.
To: linux-media@vger.kernel.org
Subject: New DVB-T Scan File - au-Gold_Coast-Mount_Tamborine
Message-ID: <7096b9e7b48236789fc0a297ace40892@dizum.com>
Date: Wed, 26 Mar 2025 05:43:50 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Sorry about using an anonymous email address.
I didn't want to risk having my real one made public.
I hope that you understand.


au-Gold_Coast-Mount_Tamborine


# DVB-T frequencies & modulation for the Gold Coast, Australia (Mt Tamborine)
# See http://www.dba.org.au/index.asp?sectionID=22&recLocation=Gold+Coast
# and http://www.dba.org.au/index.asp?sectionID=120
#
# Updated 2024-09-21 based on this:
# https://ozdigitaltv.com/transmitters/QLD/165-Mount-Tamborine
# SBS	SBS40	613.500 Mhz
# ABC	ABC41	620.500 Mhz
# Seven	BTQ42	627.500 Mhz
# Ten	TVQ44	641.500 Mhz
# Nine	QTQ45	648.500 Mhz
# Seven	NEN46	655.500 Mhz
# Nine	NBN47	662.500 Mhz
# Ten	NRN48	669.500 Mhz
#
# SBS-SBS40 (UHF 40)
[CHANNEL]
	DELIVERY_SYSTEM = DVBT
	FREQUENCY = 613500000
	BANDWIDTH_HZ = 7000000
	CODE_RATE_HP = 3/4
	CODE_RATE_LP = NONE
	MODULATION = QAM/64
	TRANSMISSION_MODE = 8K
	GUARD_INTERVAL = 1/16
	HIERARCHY = NONE
	INVERSION = AUTO

# ABC-ABC41 (UHF 41)
[CHANNEL]
	DELIVERY_SYSTEM = DVBT
	FREQUENCY = 620500000
	BANDWIDTH_HZ = 7000000
	CODE_RATE_HP = 3/4
	CODE_RATE_LP = NONE
	MODULATION = QAM/64
	TRANSMISSION_MODE = 8K
	GUARD_INTERVAL = 1/16
	HIERARCHY = NONE
	INVERSION = AUTO

# Seven-BTQ42 (UHF 42)
[CHANNEL]
	DELIVERY_SYSTEM = DVBT
	FREQUENCY = 627500000
	BANDWIDTH_HZ = 7000000
	CODE_RATE_HP = 3/4
	CODE_RATE_LP = NONE
	MODULATION = QAM/64
	TRANSMISSION_MODE = 8K
	GUARD_INTERVAL = 1/16
	HIERARCHY = NONE
	INVERSION = AUTO

# Ten-TVQ44 (UHF 44)
[CHANNEL]
	DELIVERY_SYSTEM = DVBT
	FREQUENCY = 641500000
	BANDWIDTH_HZ = 7000000
	CODE_RATE_HP = 3/4
	CODE_RATE_LP = NONE
	MODULATION = QAM/64
	TRANSMISSION_MODE = 8K
	GUARD_INTERVAL = 1/16
	HIERARCHY = NONE
	INVERSION = AUTO

# Nine-QTQ45 (UHF 45)
[CHANNEL]
	DELIVERY_SYSTEM = DVBT
	FREQUENCY = 648500000
	BANDWIDTH_HZ = 7000000
	CODE_RATE_HP = 3/4
	CODE_RATE_LP = NONE
	MODULATION = QAM/64
	TRANSMISSION_MODE = 8K
	GUARD_INTERVAL = 1/16
	HIERARCHY = NONE
	INVERSION = AUTO

# Prime-NEN46 (UHF 46)
[CHANNEL]
	DELIVERY_SYSTEM = DVBT
	FREQUENCY = 655500000
	BANDWIDTH_HZ = 7000000
	CODE_RATE_HP = 3/4
	CODE_RATE_LP = NONE
	MODULATION = QAM/64
	TRANSMISSION_MODE = 8K
	GUARD_INTERVAL = 1/16
	HIERARCHY = NONE
	INVERSION = AUTO

# NBN-NBN47 (UHF 47)
[CHANNEL]
	DELIVERY_SYSTEM = DVBT
	FREQUENCY = 662500000
	BANDWIDTH_HZ = 7000000
	CODE_RATE_HP = 3/4
	CODE_RATE_LP = NONE
	MODULATION = QAM/64
	TRANSMISSION_MODE = 8K
	GUARD_INTERVAL = 1/16
	HIERARCHY = NONE
	INVERSION = AUTO

# Ten-NRN48 (UHF 48)
[CHANNEL]
	DELIVERY_SYSTEM = DVBT
	FREQUENCY = 669500000
	BANDWIDTH_HZ = 7000000
	CODE_RATE_HP = 3/4
	CODE_RATE_LP = NONE
	MODULATION = QAM/64
	TRANSMISSION_MODE = 8K
	GUARD_INTERVAL = 1/16
	HIERARCHY = NONE
	INVERSION = AUTO



