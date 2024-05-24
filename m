Return-Path: <linux-media+bounces-11841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 825898CDEE7
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 02:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 387421F21872
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 00:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C42F249E5;
	Fri, 24 May 2024 00:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="hoDXltts"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3070E442F;
	Fri, 24 May 2024 00:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716510565; cv=none; b=OmsnBu7k49SgDTY3c90tgoiXpJLI2v4s31/U8PbZxiZlxP5Tkx7Yz6ODtWv7mWWfcHvfHuh0abBs9sd0+GzjZJCxk/4j1BEBhN9Gm+Io0yE3VPSwL+GhhDNyrK5Af40zUwnCrZryMcWbPLtyhFdTzNSdLSPyp2x07Zu3BQgtaEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716510565; c=relaxed/simple;
	bh=dOU2HlU0/w6ci8LFqlo6a30nS8wu2MvbnTRwPS4vabk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=stEv668AoOWmPycJM1Bq3MRXxULPQeqWTGKb0H95gD4dz5G1UIrXdjFGtUKOhupWFL5dgSHeXd1XKIWEKwBuIUVt6eaBwSnwFOCy/tHAk6ZV4kqq0iwBzz7rq8idxSlhRGed/tEWBL9fVBDKFx+eCl7M/0qLlWDj1Eu84Vrpqws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=hoDXltts; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=3D/IYueq+hxsvePuUrKW9Fxc6bMWD09JIKhNf8t/Ay4=; b=hoDXlttsPf5BABes
	eg+Swmm5uTfnBlAUrkVcPad/SawHzJsxEcy93H9riIpzbfUHN30LNxXOF9yy2O3RpeHtxaDXcg95P
	9wtXki/7+OgPkvr4c/4MB5REuy4kfG354XYX4vTyFtNJyxVQHzM3tZNrXeokTAhKvlA/zDwcXhOts
	vWSw7p8GUi7IIh0cOityWgeN9W/KZUC21zIJ6AMs9UqPbhzl/XuAvrl716AXHN0DmFTQl0PMqnQcK
	S1o69tURUub6/yrhu7GxiOHBQl950d5d+vz/hRYy9R/ZVCbL20JttUEyOHG2qvKZQOV8RDIXKLwOs
	oXXIU1XvDGzKJWsrrQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAIoD-002K3B-1t;
	Fri, 24 May 2024 00:29:22 +0000
From: linux@treblig.org
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/3] media: dvb-frontends: dib7000p: remove unused struct 'i2c_device'
Date: Fri, 24 May 2024 01:29:16 +0100
Message-ID: <20240524002916.444598-4-linux@treblig.org>
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

'i2c_device' was added by the original
commit 713d54a8bd81 ("[media] DiB7090: add support for the dib7090
based")
but is unused.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/dvb-frontends/dib7000p.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/dib7000p.c b/drivers/media/dvb-frontends/dib7000p.c
index 444fe1c4bf2d..c5582d4fa5be 100644
--- a/drivers/media/dvb-frontends/dib7000p.c
+++ b/drivers/media/dvb-frontends/dib7000p.c
@@ -32,11 +32,6 @@ MODULE_PARM_DESC(buggy_sfn_workaround, "Enable work-around for buggy SFNs (defau
 		       __func__, ##arg);				\
 } while (0)
 
-struct i2c_device {
-	struct i2c_adapter *i2c_adap;
-	u8 i2c_addr;
-};
-
 struct dib7000p_state {
 	struct dvb_frontend demod;
 	struct dib7000p_config cfg;
-- 
2.45.1


