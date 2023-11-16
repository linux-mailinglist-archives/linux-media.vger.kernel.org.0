Return-Path: <linux-media+bounces-442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE45E7EE0A2
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 13:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B4AD1C2096C
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 12:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA4C2FE3D;
	Thu, 16 Nov 2023 12:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b="JPsMW8Q5"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D092193
	for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 04:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700137444; x=1700742244; i=ps.report@gmx.net;
	bh=PnIxuKgeZ9YAD8D137ZurXp6+J5Nee3xVALdUo8c9SU=;
	h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
	b=JPsMW8Q5bUjxhbsESDCf5GhL0SZF9SlLn/jY70T0NEj5O6xLEmsLctsxz3UjiX1h
	 gdCmgbFAIWnVKgZrB1xxyccocxiB/cioH4B6ILBYFwr/OHxgh6aI/mt1aOnNG5fst
	 8EflcZyt3i95Ft+Zi1FhGJB7V8QLRoypDoyMpMT7RTqsyxD6xe8J0G8peK4v/qXdT
	 nZf6mxPCNnB4m8amvA1DC4oPAgA2z9cyk575fgDgDSxA58d7IZdlzhMjpc3Fpf+el
	 VzJNfHjdihuPSUDWS+zNYsTOakHtBtTC6QRsF8oMPgG78c2Yj2Sknlcfot1JNHE/Y
	 D7GFkQxtCnAFUP6EkQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.247]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MG9gE-1r99Jv3de8-00GZ3o for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023
 13:24:03 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1 3/4] qvidcap: fix v4l2_convert_hook (add PRE_TARGETDEPS)
Date: Thu, 16 Nov 2023 13:24:01 +0100
Message-ID: <20231116122402.28730-3-ps.report@gmx.net>
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
X-Provags-ID: V03:K1:wnPVx5AtsrG/5RDNbITwygYqgXsIBfrigxnNR4bU0s1qyBTZdHZ
 5Zs9la3TegLRftzMogNEhtXLavSYpJ3Ly1tesFkSlQRhDtSnaN1NljvRPertAzciOc5Ka1+
 5PWPMtKlrYd029NEaEg5tKrqQd4W4Oq4BDqwP3gKrVnta13sRyU1LZG1j9VBvRBEpzBf7R/
 39VkW77w94xviuTocXeaA==
UI-OutboundReport: notjunk:1;M01:P0:bbETn8W+wNg=;baxnKPWL+k4bKhNPmbz4cUq7xtw
 AfGsC/Wp51AnZ+VlI6HeWmbTldEDIkWhB+Ld4D+u6Ol01d/IqVDZZgwo1+3JR9sdoOh5qo9MF
 /DbD5zOZaILKIqdbRkS/X0k3zR2FIwrFChk4z12pGpVxrDrt0b9l7d63cBGUOCQeu+l+PioqQ
 vQdacQL28TY1V2gQ+5en/ibsFpU9QnInbvTEjRKVTxoZBwNWBWc/aadBc/vYlU2f1W+bWAKNT
 msdEnfyE1p3g0adXaP9pEzZpsR1UoBhhBInEAQ49RTrC3dIcU8noSXZWpnWWmHYPJSZqdvbWj
 5lBuA6EOok5maCXzZ7Z+7zPEHvH7YA2CibJAQYjJZKSfJQuALoZe2dEf/FlGW842UsOhh8q/l
 Fb4nRm4qRLT343GjKoPiyXtS6ECMqK5/wgSUgZi2ZxS+i8DAzPMfbEX/tM0zNh9qQX42lZybV
 ZpT3XHnOvenPGtyF9AKy/KXhsiic427bCokRMT0uik8mJ+ajVTkYI8N6HpQko3c26t1Zk2s2H
 k4YEiUQfNbJkkPHhmvHzbNBUpDH9heR0NkBJVYsHX7hHLDjuVTHYprPR2ATvhLP9vtgR8csYs
 WU7hQOHzP/7ZQYQKM1fR19UwBscx3XGHS6FaC1joSUEIykBpPJ6QosDNgwCEuE/sCLTGe6BZL
 nyOLRsDw+MbrlDbwcQhlCLlHc9Zk/MySiohyf/AoqiAA4T4wsObUGr73u+oA7tuXbT5RiNvBD
 RS7cmZQHspubwe36xFqhecp9fhDAtMaCgpHfVXrzxl7dbknL2iYUhGG6mq5Q4FEIgRk+lyI6v
 kAzFUawmlSZqXyZvfri3IHqhoHVFJvE3F6ZSzHa9Iuy9hNyBE/L4ETJus7dSICsfcbZfKL+ax
 j8OjYiq33sP5I/uv+Azrwa8gmQxDspRBquxHbCxTcu6wFcKYAKvmSMzNT4Vm+e5LlYFvjfIF5
 HUPAiDNVh2s3uWYn/RJ0z8cs2iU=

Rm9yY2UgZWFybHkgdjRsMi1jb252ZXJ0LmggY3JlYXRpb24gYnkgYWRkaW5nIHRoZSB2NGwyX2Nv
bnZlcnRfaG9vayB0bwpQUkVfVEFSR0VUREVQUy4KCkZpeGVzOgoKICAuLi9xdmlkY2FwL3BhaW50
LmNwcDozMTg6MTA6IGZhdGFsIGVycm9yOiB2NGwyLWNvbnZlcnQuaDogTm8gc3VjaCBmaWxlIG9y
IGRpcmVjdG9yeQogIDMxOCB8ICNpbmNsdWRlICJ2NGwyLWNvbnZlcnQuaCIKClNpZ25lZC1vZmYt
Ynk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KLS0tCiB1dGlscy9xdmlkY2Fw
L3F2aWRjYXAucHJvIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYg
LS1naXQgYS91dGlscy9xdmlkY2FwL3F2aWRjYXAucHJvIGIvdXRpbHMvcXZpZGNhcC9xdmlkY2Fw
LnBybwppbmRleCBkYjk0ODYxMS4uY2Y3ZDNjYTUgMTAwNjQ0Ci0tLSBhL3V0aWxzL3F2aWRjYXAv
cXZpZGNhcC5wcm8KKysrIGIvdXRpbHMvcXZpZGNhcC9xdmlkY2FwLnBybwpAQCAtMjUsNiArMjUs
NyBAQCBJTkNMVURFUEFUSCArPSAkJFBXRC8uLi92NGwyLWNvbXBsaWFuY2UKIHY0bDJfY29udmVy
dF9ob29rLmRlcGVuZHMgPSAkJFBXRC92NGwyLWNvbnZlcnQucGwgJCRQV0QvdjRsMi1jb252ZXJ0
Lmdsc2wKIHY0bDJfY29udmVydF9ob29rLmNvbW1hbmRzID0gcGVybCAkJFBXRC92NGwyLWNvbnZl
cnQucGwgPCAkJFBXRC92NGwyLWNvbnZlcnQuZ2xzbCA+IHY0bDItY29udmVydC5oCiBRTUFLRV9F
WFRSQV9UQVJHRVRTICs9IHY0bDJfY29udmVydF9ob29rCitQUkVfVEFSR0VUREVQUyArPSB2NGwy
X2NvbnZlcnRfaG9vawogCiAjIElucHV0CiBIRUFERVJTICs9IGNhcHR1cmUuaAotLSAKMi40Mi4x
Cgo=

