Return-Path: <linux-media+bounces-52052-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMx3JS3kgGleCAMAu9opvQ
	(envelope-from <linux-media+bounces-52052-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 18:51:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CF405CFC83
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 18:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 210E23025790
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 17:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A1A38B7B0;
	Mon,  2 Feb 2026 17:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i921IfDP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6549D38946A
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 17:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054644; cv=none; b=S1o+QTKGYGEh4DUunHP7OGTkVwfbe3FHo1XXw1etbWPV8y8Ro0dz/IX0+0n4gOZKsnlaOEaokpe+fySCkO/AbmNydpl2BW0Ha4Vonku6Nrqm4JngUmK5HCdF939DikCIH1uG1Mc6y2GAKgpygYcVcR695bzXs5tb7BuTr7OAzV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054644; c=relaxed/simple;
	bh=+PQM96hqsPvIkWG34/bJvl9Vl8P1Anp0+8VbF48QW90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgSf9xJlUdTPoN96gnHwv9ACZj06FDFd0O3PQ2zzwmqCFXj6uEYgpVjEDsQUykAiZ1uRvkx0GjFXAARxb/S1f/tlZL0oqSqOCspMF5Axjnb4A3ickfvs7os5d86EF8fTfw5FPSDLqJFWkF7FMM6jbKkrtMvq5iEo5byYd4mjDwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i921IfDP; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-435903c4040so3189465f8f.3
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 09:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770054642; x=1770659442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hX40CpC9zTbC5QExNYh9/vufeOH8vmjwNZh+PMILogE=;
        b=i921IfDPU9OghftrCDiE9+IDHpuwxxf60SMOkNDWcP8EYHD+BrHcJXwUQnbkHy3NzJ
         VfJ0Z4+8cEt5wOZsmwulLqv1plkOosl6kPBPKOzGYmde+LLl2EI5vKZV0hCie2jeCFA6
         LKB4gId12TqbJtEJa+nYbPDwyWboFaW3/7wMzGTaPJkwSCcbnRsbab44jY7Jg4TLqWgM
         Ojit+oSqYJDdxbowlKW2M6AKb4YPyRa690SRmcNoutkBaEl7n1UvbFJh5wnON+LWR5Ee
         +vhLVxK3BgZoNm1lFduo0lS81VNUAJFsOC6jEnlDCblfuRXUNK2tAicRIMV7NTTk16dE
         2+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770054642; x=1770659442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hX40CpC9zTbC5QExNYh9/vufeOH8vmjwNZh+PMILogE=;
        b=Mtw2CiGkZxe1e1OjExUKXQUGRHd9y87PG3aMDbdp3oKqfklCItsO8vlQO/M63Gxhbp
         5+YToNF3MjWYR/lEWDyLpvxtsE9sFM+mny7sIo6F/4Sp3w/r1uin57BhzSZWwrma3vIx
         KBluUYwsEHhVWKdbSg+uPc+846jPMAVFhmYwsMAc3OwPjulyEzfAnS8bBVJS8V9H4ma5
         /a2o6IGrgQYkz52UDQ9ZZIf93J6H77EMHhwzgBxPwUSyEEihdJSCzOJcNneSyI6HVM/I
         NCrmo8Yw57hPRlajF2f2ioz0Ze8lcUyBkvUmPug6cDDgU8Kqjeo3tzVyKSBCFlPioY6K
         H4Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWlu3MAhRN7VsfCM2CpwahGaaApPo/2L2DAGlc+rIJiNUxkzkI/4LZiYSwY00oVk8o8lamS2Az8Q3re+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXN0cYijkdwC5S8ABu97Li+rQPFS6wqB0ZZSz8LrK/VRoEvzWs
	hfqXe7ytqOQqDg2uRFhmDdqvhayLGPk30jf+6gD2h9wSKbe/UbMWr4dz
X-Gm-Gg: AZuq6aKdM7xIVK4a6v3N8Vn9XdzmTVlM5on0UXwllFW/A3BPpFlI92755tYCKHSMqB+
	um6NCktlO3JVl5NP7CrXKWeEXYLw9sEreDTICWx+SvZzjQPfmWKbbR5/yX3iFCsUy6iprJL3hPq
	XDGTI72tADl0jL1vNaTviMdocsDy4yGaYdHMJJmMjebtem1SX1IQaCwttwwtukaGlJCKL8gJnNK
	FEvm3/drgbiuFg6Nl6KtukSTrR8DQyONMdoyeWASVTXcq3n8WrC5zrvKZ9hqVFBwd6O49hnKiQz
	DhvBaeqpmIMAhGwpdGpf7z1aArU8V6kwa771OCC/6rTF+U39b3fnW6JCnn/SWTnCRpqrPAGJKmp
	d+ZTViooxyiwTcSJ9/F5aHpeCxKWQSYbyzHmewSPpzMX1McPqTB1B+Pw49Osy6r+GTe5eT/KNVJ
	bEN0qLTtsFXo72ux9ytTB8oMF54ZcXNF4X6+NL0ngNUnOpPx0c
X-Received: by 2002:adf:cd11:0:b0:435:9e32:2b78 with SMTP id ffacd0b85a97d-435f3a7b46emr13958833f8f.1.1770054641736;
        Mon, 02 Feb 2026 09:50:41 -0800 (PST)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm47011359f8f.27.2026.02.02.09.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:50:41 -0800 (PST)
From: Bogdan Sandu <bogdanelsandu2011@gmail.com>
To: gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	bogdanelsandu2011@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	tian.shu.qiu@intel.com
Subject: [PATCH v2 3/4] media: ipu3: avoid ending lines with paranthesis
Date: Mon,  2 Feb 2026 19:50:32 +0200
Message-ID: <20260202175033.8640-4-bogdanelsandu2011@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
References: <2026020258-very-numbly-b36b@gregkh>
 <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-52052-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,vger.kernel.org,lists.linux.dev,kernel.org,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bogdanelsandu2011@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CF405CFC83
X-Rspamd-Action: no action

Don't end line with paranthesis.

Signed-off-by: Bogdan Sandu <bogdanelsandu2011@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c | 13 +++++--------
 drivers/staging/media/ipu3/ipu3.c     |  3 +--
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index e990eb5b3..832581547 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -1226,8 +1226,7 @@ static int imgu_css_binary_setup(struct imgu_css *css, unsigned int pipe)
 
 	for (j = IMGU_ABI_PARAM_CLASS_CONFIG; j < IMGU_ABI_PARAM_CLASS_NUM; j++)
 		for (i = 0; i < IMGU_ABI_NUM_MEMORIES; i++) {
-			if (imgu_css_dma_buffer_resize(
-			    imgu,
+			if (imgu_css_dma_buffer_resize(imgu,
 			    &css_pipe->binary_params_cs[j - 1][i],
 			    bi->info.isp.sp.mem_initializers.params[j][i].size))
 				goto out_of_memory;
@@ -2298,13 +2297,11 @@ int imgu_css_set_parameters(struct imgu_css *css, unsigned int pipe,
 	if (obgrid)
 		imgu_css_pool_put(&css_pipe->pool.obgrid);
 	if (vmem0)
-		imgu_css_pool_put(
-			&css_pipe->pool.binary_params_p
-			[IMGU_ABI_MEM_ISP_VMEM0]);
+		imgu_css_pool_put(&css_pipe->pool.binary_params_p
+				  [IMGU_ABI_MEM_ISP_VMEM0]);
 	if (dmem0)
-		imgu_css_pool_put(
-			&css_pipe->pool.binary_params_p
-			[IMGU_ABI_MEM_ISP_DMEM0]);
+		imgu_css_pool_put(&css_pipe->pool.binary_params_p
+				  [IMGU_ABI_MEM_ISP_DMEM0]);
 
 fail_no_put:
 	return r;
diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index c33186208..fe343d368 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -556,8 +556,7 @@ static irqreturn_t imgu_isr_threaded(int irq, void *imgu_ptr)
 			buf->vid_buf.vbb.vb2_buf.timestamp = ns;
 			buf->vid_buf.vbb.field = V4L2_FIELD_NONE;
 			buf->vid_buf.vbb.sequence =
-				atomic_inc_return(
-				&imgu_pipe->nodes[node].sequence);
+				atomic_inc_return(&imgu_pipe->nodes[node].sequence);
 			dev_dbg(&imgu->pci_dev->dev, "vb2 buffer sequence %d",
 				buf->vid_buf.vbb.sequence);
 		}
-- 
2.51.0


