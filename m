Return-Path: <linux-media+bounces-12937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B853E903991
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 13:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57EAD1F259C9
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 11:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698D217BB04;
	Tue, 11 Jun 2024 11:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SZFcxS5t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F73A17995B
	for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 11:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718103787; cv=none; b=Ur8YW6TSnd9f8PNJEVkyHrJe/BlPBGSiF3sqKOXu27KkGW4hkJN7N+LdAf4rlFEvLANB+inwDbzYrH8ytwgEw01iIevK53b780wDzYGe6Bt/HPkhKjyhYaKWXVW7R3sqf8pjYmjBAS1+cbMelY2oSNYgvM2wiI3RjojKqEekF5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718103787; c=relaxed/simple;
	bh=8CJl8RanGtivcVT/pp3jOMy9BIfUbYWvQRvH1zViZr4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZvIn6y1voGHGGB8qr31j6GMcMhBq69ISJ5vZkBLrZfPHSNBgXHm+6VIjWnoAoBZyxAqOiBW5hd7ls0nzwOmPI5n5kBuiigxyAkH1P3xbpjBznBIfm4NMtxfyW85CNUCT2RFmC0tsQiWjJ0vc/r1m8e3ub8tEPzeWAFWjEYqq9ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SZFcxS5t; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6b072522bd5so13711696d6.2
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 04:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718103785; x=1718708585; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AMGmfOlQSxICq+sdEbtT3L0n6fIs2+2rB6Lvtt/5NAw=;
        b=SZFcxS5tyid16rHrtmaAwVfpVQoYpvXVSEjrpjm5PxfOmjRP1mOCTZquwnraMfSuXf
         QQJwrl0gWL6GJT28hf/hIBGHnvzvB1mbspk8bCSXhGVorbTY0bLMh5I2miu8o1aAC9cc
         bspCW8vJwlFWNd3LOQP0PDMFkAY8R9cQsMLic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718103785; x=1718708585;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMGmfOlQSxICq+sdEbtT3L0n6fIs2+2rB6Lvtt/5NAw=;
        b=LJt68Dm0ExIC7jDu084ImaNym4zYISAEKRcbERxYRqVQbnI+YW/cYf3uG3UZd2Dlxe
         iSBgkvW6WsGggXjX37MWjeXkKgCbIJmQW0HP6t2/KF5C3vOLNVYWn7DvTXh2NROADgRc
         IPwHRYnUCHregk/ja+uVko4fG2r4HHMZW4i6cD4OSpqoSzpqwcNPqYkmtp5cA5eCpGc7
         YRD/jNjOZ1VtX31grtIvnAorvgM3k8ImW/jjr8iMBdeoij0hwUQf6Px4yYbQ6KqkAqUu
         5sW0ryl7YxUnMiTK4SCOYqnkjLWhuYaWIScmJB25+7H3UdZmQLjMFRwV8iQoGINDIfUc
         6rDw==
X-Gm-Message-State: AOJu0YxhwP2y6Cqfo1suGYXGjyuAfxui9DdA1jd3lbz6UidZIqiAB+TG
	UD0ExfLgLZfhK/eHPvFj4JdK9n3+kDBHsvB76VFqQ50jWpfDasFIk47PSJAR3ncd8Dz9F1LRU3a
	V+S7p
X-Google-Smtp-Source: AGHT+IGTFKcy3CJcHEpOqOJMcdjoxKaj/uE383bgqCnGXhJLfs+f5KNQmu6LGZ8cgJR9iVeaS8Muyg==
X-Received: by 2002:a05:6214:3904:b0:6b0:69fd:46c6 with SMTP id 6a1803df08f44-6b069fd489bmr78103586d6.5.1718103784666;
        Tue, 11 Jun 2024 04:03:04 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b08bf006f4sm6392076d6.90.2024.06.11.04.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:03:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/2] media: Follow-up for coccinelle lock fixes patchset
Date: Tue, 11 Jun 2024 11:02:56 +0000
Message-Id: <20240611-coccinelle-followup-v1-0-df2de9c2f320@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOAuaGYC/x3MTQqAIBBA4avIrBNUKqirRAuzsQYGDaUfCO+et
 PwW772QMRFmGMULCS/KFEOFbgS43YYNJa3VYJRpVa+1dNE5CsiM0kfmeJ+H9J3tzaKGzhsFtTw
 Senr+6zSX8gGZXcmxZQAAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Hans requested some changes for this patch:
https://patchwork.linuxtv.org/project/linux-media/patch/20240506-cocci-locks-v1-5-a67952fe5d19@chromium.org/

Refactor the patch and try again :).

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (2):
      media: drivers/media/dvb-core: Split dvb_frontend_open()
      media: drivers/media/dvb-core: Refactor dvb_frontend_open locking

 drivers/media/dvb-core/dvb_frontend.c | 160 ++++++++++++++++++----------------
 1 file changed, 87 insertions(+), 73 deletions(-)
---
base-commit: 1034ead1a7333e65e516c583f757717f461eba43
change-id: 20240611-coccinelle-followup-f5a62b095f20

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


