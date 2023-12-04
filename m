Return-Path: <linux-media+bounces-1528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD37802DF1
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 10:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6ADD1F21122
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 09:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C281312E70;
	Mon,  4 Dec 2023 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b="lxDYBfuo"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF84BCD
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 01:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701681101; x=1702285901; i=ps.report@gmx.net;
	bh=6MdaBM6FTXM/uKwm6B0rZvxYs+PwzqLO7HhYo30Pw00=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=lxDYBfuoNYW3ujwbmQpZyFurvo1i+DM00HkW3NHefxORU6h976y1rivqzxXv+vg1
	 aWSTBhD66HKBlzOUH7KxdVOxSke92/hRQw8wYSlyyt39Hio9vhuO10JBjYFDQ/khS
	 FyGe0i2LRnKx5ZTWhqPEma1DUl5xKcmP34BYms0Rk7QfC2oaC1We5zYt9za+STwi3
	 Bhbge6h+/0tjU2abCwfsGVYZCpVGDfAgY1XZ+Fm2YOAVfpeB6aNLqzuLIKkoSKYFM
	 C6tttADoCeSRX4vEztDYYmhMnG6UZjxqeo0hGslhKcgz8p2WvrG1hu5f2Ew2oGZmG
	 feSQY8fmNXd10ZInUw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.4]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M59GA-1r8yWf07C0-001BDD; Mon, 04
 Dec 2023 10:11:41 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: linux-media@vger.kernel.org
Cc: Peter Seiderer <ps.report@gmx.net>
Subject: [PATCH v4l-utils v1 1/2] meson: fix has_function fork detection (needs suitable include)
Date: Mon,  4 Dec 2023 10:11:33 +0100
Message-ID: <20231204091134.28481-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:o9UbxOuIOG+oU0iS8G03TH6U6twlB2GaExQ8DEte4ZCvTh9m/cT
 wswz9DRBIjZwTvnLf+U/NKH6uizfwLd9f4c12jUgcqH24+xApj5VFEa1rddW3+RXdXQqV8V
 RKXuxL2OdZC9qrsjQXJIJxHAa9pqJFGbl1SMvv9cOYawESVUuySX81btwLf8Q+Fo1toVYe/
 g99LSGeFPmyyS8D9jkLaQ==
UI-OutboundReport: notjunk:1;M01:P0:+WsZ58SuuKA=;syXuxZtRgCgkjw0r5vlwsM7286V
 ZqCtEDKY4S2ijXrV32L/h4zUb9c6tiX2LqM4srQsQD2QnkX1u911zyovT3Q/9FAd2ciKzTEb3
 iw+Lb/G6KbhZ19x94lPxPKMggmL9P2OQRLtaoOskZ9f6O1r7nZ0wLF5sueQS3eETxuh8Kzdsq
 R4ricgSqklYGD8wmQlu3pcJLZcVBcU4dB17H711ePc9SY1xnOHKg48MORqaHY9UepfvRVaoyt
 iSzikT0JU/26TfJdLb5A6f1ciOFc/+AT0hNLpTFLubDv/9pMe7z/rZZNTpRM/TF1gfwu9QHaE
 XYF/+sdITrpJ7WbBT2Iz0wKEPGQd4vbifq0wTv4IOEm0+PL7hpeoRhiDaIkQImEpXLALb8EpY
 DilyLD4f9RNAqAdZ2ux/9uAG60/NxnnVzLK7LpOhsob0rx/1F7wK+HY5nWgTuEbsnI1jiDjyr
 LVqesg7wPavRwBO89ue44NLYjuOniI7RSU24OzAIZv0CBavfFYyw6NLGZ7IPo3JJX0jyhsN5x
 b890MkRj+GZ4nLXcHUvIykJI9sgSiy1r1VujUYX/ZILRYqx/plhMks6nsOdrH4va/E1s3ZvOm
 +kSPmAYA/1GYXVPPGL7hCtOs4YX8xJpvdimye3TPBXUxKEPKOSmd2ftLyPvnUUHm3+mI27n9Z
 q4zIwm4gzXgoXX+uq/z/CYs2osjm3yUzLyK6k7MnhXXKoIpy7Lund5fBPHtR1+IMG4+XdpusV
 bIquMjEuhEwTZYzrij8ganRrJ3T5sNC3gAYV+LToiIRlmzfPHjXgOVCavsEhLG+3kJMjfK/JO
 a6TfJascdM4FbYb4rjpcaENhI/kmFDqPdq6XbvO7FbTUerU+YtfErd4F6tLaPcjEMzK2vEsfk
 w7kJPWfg/Nl/34F0bVwZES0FsX/6ALKp9WbsSfo/pWTtdIgIQJK4s8m19b8j9yyRGmua61ErR
 L2cNXO65nYykINoYx1UZK+vgTYc=

LSBmaXggbWVzb24gaGFzX2Z1bmN0aW9uKCdmb3JrJykgZGV0ZWN0aW9uLCBuZWVkcyBzdWl0YWJs
ZSBpbmNsdWRlIHRvIGF2b2lkCiAgZmFsc2UgcG9zaXRpdmUgKHNlZSBbMV0gZm9yIGRldGFpbHMp
CgpGaXhlczoKCiAgLi4uL2Jvb3RsaW4tYXJtdjdtLXVjbGliYy9ob3N0L29wdC9leHQtdG9vbGNo
YWluL2FybS1idWlsZHJvb3QtdWNsaW51eC11Y2xpYmNnbnVlYWJpL2Jpbi9sZC5yZWFsOiBsaWIv
bGlidjRsY29udmVydC9saWJ2NGxjb252ZXJ0LmEoaGVscGVyLmMubyk6IGluIGZ1bmN0aW9uIGB2
NGxjb252ZXJ0X2hlbHBlcl9kZWNvbXByZXNzJzoKICBoZWxwZXIuYzooLnRleHQrMHgxNGUpOiB1
bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBmb3JrJwogIGNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJu
ZWQgMSBleGl0IHN0YXR1cwoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9tZXNvbmJ1aWxkL21lc29u
L2lzc3Vlcy83NjUyCgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdt
eC5uZXQ+Ci0tLQogbWVzb24uYnVpbGQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1
aWxkCmluZGV4IGI0MDE4YzgyLi4wMzUwOGJjOCAxMDA2NDQKLS0tIGEvbWVzb24uYnVpbGQKKysr
IGIvbWVzb24uYnVpbGQKQEAgLTEyOCw3ICsxMjgsNyBAQCBkZXBfdGhyZWFkcyA9IGRlcGVuZGVu
Y3koJ3RocmVhZHMnKQogZGVwX3gxMSA9IGRlcGVuZGVuY3koJ3gxMScsIHJlcXVpcmVkIDogZmFs
c2UpCiBkZXBfeG1scnBjID0gZGVwZW5kZW5jeSgneG1scnBjJywgcmVxdWlyZWQgOiBmYWxzZSkK
IAotaGF2ZV9mb3JrID0gY2MuaGFzX2Z1bmN0aW9uKCdmb3JrJykKK2hhdmVfZm9yayA9IGNjLmhh
c19mdW5jdGlvbignZm9yaycsIHByZWZpeDogJyNpbmNsdWRlIDx1bmlzdGQuaD4nKQogaGF2ZV9p
MmNfZGV2ID0gY2MuaGFzX2hlYWRlcignbGludXgvaTJjLWRldi5oJykKIAogaWYgaGF2ZV92aXNp
YmlsaXR5Ci0tIAoyLjQzLjAKCg==

