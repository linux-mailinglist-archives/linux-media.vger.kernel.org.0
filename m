Return-Path: <linux-media+bounces-54842-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI7tGsiVq2k5egEAu9opvQ
	(envelope-from <linux-media+bounces-54842-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 04:04:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E564C229BA5
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 04:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C4B03061E0F
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2026 03:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4142E11BC;
	Sat,  7 Mar 2026 03:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H77Upqk2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7828287E
	for <linux-media@vger.kernel.org>; Sat,  7 Mar 2026 03:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772852658; cv=none; b=BGPsXUCDqkRU6HknDOJw3CrPetfBxD4G4i7tIoLGRFm/HGbsLi+K2jP82WZrw08VgM4Bkl7SgmVvHjh3XGPR7V9BoCviPQaUDl23hUQa1E35CHW91AFpPsCHYYrKCCwA4G8OWEPySNAp3pPEhZT+BNApFpNnOvY3mdM6CW3r46o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772852658; c=relaxed/simple;
	bh=soc1nQwzOytP0zUgbCWxwApYixb4ALgKCcM8lxOFp2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bxXlr5vVPw9sC6Ez8iw/bXtCa4MF4o0EkDrSCChx0aKZhkzMgm/ZVzrNzI/1bWO0x3lAeov3SPGGK7wWDR1Ag9e+Onfo1guWesmstU3Zj45ZCkS3e2kRIiTeMzT+WJfCauh9HNRqt27wKGDPWY05Q/5qPoZwHozEY+0ZGQT4Vyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H77Upqk2; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-798374d0f44so145208277b3.0
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 19:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772852656; x=1773457456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TW4paroosegqJh0pxZU5dIW8jzge/McujMzL3aZu1UI=;
        b=H77Upqk2cOqNk2kkF7tDWt+96za+yRB0u44K9oEBoMiH5tl/OHFHKCROrkGcJiyd+k
         rNAd9IM+xtmLv4GFqNtBndgqbKIYelm4oGQBuFBAEzxGRRG8D8rQsFW1NnTbP/ZpGYYj
         UQyzkrSVbl7Kk1XjjbVBUxsErnvePATrsb+j4Ii27bOlRTfG4pat89VitspOgpkjpapj
         dYuM8h8jhimxjgzlGqsnOCeeKCHOGD03+QWB6z0dqxbKyts5hfltgfCfvubZTjnLbZrQ
         xgeJcUT7YyedKiV1jZ9vpRTZixs+df1qh4od2k8BiGlRH2BNl83XUvoeZrnJEo1I9nE1
         J1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772852656; x=1773457456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TW4paroosegqJh0pxZU5dIW8jzge/McujMzL3aZu1UI=;
        b=s7keqE+EKXlQCwZUS+lkQtK9pEqclOtt3rpIyJp/+e9lyghhi0DNS1lZDRMU0LUE9N
         Kb5u9rXdCxenbOUgH+OOt8QqzA1kj3FuHo21Rv6537SBKt6H29OVy5xomgJyNCs8eae2
         hflwY02D7j4RJ/wHHbvtVR1KBFOWF5/Ym+8sSx+0OhdXb3+AS7TOMCdAFgFMV/HOH1aJ
         gbqlJZ+5zpfCVBFeKK54EIcTYmWs9FmMdnV1AbYQVjcbwIDEpdQdj/IBMt+nHNvChwre
         auQgRHY4j6ldL3wfNeJcCDyRr1x3oGm8NRFx7rE18YnON/jyiRm79PE0B1J0uPjc7Qgx
         E/bA==
X-Forwarded-Encrypted: i=1; AJvYcCXfQ4SlkzNEYSaQH0pr3noAAi97BPHrqhoF+s3kOWFPKYemZa+lbylOx4kpYiuyeqQDxG97iHubxFgbxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnhu3e0DgX72cGP6IzsBD66V39TSly1DrMknu8UmCc/7x5Hulq
	Ermbuj+AIVmRH4Ruye+rg4GZUw9k4X9JkphcNZNmDROUKEdt/gTQvZ2S
X-Gm-Gg: ATEYQzy/uIKlhkoeyrNO7KMnjxr1cJxMCP/EOZq94FEg0mn8KM7qwmzAREwXcRXr1Ot
	rh5MELVXImSnDGUfKsnR4DHCITf0KGNUNNpucP8wT1HAhDAWAJuY239oH7PDM0sBZXiyy/N+10Z
	Cn95Uw0iPHzBsKvbC+VXvCEpcYTbJd1OqBmaqTHns57ueQDLn9gIPVzmMr2Fsa1+A9juHm7x/OQ
	qkIJ4D1QGvponKUhXnRDfvMaPtVi5D26KQbxWQ9Xa590c9kWH8UzOR8bhVTh9YrrMAWk9oS89Nt
	s1gjevKNf3nyo9H1z+wKadjw/tUqRJI3j1ATcjZqOR0vmxGkCQrUGcQhm50S+1Nnv0+wK9oldAO
	f5MsAPxKeEKs9LIgm58xdH/yyzfIE2rpAVGrxs8W8SKYciFTxVvjlBe9l/S5Gx7zQXwyWQ2a/pZ
	xPCFexoeM+biirxkqTcaXTZkNKGULzmV2JJklGISPzuXpEFBeraDDeF5KeqckpOOEU0G6GXvF3E
	7rMIBTTPHBSO6A/RtY5VFwg
X-Received: by 2002:a05:690c:c50f:b0:796:4486:b7d0 with SMTP id 00721157ae682-798dd6a9c02mr41536297b3.4.1772852656158;
        Fri, 06 Mar 2026 19:04:16 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798dee66c5asm15100607b3.36.2026.03.06.19.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 19:04:15 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: intel/ipu6: fix error pointer dereference
Date: Fri,  6 Mar 2026 21:03:55 -0600
Message-ID: <20260307030355.26840-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E564C229BA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-54842-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.982];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

In a error path isp->psys is confirmed to be an error pointer not NULL
so this condition is true and the error pointer is dereferenced. So
isp-psys should be set to NULL beforegoing to out_ipu6_bus_del_devices.

Detected by Smatch:
drivers/media/pci/intel/ipu6/ipu6.c:690 ipu6_pci_probe() error:
'isp->psys' dereferencing possible ERR_PTR()

Fixes: 25fedc021985a ("media: intel/ipu6: add Intel IPU6 PCI device driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
v2:
- Add stable tag.
- Add check for null instead of setting isp->psys to NULL.
- Add Smatch warning.

 drivers/media/pci/intel/ipu6/ipu6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 34f67f4f1bb5..d033d4618169 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -686,7 +686,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 out_ipu6_rpm_put:
 	pm_runtime_put_sync(&isp->psys->auxdev.dev);
 out_ipu6_bus_del_devices:
-	if (isp->psys) {
+	if (!IS_ERR_OR_NULL(isp->psys)) {
 		ipu6_cpd_free_pkg_dir(isp->psys);
 		ipu6_buttress_unmap_fw_image(isp->psys, &isp->psys->fw_sgt);
 	}
-- 
2.53.0


