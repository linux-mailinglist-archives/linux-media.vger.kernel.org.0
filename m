Return-Path: <linux-media+bounces-13248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D243908532
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 09:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD9DB1C20F80
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 07:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B41E157E7D;
	Fri, 14 Jun 2024 07:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MjuWMaix"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3F2149C57
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 07:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718350636; cv=none; b=QJYOMd+ewOWCfqd07qMBEZWSkwo0cC1VMsLd14yBr+MEePbev8mIZBFgiyUnCa+L2xI1QX0LOAKGWsQBYxHKFiTZ573BqzHkF+kcyqcT2VpscWPIDcNu5nBBTNcO+W+JF89cWi8YLtLS6e5WgtMCivD5W1hADvfxRdB8jukCnio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718350636; c=relaxed/simple;
	bh=D71EkkuxqkwRO/GAnZuGd0W8JtPETqZ3Q//eAElCFWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mn3GJW0Mq1t1b2Y8IH78t49NHlKnZPTUi0GhavY8D9J+I4zmGYqJ+7OcDhinnOlfa1pfwLO3EDSBKZXk+zMKiPs0RZSlbCHTAKaQ2XexYrUVXyVc2o14VshIBfqg/hdXoKeKRq4B/pFqhJ+XQh+9WwhBAoh35Lq9w/ICuQTWUcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MjuWMaix; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-704189f1225so1775859b3a.0
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 00:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718350634; x=1718955434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0WIEvpwjfC5Ybl+IxqglwPlMlShgzBFiqQKqyJAB3o=;
        b=MjuWMaixIDE/2Mh2G4JDQ8vw6lo048tYpCWsD1Bx6gugkBUvZv5GfEgcb3b2V/a/YM
         MQXDaFDZiGgY3CACPFJufwNme4G6o0MMYZL6zg5W+Iz+K/r51C0Q6pLBLb92PnN7OKvs
         pB2Q4wgMJ42xQOvvhM8Z2xdK/Z0xGi0Nloypw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350634; x=1718955434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0WIEvpwjfC5Ybl+IxqglwPlMlShgzBFiqQKqyJAB3o=;
        b=W1WfvLHofI1N7UyeJrajc04Yq1X/OJYEpt+VRAyRKV63Rx7qYf5y+Hw6RsnX8mmBkw
         LK3wTEXAz3Hiqz9PHCh1ZFdyUpdThMPdW0MURlCxckyy7w7dE5xXWEUamn86XqL2ZUgp
         ZDdhAb+FfeRJKvYt77TJWvGP+SODIGy8JdtjIssKf7bm1HE4pX3kOOWDKE0yJX+YPwZJ
         PJbO5FQoKqithd5N7QaFAUQnNwbR0GqmVvah5efxs6+JTlgPtv7ARiH+PGel93TQ67i2
         XSL9E9T/9h/j7ms/EHZN+4gED9YK2+H21YgMeK6y8rSnBOAmVgK6Pwt4GXOB7JEolYV3
         GEmA==
X-Gm-Message-State: AOJu0YxZ/KsJFEyUW0IjXPqlfI7c+Befuu5lcS/xJsjWzFnsffq9E8no
	VZqgFFzQGLHdnv0SdlA689otgxUfAPLN9DkI3Ccs8aBkoZFoCVmQJAZXnf5G5Q==
X-Google-Smtp-Source: AGHT+IE7nmSOAC6cCtRaQCtQ1RQtZXtFDqvBSe87aUt2IKYJCaFisqgI1b9oXfUxGmpO3LpYbyxkKw==
X-Received: by 2002:aa7:8c05:0:b0:705:b1ed:118d with SMTP id d2e1a72fcca58-705d7192ff0mr1955611b3a.26.1718350633920;
        Fri, 14 Jun 2024 00:37:13 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:336:17cf:71d5:5733])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc922643sm2468382b3a.31.2024.06.14.00.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:37:13 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v4 3/4] media: videobuf2-core: reverse the iteration order in __vb2_buf_dmabuf_put
Date: Fri, 14 Jun 2024 16:37:01 +0900
Message-ID: <20240614073702.316810-4-yunkec@chromium.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240614073702.316810-1-yunkec@chromium.org>
References: <20240614073702.316810-1-yunkec@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Release the planes from num_planes - 1 to 0.

Signed-off-by: Yunke Cao <yunkec@chromium.org>
---
v3:
- Change local variable to an integer to make the code cleaner.
---
 drivers/media/common/videobuf2/videobuf2-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index a4fbc7a57ee0..cbc8928f0418 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -324,9 +324,9 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
  */
 static void __vb2_buf_dmabuf_put(struct vb2_buffer *vb)
 {
-	unsigned int plane;
+	int plane;
 
-	for (plane = 0; plane < vb->num_planes; ++plane)
+	for (plane = vb->num_planes - 1; plane >= 0; --plane)
 		__vb2_plane_dmabuf_put(vb, &vb->planes[plane]);
 }
 
-- 
2.45.2.627.g7a2c4fd464-goog


