Return-Path: <linux-media+bounces-13983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7535F9139A5
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 12:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FE6A1F21F8A
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 10:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1138512E1F9;
	Sun, 23 Jun 2024 10:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b="fszYuhWe"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE9B79CC;
	Sun, 23 Jun 2024 10:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719139643; cv=none; b=MY1X+ZkyRvTEH05/5pDEvEoNOKM3ex66Xr+6r6LBzk01sJWsGKMls18MnxgYbgvVCjNTY7lbRBqbDRZS1VAEF9mNs97vx3rDFTWDkuxaOeCNlDPhQelDT/1HUFygUwevRUhCqwHvvJ72Fy0hIaehrgWduoYWmYSjR7yvHc7AFa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719139643; c=relaxed/simple;
	bh=T6v6HA74Dhv3NC9PBFJ50M28bQAqnRbgFYuAPxSI5ZI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FSRcWqSdR32sitH0evDCKZel0o23WE+ItWYa3UvN+qTio0AZWb/pnp9E8PJfFjcwk0m0HKRvvUwhUUtPSZWZFaqR/h6AxtBkS+5jCEOvWO2aLmOlI7hqh1LTqMSwC7vxBZXxfNy+PlF9r8GUzVeL+txXRwYdKgxMN6+to9dhehU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b=fszYuhWe; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1719139635; x=1719744435; i=nils.rothaug@gmx.de;
	bh=F29eVrTChAslFTMr01K1ZnfxpwOhoAeXSVqEcekUiak=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fszYuhWeO3IsRc7wG8KDWJDU/OnA4fdbpddIHspee28WQ3K4lJgdHIHXVmIUgKFb
	 4Hm0b7uVuXglR9MRNkT+R1CjTzpedKIhzZG3TBo1O1SyJ67rIBk7XUBOnW+mjoyBu
	 f3jmpApYOQog3YcCFY9jMQG8a8eXOzMPtMaSHjFmr97EgGp8N3sneQ7jgSmwicn9a
	 cxqxOu3FE59WynyY0k2B1vA9zrPNEgiCeLOstttOn7UgR7ksLBHiNn+fbctN1RdiK
	 NRJDz3nl2ivMphG4KcGObdBMFiJhv2J5XCUPfBe0GgJpMO7r/r8EezQputfcAHS7d
	 HfwngErdcgD2A8ismg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from nilsr-VirtualBox ([83.78.44.59]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mjj8D-1smvay2mCJ-00e1Ng; Sun, 23
 Jun 2024 12:47:15 +0200
From: Nils Rothaug <nils.rothaug@gmx.de>
To: hverkuil@xs4all.nl
Cc: sean@mess.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	mchehab@kernel.org,
	nils.rothaug@gmx.de
Subject: [PATCH v2 3/5] media: dt-bindings: rc: add rc-mygica-utv3
Date: Sun, 23 Jun 2024 12:46:45 +0200
Message-Id: <20240623104647.7697-4-nils.rothaug@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240623104647.7697-1-nils.rothaug@gmx.de>
References: <20240623104647.7697-1-nils.rothaug@gmx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lkKGNPMd4tDtaCefWtHGER9mEmE2cucswygQqvnaMqCw6mmCeYi
 E5a/2NXs24i9Alvd/ZGQAzmxiJCIjeFd1fjHiws2GF4609FB4xGWCv2wb4D9L/3r0jUVdQ+
 UUoXCRmEvgT+8/OPF/4GXmtydyyJqZKautgNyiWcAAWL9ytmHttT5ginYWVxAug8c9Fm4eU
 vrwrB5KlIzh3NixBLgEFA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XonyLxElc8o=;EEBg6bvGW47iRvYvZPyxSEl4cQS
 ZEMp37vR2VvZHws8ZA2gwzYmFWimACUXtsiYZir6rUTmPSvN9vOmhS/vwlAxvf24ic6SbwF+C
 zNFNJv8/A0n2C6De3/ZinGRq2UOUaRkS3uBgYUdV7hFR1GxREnnVVdKlNF5CcaB25zHwB01o4
 Erq+G28Etb3ynZxk2v67Aki3aoCv6FfL8oVWB5u8VgSEym5Yjp1Xf3xzZT3X0ZRVVWQVR04tA
 wca2pI0K3Feawof7Pc1i6IxNp6Zw03pTJ2SYcXjxNzJ+6zk7y5SfmFxKq4jBdRCnq6hBg289N
 xbvVZmAUIbhaQjMpvtP/4GljHhHYRUPzpgcsEjY7YmzNKdXXG/O9PNbZGFvZ8Sa7oOF3GF8UQ
 h49pOOXN0DgMPmneBYdDFJVpoPP3pQU3a9PveJ/Jt93Lahs/MPugOrUsObrHqJji0Zu5Ufmwe
 pLOhyTlagzK8Q6IS3DsUEjCn/BxGt2vNV5NpdAQpkQuClEy+wx3qjGrvchpEAw1t/wQ3S/uuz
 GAq0vHkhnQ3v6ktYojbASumSCTL3vdwSyk30g3obeiDe/GAVOkwxr021tU4JS6fAn2M/VU3Pn
 54iZpfv/7zzcXDMRBoK92S6yG00h/KYU6yfze0jg+lRRdumCnd6ay6JnAAUGPQcCn2/G/0UzX
 GLhMBfwBf89JcAmZ1eCDNzsCQxG9S+fkSawk1iQa2FNcDhHaTdAm6MjqHU+UQC3OV9zJuXCKF
 WSfFORB7jie4oqeg1H7aIEG1X1mR5hVWoilz1LtfVNHycy/C5csPM0GwweVbXsfuTFhVC7IsE
 B6emVwMyOfvKIxZMddlLbtnl9j8W1O+Bd3PDAcwsir6EY=

Add a binding for the rc-mygica-utv3 keymap

Signed-off-by: Nils Rothaug <nils.rothaug@gmx.de>
=2D--
 Documentation/devicetree/bindings/media/rc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentati=
on/devicetree/bindings/media/rc.yaml
index 7bbe580c80f7..dedc5a4b81ec 100644
=2D-- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -103,6 +103,7 @@ properties:
       - rc-msi-digivox-iii
       - rc-msi-tvanywhere
       - rc-msi-tvanywhere-plus
+      - rc-mygica-utv3
       - rc-nebula
       - rc-nec-terratec-cinergy-xs
       - rc-norwood
=2D-
2.34.1


