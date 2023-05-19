Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD577708C95
	for <lists+linux-media@lfdr.de>; Fri, 19 May 2023 02:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjESADJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 20:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjESADI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 20:03:08 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE34D10C2
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 17:03:07 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 66D3D660572A;
        Fri, 19 May 2023 01:03:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1684454586;
        bh=61/momUDIZbTXiprP8TEeb0ZLW2HVKd0DrxoKEQCsp0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gR3PiWwHJ6tnAKIlIwhKkflGSdlF7vEnpK30HCGsv6GqnTg6XU3aPTXJ3IVJ9XOrF
         LC0Noyw8pseOA24V0sdkl7QkimSk7PBPuaY5qal+HBpvcPFIJ4STf8/hPGLTuruTEI
         YcaXJCexErRDdGPsafoFGpL3PEP2MyFnLaMi2VyHHyBqemEsLYCFviQSienl6STQSg
         olZQVLK5sEZHl+OIag2qRHTnDSnVC0tcRCj4BwZmHNcFwX4DrWL4Pgsq4id5AbkWvO
         DBYLO56wSjfH3gb6wZyL2u2uRIJ1Xbv4DCA6JLCuQGWaxDg1ynDQZy3e4TTz3wXTf+
         Aijv3nns5JLzQ==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 1/2] v4l2-tracer: stop stringifying v4l2_input "tuner"
Date:   Thu, 18 May 2023 17:02:47 -0700
Message-Id: <225278a28fec4946afc79fcbd91becd4af17c839.1684453027.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1684453027.git.deborah.brouwer@collabora.com>
References: <cover.1684453027.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "tuner" field in struct v4l2_input is actually the tuner index used by
capture drivers that have more than one tuner. The comment in the UAPI
indicated that this field was an enum v4l2_tuner_type and so the
v4l2-tracer was (unsuccessfully) attempting to convert this field to a
string. Stop trying to stringify the "tuner" field and just let it be an
integer.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/v4l2-tracer-gen.pl | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
index f0cd5c61..d10be6a8 100755
--- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
+++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
@@ -192,10 +192,6 @@ sub get_val_def_name {
 		}
 		return "nullptr"; # will print as hex string
 	}
-	# special treatment for struct v4l2_input which has members named both "tuner" and "type"
-	if (($member eq "tuner") && ($struct_name eq "v4l2_input")) {
-		return "v4l2_tuner_type_val_def";
-	}
 	if ($member =~ /pixelformat/) {
 		return "v4l2_pix_fmt_val_def";
 	}
-- 
2.40.1

