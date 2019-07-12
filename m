Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 562AD672EA
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2019 18:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfGLQBf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 12:01:35 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45040 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbfGLQBf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 12:01:35 -0400
Received: by mail-wr1-f67.google.com with SMTP id p17so10487344wrf.11
        for <linux-media@vger.kernel.org>; Fri, 12 Jul 2019 09:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2MSWjLljBUSBsJc/SxR+9Uhlpk5n/uQpeLTYwjB+DYU=;
        b=kelY2o9XW+2P+SCZp8+ktee0piKtK/xjI7/Ra0LP3DFFSuAZcG4mgyaQcTfQBKOn8u
         U1BrU63UfX7yxPzudqZSKg/tm6BvL8GY71AIG5LhEkTfwNkLE7g39GWP1Q6qDwepS07T
         NWRFyWhzyHMlOACY0X899cUxjAPbGv93iAWSkiAxGBawJ2kjq/3b8Qanvx31q24NyjuN
         Wcp2ic4EqClBYbjWGgo8yB5Co3/6tF/S1XaSjL2Q1Ot22jr4XKPQzKIhN5RlDYCDHOIN
         3n21RvupAdoseugDIkZ2uAFZVbdGBQ64FgcUnyOuh+6uuec9pTbB+S3XR9ahAz+Z8I6T
         k8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2MSWjLljBUSBsJc/SxR+9Uhlpk5n/uQpeLTYwjB+DYU=;
        b=MScFDXRmieCoeQLGn/Vprj/7ZZVtCMgexB/ZniEifltQ9E4k39M2gfJUN4NPcgQ1m7
         bf78nBNHXGdT8ySB1ticy62lSu7mGoafd6b9cQMI81JQZZJZWVxLOg1aJFb39FTVVNPR
         kmY1J99e34mtpuGKkdSs5SsCDjEjAK+hqusc7pPZaAK1GgCy6EGkWBJXdh3VqE8MO7j3
         xUqjdtCNOKWaKgnM4mndxywtJJ/WsKn2FF7kR1VLdYMZ/Z3GLdfT6wMd7pigyPVmkDKE
         zkMC16cw+Ul35sJMHpFgSUqIq/tn2vhKXlfUF5RqV3ruXtIlrU1WJFoS1Bq21ZH27MlB
         J3LA==
X-Gm-Message-State: APjAAAUXfdRM9bvNaisx36EFF7pxmRJlqCQ/nEM5IOzKNYcT8f0m6rhs
        069lgLWjYKziPJPlzowOBY0z66q3
X-Google-Smtp-Source: APXvYqy0VAsMS89FOsqVHzzU4xmW8HGvTS5aNBrn+Trd6pGTGUagqGAjDT7QKNqriW2hemGM2/VhNw==
X-Received: by 2002:adf:f005:: with SMTP id j5mr11689683wro.251.1562947294165;
        Fri, 12 Jul 2019 09:01:34 -0700 (PDT)
Received: from speedcore.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id a84sm9571195wmf.29.2019.07.12.09.01.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 09:01:33 -0700 (PDT)
From:   rawoul@gmail.com
To:     linux-media@vger.kernel.org
Subject: [PATCH] edid-decode: add support for DD+ JOC flags
Date:   Fri, 12 Jul 2019 18:01:31 +0200
Message-Id: <20190712160131.13578-1-rawoul@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnaud Vrac <avrac@freebox.fr>

Used to signal Joint Object Coding support, used in particular for
Atmos streams.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 edid-decode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/edid-decode.c b/edid-decode.c
index 940bcb5..197b78d 100644
--- a/edid-decode.c
+++ b/edid-decode.c
@@ -1165,6 +1165,11 @@ static void cta_audio_block(const unsigned char *x, unsigned int length)
 			       (x[i+2] & 0x01) ? " 16" : "");
 		} else if (format <= 8) {
 			printf("      Maximum bit rate: %d kb/s\n", x[i+2] * 8);
+		} else if (format == 10) {
+			if(x[i+2] & 1)
+				printf("      Supports JOC\n");
+			if(x[i+2] & 2)
+				printf("      Supports JOC with ACMOD28\n");
 		} else if (format == 14) {
 			printf("      Profile: %d\n", x[i+2] & 7);
 		} else if (ext_format == 11 && (x[i+2] & 1)) {
-- 
2.20.1

