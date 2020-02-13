Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6440415BDCF
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 12:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729913AbgBMLjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 06:39:08 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:33994 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729801AbgBMLjI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 06:39:08 -0500
Received: by mail-qk1-f195.google.com with SMTP id c20so5333719qkm.1
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2020 03:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=726BAxzODrIm31Pwz78wMNNyFma50KrMtEFODthUrc8=;
        b=vhJsYVsbDl+QK5Sj7at6S2xur4CiPSWPAGEkDk6Tkyj5w/LjYJB8uxIFhiK2zG12Dx
         vndBR8lP0fStSPMlKE+lK/ob9G4AqzgNlkdRIeWWOCsUvEEiu3xXlXFZ6LkciGa2oE1k
         WfGuovyuC4eztDj4WbWVLu7S0zbJ37MPZ/b1olLndyJFqkTbqF3Kbnf1i8k/SUetZh4r
         fm5bEicmeI9ad1d7ucNdePaNWPA6pdPFBWo1EepHiBvQ0BlH9u6eDi+Bw/HePcQCoBat
         WqjlVtl+1azNHg62wWCYliHevzuLzByPXLZTQR5T0TYGn01ySsf45Nri4oIDPzageCg7
         9t4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=726BAxzODrIm31Pwz78wMNNyFma50KrMtEFODthUrc8=;
        b=bQkpG7A6Vf5fM3mao8oATEODbHO+zE9mzXNh1qdVBITsyvFoLNx8dEzuswWJQsIx0o
         0BOwoBrwzmJb0IkqKaBQSl/X+K8SbYt+m3nX7ixrXM3DkBXxMg/C5Ye/YuPrR4KPv8ZT
         6wl5FKsFcJqdjeKC+ZeWH37d77ZnqSgMBp8NUEWE7Ld1n8K27lsDh1ZF6oz/64yIB2FY
         vNVcM6lQu/D8YjIY76MisgHUwUmcQ8xZ2XDXbJ6yEVy/sCkwPBALVddo7z6EicexEB1P
         Cejj0CF7hWHIpqLkMn9k8+tFbTg02y03orx4fJ3RcKr71m1WsGT+xJtEHGJGQcIEJ61H
         dWWg==
X-Gm-Message-State: APjAAAV5BWbev186oWBuLTixgYibMdBrQ0OjOHgjtZwryW9JlwKQuem+
        Qzk2WUjpl+JJumNM7lSDPPmqoPY2AXQ=
X-Google-Smtp-Source: APXvYqwgkCuJzwSQ+i74DgScnYMcWNFsi2MK2DfjKI8LiPEy3ps5RQHobCJbanWIrhX4RDF28xBv8g==
X-Received: by 2002:a37:a642:: with SMTP id p63mr15639579qke.85.1581593945564;
        Thu, 13 Feb 2020 03:39:05 -0800 (PST)
Received: from athos.hellosponsor.com (pool-173-68-201-69.nycmny.fios.verizon.net. [173.68.201.69])
        by smtp.gmail.com with ESMTPSA id v125sm1123854qkb.52.2020.02.13.03.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 03:39:04 -0800 (PST)
From:   Ilia Mirkin <imirkin@alum.mit.edu>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH v2 1/2] edid-decode: add function to enable usage as a library
Date:   Thu, 13 Feb 2020 06:39:02 -0500
Message-Id: <20200213113903.23994-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is helpful for an emscripten setup, as there's no great way to
reinitialize the object from scratch.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

v2: rebase, move opening brace to new line

 edid-decode.cpp | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/edid-decode.cpp b/edid-decode.cpp
index 47135a9..0473bbf 100644
--- a/edid-decode.cpp
+++ b/edid-decode.cpp
@@ -1214,3 +1214,22 @@ int main(int argc, char **argv)
 
 	return ret ? ret : state.parse_edid();
 }
+
+#ifdef __EMSCRIPTEN__
+/*
+ * The surrounding JavaScript implementation will call this function
+ * each time it wants to decode an EDID. So this should reset all the
+ * state and start over.
+ */
+extern "C" int parse_edid(const char *input)
+{
+	for (unsigned i = 0; i < EDID_MAX_BLOCKS + 1; i++) {
+		s_msgs[i][0].clear();
+		s_msgs[i][1].clear();
+	}
+	options[OptCheck] = 1;
+	state = edid_state();
+	int ret = edid_from_file(input);
+	return ret ? ret : state.parse_edid();
+}
+#endif
-- 
2.24.1

