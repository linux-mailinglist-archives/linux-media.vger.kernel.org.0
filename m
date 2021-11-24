Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 060BA45CCE8
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351202AbhKXTQq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:16:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:52764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351102AbhKXTQl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DB2761041;
        Wed, 24 Nov 2021 19:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781211;
        bh=RRjOTqPDWgrKdDbYPjNhYCqM2YMTxtM8UhC2wV0Nr1E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f4F0FRqIrWtYVY1BgJIUuNFzzvvViYbMzStnsu9jkMUHEnXoFor7p0IA3xIauPS0M
         2mpWl2oxq/3roJBk2iuG6/H0O2A2YXaCkmMgYEmsvIhzknVzf17E08ojciXzPe9N94
         sAQjzUkOsv8KrP0WJFJ9aZ9CRj3UvnyDy0KIukfK1qhna5B5b9DD3Vg/gDFjUKtsk0
         ITlXyZXTLDTKftotWbfvcxxZF5a1PFStdrMwIhsLvxuvYCsyFJLU0BgilhUdh6OYMo
         7e+x59vjMksqPeYZTrd8j6HoKrO7+3eaL6xNV6WjsqN8OVwXmnuC+TLdMNoJ29w3fT
         wNUtENa2OepLw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q5P-Ig; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrey Utkin <andrey_utkin@fastmail.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Ismael Luceno <ismael@iodev.co.uk>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 08/20] media: solo6x10: add _maybe_unused to currently unused functions
Date:   Wed, 24 Nov 2021 20:13:11 +0100
Message-Id: <18daa194878d8815beef39d6fed2a838e1c2cb68.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several unused helper macros there, meant to parse some
fields.

While there's not wrong with that, it generates clang warnings
with W=1, causing build to break with CONFIG_WERROR.

So, add __maybe_unused to fix such warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
index 0abcad4e84fa..85eaf5d00e9b 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
@@ -391,12 +391,12 @@ static int solo_send_desc(struct solo_enc_dev *solo_enc, int skip,
 }
 
 /* Extract values from VOP header - VE_STATUSxx */
-static inline int vop_interlaced(const vop_header *vh)
+static inline __maybe_unused int vop_interlaced(const vop_header *vh)
 {
 	return (__le32_to_cpu((*vh)[0]) >> 30) & 1;
 }
 
-static inline u8 vop_channel(const vop_header *vh)
+static inline __maybe_unused u8 vop_channel(const vop_header *vh)
 {
 	return (__le32_to_cpu((*vh)[0]) >> 24) & 0x1F;
 }
@@ -411,12 +411,12 @@ static inline u32 vop_mpeg_size(const vop_header *vh)
 	return __le32_to_cpu((*vh)[0]) & 0xFFFFF;
 }
 
-static inline u8 vop_hsize(const vop_header *vh)
+static inline u8 __maybe_unused vop_hsize(const vop_header *vh)
 {
 	return (__le32_to_cpu((*vh)[1]) >> 8) & 0xFF;
 }
 
-static inline u8 vop_vsize(const vop_header *vh)
+static inline u8 __maybe_unused vop_vsize(const vop_header *vh)
 {
 	return __le32_to_cpu((*vh)[1]) & 0xFF;
 }
@@ -436,12 +436,12 @@ static inline u32 vop_jpeg_size(const vop_header *vh)
 	return __le32_to_cpu((*vh)[4]) & 0xFFFFF;
 }
 
-static inline u32 vop_sec(const vop_header *vh)
+static inline u32 __maybe_unused vop_sec(const vop_header *vh)
 {
 	return __le32_to_cpu((*vh)[5]);
 }
 
-static inline u32 vop_usec(const vop_header *vh)
+static inline __maybe_unused u32 vop_usec(const vop_header *vh)
 {
 	return __le32_to_cpu((*vh)[6]);
 }
-- 
2.33.1

