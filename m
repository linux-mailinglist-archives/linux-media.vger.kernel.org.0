Return-Path: <linux-media+bounces-43285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76982BA60B8
	for <lists+linux-media@lfdr.de>; Sat, 27 Sep 2025 16:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC29C7AF6BE
	for <lists+linux-media@lfdr.de>; Sat, 27 Sep 2025 14:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BBA2E62AF;
	Sat, 27 Sep 2025 14:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="nqP248wi"
X-Original-To: linux-media@vger.kernel.org
Received: from www3141.sakura.ne.jp (www3141.sakura.ne.jp [49.212.207.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC0C1C8611;
	Sat, 27 Sep 2025 14:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=49.212.207.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758984344; cv=pass; b=OF0iv/zAumVAhEvkJOCfyOBmBN0cVl9gPrH7k3pNriZ2nrROTscNFXfXed4aQXj14D9/AyZdzbQ6Ews4oASKwrRRa8lZqupyn6rOMNdfAgstcjD/rMwaeAugfken+ZvCUZTiuNL5QoqMZTua4FHxOzS84Q/vy2hOIZo1YYMgGto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758984344; c=relaxed/simple;
	bh=rBDj/+OvJDWxuLLyDHtZeCHCmlyH4RlF/MZo1EldIWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XA++JhO1pqCP3/xP0RJCVEM3qZFQQPGn+3bh1RRsTbAOXk4pmP2Z3V6kXxYB18NgsaS8ZVJARcER2GNKrQMpXWNjo0sj/xbjb9hugwWG+ZZkt2KtsPDSc5lxQ0F/AH7lpXoFpIwkdFJ5gPlN7gfrEF0yFf/HVnc1mOpovM2oSuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=nqP248wi; arc=pass smtp.client-ip=49.212.207.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Received: from www.redadmin.org (ag129037.ppp.asahi-net.or.jp [157.107.129.37])
	(authenticated bits=0)
	by www3141.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 58REjZ99079846
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 27 Sep 2025 23:45:35 +0900 (JST)
	(envelope-from weibu@redadmin.org)
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 0717910A24946;
	Sat, 27 Sep 2025 23:45:35 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SXAlEZ7bM9wj; Sat, 27 Sep 2025 23:45:31 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 93D36109D57DE; Sat, 27 Sep 2025 23:45:31 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1758984331;
	cv=none; b=ZaMM1dV04ltRnAJXWQgLbD3LSIAtI72CpuwYZIspNs82jM36FebOPtqwBMNak61FjPwiywBYUrpb026jDSh1vcIV2OIEWt22hOm+Kd+QwVVhItes/5y887tfUkqDApPZppf7QuvJ1h4ZC3xt9EvFLxPnz54oWmZfBgtfdyXf49k=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1758984331; c=relaxed/relaxed;
	bh=rBDj/+OvJDWxuLLyDHtZeCHCmlyH4RlF/MZo1EldIWA=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=Mza+zV0pqFwhyse1ff7e5yecNWyAprOybjDsQzDVdVYgbOF+JDPTnCyGZiwsYh9ef6ZXEO/ziPuPEy8tdbCoEbRH9133U02Sdo5DeLqr5ICjzQQbOPreNQOE4gm7PCMs6fD2SjQzeArlGWmytQxh8TWI9ogpE3xSVxzBnloBwh0=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 93D36109D57DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1758984331;
	bh=rBDj/+OvJDWxuLLyDHtZeCHCmlyH4RlF/MZo1EldIWA=;
	h=From:To:Cc:Subject:Date:From;
	b=nqP248wis1pIlm7YFyQGgQh8X0w8L16uFJS/w/tRTFcczW+uTLOBGb5kUzsjI33to
	 vdaORhNwULu0NVekyaxCbbcpiCoe/hXNd6IL0cSneymd6OOjYMoJsRULaPbAtnufvu
	 WOCWX/i5U4/IfTT3iOq/9/hNegmOppePf0riVST8=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH] docs: media: bt8xx: Correct typo in vendor name (Connexant)
Date: Sat, 27 Sep 2025 23:45:28 +0900
Message-ID: <20250927144528.170403-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In Documentation/admin-guide/media/bt8xx.rst, the vendor name
was misspelled.

Change "Conexant" to the correct spelling "Connexant".

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 Documentation/admin-guide/media/bt8xx.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/media/bt8xx.rst b/Documentation/admi=
n-guide/media/bt8xx.rst
index 3589f6ab7e46..3da0bbf6d16a 100644
--- a/Documentation/admin-guide/media/bt8xx.rst
+++ b/Documentation/admin-guide/media/bt8xx.rst
@@ -19,7 +19,7 @@ This class of cards has a bt878a as the PCI interface, an=
d require the bttv
 driver for accessing the i2c bus and the gpio pins of the bt8xx chipset.
=20
 Please see Documentation/admin-guide/media/bttv-cardlist.rst for a complete
-list of Cards based on the Conexant Bt8xx PCI bridge supported by the
+list of Cards based on the Connexant Bt8xx PCI bridge supported by the
 Linux Kernel.
=20
 In order to be able to compile the kernel, some config options should be
--=20
2.47.3


