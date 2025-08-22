Return-Path: <linux-media+bounces-40717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE160B30FAB
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 08:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FFF91CC69CE
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 06:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8092E62C3;
	Fri, 22 Aug 2025 06:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkWZuFLX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344802E3376;
	Fri, 22 Aug 2025 06:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755845955; cv=none; b=aEgGa/EALqbsaEGfzGpBwboF1JnJfTarKdv+9L5AGoYjOFv+WRRN5oaGO6gyWJCOhCI3IHHaS3Fs9gcXZqeSx1B2Vty6c1SNDvgwEL51tBcJvKI0cSviOIPt713uk+wFNdyNeJ1kvIVhnBvOG3CdojHZfibVMOUmRJ8mqDLeSCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755845955; c=relaxed/simple;
	bh=rUj/yfCKcqTqtUi4Y7Y/wwWhuggIn0a6BUKAM1IKSWI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uPn4VwkRMb4NZzA14HROjz7qO8Iv2wOZ6LhQtuYVBJGFGjhYUeRcZjLVUlDCl8cugBMfaPdMtBoVtCm7Nw3+xPG0p15iuz3o9hDDfDLii/YJ79ZZtVQPpwipRJpZKuT5mja7zoLR3kEVO+62NQppVAiMZekmo6Z/fz/X6ovO/tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkWZuFLX; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso1489564a12.3;
        Thu, 21 Aug 2025 23:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755845953; x=1756450753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4thhVB+q3+L84MtJwszNBDIjH2Zey5SbGCUKuXXACAo=;
        b=lkWZuFLXF+BiuNSggTtg0y5CLuHV76riwmb/GT9BYKp7IU1RjXOwPhu9SOwOJKgWYN
         zpYxU/QPBEo1eJEDSQMjINCPbc3Qqi6cAZvM/rgzcNYvGGbSxA2w3C6aKjdEl9wvkv55
         RRlJYsUZwLCgrqbdUkzBwwzz2O7awEB43rOQLYhWGPxaHkkJ4KUW7zQl4LxDzAG6hNrk
         GxOQIhas4BGwFnS2c0klWKAAXpSbyQVw+J5kpr1LvsTvc8yqYakLTUBQ7/5HfvUSd1DR
         MhH+kLowcC6TL8e6DKHY/J5CVJiSms21jHi1Tg2kMjGEQObvF+d0KtHYda2gcB6mGloI
         fP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755845953; x=1756450753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4thhVB+q3+L84MtJwszNBDIjH2Zey5SbGCUKuXXACAo=;
        b=riyaNbPHyIPETjVDxChkC/n4LpJ77GUSfyQWxlvTEPlmzR+ywRQT5hLcJxisTdNlOI
         trAiSnJZJjt5SEiLpcpz2LrqxQryO/lxcyZUWh8L53RwooNRRVSgbbdg9cyq8JISH4Kg
         BdfH/6nTPA8+I+qG12CAU9BTsx6ueVag3sKeobFivblsw7i6nkMISVURfXn8o6yMa3pS
         s0jHKsh/4dvTR25rsNpqqCk+MC8awrS2EVKGbVLz2vzcDtttY9iWOmEE4KliTuhk9Wz9
         +41UlapGAG5598wveKJXPBtS88gVh39tJCc6wuuNSgUEd9jxPWijWo23s47cbov7ihh0
         7xfg==
X-Forwarded-Encrypted: i=1; AJvYcCVlL4lgqxWrHZbz9Rbz8Ez73dBvbK4kkLPL+C7wR7IgpvWWk4b7I0cRY3tI67Q0TBS1Vtqr1JJ9sUO6KQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeRAXZm1d5DdUgPGCk1LEVf8sLSKZSeAwNyS5iP/w8liN0GaFj
	Myz/z2Ns0N5PPxTIBxGFoa1pocTR1Kk0JM1M3BZLkOTNBp5ePQN9NI1o
X-Gm-Gg: ASbGnctQIE9hBslOQakEaRozunlwXIS7gfu9Aud0WSaNF3r/93ipdNkcbb4uaX9R8mq
	Y8GmjhObtkk+rbW6FdPt3hq7deakqSgox1Qsav3P6MNKJj8BfWKlEUoLRxSnQ3ZtNHjxu2UllQC
	5oIMcePDogzQyvTR6oHSTn6LOEyDEFA/2ECert3Ut2qdT5zkmvk7q0h6BZRgSgb+Gs9bVCmylcb
	1erFph1dkLPC3/ewD8WZsp3aSUR+IxSu2THE+4M8JE5vcN6nHorwLGcIf/U5PfdihsLFAl8c4aF
	qZPsph5uF2NcJka7e50ZEe6ajJy6c6WJrDphDMPD/5v7wbLlOh4K+ozYt6Yusqrm6PUYWeVBpc6
	pfk6+hdjwMTS2tFSpDlaarggM4K9l0lKoM6aTeT37e1aw6QMIzg==
X-Google-Smtp-Source: AGHT+IErBkF/SFoXIWhW8kxR8e1qpeLK0vSULa1gxTblBwP4ZJFloNeCmzda5LeV6C3Aqq3fX7dPGw==
X-Received: by 2002:a17:903:1a2c:b0:234:a139:11f0 with SMTP id d9443c01a7336-2462edab80amr33174755ad.7.1755845953241;
        Thu, 21 Aug 2025 23:59:13 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24626b2ab19sm19747265ad.72.2025.08.21.23.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 23:59:12 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: dwlsalmeida@gmail.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH] media: vidtv: fix to initialize local pointers upon transfer of memory ownership
Date: Fri, 22 Aug 2025 15:58:49 +0900
Message-Id: <20250822065849.1145572-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vidtv_channel_si_init() transfers ownership of each object to the correct
table through functions such as vidtv_psi_*_assign().

However, since it does not set the local pointer to NULL afterwards, if it
fails for various reasons and jumps to a place such as free_*it, memory
that was freed in vidtv_psi_*_table_destroy() will be accessed and freed
again, resulting in use-after-free and double-free vuln.

Therefore, local pointers that have completed ownership transfer must be
initialized to NULL to prevent re-access to already freed memory.

Reported-by: syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1d9c0edea5907af239e0
Fixes: 3be8037960bc ("media: vidtv: add error checks")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_channel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index f3023e91b3eb..3541155c6fc6 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -461,12 +461,15 @@ int vidtv_channel_si_init(struct vidtv_mux *m)
 
 	/* assemble all programs and assign to PAT */
 	vidtv_psi_pat_program_assign(m->si.pat, programs);
+	programs = NULL;
 
 	/* assemble all services and assign to SDT */
 	vidtv_psi_sdt_service_assign(m->si.sdt, services);
+	services = NULL;
 
 	/* assemble all events and assign to EIT */
 	vidtv_psi_eit_event_assign(m->si.eit, events);
+	events = NULL;
 
 	m->si.pmt_secs = vidtv_psi_pmt_create_sec_for_each_pat_entry(m->si.pat,
 								     m->pcr_pid);
-- 

