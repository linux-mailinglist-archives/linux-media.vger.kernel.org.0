Return-Path: <linux-media+bounces-48687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71886CB7B77
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 04:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9537B3005F3A
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 03:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A1D2264B8;
	Fri, 12 Dec 2025 03:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UjtQhNgh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A701122083;
	Fri, 12 Dec 2025 03:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765508463; cv=none; b=SlhkX2ireHXtEck+F5bwEU9kmFQDpZe/SgLRBUojEFi751A3l+/opF49/vU18hff8uk9LrzIgwbTtjLEj/ebYN5k6GpMgTc9kSM0/BMU3YGm0awxMd8WqtX9b7vkfY4cU3iC2e0zwkiVrQ5jz7Qb+t/FXv+YuiABJPHOjfpsHvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765508463; c=relaxed/simple;
	bh=MRVJ17cxjJ/1xqcJyZvQADUaV2QTkzL7dFTtiTT0rNc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DBhAaSw2Vh8jfEdt061ixAdbUXxN5Qc4XpPwY99Ym6FdSpoqtVb/V7Y2n6mkptWYJsWCpW7TWfrSBQtw3ikNa+RT9RMDypfP6vmTzhHxM0NycMBGLpoqj95upbswX6gYtC7v/Q/eWMp2MqU4HzNySOpERkZEpvUZlTqwE8RfMo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UjtQhNgh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31830C4CEF7;
	Fri, 12 Dec 2025 03:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765508463;
	bh=MRVJ17cxjJ/1xqcJyZvQADUaV2QTkzL7dFTtiTT0rNc=;
	h=From:To:Cc:Subject:Date:From;
	b=UjtQhNghZMAAuMJiqLhLDHiXRPTmVMKOpejBYlSdfKKvVqvGaLyFagJETYxCqKDuY
	 B1n3z8HOwJ/dqtHENSG7qWUmFiGlLzqgaEz8qHmJzjh5aSdMVnXO5XQzF5mZnEFjtm
	 kMQnzJ8KJ6i0IT10D38Sfhs3+xM022CR7NFwUjeXvdHwzpZcpB/x/vKcAlyKTGXzfU
	 vKsgWd3kBu1IuKYIFdbV2Ga8o+f4X19/dHeahuehfba2f/mbHIsE5vYEJ5/3ue5UBD
	 9Bp/YX0EXxz3MZvuboFA3hLZaWtnhcTuMMUCb569wukXUh01hLjFCtofV4YUej16ml
	 h9ISLBLWrReLA==
From: Kees Cook <kees@kernel.org>
To: Bluecherry Maintainers <maintainers@bluecherrydvr.com>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] media: solo6x10: Check for out of bounds chip_id
Date: Thu, 11 Dec 2025 19:00:35 -0800
Message-Id: <20251212030030.work.534-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2342; i=kees@kernel.org; h=from:subject:message-id; bh=MRVJ17cxjJ/1xqcJyZvQADUaV2QTkzL7dFTtiTT0rNc=; b=owGbwMvMwCVmps19z/KJym7G02pJDJnWrUFCTv6BhY++G7huc+eQ7k9LclwQdndNmNcE93e+f z6EWy3vKGVhEONikBVTZAmyc49z8XjbHu4+VxFmDisTyBAGLk4BmEhlIsM/vcN7z/b2cfenPjxh kV52J3bO+a8/085XTMl6Ljj7mmjic4Y/vDK1J9cHvJ8vVfa9IGgLo/7vgK9aOj8ucPh/fZbq/fw wDwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Clang with CONFIG_UBSAN_SHIFT=y noticed a condition where a signed type
(literal "1" is an "int") could end up being shifted beyond 32 bits,
so instrumentation was added (and due to the double is_tw286x() call
seen via inlining), Clang decides the second one must now be undefined
behavior and elides the rest of the function[1]. This is a known problem
with Clang (that is still being worked on), but we can avoid the entire
problem by actually checking the existing max chip ID, and now there is
no runtime instrumentation added at all since everything is known to be
within bounds.

Additionally use an unsigned value for the shift to remove the
instrumentation even without the explicit bounds checking.

Link: https://github.com/ClangBuiltLinux/linux/issues/2144 [1]
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Bluecherry Maintainers <maintainers@bluecherrydvr.com>
Cc: Andrey Utkin <andrey_utkin@fastmail.com>
Cc: Ismael Luceno <ismael@iodev.co.uk>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: <linux-media@vger.kernel.org>
---
 drivers/media/pci/solo6x10/solo6x10-tw28.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-tw28.c b/drivers/media/pci/solo6x10/solo6x10-tw28.c
index 1b7c22a9bc94..da7b45dea5bc 100644
--- a/drivers/media/pci/solo6x10/solo6x10-tw28.c
+++ b/drivers/media/pci/solo6x10/solo6x10-tw28.c
@@ -166,7 +166,7 @@ static const u8 tbl_tw2865_pal_template[] = {
 	0x64, 0x51, 0x40, 0xaf, 0xFF, 0xF0, 0x00, 0xC0,
 };
 
-#define is_tw286x(__solo, __id) (!(__solo->tw2815 & (1 << __id)))
+#define is_tw286x(__solo, __id) (!(__solo->tw2815 & (1U << __id)))
 
 static u8 tw_readbyte(struct solo_dev *solo_dev, int chip_id, u8 tw6x_off,
 		      u8 tw_off)
@@ -686,6 +686,9 @@ int tw28_set_ctrl_val(struct solo_dev *solo_dev, u32 ctrl, u8 ch,
 	chip_num = ch / 4;
 	ch %= 4;
 
+	if (chip_num >= TW_NUM_CHIP)
+		return -EINVAL;
+
 	if (val > 255 || val < 0)
 		return -ERANGE;
 
@@ -758,6 +761,9 @@ int tw28_get_ctrl_val(struct solo_dev *solo_dev, u32 ctrl, u8 ch,
 	chip_num = ch / 4;
 	ch %= 4;
 
+	if (chip_num >= TW_NUM_CHIP)
+		return -EINVAL;
+
 	switch (ctrl) {
 	case V4L2_CID_SHARPNESS:
 		/* Only 286x has sharpness */
-- 
2.34.1


