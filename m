Return-Path: <linux-media+bounces-11871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 646378CF0A0
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 19:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 955DA1C20F64
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 17:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E42127E05;
	Sat, 25 May 2024 17:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="pF0n6eO/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4751D1272A7;
	Sat, 25 May 2024 17:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659571; cv=none; b=As+IM43rqfSn2Dpov7anuP5WmB38gsumHsirSM8AJW2JOWQoYRtkpfGe3z/4WY0YDa/cqtPoyDJL6Xoh9n9QE9hZIyxPAMHEpz5fuNnvmHqVa4FFgpO3bBm8GKjv8ZfyVHM8QEq8sp8k9Uu5VfDVVYvgXlj/IY3yEn1wXUJmVAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659571; c=relaxed/simple;
	bh=1y4EXq8wfxaWOetYmgoYWkfjBJRppuV2FHIZHW22ggI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GoJD7hwnDpOKQZZgVp42MYwbV4uXQvzigHL1WYcIHJvKIpVz0TOK6n6RLcjSaP5/6AgfwdNs7/Y6wORnUA9977LE6/U3qYmqQuuKJoEbMCoLln2LjELNtb/AKZqyTxrM6MB7fO45y1hO7RfyqGPUFTLO44b2tbslB+gu/1wPC84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=pF0n6eO/; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=EV8BtTECv6/pJPp6hT92djb0TBiGkN5o9AIwBaLUwCY=; b=pF0n6eO/0VVvM/Dn
	bNvOTgpXgWdmdfYNPrJntt43eWm+GjLFkTIQLtIaWCNexASM97FjmV/EVA4HjgH8reKRamHjVEDBf
	0g0gIZBSC+3H8n6CNt3rQnsrTaiU9v60/EKjPsud/FqJmPtf9k7GyUv1y3EBayK0Xye6LTgPEhqRM
	ZUkvFLPx2Iau60ooUofUdm6x0UDLltobJqK89CV2fpu36k4kLgGRluFVod5KXiuS+loqQnDdnAZUD
	r33AHpygM+4dnqXOuM0vaarHAhlUNxjQSngYbAAa2ATO44ZlN94sfBHG7BqFJRjEQZqfOQyg7Bvdq
	UczBxmvkD9pNSXHTmw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAvZT-002Wcl-08;
	Sat, 25 May 2024 17:52:43 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	charles-antoine.couret@nexvision.fr,
	isely@pobox.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/3] media: opera1: remove unused struct 'rc_map_opera_table'
Date: Sat, 25 May 2024 18:52:28 +0100
Message-ID: <20240525175229.100559-3-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240525175229.100559-1-linux@treblig.org>
References: <20240525175229.100559-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'rc_map_opera_table' has been unused since
commit 2f4f58d689dd ("[media] rc: Name RC keymap tables as
rc_map_table").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/usb/dvb-usb/opera1.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/opera1.c b/drivers/media/usb/dvb-usb/opera1.c
index d269f8bb2dee..268f05fc8691 100644
--- a/drivers/media/usb/dvb-usb/opera1.c
+++ b/drivers/media/usb/dvb-usb/opera1.c
@@ -32,10 +32,6 @@
 struct opera1_state {
 	u32 last_key_pressed;
 };
-struct rc_map_opera_table {
-	u32 keycode;
-	u32 event;
-};
 
 static int dvb_usb_opera1_debug;
 module_param_named(debug, dvb_usb_opera1_debug, int, 0644);
-- 
2.45.1


