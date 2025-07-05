Return-Path: <linux-media+bounces-36887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D50BCAFA031
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 15:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C4233BD482
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 13:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C408125A2CC;
	Sat,  5 Jul 2025 13:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLf5xh+8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D633A2580D7;
	Sat,  5 Jul 2025 13:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751720917; cv=none; b=cliwOMF8wYZCHRunVtPZJZCNfjbibeU+MD3v+g8YlO239LlmeP3VsNrUGng9xPJWrh9iMZ3PNcIPCWfAYFe0NH28VDULS0Lb4gmiUMcRTUZ2T2fIkrhwGsDv3cQuOr+95Zq0cT21qSXmNjH0+m83QoY1DSzicsUG9OoR/dCC6MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751720917; c=relaxed/simple;
	bh=PY4C9YkzB4XNqZGeXjJ0WvzqHJuE9/agmQPhZCUcsAM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m+XnaY0KRRB0PjwPhKoX7HcpNrdiN9cQ9Z2D65tezjOmVjbx06eFto8sFAHQiNwOG80oy6ZBkXZ7rCMktIRi0fraMAV1J/umSt/CxhabCLAx+uQj6wPo70KX9YrEcp3u0Q4dZx85PJj94iIpYjDCQFZGQBbmwGRtcP1YM18VyK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLf5xh+8; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so1562488b3a.0;
        Sat, 05 Jul 2025 06:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751720915; x=1752325715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xrm1kWoPaGkxV4g2GOWN3UThzaZG17eDiDzIl7208/Q=;
        b=WLf5xh+8EWlhBi53gnNKudmYR0IU8x9kUAw/mKgMuYJVV4fJNb4kaIKzRHF5vzvGuI
         ej6VcVOroProgpAW4KzH2ilENEtGnc60uWOpbkdBIwUPpmozCzKBYdBjmjXaykss0g14
         co/pVQRMTmPQ6jV5kunSXCU6V+J2ZjYUEAx0B/7f1TvqEqFOoHV4NFUAqjelPcapvj6Y
         HWTTmHtd5olM93Y/xsJME4ZuF1gHVdPVMRRHevAEP8MWkwAmZqS1kWueSvoX7Qt3GJNj
         +KrhetBVYEK5gC2N2U9+PYeYSs6svsIwab9j1ntS++JCYfPtKMPkdS6ZFktOvJJfij99
         ow7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751720915; x=1752325715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xrm1kWoPaGkxV4g2GOWN3UThzaZG17eDiDzIl7208/Q=;
        b=KwV6rQpuqSQJdK/xZoVeh3MLFS4o8EU2dKlK53uc+MVfN00p0l6iUXEa0qIg9pPxEX
         bx4UAJjghG7TENqYZgeqZcuX4pevT5nmTlZui5VkaT5G3s1B8aUnhdDnlLbohvalgRUk
         NcBsPB+cKhzRtaQsZjv2/FIrPZM0KdO9+ptkWiXuKDEdaqmytQGt5jYCgBeEZBrTqIyU
         RItY6xKZ3RV1iocezhv8rM25NTufveXNn0lc4/YULwafmoekp6EE1M0F+Zp6tHk0FECU
         ogsAvIdjFsdMKFe9GqaX5LAIgCJFlNPp/MTeWLkm2/xzrg6ufSK4bIQgXq4GI4zu8gaU
         4/0w==
X-Forwarded-Encrypted: i=1; AJvYcCUtURxZy598H7m8a13JVk9JNE+2+GnNEgchEByawcieM9rXQaacncfyEYN/6TbNcOMp7Tb2yXisJK2xZyU=@vger.kernel.org, AJvYcCWC8Fv8YqOP54/YxyszYdr6JiwoAOu6QchFZbjzcqt65o4ulhhBqgasELHTpzsGZHHs1d7BFUB5OFfHT68=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkM+SAdg27Y57S7rrri8wYc2XYpSgxNyMVd90SPCH/kxTExJIa
	0FVKJobzSRLwSbje5kICFwlhpot3u8gc87wst+EvGH0WmUEuIK86HkRj+6RyvA==
X-Gm-Gg: ASbGncvUpUmHCi835lnZbtBbiYfYK5ogqN3JvHhKJgP1qWwNT/rXOm9h3FsUds4i5xP
	0b2SBcKTXbl0HonG5leo5ovZSKecGU8hWiAgo7lMxti3nQE4tbnua1Qr+wLOPNIkDov/A7pssw0
	NeoKTYCLG/5Y0dwQVJ6wXL91tad8YLa+Prm+pbUdPyVwIQJA1OWrAdLEE+zGr0lcJx89VoiZy1k
	7slzBu7h/MuGRTDsW66Gjf+ZL4Z8epsRZVTJQgk9/hYvmrFmc5rq3iUY4lC8KcJ82FUqRgFu4li
	zaYHsuETCEVZcJgsbw6fv4fq19ZjhHxQ6B4qAEYzSvrUO9/2jjfBjzu/XSGG1mEhwdwZEJYnh/H
	f/2BNzmc=
X-Google-Smtp-Source: AGHT+IE2Y6SHkgc+b9WM/ZkTHDlh4SguFcHr9tiVijW+NDcNvcqG7NZGJw14l/s37y48JMNEqf0xUQ==
X-Received: by 2002:a05:6a00:3c90:b0:748:f6ee:d1f with SMTP id d2e1a72fcca58-74cf6fbdb12mr3253705b3a.20.1751720915034;
        Sat, 05 Jul 2025 06:08:35 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a4146sm4434618b3a.141.2025.07.05.06.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 06:08:34 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jesung Yang <y.j3ms.n@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: dvb_frontend.h: fix typo in kernel-doc
Date: Sat,  5 Jul 2025 13:06:57 +0000
Message-Id: <5905eba60c787f75d2e20ef42690a9ba8cff0770.1751719712.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1751719712.git.y.j3ms.n@gmail.com>
References: <cover.1751719712.git.y.j3ms.n@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix grammar in kernel-doc for dvb_frontend_sleep_until() by replacing
"Its" to "It's".

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 include/media/dvb_frontend.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/dvb_frontend.h b/include/media/dvb_frontend.h
index 607f7645468e..12143f0b14a8 100644
--- a/include/media/dvb_frontend.h
+++ b/include/media/dvb_frontend.h
@@ -818,7 +818,7 @@ void dvb_frontend_reinitialise(struct dvb_frontend *fe);
  * as possible, as it affects the detection of the dish tone command at the
  * satellite subsystem.
  *
- * Its used internally by the DVB frontend core, in order to emulate
+ * It's used internally by the DVB frontend core, in order to emulate
  * FE_DISHNETWORK_SEND_LEGACY_CMD() using the &dvb_frontend_ops.set_voltage\(\)
  * callback.
  *
-- 
2.39.5


