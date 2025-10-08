Return-Path: <linux-media+bounces-43954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C250BC48FF
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 13:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 270D434D1B4
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 11:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D7F2F6576;
	Wed,  8 Oct 2025 11:28:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch [83.166.143.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C1D2EBDF2
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 11:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759922897; cv=none; b=f6B/sR8Q0JvRHV63Nzm0tpUu557Y553svOzlLVQRiBmpX58E1V9lS5Y77Ilfvu0cK9qDZdVwLxHlVhPXQr6Llztd9voKhfEy0lK9U38MZMf+gDuaH5+sBNNjSgLM/9hL2ao/EnUU55crYA2Mg+kGsQOzmHz8OAMl4iW/ThVVsEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759922897; c=relaxed/simple;
	bh=rRHXV8zk7/Pf7qvq0kgOStj0Mbg5YCdg21V00dV7BWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=h6k/N9USteo1xBEHkYzjfdWxR5gmkll95pvTSH7XjtiLnnDcDCdr/h/QGA2w2hnm1cv7rpX/QN1hDow+fIDy49hEN1llZrkZU72SMwCUBWU/8b/i/7bcK3fsFTsECerhHr+0apDT9yY9iqiLQcdqt5Z3qkVTXtPDeKp5efLwlKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=83.166.143.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4chW2y3tsBzxYM;
	Wed,  8 Oct 2025 13:28:10 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4chW2y0k2CzFZP;
	Wed,  8 Oct 2025 13:28:10 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Wed, 08 Oct 2025 13:27:40 +0200
Subject: [PATCH v4l-utils] README.md: migrate instruction to "meson setup"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-readme-meson-v1-1-04f0bca4e4ae@cherry.de>
X-B4-Tracking: v=1; b=H4sIAKtK5mgC/x3MQQqDMBBG4avIrB1IbNKKV5Eugv62AxolY0NBv
 LvB5bd47yBFEih11UEJWVTWWGDrioZviB+wjMXUmMZbY1pOCOMCXqBr5PYFG4L3T/dwVJItYZL
 /vespu5l/u8xK7/O8ACpc/GZpAAAA
X-Change-ID: 20251008-readme-meson-87e1aa556434
To: linux-media@vger.kernel.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

meson [options] is deprecated since 0.64.0 (commit 3c7ab542c0c4
("deprecate running "meson builddir" without setup subcommand")) and
throws a warning telling you to use meson setup [options] instead, so
let's do that.

While 0.64.0 is higher than the current minimum requirement of 0.60,
meson setup is, according to the aforementioned commit, supported since
0.42, so this change should be fine for meson versions between 0.60 and
0.64.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 358960a7..1f82e6c9 100644
--- a/README.md
+++ b/README.md
@@ -56,7 +56,7 @@ After downloading and installing the needed packages on your distribution, you
 should run:
 
 ```
-meson build/
+meson setup build/
 ninja -C build/
 ```
 

---
base-commit: 0a9722fc1a8d5c1a78c269281e9618be8e393716
change-id: 20251008-readme-meson-87e1aa556434

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


