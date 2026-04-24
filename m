Return-Path: <linux-media+bounces-59495-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA7BN7Ym62muJAAAu9opvQ
	(envelope-from <linux-media+bounces-59495-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:15:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C38D645B48E
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65CD13004DDA
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 08:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BFF311C2A;
	Fri, 24 Apr 2026 08:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr4SIXeL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A16315D58
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 08:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018547; cv=none; b=WvTJjSAXQlIm5uaYSUCWH7vV+YEc0V2/C4RSalg5O0epZM88cBOr5AbHACI+68qHXjFKiJY6XSfcoF+xeNLvXmZkVb2fdNTj7/FYsodb2Eqby+119Umk3izcz4qGkddnoCKl8HFvXKEQidK1GOsBGN+PcnVtUUw2cIkfmEUU5U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018547; c=relaxed/simple;
	bh=undu5dkCTUgwl1M8+79fnIw1tnD/iD/mxZTBPxvLUMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjlgC+APwoSua4r7ebZPkytU0mrvYXPnbLTdMZi9zGNVPBAFIr486AzxCZNcpXPFvOd5ovL+5v5isq5PR85pC/OlhS9sxfE3wtWeKuXFj48whb0wSkPfSdRAAjMuZ3tOttb47qkQSDL8sqiCACpa/MNNu/S6w8OO9PvhokFfA9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr4SIXeL; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c76c067bc51so2958778a12.0
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 01:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777018545; x=1777623345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qcv3yPzsXnW5c+HXfigOkDMAbuRYnw8S8vUv2u2wfwA=;
        b=Pr4SIXeLJDnpDBGlC4ysqgqrZ7WSGX1UbMsb8KKLxiUzN6g2acvnDQt94H9qJqMARo
         NNo35ievTIsfOLhZ7JN8Un3v1CaAA0G81XD8MGX1PJyLiO5KfDXLEfFDBXae4F6freTV
         dci1SU4hUswRubUnDAO+w6qyY27Rk1idC3q5Ax3VJTsVLk7S9Ahd5hyLt/VD1pLyBmCq
         Dg562Dwac3lh2n1vNyhx3H/hNOM3KZQdjMn4An0beg4bTa2T55/6cVFm9rsxWFm9DOeb
         c300IeYUBuOJ6E3QRwMBkZhvAZq2UJg7Nm8BHOPeubyLmw7uZ0YcMy7TU6c1NwUnP3OP
         If/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777018545; x=1777623345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qcv3yPzsXnW5c+HXfigOkDMAbuRYnw8S8vUv2u2wfwA=;
        b=hn6Azs6cVc0hdHx6ESYDrlKpCj5X969nd3UzUF+5vEpUqcNcHP9M/y/hUWmCZVfSUS
         lCL8HJ1Zg8L+KUSM/bDFkNLQJ0sDDORVjXIBqiul8VHTGHM5uQ+uQ4IvZ+aAD6P8cile
         dwzsQ+5l3Iilf6Z4NojX4d45LS/AFwpt0+aMZAkq93mvpfNGbu0lYygnGF5dnC9wPZ+P
         tP0p2PacVeKYvCAWUC5qIcXShnQaIkA9+im0R14uH8gmuXohcIVC8b+X1J/DpUjvBvHL
         TwZ+S73AcYPu3viSqAVrkW6Ke+j3haltn0M9Ir2QH45+T4DlZTBDY8kEGwbJmoVmW4dD
         RGEg==
X-Gm-Message-State: AOJu0YzEQ/vhjIc5LgvL8+E9qIM3ZNOwWDf31GNgc8HRTKMJWO1n3R+m
	yDkznqrXNaVsUVqlV3xhdLZ/V/n/xuG2dLvgn1yMgBl9YpiZVs3fq9Cg
X-Gm-Gg: AeBDievBK0VEqnFwaPriZvkUc2RU8GpEYTLzzcN6/kCb+7CeVlyexmiy1maGZtoydhC
	H/EL6NDtVEgnkXmQsSxVnHLwLTkvE5MzCZ2MnBGslufIks7didzN0IQcLjHVfQ4hzx2qh7BIFqB
	dKnXfqFGmkilvQ7Huz3KmrZXs8EF7i0vXDwdqerSq1CFpQD/TU4xu/bPCI4OYB7WXOXzoq6vu8z
	1+RF34EWQJl/ewpuou0aDJqK6TcGVe+nQ9OClpZqjjzMkt+7eLdGZSQXMNheobeg0e2SYeFl1QM
	l7FFU4nWTE1XzPuyyZBYbQO3r9Gs+8/NOedbFLQ5h5frtg51UkAvZU1YysNRYaK7pAfZhTuS201
	BvBTlXSL3xi5KlhuyCHQunhH7yNT44sikE5/1T2LwGElLljv79Hz/37JjjBh7osVgTdBY0u2bC8
	HbNc99Ai0Ui4uHGibY+4tO6Dt3APfifpJ60kUK
X-Received: by 2002:a05:6a21:6d9f:b0:398:b95c:51ed with SMTP id adf61e73a8af0-3a08d8a3490mr34780945637.35.1777018544653;
        Fri, 24 Apr 2026 01:15:44 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:993:9321:304a:9347:5e0e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797702fbfcsm17347848a12.22.2026.04.24.01.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:15:44 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH RFT v2] media: atomisp: Add error check in create_host_regular_capture_pipeline()
Date: Fri, 24 Apr 2026 15:15:38 +0700
Message-ID: <20260424081538.459564-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C38D645B48E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59495-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robertusdchris@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

When calling ia_css_pipeline_create_and_add_stage() function, there's no
condition to check whether ia_css_pipeline_create_and_add_stage() throw
an error or not. So add conditional check for the return value of
ia_css_pipeline_create_and_add_stage() function.

This is reported by Coverity Scan with CID 1408952 as UNUSED_VALUE.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
v1 -> v2: Add Fixes tag (suggested by Dan Carpenter).

v1:
https://lore.kernel.org/all/20260423060246.296986-1-robertusdchris@gmail.com/

I am not sure if omitting the error check is intentional or not, but from
what I see from another ia_css_pipeline_create_and_add_stage() usage
in the same function, we check the return value after the call and return
the error code if it's non-zero.

I also don't have the device to test this change.

 drivers/staging/media/atomisp/pci/sh_css.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..6aa8a883cc76 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -7041,6 +7041,10 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 			err = ia_css_pipeline_create_and_add_stage(me,
 								   &stage_desc,
 								   &current_stage);
+			if (err) {
+				IA_CSS_LEAVE_ERR_PRIVATE(err);
+				return err;
+			}
 			local_in_frame = current_stage->args.out_frame[0];
 		}
 		err = add_capture_pp_stage(pipe, me, local_in_frame,

base-commit: 028ef9c96e96197026887c0f092424679298aae8
-- 
2.53.0


