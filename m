Return-Path: <linux-media+bounces-441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7146B7EE0A1
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 13:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00350B20B61
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 12:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3402FE12;
	Thu, 16 Nov 2023 12:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b="Nh3queC0"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04286187
	for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 04:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700137443; x=1700742243; i=ps.report@gmx.net;
	bh=Qjf4AH7yZ9mpz2xU3sHRLeOts1AisIajChvtpTw+Yxw=;
	h=X-UI-Sender-Class:From:To:Subject:Date;
	b=Nh3queC07R8a3On0/7FUH8J18mNugfYDSABaxM9NvmkhpgaQObPTqh8AeZ1YvE/z
	 VB7AEZsQUW8yuXZpORx655xjF1Ci6fkg1n+XH9suZkmer/GvhVnHBqr9JoLrSaZ7l
	 b5QGDbL7DipXhQ69ZD94DZVAzr5Y0x6XuZBW3J1cPHlecEZiUoIGafug/zCG9mVLi
	 VFFRB2T1q0I7j+mcim7cGSJlkN0GIDRWK2ryxeYK2lAFuBTlzx7SyI2PilOL/oSSY
	 QhTVr5RohML9Kt2tc/jwJIdy8DIfVz0D6yOzIraXTw/4MTnlAvqwVGNZJ6ZG90hwd
	 UiI0kyXi53hvb0UsYw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.247]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MmDEg-1rllqt1DEG-00iAZY for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023
 13:24:03 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1 1/4] qv4l2: remove unused local variables 'QString what'
Date: Thu, 16 Nov 2023 13:23:59 +0100
Message-ID: <20231116122402.28730-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:PjDGd1vRn9K5vNIunBNSVKcLUd4t3mjUCossa85S4+HSsUZQX0z
 +bbxEMz1aVq1pcwnTSaSRdH/jzuqxdzN5555KT2RYlUff4aJwaH9qIFW+0gRYTvHJemqcyH
 iP2a7AGodGQiyQcUeh8VfcmGhslXJRjcJT3BxThlWn3FdBiFLpSZe8R2cwNxvowJhgVTnns
 TYxo+NMxdKanUyNp9XEng==
UI-OutboundReport: notjunk:1;M01:P0:+w1IrL+1ZHc=;NDc6mqKAdrqSXVBdqkOMtfz3e9u
 d7GbqKyXFbTitxw5THQjRrbav8sEKmAtg+WPx8IyfThxo2pn+DdzMrZ8hOv58SDh7BnIKy63b
 XB5nzYHnzIe2LARCZA0COvfELnUDx1/Ai16vywSUNnXWMBHj6NM1+/16Vl607XyRKM6bz9hHW
 wO4v/me1CCWN3btE+kpaXHaAYW6V0KPAfC+kxSDRoLcK+B4aUNx7LKYCoOi0AtJ4t1IqdBsxR
 ooCrTaETJH2ZK7LYt4Nr5Qm0z5YxuMd+jd/ZmU0noACUR1rzfLuGrDnOkDpwSYzuuPXbrFjr3
 kEzMhfn+FmBu4EfafUWhYHFwgzd9nearckBKWy5HopETILwdvXvGhF4m9jXFvUbJiRun5HGLv
 4lnNXPUdy37RU2H2Em8O696f9xT8PxtTp/yeYGCl31D0Q3iWwjhkIZgXsBg5hS/CKBz4dAfAZ
 fQ2/I6j9CS2kjyCbzxr04XCs1iuwpyHFC2S0d8RNJRypdcDIOk2mRsz+fQNH0dV9O/3oTiu8z
 jP9aohJXWLd9SfNq6TP/GEEWIfYmQEAH+4qKTQPtl+xhtHBn6DGeUO35NAwRkocD8GBiGirl3
 AdxXqvGq39NkS0AP2BdqZCcjik5eroZa2T8kHqFWoQ70H3m7Pffaj2c8XNkIOZm7q6j0Ozlyk
 /1D6xoi0kkQ351Mr8l9npERvID12u3uXKEURyS7CRfyAT598/xPbWRxe2Mguu4BhlAzw6dFrN
 Uq8WzYDt2bkaE9nzJr6gqXCPSDnEiRXUPqWTgffaL0cu2yrCPcbvj8vyELYF05KYgt3Vh3/Os
 zul7ndDLEz79NmjoRJNXuH0iyOpFfbMh9IdWCPx65etz1MY7OGfqEyBUqRcdVQr1T3jBoIMnL
 QZCtomMOBJH1rRaZZ8SHu/XOSEMIDXbdIvUH8x4QsvB9maud86v7IUXf+ehdWFcHges+EdF6B
 P/k/phppnrHWdvm5nO43RUgNQDc=

U2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgotLS0KIHV0
aWxzL3F2NGwyL2N0cmwtdGFiLmNwcCB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3V0aWxzL3F2NGwyL2N0cmwtdGFiLmNwcCBiL3V0aWxzL3F2NGwy
L2N0cmwtdGFiLmNwcAppbmRleCBjZmRlY2RlYi4uZGNmMDE0YTggMTAwNjQ0Ci0tLSBhL3V0aWxz
L3F2NGwyL2N0cmwtdGFiLmNwcAorKysgYi91dGlscy9xdjRsMi9jdHJsLXRhYi5jcHAKQEAgLTcw
NCw3ICs3MDQsNiBAQCB2b2lkIEFwcGxpY2F0aW9uV2luZG93OjpyZWZyZXNoKCkKIHZvaWQgQXBw
bGljYXRpb25XaW5kb3c6OnNldFdoYXQoUVdpZGdldCAqdywgdW5zaWduZWQgaWQsIGNvbnN0IFFT
dHJpbmcgJnYpCiB7CiAJY29uc3QgdjRsMl9xdWVyeV9leHRfY3RybCAmcWVjID0gbV9jdHJsTWFw
W2lkXTsKLQlRU3RyaW5nIHdoYXQ7CiAJUVN0cmluZyBmbGFncyA9IGdldEN0cmxGbGFncyhxZWMu
ZmxhZ3MpOwogCiAJc3dpdGNoIChxZWMudHlwZSkgewpAQCAtNzI1LDcgKzcyNCw2IEBAIHZvaWQg
QXBwbGljYXRpb25XaW5kb3c6OnNldFdoYXQoUVdpZGdldCAqdywgdW5zaWduZWQgaWQsIGNvbnN0
IFFTdHJpbmcgJnYpCiB2b2lkIEFwcGxpY2F0aW9uV2luZG93OjpzZXRXaGF0KFFXaWRnZXQgKncs
IHVuc2lnbmVkIGlkLCBsb25nIGxvbmcgdikKIHsKIAljb25zdCB2NGwyX3F1ZXJ5X2V4dF9jdHJs
ICZxZWMgPSBtX2N0cmxNYXBbaWRdOwotCVFTdHJpbmcgd2hhdDsKIAlRU3RyaW5nIGZsYWdzID0g
Z2V0Q3RybEZsYWdzKHFlYy5mbGFncyk7CiAKIAlzd2l0Y2ggKHFlYy50eXBlKSB7Ci0tIAoyLjQy
LjEKCg==

