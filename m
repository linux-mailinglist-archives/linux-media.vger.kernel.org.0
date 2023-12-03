Return-Path: <linux-media+bounces-1507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B638023EE
	for <lists+linux-media@lfdr.de>; Sun,  3 Dec 2023 13:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E24FB20AFA
	for <lists+linux-media@lfdr.de>; Sun,  3 Dec 2023 12:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72FBAE555;
	Sun,  3 Dec 2023 12:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b="tf82c8mD"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AACB2FC
	for <linux-media@vger.kernel.org>; Sun,  3 Dec 2023 04:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701608172; x=1702212972; i=ps.report@gmx.net;
	bh=phYltxpOafOsAodpRPG/7Zfg4A38u1if+bY8GQ0daPw=;
	h=X-UI-Sender-Class:From:To:Subject:Date;
	b=tf82c8mDXj9o2mNiMpJatjE44K4n5sh0ZYVsF3pa6PDfcjoYhQshlk43zHjfgfFE
	 qCG3yCRywaXehRc/ZMujnGh3RW2CJOIQbrqyqilLt6bqlf/mZJBFQd5+94+kPIAUi
	 fZtjG06r/vsKQ8Yi2bNErVUzmqwX6IbJW7yZ3IJ2dzyLfKvGE86KRNr4DQmdAkMpM
	 3psba3J518PLKnX3+6kW3FpdD21CeD9teXr4dJRqRV0ar9f3WB3Du/ir9iFNO/WUw
	 QKPK1d7fvwXG6erefx096II01rD89QNbSiByBDqXoedkbJFG7NMuxcBNO7uzO3x0q
	 RRjSXUiEPhnTHYvaEQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.34]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5GE1-1rHmq93XpV-0116rS for
 <linux-media@vger.kernel.org>; Sun, 03 Dec 2023 13:56:12 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1] media-info: add missing sys/stat.h include (for dev_t)
Date: Sun,  3 Dec 2023 13:56:12 +0100
Message-ID: <20231203125612.31945-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:gOd+zdX1z4LOarEg7EHKXVgViMbPnqQ28peGKWDCMOe5Daa/KmL
 3IF0/d/NezaAEDxSn+XBYyM3Q8JnZAA+ecyoxFFbHlOTIS/2X+FY+jjb6yPJdf15ycsGc44
 jIzNcQp4bwqwLxRLHK6hz47NN4wLANsZHCODrM/2BVx3G3Lf/rpUIlFLlKR61aXjNzCQRbV
 UyEAFlDSqkC5r1OyFgWxg==
UI-OutboundReport: notjunk:1;M01:P0:0GSaGGSiT7I=;WgfzoZ9/oYxuYHa27jHJ8iAa3M6
 q0kbymv3BeCSb8c+r63sjG20RJtqBWECIQhhCz7x/yCVpbNjBXpJ9DCzR5iY5RbVxW3wvzOUb
 2QzQAlaOi2BGZnv3eyoWC7QrX58h5peHxsDG7GLFfvlyujeR6KUQetIokqGwH4puV1ZArkEto
 m31k6FZXDK7dU3RVIKQ64K8Ys4t3Ge+zAW57lwxwIevyST5qP3n7VmJ4aXzNdYZuiUJ8Cg+aF
 wsymf7zMDkzvwoZgzKSlQZdRAciv9CtdZ1N1tAxB+sX2dchtYy7bbPyFDIF4YS9TqToI8vmdb
 4ldY+SsygMI64IDm+y+gvNHNweQz8KfqrP60gwmmbontryMBw/5SI/C78ohvXSEgZje2OQIbS
 7wdWGAR58WIDLAQxtCd4UnCLYvPrOTtf/LRKQRsCzh3nk83z05if2dyM9FNEvi/WV/muUs7Zi
 U60f7XdXzKfGdlWNgRtZJEpHgWEcwscvmdxKT99ci3B9qLy9VkrpGUJHKF/dt4Svum2+Bda8a
 nWuQj34QtNMKJ+91SnZa5ka1qBIzCgLexTp3gQe9sSV+ofGZxNTqxR3GmYLHYYeVefDA7Iq1b
 wf5R7Jpw5byxacgbBHvh3RvIQKlOoIk7HxvLdKQByEjCygk+umXelOwhQMc0iV8tGNMj/EP77
 heEPsGhtE8n6poJoyd94045ADSadkbG2lhdd6CfxVwcazCJQBO0TGOARk0tQtEMvY0qStziTp
 4HCxtsDGRjuidbx82gXKV0oWLRFv0wHknrId+yXwAnfW+wkWH+qGvpCh0xFRavssfNCFL8FE2
 YwUi+LyAhIs79O477WUwGQ06AfjIw5fTzbVIl3jhW5Ef4mokEb14s57RmyOVDrzQ0d7dz6uZJ
 6AJIpIk2GK74yb1TMw/PwsXQcxrhsszxTxPqtkuqTZEHxGaZ27n1PwATVRZXucX81XVTjVulK
 PmSZxtv5l7JlabkFFg1JMAMHbCU=

Rml4ZXMgbXVzbCBsaWJjIGNvbXBpbGUgZmFpbHVyZToKCiAgSW4gZmlsZSBpbmNsdWRlZCBmcm9t
IC4uL3V0aWxzL3Y0bDItdHJhY2VyL3Y0bDItdHJhY2VyLWNvbW1vbi5oOjExLAogICAgICAgICAg
ICAgICAgICAgZnJvbSAuLi91dGlscy92NGwyLXRyYWNlci90cmFjZS5oOjksCiAgICAgICAgICAg
ICAgICAgICBmcm9tIC4uL3V0aWxzL3Y0bDItdHJhY2VyL3RyYWNlLWhlbHBlci5jcHA6NjoKICAu
Li91dGlscy9jb21tb24vbWVkaWEtaW5mby5oOjQwOjM0OiBlcnJvcjog4oCYZGV2X3TigJkgaGFz
IG5vdCBiZWVuIGRlY2xhcmVkCiAgICAgNDAgfCBpbnQgbWlfZ2V0X2Rldl90X2Zyb21fZmQoaW50
IGZkLCBkZXZfdCAqZGV2KTsKICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+CiAgLi4vdXRpbHMvY29tbW9uL21lZGlhLWluZm8uaDo0ODozOTogZXJyb3I6IOKA
mGRldl904oCZIHdhcyBub3QgZGVjbGFyZWQgaW4gdGhpcyBzY29wZTsgZGlkIHlvdSBtZWFuIOKA
mGRpdl904oCZPwogICAgIDQ4IHwgc3RkOjpzdHJpbmcgbWlfZ2V0X2RldnBhdGhfZnJvbV9kZXZf
dChkZXZfdCBkZXYpOwogICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBefn5+fgogICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBkaXZfdAoKU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0
PgotLS0KIHV0aWxzL2NvbW1vbi9tZWRpYS1pbmZvLmggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdXRpbHMvY29tbW9uL21lZGlhLWluZm8uaCBi
L3V0aWxzL2NvbW1vbi9tZWRpYS1pbmZvLmgKaW5kZXggYTg2MmI3MGIuLmMwZGQ2MzA0IDEwMDY0
NAotLS0gYS91dGlscy9jb21tb24vbWVkaWEtaW5mby5oCisrKyBiL3V0aWxzL2NvbW1vbi9tZWRp
YS1pbmZvLmgKQEAgLTYsNiArNiw4IEBACiAjaWZuZGVmIF9NRURJQV9JTkZPX0gKICNkZWZpbmUg
X01FRElBX0lORk9fSAogCisjaW5jbHVkZSA8c3lzL3N0YXQuaD4KKwogZW51bSBtZWRpYV90eXBl
IHsKIAlNRURJQV9UWVBFX0NBTlRfU1RBVCwKIAlNRURJQV9UWVBFX1VOS05PV04sCi0tIAoyLjQz
LjAKCg==

