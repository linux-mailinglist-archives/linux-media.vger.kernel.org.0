Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C41C3F9E55
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 00:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbfKLXqj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 18:46:39 -0500
Received: from mail-qv1-f67.google.com ([209.85.219.67]:46604 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbfKLXqj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 18:46:39 -0500
Received: by mail-qv1-f67.google.com with SMTP id w11so58831qvu.13
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2019 15:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LiFXnli/uFRmxP0Qb8urwCqWFRBJkDJ5cbPu6CZnE4w=;
        b=s8Ihivc0Shjyo85vG5foZIn2AElLn2PefSklSRBxgMZ44g2K17/51jzqIN5j1efAXs
         6q31CT+0cZYmPo+6OXoTNHUKBo89P8912Hz6dKbvow9vvd/Wm//SEoU4pxPfVRCc8+7P
         ZkNryeQvhyJS6td9wPmC4wKbai76kXNE/LXle9OwwwWfO11l7ZiCVdQEMRhiNrtyAnoa
         L+IjONtHlqG3ZWM/+T4gSfZZBTTYfwnTU6nXJhrEpALWHaU6fHXGsJ5FuV6+1cB9IrWz
         dgBYSOO/OEVMfS9vboFfcU1Swy+YPu6wAwtvQAGbKi+EIQFsbrkExEiP+yvnLeMXsywG
         isKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=LiFXnli/uFRmxP0Qb8urwCqWFRBJkDJ5cbPu6CZnE4w=;
        b=JcTk7Q8p37mW/hQ7G+PXiCUZ5g+ZBfJyG861qVViJo0m1PHT66fin9yq6BQ88mNLbg
         J91d3EgY0qP/dxBhgrjfJZYO6H6Y2r9JrOp3hjHG9EW5e8d9z7+GzXdYlb79D+Jk0Doa
         YQw2R82KIWm9aan1sjCIh52ors/VywgQ2VhGDU2+Wa9rjLtglV7yfGoR97XU0UujcNnh
         l2r3/GCPQRB4qkEacrfgCWgkLD1HuoxvB1B8Ve0O97NDVx6ooM5kXqkdYga61WPXBKPL
         BEETQpb7L4ycJFl5VTfS56W0Uqcc/A3i5XH0IPK0XLB4mnSVeC0Vu8GIv1+QTAt+RaN2
         WsYA==
X-Gm-Message-State: APjAAAX470ZxVFKlZMHKequfyde3tAgyy81EyL/Y1a0k48E5CEVP6I7u
        CwpHrVy+GfyEb7dKwySIx0aXzISOgxU=
X-Google-Smtp-Source: APXvYqwd+sUOZQ3ZTRMrfb4Mi8UF0Z5SY3rrdmbiMye5/+SiyeCElqtiXGV3wrdaOR5RNMOpBiadDQ==
X-Received: by 2002:a05:6214:13e4:: with SMTP id ch4mr243485qvb.242.1573602397714;
        Tue, 12 Nov 2019 15:46:37 -0800 (PST)
Received: from porthos.hq.glmx.com ([38.32.121.218])
        by smtp.gmail.com with ESMTPSA id x65sm123817qkd.15.2019.11.12.15.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 15:46:37 -0800 (PST)
From:   Ilia Mirkin <imirkin@alum.mit.edu>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] edid-decode: fix typo in 1024x768i established timing
Date:   Tue, 12 Nov 2019 18:46:28 -0500
Message-Id: <20191112234628.3212-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Looks like this has been wrong since the dawn of time - commit ec1931fa.
Also adjust the AR to match the "new" resolution.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 edid-decode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/edid-decode.c b/edid-decode.c
index 40891aa..07f8b48 100644
--- a/edid-decode.c
+++ b/edid-decode.c
@@ -553,7 +553,7 @@ static const struct {
 	{800, 600, 72, 4, 3, 48100, 50000},
 	{800, 600, 75, 4, 3, 46900, 49500},
 	{832, 624, 75, 4, 3, 49726, 57284},
-	{1280, 768, 87, 5, 3, 35522, 44900, 1},
+	{1024, 768, 87, 4, 3, 35522, 44900, 1},
 	{1024, 768, 60, 4, 3, 48400, 65000},
 	{1024, 768, 70, 4, 3, 56500, 75000},
 	{1024, 768, 75, 4, 3, 60000, 78750},
-- 
2.23.0

