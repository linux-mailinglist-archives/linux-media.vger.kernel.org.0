Return-Path: <linux-media+bounces-45157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F4BF85A1
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 21:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBF9F46397E
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 19:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0E6274B5C;
	Tue, 21 Oct 2025 19:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ssn.edu.in header.i=@ssn.edu.in header.b="PdhDctOW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1F927465C
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 19:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761076465; cv=none; b=WnqcsAj6Rczm9rsZGqBp2lYWhNkvkcNuBdexg/o7BIP+zHy+c87W0jA6E1b+Ybx3s033D47FpP5YPMWvo6A9v3Jdd7XNookB36CUARrobCIQcw1bOUGp68wfR3JowQd1npzPL8re5PnMkJY8DBkJDO7+YyDs8sPf4uuizleMgwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761076465; c=relaxed/simple;
	bh=P6gOTDuxOa/YTaF/r+9WBSdmbFeLRsp1krHSzNxYKmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NALStgqUI7QFMdHLl+ywyqRbMQFM01O4lhTrOOfNvPIEXengkSrUqxWAkfBlBBkN8LeE6EeHMA55PO8cnOieXGVbizGechPSk9pGK2TnkVLssQGF+RlCrMD6NJnhrMdtyd02cIIZj4u5giaYObtwFaKi2pdIX+5vBxAxEHw00BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ssn.edu.in; spf=pass smtp.mailfrom=ssn.edu.in; dkim=pass (1024-bit key) header.d=ssn.edu.in header.i=@ssn.edu.in header.b=PdhDctOW; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ssn.edu.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ssn.edu.in
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b67684e2904so4285683a12.2
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 12:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ssn.edu.in; s=ssn; t=1761076460; x=1761681260; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AcFoefsaPjLXkyzo6zOvLiCXIAfemQ8FPLpQYhQcMBA=;
        b=PdhDctOW7LHTQOimwSD41mYdY6sAt+KdYPQZ+9z1mFn+kdzilygT49LPQOdBHJCT5F
         2x5ayXsJr7fzjnso4OEv7wIr2BJdCYCgD6McRk/u8Ye2JpG/ZpV7Q1EG7tZKhFahL38m
         f4HTyLdufSA/gJ9odLJz0lbtW3QGKBZN6npeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761076460; x=1761681260;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcFoefsaPjLXkyzo6zOvLiCXIAfemQ8FPLpQYhQcMBA=;
        b=B+UapsfNh7ceKVH8GOpTR+AfMYgSoqTATIek3YRfcxohvdtBxfRIoOgoRE+MeEHpB7
         YsovxJM6IRY5B0KeSCMbHS3iAsztnebDVOQQ/NCB3t6xB+K9CjYNXvy5wkYff6STDKRj
         UUk6vkyugnyJ8mI0/HZAoPGrZ/p93kqgJ6hJ+mnFhy6uXXw5fPBxVt/LnFLnH/N1mMyZ
         1C1YcMQwXYKItGZsjaNl433IqClRncz71bscU7/DjIui+Ae7Yg5PGx+arZomKBez2l8q
         c4Ewv5Lc03KcWzXDeqMDySYL8zy6F48LOkyNfgycvdKjlsfYhS4+1RIYDO+DodkmYaa3
         RRYg==
X-Gm-Message-State: AOJu0YxC9CsBUJNovL1QxqgjZOHvlnlyF2oblIbiZ4xg3wFcc8LTLjyM
	oLEplHRMfwrw1VBR75n6Of76ELHv6BQiZ+MkfSke0NsMHErre2Znjjkn1EE4kNGm9fmZjOPHxtC
	xtNl7tMUDQddyCaPhddFozXeY3S3KRzUGqDkbd8Z/Hmdx1jQ2nyQankxpKIs1Q2dwcBOejDCcUd
	3i
X-Gm-Gg: ASbGncvWEjZLE3EtXpVyMMneOanhTCjTKKti8oKSwX3dWS5I1OLp1YWFCYMH/wZFyf9
	f7792LlbYn+cmgmsgezfu95Tt/liIWVSgZyJ9HBQf8EzEagiSnFnv86AqcJ94lZuJFAb0cWS/QA
	B8sFbNA2oQ+vEGsAL8ztvtmdhnYQXoLOA3mNLmawrcmUXZ6OQt4Xj7FJHGfitfjHSbxKfVAldNc
	z8Ant2UsKUwR4ErEpDWzLrcykJn56xXH9CLM3cQIC4fU9NrZDsdjorHD4T9ZlvXxQ4ynuePDA2m
	Q9O03Ca8+YCM88lmO0/pvBE4Yg5CvMFuJIC/AE81IZOPhoH6QWVVpvSwaC1cW8Nz4Q93BZ9JfTg
	41zWcvVUTuSSgJ3R/zldTe3kQJk37YjkKUDVWVe3EyaOOqwx8b0H5F5S4QUnoVEyIj51bCOZI3L
	a2qxiih2genvm7sPV8zNqJhelbYD1mQ49zAv4X7xT+ViK4SwDY1guwO+YMCESz0vWDWzPVE3uV6
	zhiUGfZta2eo61u9fydEivpeA==
X-Google-Smtp-Source: AGHT+IHdqPILmI5njIqVDpKBmLui9usuOxoUPpD/nquNAJpzxuM5S7Wu7+rKnfoB/re6af/wm8VuZw==
X-Received: by 2002:a17:903:1746:b0:290:9ebf:211b with SMTP id d9443c01a7336-290cb07d223mr220000405ad.40.1761076459335;
        Tue, 21 Oct 2025 12:54:19 -0700 (PDT)
Received: from biancaa-HP-Pavilion-Laptop-15-eg2xxx.. ([2406:7400:1c3:33f3:d5f3:33d1:a1e0:46bc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fddfesm116662155ad.88.2025.10.21.12.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:54:19 -0700 (PDT)
From: Biancaa Ramesh <biancaa2210329@ssn.edu.in>
To: linux-media@vger.kernel.org
Cc: awalls@md.metrocast.net,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Biancaa Ramesh <biancaa2210329@ssn.edu.in>
Subject: [PATCH] kernel memory safety check in a block
Date: Wed, 22 Oct 2025 01:24:12 +0530
Message-ID: <20251021195412.176771-1-biancaa2210329@ssn.edu.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"

Signed-off-by: Biancaa Ramesh <biancaa2210329@ssn.edu.in>
---
 drivers/media/pci/cx18/cx18-queue.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-queue.c b/drivers/media/pci/cx18/cx18-queue.c
index eeb5513b1d52..025ba4e6e4be 100644
--- a/drivers/media/pci/cx18/cx18-queue.c
+++ b/drivers/media/pci/cx18/cx18-queue.c
@@ -383,9 +383,16 @@ int cx18_stream_alloc(struct cx18_stream *s)
 						 buf->buf, s->buf_size,
 						 s->dma);
 		if (dma_mapping_error(&s->cx->pci_dev->dev, buf->dma_handle)) {
-			kfree(buf->buf);
+			if (buf) {
+        		if (buf->buf){
+            	kfree(buf->buf);
+				buf->buf =NULL;
+				}
+        		kfree(buf);
+				buf=NULL;
+    		}
 			kfree(mdl);
-			kfree(buf);
+			//makes accidental double free less possible
 			break;
 		}
 
-- 
2.43.0


-- 
::DISCLAIMER::

---------------------------------------------------------------------
The 
contents of this e-mail and any attachment(s) are confidential and
intended 
for the named recipient(s) only. Views or opinions, if any,
presented in 
this email are solely those of the author and may not
necessarily reflect 
the views or opinions of SSN Institutions (SSN) or its
affiliates. Any form 
of reproduction, dissemination, copying, disclosure,
modification, 
distribution and / or publication of this message without the
prior written 
consent of authorized representative of SSN is strictly
prohibited. If you 
have received this email in error please delete it and
notify the sender 
immediately.
---------------------------------------------------------------------
Header of this mail should have a valid DKIM signature for the domain 
ssn.edu.in <http://www.ssn.edu.in/>

