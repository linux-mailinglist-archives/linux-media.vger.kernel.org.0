Return-Path: <linux-media+bounces-4744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A958584AF33
	for <lists+linux-media@lfdr.de>; Tue,  6 Feb 2024 08:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB9DE1C226BD
	for <lists+linux-media@lfdr.de>; Tue,  6 Feb 2024 07:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057C7128831;
	Tue,  6 Feb 2024 07:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="kO9nWSKW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C641F128818
	for <linux-media@vger.kernel.org>; Tue,  6 Feb 2024 07:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707205785; cv=none; b=dJPkry1Q+6CwBo34CeO1AW/Gbl6iChkjmNlNRur/cH0Ptdf2P08/kXoNuxGpRUfdUHFaLiMhLPfTrErmZXrNFeDBf1MGzJBbMm83Yd0ML96cu6pT2ROfq82yT/e6RMNjeg52VRolrjT9YuKc906T59OcHB4do+kTzWVNUw/qPfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707205785; c=relaxed/simple;
	bh=OK5lRA7V7FsFnorYgS3IOSgU4KdjRhWcO5SvFbUkZsg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=g4yE5oqBof4rOKAeKD3tW7q7nbGh/jSR+JlPQ8O/FzWWVZvOahzbljT4ubDUtj4o4bHSsWFRaYwzRheLdqV/mjrb8TzNktJT4craATdhnFEI3Eugm5llcAS1ekBKwsQ0Mcf/RFRHfeTiE3G5PflyBqrduoKyViw2y7me5Q3dnwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=kO9nWSKW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d91397bd22so4166515ad.0
        for <linux-media@vger.kernel.org>; Mon, 05 Feb 2024 23:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1707205783; x=1707810583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V3BkzWidJIUO6a5Li3rvGAaKQcBMxM0YR6nza1WJwCE=;
        b=kO9nWSKWQv/wasE3YQPBEOWCkH+shhX72CCQH6ZkHKx52cClMQqh2AaCp546w/ebx6
         tK/h3DsYXnvV3gzv/+jF6E/zZKQ2lo67WqmZSLj2NUwM40iTrjbdKrkUS9QlB7F/dCzZ
         6NLIBQU3r4xSfq4p+18SRzd5L+lPOjQrAhD4d/x5UXHeHbFxgc5VjJCKY53I6GZhEaG8
         CEJz7YvlW6oCg21nkbw3bdZdZzGJ8VXwDF8evHOC64FbH6+/GhEkNeK5xJ0XswkXvWuc
         R/+qg7CiljV5nHv32Iu2CAWY3QL2bB/jpFlPvQVyNFtuT9aWt01b5RlvLBgkywlIP3rK
         SN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707205783; x=1707810583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3BkzWidJIUO6a5Li3rvGAaKQcBMxM0YR6nza1WJwCE=;
        b=fygCTGUIT4pkJreCRabFgVxbhgMcHsdByM5jaCi1o05vCFBRz5JrWonJ0o6o1uxwHg
         CJn+QqwSR+a0SiqHi8uxKbFypO5MtZrN6oGTMt1XzyiA3l+68GlPNHqC2w9bBw/0tm8b
         HQYXqsPZo6Ig2hqIhYBE7V9t6ssUrUGBtuB3eFcCOALp2QVnquuRpA0WCEC29WIeBYoK
         EN3VtewkT7ZKcS4FFbkmYQYDiJpzSU/OEGfseQ2ZmJHMZhy755Sgt1xiT5Fo7cN61Neg
         VXG2pqSflSPAAM7zxpwHc4dDAIb7uJU37S1CuY3upYLdLzUTUCh06pd9ri0GySGo+Q+n
         EoTQ==
X-Gm-Message-State: AOJu0YxoSGxmVMp0SOsyBGBQuEBMLObZAWOUyarszQ1cMgpOqjQ4cDYv
	WHJbWcGnLD27Q+kU/yjiOEI4xQg5m8G/e1ffslsUjwC13AFaGVvoVbDXwizfiMk=
X-Google-Smtp-Source: AGHT+IFDevANh84iQ1483ULm4E0yqwag9AtHapByfK7FNk/QEDKBINLaUH9tPZNYc2pM/dNHJSnWag==
X-Received: by 2002:a17:902:fc84:b0:1d8:f129:a0bc with SMTP id mf4-20020a170902fc8400b001d8f129a0bcmr1083908plb.13.1707205783032;
        Mon, 05 Feb 2024 23:49:43 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUlYLAD2TI0URNOjz1VP3E2L0Tm8XPfE+3jlygdTA3W/OaqPBY+ELn5r7O804/7e1oEqu4ngclAOcg+4SHooCRmTfWMx6MTsWYOB9MG95zlsEH9U/D0OqAMMWKAyDagTWhd7TkI8vpjrd8R6LkQmmsyW9Zgan/OUucupBSVmvobJ672nU4KFzXKHC5Cf/BnAphl2Or3aUTDMUPABi9I+6bsh4s13ZtEGsYJiI1tOmmO9X49okYlmF5nnz25J/0N2aGYc5rG7W7zI9dNdTZHUozUeY4V9rkWrKIdwNE+BM7Kxt3PtaQcdy8uyZ1S4uI+jFGwF7+Yck4+7heO9ORVMqPbJtoz7YQx8YjYteKVJsogs8hCQ8SE8ogeCfuKN18TjedPJqYAH/te7PEq2qpoGvy38JiBB4q/YpiJgd+C8kWTs+Nz4kJ5980TjAvhs0I224O9yLAfBwriz9TLTfh8HljPJGdXK50DGNlG62o4mhlSngGdS/93HC/Wb9DPL74sqq6sicdLntsrJLRJLu5lmAO5gX46
Received: from kells-TravelMate-P414P-53G.mshome.net (211-75-10-161.hinet-ip.hinet.net. [211.75.10.161])
        by smtp.gmail.com with ESMTPSA id z3-20020a170903018300b001d9773a1993sm1163819plg.213.2024.02.05.23.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 23:49:42 -0800 (PST)
From: Kells Ping <kells.ping@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Kells Ping <kells.ping@quanta.corp-partner.google.com>,
	Benson Leung <bleung@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Ken Lin <kenlin5@quanta.corp-partner.google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Reka Norman <rekanorman@chromium.org>,
	Ricky Chang <rickytlchang@chromium.org>,
	Sam McNally <sammc@chromium.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-media@vger.kernel.org,
	"rasheed.hsueh" <rasheed.hsueh@lcfc.corp-partner.google.com>
Subject: [PATCH] media: platform: cros-ec: Add Dita to the match table
Date: Tue,  6 Feb 2024 15:49:26 +0800
Message-Id: <20240206154554.1.Ic01f1c2400bac3dc97ff0ec232a5da41c0578554@changeid>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Google Dita device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Kells Ping <kells.ping@quanta.corp-partner.google.com>
---

 drivers/media/platform/cros-ec-cec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
index 488147b71338..9340d117314b 100644
--- a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
+++ b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
@@ -309,6 +309,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Taranza", "0000:00:02.0", port_db_conns },
 	/* Google Dexi */
 	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
+	/* Google Dita */↲
+	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.34.1


