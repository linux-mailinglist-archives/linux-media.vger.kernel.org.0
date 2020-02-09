Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 648CA156BDC
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2020 18:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbgBIRtm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Feb 2020 12:49:42 -0500
Received: from mail-qv1-f67.google.com ([209.85.219.67]:39757 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727397AbgBIRtm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Feb 2020 12:49:42 -0500
Received: by mail-qv1-f67.google.com with SMTP id y8so2123355qvk.6
        for <linux-media@vger.kernel.org>; Sun, 09 Feb 2020 09:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5OkGq3dWz9ecKmGTpZN3ABv7jy8EyUjTuWeJpq+aodA=;
        b=lihqwTjqef9DAr68UT5VwdeUaL8ZFunmbHxIkaivdzKiQMVVAQCAepvglHlvSeFmcW
         epp9cQpFKZ3v4qoDPHLlEn78peAC4naWmgdR+2/gk93JMyR+DhEQKaPRrkIeTXwX5vJH
         vrDpY5dtM8cWGDe3/0dMl+u8EpRk0SAmdvVHhlQATzMe/NWiJ7igS3orf8kAXV2ERdRq
         DaGJdjvQ3+X1SJyVGZQlcqk5DEpebc7H4OmuyrzaENOgx0I9sd0pmOHXa0UOHFMzuxIg
         gPI4Te/HQYgumx1btl+HfTpa2S2Y3uPsE2QrPTs8ND+1HpZ3swWSTJkS6aOjJNDnCkts
         iW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=5OkGq3dWz9ecKmGTpZN3ABv7jy8EyUjTuWeJpq+aodA=;
        b=oKeq4RUqtiLyBXabIsgglpL+6idl/voRxJjqaXuZSk3pYN5NYBh+lt9LvxjyctXwZG
         iX67tOzhEy5v/kOX4OIgn4c6QsPG583eqUIV902J94jFW0hthEWK2TYo5LikQZfU7rEC
         5wBqZDVlDw1xertrMjKufcWwiHsNbDu7H3Lh9eoGSVGAkXJZTmN3jdcWyaBVO6tdpxgq
         M/poreCm1YHuE8jOU6Cg8unnmD4uPIvygBLR9RB+Fcp9UL/GHjuDDphNcF39Kuk+taFl
         U5Znm+BnDzgzVnLgJt8c+UIy+tIRb6cE1kahYJqdcYVBrswP3bZ84+oLIJ/lh47IGpDw
         OlCw==
X-Gm-Message-State: APjAAAU5meSzam+XshdKtE7CTcCKzq+09X/PT0NuZpZSn5F24uYn+CLo
        dFIQeIU9OrmUDX4bKinc2rFaLTIo0kk=
X-Google-Smtp-Source: APXvYqxIxc8x23bM/yPwN/iboj8ea4U10QG3R4VSXNVVrZSFNdia43MOJb0MFnm041SvSUvKU5J6Ig==
X-Received: by 2002:ad4:5a48:: with SMTP id ej8mr7015527qvb.187.1581270581389;
        Sun, 09 Feb 2020 09:49:41 -0800 (PST)
Received: from athos.hellosponsor.com (pool-173-68-201-69.nycmny.fios.verizon.net. [173.68.201.69])
        by smtp.gmail.com with ESMTPSA id 206sm4621095qkf.132.2020.02.09.09.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 09:49:40 -0800 (PST)
From:   Ilia Mirkin <imirkin@alum.mit.edu>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 1/2] edid-decode: add function to enable usage as a library
Date:   Sun,  9 Feb 2020 12:49:36 -0500
Message-Id: <20200209174937.22844-2-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200209174937.22844-1-imirkin@alum.mit.edu>
References: <20200209174937.22844-1-imirkin@alum.mit.edu>
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
 edid-decode.cpp | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/edid-decode.cpp b/edid-decode.cpp
index ef50da2..fd17bc6 100644
--- a/edid-decode.cpp
+++ b/edid-decode.cpp
@@ -1005,3 +1005,21 @@ int main(int argc, char **argv)
 		return edid_from_file(argv[optind], argv[optind + 1], out_fmt);
 	return ret ? ret : state.parse_edid();
 }
+
+#ifdef __EMSCRIPTEN__
+/*
+ * The surrounding JavaScript implementation will call this function
+ * each time it wants to decode an EDID. So this should reset all the
+ * state and start over.
+ */
+extern "C" int parse_edid(const char *input) {
+	for (unsigned i = 0; i < EDID_MAX_BLOCKS + 1; i++) {
+		s_msgs[i][0].clear();
+		s_msgs[i][1].clear();
+	}
+	options[OptCheck] = 1;
+	state = edid_state();
+	int ret = edid_from_file(input, NULL, OUT_FMT_DEFAULT);
+	return ret ? ret : state.parse_edid();
+}
+#endif
-- 
2.24.1

