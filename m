Return-Path: <linux-media+bounces-37642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC41B041AD
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 16:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E82F7A6657
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 14:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E3E255F5F;
	Mon, 14 Jul 2025 14:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6JAvwOd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA9522129F;
	Mon, 14 Jul 2025 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752503270; cv=none; b=KXW1V6akyZBtRIx10U/BYNoi6NLRFpmsDtVzGCAhok3SFi5XWvJuX3nwSekbxS4D5aptskPS1lbkgfn+vtw/OTWpk+eqHZq0DERcrmRvxYfxrkUofSkS/Mafh04Oj1Sru3YrrjhRBGpzRCvSarzVh4rCSSkCPiCeHdvdvPKnDwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752503270; c=relaxed/simple;
	bh=eROD8KsMAjiCsZj+peKBcTcIjpOrv+DsbDLjV910f5A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E3yQv9ZMauyGZLURvQn+Thd0IEm4kVbhLiI83Cm9s+exWcrWnmjd6lPkwrz8ePHAtt6jUYHyftE6DPvSzpTx6TCqfNtuq2NeuoFVSRkc3CplldMDhQbJ0FiRqW8LkjHBsJBPZWvaK4pgaNQyuQcmQaCkuglS1k+0XtORrkRhcIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6JAvwOd; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e75668006b9so4326520276.3;
        Mon, 14 Jul 2025 07:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752503267; x=1753108067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NZ4i2QhyUjJCdRWaTj6VHcTAkDZaF8Fq1MoG4qKDJRc=;
        b=V6JAvwOdim/puPtmPPcyjoN1VSDEaSSSp/GL2Z8WYf5siL88WMH+XHplisYQJr46rX
         IefOQK9D/kAYxBr0calrpYTrktmCGoN5qIGwo6E9EVFApbntTkE+9S4cLeDB8OZbbyYz
         hrXRAyMqW6AzVDh31GeiILVoIluAyOqpdPAXdaOGTGOInFolLz6XtoYOU5oCV21T7IEY
         5GCAE2abBr5UbmViK8gddKdPWxXya5ud6xgw5PqHCFXom5m9mGR1Nidslql1uLf6QnGk
         tFXQRaLIu0lLZnxBLWNqWNsALtThRoaEBtxx3b/6apNiGzoi9FP5jcLGp7rYEuYlSw0a
         IHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752503267; x=1753108067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZ4i2QhyUjJCdRWaTj6VHcTAkDZaF8Fq1MoG4qKDJRc=;
        b=IV/b2h6djNVUsvmPR0AIcmN1iXrFck5+Qh3jcwyRM6EMHs0m/nZOPhNu+dxc3+GZC4
         DBRIL/ZiCxvUmSNmLnUuOlhq/9DP7g0VvKnFLtRx0iA1AYPDUu1aQSYPBopVIMixIrvl
         8j4SSTP4glVlZ+FA8fWZ4lpadFNB3V3WE6Htm0oNgE0Mn/Ppv5FNFsPw/skoO4fgA2ea
         XdYUaKzhop9HL1ArJxTbwcz0HKu25AW/KHtavYn2G/jPLvgmlD3r3zj5BOFJjStMekCK
         PwPAppC5Nyt1uSlaA6E3lAev9PWwWYK/+9EkFk6N0xgiAndW6lwyfP/nQGoj0s65jWqc
         dtjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPmXSE+Kc6923HoXP71sHbs32lbWg9I3QShWbfJmFtXsBoBTQzGCsZGnAnPA2QSIFXNQp3cJNA3hwh7JU=@vger.kernel.org, AJvYcCUfMCM6ghaK/BRjBTa0CCw7zdM7u1wbRvajFYTngrv2x5YJ5QGyuxwJoWjQ2n+uG74rm5cSZN/eYWvD2Ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YzURkUXY6suDzfKkrjlcq94CSYKtAPkL9IaMzmV8rj4uOEfDK8n
	jbSUcpEpcTfBtVrdD66x7Bcts1yXbF56zMn1m97XxdvqOjziBAXR4cQN
X-Gm-Gg: ASbGncvvormvPJGSzpDDOrHh6tSdv63nE5Rgf0SEpYJ4O18VIMd67yKIjODE7f2oKwT
	TNADfddoYir3sJVe/oPBRCS0/lm9JfQ9MLuoJtqVl5yDjOb2ffZQeajhfvZY2kIr/xClzf3P+bn
	kQQ95Hsk8PpSpzG5CLdq0/7aprDs2RANtHwjdxPhfIP+uQ78lJE3aQFOLWjuITsz/UMlJbawHpt
	ytlG9WKjCzXkIRyMey/izbDpwtzxpedUuNtr731MCRfjKmap1lzdjbyhrrN+fZDm1+kDqeIcC4Q
	srm+AmykGThUvf5w3A218rMdOV2tVRjG2ut5i0FFKeMrkCt77QrwBTEnPs5kQdHlj6ObQ9YW2o9
	R2dyXmmupjQbJG2Kef2ShUA3WtIPwKU5Rt7L+9Y/Ne5kVGA==
X-Google-Smtp-Source: AGHT+IFk0Te0RtNbe5N1idQ48Qj3Nr77oph+AIUdsQ4GoiZojewVBZI+1fIRjgW1gcYPi/qlrRAffw==
X-Received: by 2002:a05:690c:2505:b0:710:f55f:7922 with SMTP id 00721157ae682-717d7a65c42mr212019617b3.34.1752503267247;
        Mon, 14 Jul 2025 07:27:47 -0700 (PDT)
Received: from sshe480.ammonoidea.ammonit.de ([2a00:5881:3041:2700:c83f:4374:166:4a71])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c61b64e3sm19669277b3.56.2025.07.14.07.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 07:27:46 -0700 (PDT)
From: sina hosseinizad <sina.hz@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	sina hosseinizad <sina.hz@gmail.com>
Subject: [PATCH] media: staging: atomisp: stylefix
Date: Mon, 14 Jul 2025 16:26:45 +0200
Message-Id: <20250714142645.88038-1-sina.hz@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

change the spaces at the beginning of the line to tabs

Signed-off-by: sina hosseinizad <sina.hz@gmail.com>
---
My first contribution to the linux kernel, so starting out with a stylefix
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index bc97fa2c374c..bd3a017490ef 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2347,7 +2347,7 @@ int atomisp_css_video_configure_output(struct atomisp_sub_device *asd,
 }
 
 int atomisp_css_video_configure_viewfinder(
-    struct atomisp_sub_device *asd,
+	struct atomisp_sub_device *asd,
     unsigned int width, unsigned int height,
     unsigned int min_width,
     enum ia_css_frame_format format)
-- 
2.39.5


