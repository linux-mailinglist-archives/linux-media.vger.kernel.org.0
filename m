Return-Path: <linux-media+bounces-56100-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPgrEMZ5uWmyGwIAu9opvQ
	(envelope-from <linux-media+bounces-56100-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 16:56:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9750A2AD640
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 16:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D5FB3091C99
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 15:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6D12DC772;
	Tue, 17 Mar 2026 15:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8HEtXWy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6414E2D9EFB
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 15:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773763001; cv=none; b=reF1szDN7+vonohGYOS2eqg4y2XnVj+B2c2ASnyfCl5KKBkZofgtmKs+eBi30BGtHpnkLQRzilo8C3lZQIUyfzvWTs8J8MMyiCmPeshym4Db/kvIAdDJ5qt/2rDzF3otv8Cn5aBUxTk2YHFRjxy+TSaAP205JW/dqsf9BcRTT7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773763001; c=relaxed/simple;
	bh=FqwVY+k3SGk8TAJDKHhTXtNvhQHrDRduwzSUo5VOmwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g1Jg3DU7Jxl+P2hLRXtux4ir0wIk5FOKgLAk/280PRBka8f357a2lda7hxbG8CuEJ13YG2nsnTr4X9Pqj7nNBVR0wbv2cZbl3yt1JYzo6oxBfXy0U4f+f100wLsUxGuFEmdc8LubhuUIFU7ixuZQ63BDunL/gDORBEJCPT8ekSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8HEtXWy; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso67890545e9.0
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 08:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773762999; x=1774367799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=focQCcFKweFm9YkNGVKAAlAzSn33WaBiPYVWwXWj8lw=;
        b=L8HEtXWyETC6Km1vhAocwyuEPOazxCvVdX1cEun6YnDRkHrYSsOn0xj3ILOQfBX+rX
         Av8JfE4Zy+dxTsDQoVBXMAdVFJk/ehab6PeppytdV+6FZcHlfiTnoI42DH/7h3pblbsP
         dzVfDEB0Q9ktcvQn5LyTJN3c8/N84CXdhTVO39cYXuJ91QTF7cCHj7y6OKPjucDnJO8r
         bpyIC2YHQnrEUcTUTKyBFcMwl/sI66ZTtQOivrXIJbKuGDTtOfq/zfJWC9j6n7YpqzSc
         HX0xjKP5HhA9dgELe7tyVnkFMk+NdRc0JeUYRFw2sl+V4VXcMy7WIosuhwiX7yPC6h29
         MoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773762999; x=1774367799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=focQCcFKweFm9YkNGVKAAlAzSn33WaBiPYVWwXWj8lw=;
        b=ZpkGs3lNpfPwxEYqH1UIW8o+1ATGYnEb1bLoz8CkxhAyVj4StuKaw7myX193Ab1QB3
         frFcz/WZDWuYCfIgrpNYwZ2tsRl63D3dxbfAQ5RYNFQIPxCoBm2605K0vPzTfl4RDsyk
         Q7+ColY86+t2TdLfpCPQMNSkMyGGopfLu39AVPOvB9MPvHC/VIt/ygaDhJYSrmdET+hE
         uf26221aw4Kw4V5Zb44znhKlBLlI+NNjvRQSJrq7TWmt7WrrHkULctdIBK1BRvYC+k5F
         ZZIP8gBbb4mUApPkLJusEHqRnW+8iH/vM0SUaxOVJ6vmsmOfVSiVih2ycplzUc6fERjX
         71sA==
X-Forwarded-Encrypted: i=1; AJvYcCWfJAMvDsXYRN4TgN71a+ItyKR9TWEEiEzu/qNLmETuLS6tDITmdM1BJiLOH/zLt30HjoOCOZhHbh1Xog==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNpWBeCDPGIQyrYuMT/+23H2qk1gm/eoMEQ4Yb0hUsDJp1UB3F
	IoFsKddDzQuUYC4YgZ1r/qpgkGQijzQEBgIze7tBF52iuNgGMSBYuTzN
X-Gm-Gg: ATEYQzylrf6OkLkKkbyLCNsrefejIG9Ohy5dzyMwJTyQVJFZ3eNM/zbuWKU3OWoEcmW
	Q3lf7LnI0g0vMyvm5eT2MJf1FZVyXOZZ/MmslHAtr0ibu0SsoEo9GenCelGtM84Pdv0c32XayBD
	z0AhRem9dCEoH0lD12vJTLkC8WVsg3RdW81P1WWwMcj5Akk5opKJG96Z2qUmZVFRbGS1EaYNNFt
	cyXiNQreriWk4ot13fcJtgX188zvsVJWlkeOoIFRj4e91vB1HAyC6LA3RHcshxKTeG9e5QYlfBd
	6rwuxPa4ebV0n/8FVP5yFIXqrn3PBizUvPs9VNsPc9YZDuvH3/1rjf0kFGhpu58klPOv72+rBKq
	MQNn5Jmn7lJ9comcsSugYjQ46gRRvyPVQ2SBEYgXUY9ZvM78m81SQ3PkB3igh7HPqiPy4citfcS
	Ea88hEnf82iWp2ryZlZ6e1IGWcOcfuXLZbETqToG6C6u0Ru22IYOljLi/EGoht6w==
X-Received: by 2002:a05:600c:c055:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-486f4476ad8mr179025e9.23.1773762998448;
        Tue, 17 Mar 2026 08:56:38 -0700 (PDT)
Received: from localhost (mob-194-230-148-148.cgn.sunrise.net. [194.230.148.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f420d7b5sm2797485e9.2.2026.03.17.08.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:56:37 -0700 (PDT)
From: Teng Liu <27rabbitlt@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Teng Liu <27rabbitlt@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove unnecessary parentheses in return statement
Date: Tue, 17 Mar 2026 16:56:36 +0100
Message-ID: <20260317155636.99844-1-27rabbitlt@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56100-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[27rabbitlt@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9750A2AD640
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove unnecessary parentheses around the return value in
ia_css_pipeline_get_pipe_io_status(). return is not a function,
so parentheses are not required.

This addresses the following checkpatch error:
  ERROR: return is not a function, parentheses are not required

Signed-off-by: Teng Liu <27rabbitlt@gmail.com>
---
 .../staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
index 0470871f8..fba567de4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
@@ -446,7 +446,7 @@ bool ia_css_pipeline_has_stopped(struct ia_css_pipeline *pipeline)
 
 struct sh_css_sp_pipeline_io_status *ia_css_pipeline_get_pipe_io_status(void)
 {
-	return(&sh_css_sp_group.pipe_io_status);
+	return &sh_css_sp_group.pipe_io_status;
 }
 
 bool ia_css_pipeline_is_mapped(unsigned int key)
-- 
2.53.0


