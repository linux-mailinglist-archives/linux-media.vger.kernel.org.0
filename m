Return-Path: <linux-media+bounces-2266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C8380F0F1
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 16:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 232EA281CD9
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 15:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2979E7A21E;
	Tue, 12 Dec 2023 15:28:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F337FD65
	for <linux-media@vger.kernel.org>; Tue, 12 Dec 2023 07:28:08 -0800 (PST)
From: James Le Cuirot <chewi@gentoo.org>
To: linux-media@vger.kernel.org
Cc: James Le Cuirot <chewi@gentoo.org>
Subject: [PATCH 1/2] meson: Fix building with -Dv4l-utils=false
Date: Tue, 12 Dec 2023 15:24:05 +0000
Message-ID: <20231212152418.20584-1-chewi@gentoo.org>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ir_bpf_enabled was referenced without being defined.
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index 03508bc8..d9689d35 100644
--- a/meson.build
+++ b/meson.build
@@ -382,6 +382,8 @@ subdir('lib')
 if get_option('v4l-utils')
     subdir('utils')
     subdir('contrib')
+else
+    ir_bpf_enabled = false
 endif
 
 subdir('doc')
-- 
2.42.1


