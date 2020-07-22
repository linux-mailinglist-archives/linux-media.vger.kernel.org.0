Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039F0229954
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 15:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732429AbgGVNlz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 09:41:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56595 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732349AbgGVNlz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 09:41:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595425314;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=Ui/vqY+wjCMXVC3AeuKik/PdHbSTYXnM22dr85QtBBc=;
        b=O464shV4LDXNxelC62uSeRQXo/zU4b6nk8ukOHIhikqdyyOfYvFtTXnY4ep298iRG/ZwUl
        cuSg5YSb11oH3fNdO0eMzhiCif37+Ep2rWfzPnZDoPJZzNnL5jOMHKUXdwFO3EyaqS+jW4
        8iVpVdK4VFHraoVCDI7w3GWbobzGZKg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-7ICYfnSuMNyiYEkrBuCq7A-1; Wed, 22 Jul 2020 09:41:52 -0400
X-MC-Unique: 7ICYfnSuMNyiYEkrBuCq7A-1
Received: by mail-qk1-f199.google.com with SMTP id x20so1418631qki.20
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2020 06:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Ui/vqY+wjCMXVC3AeuKik/PdHbSTYXnM22dr85QtBBc=;
        b=PZRp0G6H4RwszjX8FSqnv1dOL+pt3qd5hQ0HiZ4Hb5LsRgKb9tynd27mu7bXLkIFdm
         NS+1zCjij6IQ6IBmKoCVPUZZAdSw75aJyegok63Dsdqb64NNKfW4iHRcw/VzIuusEAPC
         QLEAsXzUFYGiBgggQP7tlJLhJznd3Xuc8L2U/rrV2G05abSf/9x4sNZ2U6nBPhJzbKNB
         DucFZrIhg4Y9GHQaztAuekzUdbIdVLU352/y6E02V4CZ/LucO0Ngc3x/enAc7VxOdD+v
         k0TFE7RtrOWLzKo4zfU2ULlpJEuDCkL4hAIMOGSv/JWQHmDJskh/21VMguzaq93QF38E
         CF7A==
X-Gm-Message-State: AOAM5305hChiu3j26KHsm2iKXYIYLPuTrdjS+736Ddd4nhiXRVrq0klf
        b1jBoyDEZfnsk9BpYsHN5NahpNG7nADrVONIkIcmTD14F9i/EgjUIQyMW8BNACqtfwdOy4pisZ0
        rMVVhLevIpXFilzClbgEAcXE=
X-Received: by 2002:ac8:7241:: with SMTP id l1mr34190477qtp.254.1595425311636;
        Wed, 22 Jul 2020 06:41:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9SwiS7B94UsTa1T4MWZIZChKfTj3cztPK0m8KJwbQIjkVQygaJ1FIqBq5LPXmP8OjlBQaDg==
X-Received: by 2002:ac8:7241:: with SMTP id l1mr34190457qtp.254.1595425311411;
        Wed, 22 Jul 2020 06:41:51 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id f54sm27791224qte.76.2020.07.22.06.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 06:41:50 -0700 (PDT)
From:   trix@redhat.com
To:     jasmin@anw.at, mchehab@kernel.org, o.endriss@gmx.de,
        rjkm@metzlerbros.de
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] media: dvb-frontends/cxd2099: report errors
Date:   Wed, 22 Jul 2020 06:41:26 -0700
Message-Id: <20200722134126.31191-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this error

drivers/media/dvb-frontends/cxd2099.c:420:2: warning: Undefined
  or garbage value returned to caller
        return val;
        ^~~~~~~~~~

In read_cam_control, the call to read_io can fail.
When it fails val is not set.

The failure status should be returned to the caller,
not the unset val.

Similar problem with read_attribute_mem

Fixes: 0f0b270f905b ("[media] ngene: CXD2099AR Common Interface driver")

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/dvb-frontends/cxd2099.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2099.c b/drivers/media/dvb-frontends/cxd2099.c
index f88b5355493e..9dfaf18fc4b4 100644
--- a/drivers/media/dvb-frontends/cxd2099.c
+++ b/drivers/media/dvb-frontends/cxd2099.c
@@ -387,12 +387,15 @@ static int read_attribute_mem(struct dvb_ca_en50221 *ca,
 {
 	struct cxd *ci = ca->data;
 	u8 val;
+	int ret;
 
 	mutex_lock(&ci->lock);
 	set_mode(ci, 1);
-	read_pccard(ci, address, &val, 1);
+	ret = read_pccard(ci, address, &val, 1);
+	if (!ret)
+		ret = val;
 	mutex_unlock(&ci->lock);
-	return val;
+	return ret;
 }
 
 static int write_attribute_mem(struct dvb_ca_en50221 *ca, int slot,
@@ -412,12 +415,15 @@ static int read_cam_control(struct dvb_ca_en50221 *ca,
 {
 	struct cxd *ci = ca->data;
 	unsigned int val;
+	int ret;
 
 	mutex_lock(&ci->lock);
 	set_mode(ci, 0);
-	read_io(ci, address, &val);
+	ret = read_io(ci, address, &val);
+	if (!ret)
+		ret = val;
 	mutex_unlock(&ci->lock);
-	return val;
+	return ret;
 }
 
 static int write_cam_control(struct dvb_ca_en50221 *ca, int slot,
-- 
2.18.1

