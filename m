Return-Path: <linux-media+bounces-43749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8CDBB89CB
	for <lists+linux-media@lfdr.de>; Sat, 04 Oct 2025 07:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 357133A5469
	for <lists+linux-media@lfdr.de>; Sat,  4 Oct 2025 05:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DBF1E501C;
	Sat,  4 Oct 2025 05:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=jdstroy.cf header.i=@jdstroy.cf header.b="Xfg8Qixf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=iad1.rp.oracleemaildelivery.com header.i=@iad1.rp.oracleemaildelivery.com header.b="vmbpVXXc"
X-Original-To: linux-media@vger.kernel.org
Received: from adg154cb126.iad1.oracleemaildelivery.com (adg154cb126.iad1.oracleemaildelivery.com [147.154.32.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C2B3FB31
	for <linux-media@vger.kernel.org>; Sat,  4 Oct 2025 05:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.154.32.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759557022; cv=none; b=PrZBD/TSoj2Gpexi9MvhVjkCUFYPIwFh2qfwjVI3wQgwDUku/av7CwCQzBu1QIjzHWbBvmThfXCpc7Hng4E6DVwiLh/w5eYiQIneuo791vrfAl6NaPb9iUFgxetWi/xFsPqywf/9nyBnClMC6Ue/FLN51K0QSNnwq+IHUro3NaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759557022; c=relaxed/simple;
	bh=qHcJ0+4WAFjk1FY5e642yXljByoJwEau/mMsII2l86s=;
	h=Message-id:Date:MIME-version:To:From:Subject:Content-type; b=DEqbKWvnXz6qzHsS9RqNoTtEbuNrYV/0qWSoqtaJh7UiGcScFUKdWhzbYkY+id2bPamg5AKHt6kZgR8+/mWEDsAH3uz7R9ge9YVWBirfbb+kAjuQRaZSpbRlAYj6RSlU4Mwi3vl9B8fvh5FRfmF8kDo4I4rCV/oOIClBWCgJ/qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jdstroy.cf; spf=pass smtp.mailfrom=iad1.rp.oracleemaildelivery.com; dkim=pass (2048-bit key) header.d=jdstroy.cf header.i=@jdstroy.cf header.b=Xfg8Qixf; dkim=pass (2048-bit key) header.d=iad1.rp.oracleemaildelivery.com header.i=@iad1.rp.oracleemaildelivery.com header.b=vmbpVXXc; arc=none smtp.client-ip=147.154.32.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jdstroy.cf
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iad1.rp.oracleemaildelivery.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mail-us-202304;
 d=jdstroy.cf;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=EBKXCHiDqx1vKsiq/j4vUe/aYxXl4yHAcjbCQIO0zUE=;
 b=Xfg8Qixf76Yf7d2orXi5ABVAoGkwhUuSofsRDo7iYStQ5vucKz3Fsmlb9mZ7c9n9MezwwsbFNykv
   yyNppisbMf+ZghdAoNLuNIU8ky9ZUnAfCdTdXS0zo8bzlA+3dD4kYKoz7Bp6E89YiDlr4YECYf90
   97a9ZJm22YVoQVSpmB9xxxiunrv/OvbuJf4NYzGNyYVXPWxuTYq5TT+OsTev9J259hH0lJSxGIsX
   RybvD60lHRog1cWA2HxzW6oINYhicGnmAhTGjwESVJh68PrkAp2gZ3mjDtHZiRWXUZ8RM3v0x0nb
   9WDdnh18P/GsOiJbN3QpzbqHylu8MR2JVJcfBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-iad-20200707;
 d=iad1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=EBKXCHiDqx1vKsiq/j4vUe/aYxXl4yHAcjbCQIO0zUE=;
 b=vmbpVXXcFYzYxJ7gM+od/bTu6/SXtvz5YBwCPtO06ONvyxXjIMZb7pZyGgdn42UKUmbuF8GqAodD
   pJBL+Z7/yAn4jIhqHJFtYcHQu0kzJ3z8Z8xh1R/LJT7p6/TRxdJDHQNxZovjcihjnw12WL4e1JD+
   hpijQ6F+21IFaUbkQbMFTjymVAPIAU/siQcrj3dHKONkDk0saO+QJf2Zy0luMRi6GuMtdWH0TSrv
   pZozMGlAAvFHGOyaYDVKz+qzmSh1UK9bLRNXQ2NTzphbSRGyQB7+TmER5t+IOpCJ5lHEGMHXdayH
   K1TqL8ZwQ5VkeMVQM9qC5CGTaac91jM5yWwAPg==
Received: by omta-ad3-fd3-301-us-ashburn-1.omtaad3.vcndpiad.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20250909 64bit (built Sep  9
 2025))
 with ESMTPS id <0T3L001I9EVU2220@omta-ad3-fd3-301-us-ashburn-1.omtaad3.vcndpiad.oraclevcn.com> for
 linux-media@vger.kernel.org; Sat, 04 Oct 2025 05:50:18 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Message-id: <d90b5072-3a10-44ea-93e3-0077fbcbd509@jdstroy.cf>
Date: Fri, 3 Oct 2025 19:50:17 -1000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-version: 1.0
User-Agent: Mozilla Thunderbird
Content-language: en-US
To: linux-media@vger.kernel.org
From: John Stroy <kernel.org_202510040544.1952@jdstroy.cf>
Subject: [PATCH v4l-utils] utils/keytable/rc_keymaps: add zune_hddock.toml
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 8bit
Reporting-Meta:
 AAF8prTF+AsI15k619vKtzFRHTNLdpusrP591i7nAa4ZSnCtisRvAJi5qN89aoeK
 mYJxj2BIkcaeGO2Qry8pqv4TKDgUCwTiNJjOj7XcaJe0zNvZqqKzcRQOF+EgWRsl
 459fLVMIDQWBZVTE+MAwfss/q2cRdniwdQzTPtuHWRscITY8nAou3MzSb9dcXmyz
 4znwvgdvXn15K5JDA1LwBPCGCfrYgbL4+LfdXt4m4iworyeuCqEoBgj6MtRG58Dw
 ClzVKRktYqc0awgdinpYrt+DoBOpm83p0nPkvZ4o2K2oJPSAVp0cxnghRIiNmetX
 zySx8jlz8ElhytyX8+GRsGEwwpp7PVT4Q6wBZeZYG7y8+TWsWULwHyC+VEw/z35s
 HYGgn8aa/4+ZIbWC6WINpxdaZ2/e8x0EDw0KmAIlVBFEwUZoUy3wlA3jF5azB9uS VXTYWqFUJGg=

Add Zune HD Dock remote control (Model 1401) data.

Signed-off-by: jdstroy <jdstroy@users.noreply.github.com>
---
  utils/keytable/rc_keymaps/zune_hddock.toml | 17 +++++++++++++++++
  1 file changed, 17 insertions(+)
  create mode 100644 utils/keytable/rc_keymaps/zune_hddock.toml

diff --git a/utils/keytable/rc_keymaps/zune_hddock.toml 
b/utils/keytable/rc_keymaps/zune_hddock.toml
new file mode 100644
index 00000000..a38fc75e
--- /dev/null
+++ b/utils/keytable/rc_keymaps/zune_hddock.toml
@@ -0,0 +1,17 @@
+[[protocols]]
+name = "zune_hd_dock"
+protocol = "rc6"
+variant = "rc6_mce"
+[protocols.scancodes]
+0x800f640d = "KEY_SELECT"
+0x800f6410 = "KEY_VOLUMEUP"
+0x800f6411 = "KEY_VOLUMEDOWN"
+0x800f641e = "KEY_UP"
+0x800f641f = "KEY_DOWN"
+0x800f6420 = "KEY_LEFT"
+0x800f6421 = "KEY_RIGHT"
+0x800f6422 = "KEY_ENTER"
+0x800f6423 = "KEY_BACK"
+0x800f6427 = "KEY_PREVIOUSSONG"
+0x800f6426 = "KEY_NEXTSONG"
+0x800f646e = "KEY_PLAYPAUSE"
--
2.43.0


