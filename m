Return-Path: <linux-media+bounces-27201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D59A493F6
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 09:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 074FF3ABC4B
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 08:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784E1254AEE;
	Fri, 28 Feb 2025 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FohT+C9u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528B41FE451;
	Fri, 28 Feb 2025 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740732590; cv=none; b=oHTpDEjhjv3BFZ4/IQhPn2cgSeFe6ABbhgqx+xCxScoXBC7ZLtF0/NZXzoA88/y+geQ6WxWAeBTg6ZsWoyz2LGKifAnP9aboJtdlQJfRa/6HT9yIKc+W/ZqUFXz1K21wMHVbOPmIdPf1d8NViha5Wm453lcigNOZQmaE+4h8aFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740732590; c=relaxed/simple;
	bh=0OeYBfc05rNRrXCsMR/lpy78B0DbGubAinIc4A9f34c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ca7DnHspCphdDxoPWVCJ+uFsyBvX36I7INPAIzQ+CBUS/AvGNR5cL3Uw4hmtMFYsaTiRxKIy1jIygOUBUHUhO4Qeq/u+P6DBiKymERbCEaXsOJ5tcap4TG6IyvFkPLQqczyrrYA+n/Ysoc/uvhNwcHpLaxzW1iTrThoqtOfA+9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FohT+C9u; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4397dff185fso16380505e9.2;
        Fri, 28 Feb 2025 00:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740732587; x=1741337387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0278h66H1jTg8JM/D/jFuhQNk348iAfaj0k0Hs30ZY=;
        b=FohT+C9uuCzizCJAOhZYAJSv9wQO0tj3qrsDpcScw0Q1ETlJXC0XyY8cyqIu2CAtqG
         KywlpSpdiw81nbyGLOHMyBKJR37817mucUUw3qclOXVl6MzXYSDzvjaeWutlWiSiaOA/
         T5tcjXCs5WPTlHfKy8q8TwzyFt0ikdjHjN5lAupDKmRispIEpYkUGxyLJsw2REyOTAhI
         JmvqDTOklX3nPvn4CxuN6MnzXLcpNbOarOqxScGd3vkxyy92f00tz+aC+g0wLEwIpiMU
         CxIQ8hUANq3FZyZBuWSJbV1g0Cc8oQMAnrJ15aWR+pAVceW6g28+HSKF3HKy06qjiLAt
         cwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740732587; x=1741337387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0278h66H1jTg8JM/D/jFuhQNk348iAfaj0k0Hs30ZY=;
        b=uVaD8w8o59tF+pFG+Tq/7lhtePuRIBnSeONBjwrgwjw288wOccP8Kedv+ETzy5PcYQ
         PH54h7gjoWCoKePWXP93vXXrwH72v7rkeMknVd2WUAmW+hHlYtzcxPSQ0DP2Dfy+tnWL
         uQWnNEZ0miQSRMhNt9u4pnPDUj9GHsbCOY/ENRj9Y3Sq5Bjk8x+DYEr+mFDZnVhQYi00
         ru7AetlUwCGk5NEveft87rguy34fZUKAQHooSOKS58cSLPBdAUrQFHm2LojHZKh03jaX
         uZ+yX/t/8bdmG3kz7OOgK40xGaAgUcgE9eq4b5S1LchwPq9kdWjPilgubaJg6y8BAEkf
         Y/Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVs+mVpeliXSWrJgtDbK1ga+2pryMCpck4/zHLkJM9P6Jc0NwWN1vCwM1SHdDMhKKYmpUPqndoiY/9SS/w=@vger.kernel.org, AJvYcCXPsN2fS+Ot1UFbHsgFe8H1FH0dHuU8LOe/9aw7Gn1HQvOczMIrQs6lOWdm+x5+mpUxLuUx15Ebt0lSeFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXNGd1hIY5t1Z1auzj/Gw8zvrGoD+sCiAN0sNFwfXzf5WymYn5
	j/faaDn0ILMHe0W7oXLB3BNuZOS8TbVzZGkJYsKerBXcP2dzKDVf
X-Gm-Gg: ASbGncuUCFhVull5OKb2Jqtwt3IAEFgNdDZp1f98oZEw3wJShuqBMwOiBhvmMhvK3zf
	w0y+5Uu8uCpiMg3FAtMo6LY7DBqEPhjV+t65GjixUO8yw0ztC71oAcV4AKDpsB20Pg9Gv/BAb0C
	G3vYpNlt5eeKK6mQ80qDKyABybF6vxmJWXuyXRol2TcmcCvW/Bg79K/41QLtGa27yM70qc5a03M
	uXNk+BoKY6KvXofA3PhhrYhn4em9V64mind2HBQ5oqHtFFrj+koqlQ5Mn/fx7ZlkVDCz/b1zibv
	aFUffDDDzdswkphx4n0gEjBBZQA=
X-Google-Smtp-Source: AGHT+IHC1kVGHx2QH9Mad6JlM6mJOlbEXN3652P/YltH+GHQY4CFR/FapmuMThulqFL+axQ0wZ1RTA==
X-Received: by 2002:a05:6000:1786:b0:38e:65d8:b677 with SMTP id ffacd0b85a97d-390ec9cea75mr1984297f8f.33.1740732587518;
        Fri, 28 Feb 2025 00:49:47 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e485dcc1sm4411390f8f.87.2025.02.28.00.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:49:47 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: dvb: Fix spelling mistake "ofset" -> "offset"
Date: Fri, 28 Feb 2025 08:49:12 +0000
Message-ID: <20250228084912.678118-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dprink message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/dvb-frontends/stv0299.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/stv0299.c b/drivers/media/dvb-frontends/stv0299.c
index da7ff2c2e8e5..ba4bb3685095 100644
--- a/drivers/media/dvb-frontends/stv0299.c
+++ b/drivers/media/dvb-frontends/stv0299.c
@@ -250,7 +250,7 @@ static int stv0299_get_symbolrate (struct stv0299_state* state)
 	offset /= 128;
 
 	dprintk ("%s : srate = %i\n", __func__, srate);
-	dprintk ("%s : ofset = %i\n", __func__, offset);
+	dprintk ("%s : offset = %i\n", __func__, offset);
 
 	srate += offset;
 
-- 
2.47.2


