Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F69C32A863
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580258AbhCBRbF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:31:05 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:45209 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1578128AbhCBKfy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Mar 2021 05:35:54 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id H2MqlKlzoC40pH2Mulm6FC; Tue, 02 Mar 2021 11:35:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614681308; bh=Mf4FvERrmB7aOcuSUJ9jm+bj73snwSpBgwlxWHt6h7s=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=asaY8W8PTw8J7052nlYqRH1tdoPOpvar8Bb2pfxdPkJOKuJJisbboiKEzWk28Zfas
         UdKE7+apzZp5qGA5H6lkhBPv3YbHVIJ79aODQCRXYb8ojYLrtUl2m8p6ehWk3ombPY
         4XREJgZX6bOjYAiQaWmOKbuJxbGPZTtFG7XnPBuO74ABCHHstsMDywg2jBaVHLQzR0
         eiBcscCTPdGJjR8KpAHaBQhIdTMGUt7LSeZkCsBBWZob0HN60CC3pHmvwWa98FcNWI
         4fcq+TouBA7+RH6D6p3vBShw39TvXBtJvSLz2Z3xBVUy9jF2csRvuwzbPGGpPNFuW/
         /QjjAzXkoPiwg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/2] configure.ac: add AM_GNU_GETTEXT_REQUIRE_VERSION
Date:   Tue,  2 Mar 2021 11:34:57 +0100
Message-Id: <20210302103458.819043-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302103458.819043-1-hverkuil-cisco@xs4all.nl>
References: <20210302103458.819043-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfOE/rhnHDjmszu4cYYwmvRspQ1M8KiVR7C7BhBrEKx4JcjRAQTTJIU3GBSZzk/x8zvymOl0uB8NiYFrhG8Z0ZMUWp/C9KFrFbU4PaOSrK0cdDLBFsxo8
 cjiWJQik0fqqZh7XBJcZWQFQCOys3/cWOT2sarWjTqCfF3eu8Xaq+1fGueyZlEx+cDXOLZfxlnrs5uP26Q3tY8aAGtvdy6ynHFDck8akbEPGP+rc1LG84q5I
 dmjJ/DO7cOxT2YqNGG0446C1kBpbv/mqcTjj2p/Af8U=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is needed for newer gettext versions (>= 0.20).

It avoids this error:

Making all in v4l-utils-po
*** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.20 but the autoconf macros are from gettext version 0.19

The old AM_GNU_GETTEXT_VERSION is still needed for older (< 2.70)
autoconf versions.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 configure.ac | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure.ac b/configure.ac
index 5290fa01..62b12549 100644
--- a/configure.ac
+++ b/configure.ac
@@ -97,7 +97,10 @@ PKG_PROG_PKG_CONFIG
 DX_DOT_FEATURE(ON)
 DX_INIT_DOXYGEN($PACKAGE_NAME, doxygen_libdvbv5.cfg)
 ALL_LINGUAS=""
+# AM_GNU_GETTEXT_VERSION kept for autoreconf versions that do
+# not support AM_GNU_GETTEXT_REQUIRE_VERSION
 AM_GNU_GETTEXT_VERSION([0.19.8])
+AM_GNU_GETTEXT_REQUIRE_VERSION([0.19.8])
 AM_GNU_GETTEXT([external])
 
 LIBDVBV5_DOMAIN="libdvbv5"
-- 
2.30.1

