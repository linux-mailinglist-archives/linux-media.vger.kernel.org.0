Return-Path: <linux-media+bounces-28908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7DFA742BA
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 04:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55B5F3BC074
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 03:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2B320E336;
	Fri, 28 Mar 2025 03:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="1xTpkqZh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505241B95B
	for <linux-media@vger.kernel.org>; Fri, 28 Mar 2025 03:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743131422; cv=none; b=FbgLxKWeY7SYTDQYAnhOIl7u1lTC0/VkRz0PbBEZHDlJr5eHS9vdwHeOnYOmYZBNmh8zaTGPopXYSH96AeJLf/3PzDdu1NmweHO27c4YCjEKuqJ8yjDzDlOmIR3WmdaEuG2RisLZqyXjkSREcKYdz9zsN1IQomndZDecJxuzOhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743131422; c=relaxed/simple;
	bh=mZk1/g6K9/xfZWWHQNM53p/aOxDqD8e73imdnMmnNKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pUcIEl1fZokpe/7otl0O1061yuskrpo5eJdOA0EMjkBPlfJEE0Sg0xnkqJkpcDmjzgPXp8fgIG6viDMymd9FZcgvlsu/UIFnajCg0FmXkIx3SLFpfyAyfcxN14E4X5pZPUGeDNu8lTvwozUCn9fFzskC/gnluXil44uGmDGbQl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=1xTpkqZh; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22622ddcc35so48233935ad.2
        for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 20:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1743131418; x=1743736218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4to77tfN2Uh/XXo3c+lIPR6s2qFb1tp5+3tSOChySQ=;
        b=1xTpkqZh+zD7YHkB+LiSCUIkkYzSq+LSQSeNpn95bevfEYi4S0m5aKn8pEQKuXyH6B
         c/eBimVCr3dGD6jjBVqkanK+WXNG/83cijcvDtfli/TbUmUXLbURmZJ/u29s5lO/dext
         AoULk/Y/nt82R4GYT1CHecwcpPoUlEQmwlhsdMwDjEo9eKSA2RYp74Vzfb0GBPU7tmo3
         CmfRySr6qxCDDy6+K6+luZki6Hfv6dabScDzXg6ET7wbghFrxTtDfuebJ/mR0VBCoHik
         tJv4EUTFM9nS2eiSJ2vu1RFgGIA4rxU0IrXTgc4Iw3UR7SX4YHgVTMewpfOUPmfirvkb
         HpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743131418; x=1743736218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4to77tfN2Uh/XXo3c+lIPR6s2qFb1tp5+3tSOChySQ=;
        b=rXyfizbN6noJRitd91JP1EMooSsIp6uTaOw4QiKn+AoBWWcMGKi2RL/123aENpI6+t
         0YAdjji4ZaReiibJ9rrtIVbseXNrqduOR0MKzr3ozuj2cN1/s93MiwJZWPefaDbnsyyv
         TDTq6Wefog0saneDmluZ1lW5d1mJlvSFGuM4dkbZM05MoWAWXsVXXCHzaWhCmuoWf3T7
         RcU0d2lHqvnoP1J/nb1ZrygCtEHMulYkPl5aOj8Be4HF8Nly5BzUVyjjVNIftuv144bY
         beoh2vhAKkAVmKDrDogDbe7oDkJ56Nk/m3AYgVhzch4CFsP8v8kilE/hZ//a0QG6U0mX
         qT5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdhn0102cZaLDFf/opabIFoNWFuMWgv5jBw9hyFgNNwllkjKBuQjwJXdhLTFz7GFBTO4/5CTV+iyreog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbDkOEn9h/bLdH1TdJ+bFwQrBxMneP5+HfaLuNLyPklG4Hds+P
	Czva9qBkVW6/kQL9ppFCaNi8jYzTXAZ1Z3QtKdNlcXbQ0xv9CTsWYIlNHXXYAk8=
X-Gm-Gg: ASbGncsd+t1+bzustBZpelY464Y+c3lnW95or/CHRbLLxC+sGc3/0U7NUAvTvB7puEy
	vDm/ipAxpD4blhzhRUl0GCWsL56WGugxsUoVkAlAmQXr1E/dgfwGJwYL+QlxaNAHp3C/ZXylF15
	UhiMgT4fLKVfC6l0ENx/XBQWZao+OmtNFeD4plfxBjNrtr/6ZQN0zzig7zhAWZt5jdDNGc97Fdr
	hG8O+zJpuYTIRHsN8inW88WRBY7c3ABtuXKFbSeKZdvbuDzfwy6ddJ1bkQgEWpMG/bg8wU5XiNv
	pNqs50wKqB2YZ28vw0BBEe+0BSECwrXWtyPgMBNxzdiCBWF+ckyZXuxPZ3j4YfcuMxrDwiQkEA/
	ONRzyqIipm0QwDmQ6xXteYMahUrR7he2DUGW0pJ8SsGJ3T416Hai2nHRp9SVcxnGZjJ0tZg9ksI
	ASAVqm11wvqJE8jQ==
X-Google-Smtp-Source: AGHT+IHobEzkQ2a6/oFoQL+lhbLX1JKOfW8BRICYcfmgFVFtQ+arV1esj4jUfvhTyOflSwK99gUdZA==
X-Received: by 2002:a05:6a00:856:b0:736:4e02:c543 with SMTP id d2e1a72fcca58-73960e2f356mr8117439b3a.9.1743131418365;
        Thu, 27 Mar 2025 20:10:18 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e33a-bfe3-0ab5-dc96-8a97-3edc.emome-ip6.hinet.net. [2001:b400:e33a:bfe3:ab5:dc96:8a97:3edc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e22324sm663315b3a.58.2025.03.27.20.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 20:10:17 -0700 (PDT)
From: Ken Lin <kenlin5@quanta.corp-partner.google.com>
To: kenlin5@quanta.corp-partner.google.com
Cc: bleung@chromium.org,
	chrome-platform@lists.linux.dev,
	groeck@chromium.org,
	hverkuil@xs4all.nl,
	krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	tzungbi@kernel.org,
	u.kleine-koenig@baylibre.com
Subject: [PATCH] [v2] media: platform: cros-ec: Add Moxie to the match table
Date: Fri, 28 Mar 2025 11:09:35 +0800
Message-Id: <20250328104619.1.I04b964661552ce532dbefd1ee5999fb0a0641a07@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250327103918.1.I704cb6f738208386a0d431d355169c6fdf0f51bc@changeid>
References: <20250327103918.1.I704cb6f738208386a0d431d355169c6fdf0f51bc@changeid>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Moxie device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

           Hans Verkuil <hverkuil-cisco@xs4all.nl>,
           Mauro Carvalho Chehab <mchehab@kernel.org>,
           Reka Norman <rekanorman@chromium.org>,
           Stefan Adolfsson <sadolfsson@chromium.org>,

Signed-off-by: Ken Lin <kenlin5@quanta.corp-partner.google.com>
---

Change in v2:
 - modify commit messages
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d..1de5799a0579 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -329,6 +329,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
+	/* Google Moxie */
+	{ "Google", "Moxie", "0000:00:02.0", port_b_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.25.1


