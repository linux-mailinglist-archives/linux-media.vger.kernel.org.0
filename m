Return-Path: <linux-media+bounces-41747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C934BB431A9
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 07:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BDDA5E66A5
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 05:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2F8241C89;
	Thu,  4 Sep 2025 05:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2RYYtDx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7E18F40;
	Thu,  4 Sep 2025 05:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756964437; cv=none; b=A/Y/XuGC4v38atPcLKjyVCb2j3skx9t4hzk8Wbm47/rBfBwpTNlpdfJ/yX8LhEAYsymIFQwAlTITTKnhXuDq4a6J7xa6e65K6NSIiA3eIb33ueC9UqHlXmPalpdjjCLIIB7kipefM9xST2LkVyVLip22PORhJewlcxNabb0eHZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756964437; c=relaxed/simple;
	bh=OQ/E4y9kB3rGINfiUnkpCWTQCdSgM4fZZHZXppCOuaw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fsNuXNNgPLlWUPkMn0Id6q0ZlceHqa3f5JEwB9QxE37oDkXEy6JcUw8oW8C8kX1+QL/BqwBE8uO+YP3sEie+kOf5kwktX6k7C7dzDNzXNpYp4FFviWgJgtg/TZrIYKOL/ZyRiUbHz+ffCHpuQEmZUna6HOxKnUQCmaTBPNyqGi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2RYYtDx; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7723f0924a3so930419b3a.2;
        Wed, 03 Sep 2025 22:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756964435; x=1757569235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shL2fhdQ891TB+Ct80rXzlQvWNofQxPpdzFt0NH7YFc=;
        b=A2RYYtDxGCeGC04YbNDlUXVSmQz4Mxs9qgpewrUVW3UoTRltorKmYrdsZkS53qWsg9
         K7dc1nMgfhKaDu96j/3U/Qmq+Q5sF8gznuT1TljBZBbb0AiBi8g9RYUAbWtR/iOrrcKm
         NbvoeBeYWSjk614tD33mYFiIW2FjJLsgsFfOqtAyNmyUYqMEWukX1Ke0byVuu6s2XqOs
         6/wajemTALyAi6DeZ0eSOIIJgcGyqC7Osw841Zjj1Q5qdplY0g9CKBxxyDk1HPqGcQIP
         q9Xc7fYOTpQyQBM//xc7w3Q5++EkZhyH68XaV52hDdsgwY6EzyWSeAQBoHqKIO1RUSSv
         TWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756964435; x=1757569235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shL2fhdQ891TB+Ct80rXzlQvWNofQxPpdzFt0NH7YFc=;
        b=O5hd67RtKM1/F+SCQGhJxfcZmguH9Senp3e6P8JlYdVz+n7hDHhU7kCY/Gdcg2w0X7
         9nY7zBZQPITUJq/IcIDJA2bIT/jasrDZpKg5FWAlSKj+a+k9RdJH+wv6liT12ENnyaR4
         jDjX7tKvLu0M+Ihb3qNyDY/rBsqmjUkOggDJ/fIKT5zAH9Q1uUT+rmksQtAgg8CD/dea
         XxHbM7shRotYIRmT9c37ylMX+Vg6EeEfRipufl6kLFntmxqoMJFvnvE9HhBeyfYr3RgO
         1k2HASTDDeAEzlZXMcjKVcYCVxMwBm5LXghoSY5xpWe/j7HBVJ9u++8rSrabx09hvFOn
         BAvg==
X-Forwarded-Encrypted: i=1; AJvYcCUuXzjYo3pPsHHpjYBPyOfQkFqHOTT9vQ558nob7Wn4cQVZRIz1EuK9AzLz0Aqd0PqLwo48OY8Fy7Kgxfw=@vger.kernel.org, AJvYcCV8UPgD9zsl6CUQJSowdNjJn3pydVgy3h/SH65vARbbPAdB8HWrgXUlWf9VfV1003guWYnmwMGT@vger.kernel.org
X-Gm-Message-State: AOJu0YwGzf7Eomp0pZa0eud5D7K3BdQRSSjG6lW36bAKPc739wsRbHlD
	0geZLBv8KlBwBdMyM2DJhhPXlw69Q36Ma8xCHPMVxyUgdJdwgDOplcm+
X-Gm-Gg: ASbGncvKxL17VFobOMq0BrOAImJ1ZLlSuuP0CqwqJS3RJF0hdRAYd2nNQDqI6Y44cX5
	mjCUs1pXy/t3Fo+mCM0Juv+vffDY5DrU7C5pGlAMh6nOMMXu2vawBZlgoOnAn4XxhuOjeBNDbho
	7XlRM3HWUosl00M+oH2QBYI/h59R8C9NlZbFlfHx+5aiwv/szem0pr/XjSPJREyGUSLjqJ6ewjv
	WHiVvpsuzE5qT8I/Tx7QTIIBvPzfO+tlce9C8Y2l3uAYw5WeeK8RPR46DRN4Y0Hb657oBCXgyFh
	yNxGJ9TVYbf3vjfkBlUEHg7Gc3H4nrvpzR+KqrKLEKBpJizrNQkrPFEnrfaBA+bi7eCPMkyQDRy
	vIPT7Du0OtaiR2n1HqSeHXROxNjaisXCkkYhjr0+9OID8k72PlQ==
X-Google-Smtp-Source: AGHT+IHCeFD6mwmHsPbVzqnf/RdZI2LdzxhJb+bn981uRs8UNNuSLX6ga1/IDq9eNX+swPfzo+kg7Q==
X-Received: by 2002:a05:6300:210d:b0:243:aca2:e500 with SMTP id adf61e73a8af0-243d6f062d9mr25374936637.29.1756964434848;
        Wed, 03 Sep 2025 22:40:34 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd366a909sm15568027a12.52.2025.09.03.22.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 22:40:34 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: dwlsalmeida@gmail.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH v2 RESEND] media: vidtv: initialize local pointers upon transfer of memory ownership
Date: Thu,  4 Sep 2025 14:40:00 +0900
Message-Id: <20250904054000.3848107-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vidtv_channel_si_init() creates a temporary list (program, service, event)
and ownership of the memory itself is transferred to the PAT/SDT/EIT
tables through vidtv_psi_pat_program_assign(),
vidtv_psi_sdt_service_assign(), vidtv_psi_eit_event_assign().

The problem here is that the local pointer where the memory ownership
transfer was completed is not initialized to NULL. This causes the
vidtv_psi_pmt_create_sec_for_each_pat_entry() function to fail, and
in the flow that jumps to free_eit, the memory that was freed by
vidtv_psi_*_table_destroy() can be accessed again by
vidtv_psi_*_event_destroy() due to the uninitialized local pointer, so it
is freed once again.

Therefore, to prevent use-after-free and double-free vuln, local pointers
must be initialized to NULL when transferring memory ownership.

Cc: <stable@vger.kernel.org>
Reported-by: syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1d9c0edea5907af239e0
Fixes: 3be8037960bc ("media: vidtv: add error checks")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
v2: Improved patch description wording and CC stable mailing list
- Link to v1: https://lore.kernel.org/all/20250822065849.1145572-1-aha310510@gmail.com/
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

