Return-Path: <linux-media+bounces-11840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F21908CDEE5
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 02:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15D6A1C21286
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 00:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6B1DDC7;
	Fri, 24 May 2024 00:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="oUHkSNUm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3015636D;
	Fri, 24 May 2024 00:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716510564; cv=none; b=OGq6jCnyPxCYzl9e1u5ATvWjQDQrBCWebjiyCPTsjeMVxnvrJIjPMlDwP/y0ACX1Am2fM6vH+BSza1fOM5WwpCX0u4e/0MSKBL7gvr+RSbA4+OBq4SLnXbgVyjINYRIE210jgTTLK4uVKVKQ0HBEPwURwqt6oHJtomw9dBveSLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716510564; c=relaxed/simple;
	bh=n/Qntqkj2kmjfIGVMWcj5ShGuaFWHTw0NgUYb4wiS24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XEFc3lPtFCjIDU2huSeG1sdBSF3HSzo5cZ+67nNNkanYryhycVSDE/sppcOIIWaz9I1y+psJiPMKWLKIi3lxkl7bjLgsLKtHnqfAW1bgL37mQWFc856YdleTXNaOejWRcbju6wRlmiC9QN1cEg8s4dX9MTFqoEpDWR3RZoS7vNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=oUHkSNUm; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=4XOP33AssjiC4+55JbUuk9T5nWyr3hKcThL/cfujuCs=; b=oUHkSNUmlRsQijNG
	x3YrWwfKxNRm+E4w0RApuupbnZ5SMdjcMRZA4COxZUw5+4vRDO/C09qj0t70VlTb5vOWWhRBwzx85
	Y0WNOkOUOT6VtZFYQnCcB/uIYZ7VlRVNLNcT1Fhj+yOFhYuypSrQrIGVUsuU5+FtRBgDx4/lsBSy8
	Z3AbtH0n3SkbJjKOzwbmm3pV0lun6EHuBiXlrRFDWJa7Qp3Y+kenlHZamjJJqOVx3xwFHI7zRekfj
	qh+jfOhlDChA0/8QeTPUST6DTDPVTZi91Dn0Rcb3+ZMeo4kinm04Q5x6oAgiqYG6gKPwligCztpDF
	LWiGxFJNOPCTSdhicA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAIoC-002K3B-1L;
	Fri, 24 May 2024 00:29:20 +0000
From: linux@treblig.org
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/3] media: dvb-frontends: stv0910: remove unused struct 'sinit_table'
Date: Fri, 24 May 2024 01:29:15 +0100
Message-ID: <20240524002916.444598-3-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524002916.444598-1-linux@treblig.org>
References: <20240524002916.444598-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'sinit_table' has been unused since the original
commit cd21b3349437 ("media: dvb-frontends: add ST STV0910 DVB-S/S2
demodulator frontend driver").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/dvb-frontends/stv0910.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/stv0910.c b/drivers/media/dvb-frontends/stv0910.c
index e517ff757744..069dec75129c 100644
--- a/drivers/media/dvb-frontends/stv0910.c
+++ b/drivers/media/dvb-frontends/stv0910.c
@@ -119,11 +119,6 @@ struct stv {
 	u8    vth[6];
 };
 
-struct sinit_table {
-	u16  address;
-	u8   data;
-};
-
 struct slookup {
 	s16  value;
 	u32  reg_value;
-- 
2.45.1


