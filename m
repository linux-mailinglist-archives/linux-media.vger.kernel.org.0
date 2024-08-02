Return-Path: <linux-media+bounces-15727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C15DA946075
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 17:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D36A287F0F
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 15:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280B0136355;
	Fri,  2 Aug 2024 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="ZB2bSwDS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8C3175D36;
	Fri,  2 Aug 2024 15:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.95.48.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722612284; cv=none; b=MmxkaUbBNx+TlC7q/tC3G9R3s0NVmAvQXSKIVzEcpC5tD64+icNMGgLXqAUkVXjkfXxHUUOe2upLgq7R6DVfm7M/DzCLdzXAJSmaAHC/mTBguPWIlA/ogH3C/qVYswUmr4D0gg5BdQ1WGU78LzvOxBTRw9H5+37PGTRMqhifanc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722612284; c=relaxed/simple;
	bh=tSOPhpPWSDfuhuQNh/03dUPsZeMbnMz0ai/De9506rg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jPWTx7LleT2PdLWL9n7cX3RNsyhFvS/L5qgJYw1Di5/FBgnPr3T+uxJRE89jt9iGGprgJQeDiP6rtEz4Wo7LLlY3iJewHDubEWMqep1xmi8LjkLKmbQwkFTsAJR95upmm9n7w+/wwFAY1fWonSEkzmz0UNDI0RzZMYOwiQ5sHuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=ZB2bSwDS; arc=none smtp.client-ip=52.95.48.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1722612283; x=1754148283;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Jl1MLgN/io3EBYNcV6UPk1uVnZispg71Was7orwfQaE=;
  b=ZB2bSwDSQMCFgSck3j9myS5Kamh39Vinml12NivGK1f78Od2CQG2y21D
   c0fME7Kb96b9T+J2ulfKHDXFAXABhKTsqyqU9CucaBe6QJlPfOEM2vHWb
   oEOaZlBagM4y+PcACTLZw/jPQ2CtqjlCL2PqeZyFTaQ7pM/TbNvfk8gXO
   E=;
X-IronPort-AV: E=Sophos;i="6.09,258,1716249600"; 
   d="scan'208";a="414879173"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 15:24:40 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.38.20:37986]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.47.88:2525] with esmtp (Farcaster)
 id 52fc12c4-fc78-4936-82aa-b0c63a035f2a; Fri, 2 Aug 2024 15:24:39 +0000 (UTC)
X-Farcaster-Flow-ID: 52fc12c4-fc78-4936-82aa-b0c63a035f2a
Received: from EX19MTAUWC001.ant.amazon.com (10.250.64.174) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Fri, 2 Aug 2024 15:24:35 +0000
Received: from dev-dsk-jorcrous-2c-c0367878.us-west-2.amazon.com
 (10.189.195.130) by mail-relay.amazon.com (10.250.64.145) with Microsoft SMTP
 Server id 15.2.1258.34 via Frontend Transport; Fri, 2 Aug 2024 15:24:35 +0000
Received: by dev-dsk-jorcrous-2c-c0367878.us-west-2.amazon.com (Postfix, from userid 14178300)
	id 0E1D8A79E; Fri,  2 Aug 2024 15:24:35 +0000 (UTC)
From: Jordan Crouse <jorcrous@amazon.com>
To: <linux-media@vger.kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Robert Foss <rfoss@kernel.org>, Todor Tomov
	<todor.too@gmail.com>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/2] media: camss: Fixups for large capture frames
Date: Fri, 2 Aug 2024 15:24:32 +0000
Message-ID: <20240802152435.35796-1-jorcrous@amazon.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

A few small issues discovered while (thus far unsuccessfully) trying to bring
up a 64MP sensor. The chosen frame limitation of 8192 seems to be somewhat
arbitrary as there don't appear to be any hardware limits on maximum frame size.
Double the maximum allowable frame size to accommodate bigger sensors.

Next the larger data sizes end up needing bigger pixel clocks. This exposed a
bug for 8250 devices where the VFE clocks are shared between two blocks, but
the CSID block is being initialized second and overwriting the carefully
selected clock rates from VFE. This was likely not a problem earlier because
the lowest VFE clock rate that CSID was selecting was good enough for the
family of sensors that were being used.


Jordan Crouse (2):
  media: camss: Increase the maximum frame size
  media: camss: Avoid overwriting vfe clock rates for 8250

 .../media/platform/qcom/camss/camss-csid.c    |  8 +++----
 .../media/platform/qcom/camss/camss-csiphy.c  |  4 ++--
 .../media/platform/qcom/camss/camss-ispif.c   |  4 ++--
 drivers/media/platform/qcom/camss/camss-vfe.c |  4 ++--
 .../media/platform/qcom/camss/camss-video.c   |  6 +++---
 drivers/media/platform/qcom/camss/camss.c     | 21 +++++++++++++------
 6 files changed, 28 insertions(+), 19 deletions(-)

-- 
2.40.1


