Return-Path: <linux-media+bounces-36885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4179AFA02E
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 15:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43A223B8ABD
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 13:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF045256C8D;
	Sat,  5 Jul 2025 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxsoVPDb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE4F220F36;
	Sat,  5 Jul 2025 13:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751720913; cv=none; b=EutfqmVYqKoLMTNB7moDqR8hWaU0vOPuOcleCOmT5bsaNK6WO/jZ+1bi3F8fqP9xIymiO/x6hTtDnY3RL9xo7LN3ue341FVDW2utTIvdiVbUooR8aQIOrw/3LDTXZoTrPaDezltHc4wq5STkutB7/GZW+7fLlo2QplYPn5k1bgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751720913; c=relaxed/simple;
	bh=P1THOPizc4yPRbXdgqx5IlzZo8w8HRGIW4wNgIvmk0k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d0SMLk4C0gCi3qaziZxTT2A0/aw5alJdknH2jbU8F7/+eXHZelgtlaz6lYCbHHrBBlS86MU84LQMTBaOph0RjNbc5gkktV7Jr5dRe/3A+lPKg7IytlSWq1e1gcce679t96phz7SAnBdaDP+UxGUnvaGHBQFws5KJM/dOv9p9pKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxsoVPDb; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7481600130eso2388734b3a.3;
        Sat, 05 Jul 2025 06:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751720911; x=1752325711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0C0QF9E9ThI+tzjv6xggGhgRFFtUbxQgOLH9sLDDPRo=;
        b=fxsoVPDbfmyC86jP2aPCPbgzqxrx9mP96GUYGet8cq4SvZ++yO8EYw3YjDIxLwKql5
         NEycfjrYsQZ/+1kqRq4oykquMfXwa+SjGi8BcL4Tt1BW7duWzXe2U2RCKop5w/smiBNc
         oPe2k5eBmZnnFf+8JIrVFVbRSNIt7dEeHZgL7xIqbMQdoREqd1OtzLNIPntBoZTgA1xm
         aqG0CZ/7BlR8MWsZIFDGM1gka1lfAGAiR8jFg2WCiv5ctY6jFt3LHU8CFOPbiSnm/fGm
         GJ/fLrYu1tobCw6yKhxNQWEfBDEO1HqsUBR/CvjzVkIKC1FzJ310K7PcGCDpiUnteTAX
         gIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751720911; x=1752325711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0C0QF9E9ThI+tzjv6xggGhgRFFtUbxQgOLH9sLDDPRo=;
        b=RUZKYdD73aHhfDwpBvS7plwAH7qTw1214MECOT7b/CcMsrDNFRAVX0/E6P+KETRlDE
         H9P/bs2pBiBJlP9wLP8XWZzyMidbm4HK0L9dG9C3fV8rfL/v1V/tRZJ+wbJSVOYvOxlb
         iN3DEO7iDcL+oyB5iNJlhQugYw+xqXWLqf77+hTmVG8v4RX8jtBrMuG68XnZkpmiPn6f
         lraqy/X7PJWxtIs7ymB/CsjEeQWkRlP/cqLc6tLfqEguQ8OinG3pPQ3OSwxxJs7tajHU
         ahTOSgucCeBU9F8BvwbeYy/Wd1lhGWJGm58PeuSXPSTRdQp2OIgFMwZdOAOiwHvEmGwE
         GN0w==
X-Forwarded-Encrypted: i=1; AJvYcCUhD0v9IievNXdZWUWhqFVRCHEw7VXGrc9AJtKfKmAMwbsHR6Pyav81KdJryvvT2mz/gp985OZoofNPYX4=@vger.kernel.org, AJvYcCXM5ZLcSpLsmULfiTA/b6DNWfOJ4QfB462aitGs1GMRa8fux8BRj5aGbb/liadmUdojtyeIYNgVCDPGwtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3/wPpOaK7VjuwpeQRF8SnDpCzyiiM+3M0JP+O1vvtF1xp5Buc
	74OeQ9fSDu6wI5SbEZhGylSssNpWk+p7u/d2/NUHVU0uQl+eL5wdrQyv
X-Gm-Gg: ASbGncuDeYIZ32RIrf9k7SveKj5ln23rE3y/wC41ZYmYG6xcsIoV2mzvrNp/QO/7gik
	EL/5TdpZngZ+Mc2QebSIgUKKLAxXKEpOQ4VoYucE0xGt8025dVoGVgrhpL4EKCjkcCMoQx/7OPp
	W4+kStu0zFw5kG7/bZ6ZFnCOM/7HEk99rmyyzH8tjB2sAwgPQ1POV+5cQvTzaw/5oum4gzaVc8+
	GUYIxmHwEL3YLnFdRmFdJOw3FDI9wsaVj/hWV6Ecfyc8DfRoKN5cku3Go8iT3Y4VjT8dxmaS0Ah
	4lPj3YuRC6m38VIH0PiGdU44E9u8SHLtSqKi2iQzLN3nrtIf64LaKhZQ7go7meRFVSq598pbcun
	S/5U6YfM=
X-Google-Smtp-Source: AGHT+IEhSirVJWlKVQcuRTLCdn7wt37nvrtVitxl7oEj3VzJkhWBx4oIcs8uuEy7tn6Lai2Tx4/LTw==
X-Received: by 2002:a05:6a00:986:b0:748:3385:a4a with SMTP id d2e1a72fcca58-74ce66d56c3mr7910774b3a.23.1751720911036;
        Sat, 05 Jul 2025 06:08:31 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a4146sm4434618b3a.141.2025.07.05.06.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 06:08:30 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jesung Yang <y.j3ms.n@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: dvb_frontend.h: clean up kernel-doc comment
Date: Sat,  5 Jul 2025 13:06:55 +0000
Message-Id: <cover.1751719712.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two minor issues in the kernel-doc comment
for dvb_frontend_sleep_until():

  - PATCH 1/2 corrects the type description of ktime_t.
  - PATCH 2/2 fixes a grammar issue.

These are documentation-only changes with no functional impact.

Jesung Yang (2):
  media: dvb_frontend.h: fix ktime_t type description in kernel-doc
  media: dvb_frontend.h: fix typo in kernel-doc

 include/media/dvb_frontend.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


base-commit: 35392e855abf7d02ad3b061cbc75c7c7c37f0577
-- 
2.39.5


