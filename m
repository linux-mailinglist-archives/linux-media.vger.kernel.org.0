Return-Path: <linux-media+bounces-54243-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IAUKwcqpmnwLQAAu9opvQ
	(envelope-from <linux-media+bounces-54243-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 01:23:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6603A1E718E
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 01:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9112D3054CA0
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 00:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07EE320459A;
	Tue,  3 Mar 2026 00:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BvMotk0v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD391E9B3A
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 00:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772497395; cv=none; b=nMtF4uIjVXoXdOqrpYqmfaD0R/8mz8wP73of51pGgl/+tuJroQo9O4uxJppduE/ISo9V/zLzDQRJWfxjqM4U6CcJyczjVMBHiJ3buYBjCUSFiEQ1xMHSgpzPVZ8NLh4iijL1WiQYwKra8S9keNevt08Yztaam0eouhlDIexhk38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772497395; c=relaxed/simple;
	bh=LcPV1QmMy+rWVhJ+Odq+5wXcLl75LrGO+7iVwv3y4us=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HtDqEa84qGFFPQtHVQmULMo2UMTrJYqmyk99k4D/sj9KK+d8pBg8eOjtft9QqvLAN7UUCf6qZtBhi4OEuNZRY60v3J8b7jXy/S+cw84Hh5/wCR8x2yRXKCkaEaXpLkKQjHqEBVlp0/IBytihB76S1Py+JWuHz3IFykNuroXojc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--isaacmanjarres.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BvMotk0v; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--isaacmanjarres.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2adef9d486bso45656485ad.2
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 16:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772497394; x=1773102194; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h+S2hEoh3AkWLV1vPBRg6tolIoONYGr6f+l9MUzh2LM=;
        b=BvMotk0v9N9Y2X8LICpjhXP40r7RKpUwW/T5meoagYASNmc07llroBZzOpMhvDCcEe
         t+NYLxjONP+MZdbFN6PupNYOJ122RlkTVo8kdDRpF5W7ChMKTf+S0GIY3a79ACK0xJrJ
         NZH7GIlaAEPyWWOtgM/vQiSmCO/vaPO8ejIB0ov5HWtS7DX2Eti0f4jKj18aSdwGja+G
         mGODwbvFilgOYYaeBXGNcHkEO7MXWn8R4EhSCtpf7i7CPKXLwVz6lF+N4UUDoboPwgkw
         B99Dx4EDOMlwzjQ+SIBeAT+NxkbMIcdqRAK6JgdVaS6Pb3nOxqJQLFaBsIQbKzGOPEPR
         j4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772497394; x=1773102194;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h+S2hEoh3AkWLV1vPBRg6tolIoONYGr6f+l9MUzh2LM=;
        b=i+d3sS3YlC210yDNKonuWhNGVFEpc4Th+wVflSOnne9EaNv6rVDYl8nt8zuGET9yVy
         TUAoMpa/+LBPRlcwePDpsFoVZ63GahAje1U4RbQpqN83GYE4O8/g5LNOGQ7Pa+Smwebh
         naZWTcd30DLtRGwiQkAN5HlHlAp7a/NT2COXWjnYoPJ8fJ5XMQ620wCFyPkyjGEjTMmP
         Qn3dB+FLvxH6lR7wrrhv/YsKHl7WU8DHcg/CcNZddNJBewmn8L/HW5bi2HkjQSAb9NxI
         WY5Ct2AtBP1pXShFg7RPcCx19RhomP4xuzF+eFff7rvcOC+7yBWTFNMdsGfdQuQ9ixUV
         M8Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUHve/L8M4Va7osPgHqyQD/3SPDKV5LNRKBnCvo+Tg+lFpNC/U2OLU74VrA2940AH0lpQ7G8KmPgQmpYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwddRXSuAjiwQu2ckvAajmhcrUyZvtOnDyWJWddf/llMNcOr8KQ
	4WR74Z1GwFkRwNy9x3cGopuI8FAljxuwG4X26uBgyj/5KfNFLVD/by4uAPM/3H9EvMxmZM/HOpa
	whcuoK9bTb4y/1fC2Px2SIqZ8S89666+yQi9L7A==
X-Received: from pjbcm8.prod.google.com ([2002:a17:90a:fa08:b0:359:8d0c:c0d7])
 (user=isaacmanjarres job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:164d:b0:359:8c01:66f with SMTP id 98e67ed59e1d1-3598c0109f7mr3959561a91.28.1772497393649;
 Mon, 02 Mar 2026 16:23:13 -0800 (PST)
Date: Mon,  2 Mar 2026 16:23:09 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260303002309.1401849-1-isaacmanjarres@google.com>
Subject: [PATCH v1] dma-buf: Include ioctl.h in UAPI header
From: "Isaac J. Manjarres" <isaacmanjarres@google.com>
To: christian.koenig@amd.com, sumit.semwal@linaro.org
Cc: linux-kernel@vger.kernel.org, tjmercier@google.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	"Isaac J. Manjarres" <isaacmanjarres@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6603A1E718E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54243-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[isaacmanjarres@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

include/uapi/linux/dma-buf.h uses several macros from ioctl.h to define
its ioctl commands. However, it does not include ioctl.h itself. So,
if userspace source code tries to include the dma-buf.h file without
including ioctl.h, it can result in build failures.

Therefore, include ioctl.h in the dma-buf UAPI header.

Signed-off-by: Isaac J. Manjarres <isaacmanjarres@google.com>
---
 include/uapi/linux/dma-buf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index 5a6fda66d9ad..e827c9d20c5d 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -20,6 +20,7 @@
 #ifndef _DMA_BUF_UAPI_H_
 #define _DMA_BUF_UAPI_H_
 
+#include <linux/ioctl.h>
 #include <linux/types.h>
 
 /**
-- 
2.53.0.473.g4a7958ca14-goog


