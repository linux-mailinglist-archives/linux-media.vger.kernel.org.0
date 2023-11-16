Return-Path: <linux-media+bounces-443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C17EE0A3
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 13:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B327BB20B95
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 12:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CF52FE3E;
	Thu, 16 Nov 2023 12:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b="ozz/vbdW"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2211196
	for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 04:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700137444; x=1700742244; i=ps.report@gmx.net;
	bh=4WQ+82j6OnH9eYND+COVeQ/JfA5i474Qv5XrvgjTx5w=;
	h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
	b=ozz/vbdWtYcW8cEimiv98OWg7E5OkVKXpu6fAowU23vMEHIrZTEVbOQ1aeItV07y
	 PhGrCvoqnsDCZgJNgbgNZHU3gPzs7X6ImdIJ6Zm5ZljnuR+SeOszWEB8p/GZ2j6ON
	 kROO4LCjARTdzABLXiPVb+3w/IliJNlnYlEMnHKlqVjtaapgnwmoZSoAz/00vFecY
	 SLKt1S3SRqkzMAmA4JiDBNfJJBWbp0LIejBmPYP683k467XfSS1UFZ3ZNHgK6rXGj
	 Eiu2OtB3g88OiSCFhi2VA4ScRF8kmgbx/V0rJu+mmbIvDAUxMQPYrZlQSHzHHeSCW
	 uo45Fo/XU19gvtJPAg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.247]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MTRMs-1qw09A059g-00ToaG for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023
 13:24:04 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1 4/4] qvidcap: enable Qt6 compile with Qt OpenGL support
Date: Thu, 16 Nov 2023 13:24:02 +0100
Message-ID: <20231116122402.28730-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116122402.28730-1-ps.report@gmx.net>
References: <20231116122402.28730-1-ps.report@gmx.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:9Xz8RDgQZdfW6i4ohOI24dgXDrPg+52KUMbtW20p1ZHY4xxjs+S
 EL2vZQ8N5/0SM90WDbnYWVy5sKsRdg0tFhn4ka+H57yV7DzlL1RN4pO20LJhnwk4VJhKXPj
 K08br99/xngttVzYmPnVpZiAvMOATsOzwuJRDsP9s6Ke79OpEnLEBPH8mMyD6NM2gZ4jNkC
 zTA3Cx4Bl6nL7AyztwByg==
UI-OutboundReport: notjunk:1;M01:P0:YVla5nER0QA=;m5jrd5NDniREOWDViz3kfGZBjvt
 VcF+8qc5DDclcQ7XXsTcJ23VOycebE90aSQwOBsDEs2B5uVl8NfDDcNoi611Mi2aXnv6gb0B9
 Ez+EdIae78QWrPxDj6jXs9Ycw4eodrp/RdiCJ6/ub7NE2TDApObTh2f/zRvUVDOIHeMLP8Aoi
 RJzmkkVoOuARBBO2IczTSyhVJOZnbzajLq3nerM7w8xjTWaUVTACXO6JdBdQXPb5CaBe77vyO
 9Cc4oHWFWbLDRUs9uhqZ7vSbFCqcl0epYJIkrqffSMixBbRI0Agr8pSTHUPX1BhQmQPJA/JYA
 PkN0xxEcQU8ZOvbv/XOpeav3VG0mXk5AYaty6ikYfIjlScmIA6jYqF5dJwXSF3BQ6PVuXUUaZ
 2cdaiXgxlSIXA5DxCkjcrsryFFVhQ9cMNegWyqr0BdrT8ptEQReiNFjfpi5af3nMl4ugMAHSo
 zo4QNJmtdToVX6uN8aGi9Dy3YQMngzUPgDLZZq9xssxCecn9yu9fnu4crcXfm5rQeZ7KiP5Tq
 Tw+aqIxMsU4LZCvbdfZZRtnKXntVl+R4hg3KjDJbkKRiqzMI6ThjDrRS3M4eD5CC9S/748Ijb
 Em4PkbJt2BuyQKFd3UO7nvUYDyidXcfX5RL9Gor+oOP92TKyHe0S4Pl6zAelP9bnVg2+yoFGW
 HHqvUeMb4wdFyLslkCoNU3v6dWkbC6BLjKyfUWgl9VZwpJOgYPB7lUx68gPPjz5CRyYxedeVw
 Iu5NboaruBm9XU74rXW7jQgtPf7E2mTqUuPI6UwKe4Ha7zoImum4pnOqsN1P4v7+70/w1y3Fm
 ege2d1D2L7tkhkjfN7loY/f0LvFmAtKLPRSu0aj5R2/W4HyPiv5PhsHpboLcPyiO7WaxLgPGQ
 ojc+zSyfnOjwyKs00nMEXYRFCBLb1c3QSxiISq4+4JJtVTRIDSfhyoelc8JC7/88W3i37pAv3
 epLlNA==

LSB1cGRhdGUgcW1ha2UgcHJvamVjdCBmaWxlIGZvciBRdDYgKG9wZW5nbHdpZGdldHMpCi0gZml4
IGluY2x1ZGVzIGZvciBRdDYgKFFPcGVuR0xTaGFkZXJQcm9ncmFtIGluc3RlYWQgb2YKICBRdEd1
aS9RT3BlbkdMU2hhZGVyUHJvZ3JhbSBhbmQgIFFPcGVuR0xQYWludERldmljZSBpbnN0ZWFkCiAg
b2YgUXRHdWkvUU9wZW5HTFBhaW50RGV2aWNlKQoKU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVy
ZXIgPHBzLnJlcG9ydEBnbXgubmV0PgotLS0KIHV0aWxzL3F2aWRjYXAvY2FwdHVyZS5jcHAgfCA0
ICsrKysKIHV0aWxzL3F2aWRjYXAvY2FwdHVyZS5oICAgfCA0ICsrKysKIHV0aWxzL3F2aWRjYXAv
cGFpbnQuY3BwICAgfCA0ICsrKysKIHV0aWxzL3F2aWRjYXAvcXZpZGNhcC5wcm8gfCAxICsKIDQg
ZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3V0aWxzL3F2aWRj
YXAvY2FwdHVyZS5jcHAgYi91dGlscy9xdmlkY2FwL2NhcHR1cmUuY3BwCmluZGV4IDBiNGM0MTE1
Li4xZTM1OTdiMCAxMDA2NDQKLS0tIGEvdXRpbHMvcXZpZGNhcC9jYXB0dXJlLmNwcAorKysgYi91
dGlscy9xdmlkY2FwL2NhcHR1cmUuY3BwCkBAIC0xMyw3ICsxMywxMSBAQAogI2luY2x1ZGUgPFF0
Q29yZS9RVGV4dFN0cmVhbT4KICNpbmNsdWRlIDxRdENvcmUvUUNvcmVBcHBsaWNhdGlvbj4KICNp
bmNsdWRlIDxRdEd1aS9RT3BlbkdMQ29udGV4dD4KKyNpZiBRVF9WRVJTSU9OIDwgMHgwNjAwMDAK
ICNpbmNsdWRlIDxRdEd1aS9RT3BlbkdMUGFpbnREZXZpY2U+CisjZWxzZQorI2luY2x1ZGUgPFFP
cGVuR0xQYWludERldmljZT4KKyNlbmRpZgogI2luY2x1ZGUgPFF0R3VpL1FDb250ZXh0TWVudUV2
ZW50PgogI2luY2x1ZGUgPFF0R3VpL1FLZXlFdmVudD4KICNpbmNsdWRlIDxRdEd1aS9RUGFpbnRl
cj4KZGlmZiAtLWdpdCBhL3V0aWxzL3F2aWRjYXAvY2FwdHVyZS5oIGIvdXRpbHMvcXZpZGNhcC9j
YXB0dXJlLmgKaW5kZXggMzdmNWJmYzUuLjhlYmU3NmE5IDEwMDY0NAotLS0gYS91dGlscy9xdmlk
Y2FwL2NhcHR1cmUuaAorKysgYi91dGlscy9xdmlkY2FwL2NhcHR1cmUuaApAQCAtMTYsNyArMTYs
MTEgQEAKICNpbmNsdWRlIDxRQWN0aW9uPgogI2luY2x1ZGUgPFFBY3Rpb25Hcm91cD4KICNpbmNs
dWRlIDxRU2Nyb2xsQXJlYT4KKyNpZiBRVF9WRVJTSU9OIDwgMHgwNjAwMDAKICNpbmNsdWRlIDxR
dEd1aS9RT3BlbkdMU2hhZGVyUHJvZ3JhbT4KKyNlbHNlCisjaW5jbHVkZSA8UU9wZW5HTFNoYWRl
clByb2dyYW0+CisjZW5kaWYKIAogI2luY2x1ZGUgInF2aWRjYXAuaCIKIApkaWZmIC0tZ2l0IGEv
dXRpbHMvcXZpZGNhcC9wYWludC5jcHAgYi91dGlscy9xdmlkY2FwL3BhaW50LmNwcAppbmRleCBj
NWFhZGIwOS4uMDI0NmRlNjAgMTAwNjQ0Ci0tLSBhL3V0aWxzL3F2aWRjYXAvcGFpbnQuY3BwCisr
KyBiL3V0aWxzL3F2aWRjYXAvcGFpbnQuY3BwCkBAIC0xMyw3ICsxMywxMSBAQAogI2luY2x1ZGUg
PFF0Q29yZS9RVGV4dFN0cmVhbT4KICNpbmNsdWRlIDxRdENvcmUvUUNvcmVBcHBsaWNhdGlvbj4K
ICNpbmNsdWRlIDxRdEd1aS9RT3BlbkdMQ29udGV4dD4KKyNpZiBRVF9WRVJTSU9OIDwgMHgwNjAw
MDAKICNpbmNsdWRlIDxRdEd1aS9RT3BlbkdMUGFpbnREZXZpY2U+CisjZWxzZQorI2luY2x1ZGUg
PFFPcGVuR0xQYWludERldmljZT4KKyNlbmRpZgogI2luY2x1ZGUgPFF0R3VpL1FDb250ZXh0TWVu
dUV2ZW50PgogI2luY2x1ZGUgPFF0R3VpL1FLZXlFdmVudD4KICNpbmNsdWRlIDxRdEd1aS9RUGFp
bnRlcj4KZGlmZiAtLWdpdCBhL3V0aWxzL3F2aWRjYXAvcXZpZGNhcC5wcm8gYi91dGlscy9xdmlk
Y2FwL3F2aWRjYXAucHJvCmluZGV4IGNmN2QzY2E1Li5kMDhmMDA1OSAxMDA2NDQKLS0tIGEvdXRp
bHMvcXZpZGNhcC9xdmlkY2FwLnBybworKysgYi91dGlscy9xdmlkY2FwL3F2aWRjYXAucHJvCkBA
IC03LDYgKzcsNyBAQCBJTkNMVURFUEFUSCArPSAuIC4uL2xpYnY0bDJ1dGlsIC4uLy4uL2xpYi9p
bmNsdWRlIC4uLy4uL2luY2x1ZGUKIENPTkZJRyArPSBkZWJ1ZwogCiBncmVhdGVyVGhhbihRVF9N
QUpPUl9WRVJTSU9OLCA0KTogUVQgKz0gd2lkZ2V0cworZ3JlYXRlclRoYW4oUVRfTUFKT1JfVkVS
U0lPTiwgNSk6IFFUICs9IG9wZW5nbHdpZGdldHMKIAogIyBhZGp1c3QgdG8geW91ciBsb2NhbCBt
ZXNvbiBidWlsZCBwYXRoCiBNRVNPTl9CVUlMRF9QQVRIID0gJCRQV0QvYnVpbGQtbWVzb24KLS0g
CjIuNDIuMQoK

