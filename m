Return-Path: <linux-media+bounces-35547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 711AEAE30C5
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 18:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A7AB188425F
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 16:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7271F239B;
	Sun, 22 Jun 2025 16:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=yarny@public-files.de header.b="j4WfLjro"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCC3A94A
	for <linux-media@vger.kernel.org>; Sun, 22 Jun 2025 16:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750609705; cv=none; b=cNlEqgKpj2yl9/TGL+nV/FveKfipQjXqQyLWepbXe71MxuTVKgGzebuDivN2km3aPedCEHiDtbWyMJYPJ1EbQ9YBk3s3UBKjWA+V5ZhQwVpZKaLNDO8PfC+qcs5awitwnnjfNoXUeYxuzQnZgs3SgIPArjUrrwZMTDmrbXSL0dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750609705; c=relaxed/simple;
	bh=pFZdSVKLgmxCkboXggFJ1H63xGkGiWN6K9vf3L2xRa4=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:From:To:
	 References:In-Reply-To; b=bYeqwnvFlZna+xkktVZjkNv30yazZ7MHuwczuTHPlGzhtgp25fI+Wu/HoQyr3SxDb6QpVf+cWIt31iWcVKQ2NwtzXk9nKqc35jfdJGY1C1kTlk0777O+hS5xcDKRt56wpocV8eghSCjpnRAA/fP1/n6G1Ij4Deh3ejI9xzOof8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=yarny@public-files.de header.b=j4WfLjro; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1750609700; x=1751214500; i=yarny@public-files.de;
	bh=pFZdSVKLgmxCkboXggFJ1H63xGkGiWN6K9vf3L2xRa4=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
	 Subject:From:To:References:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=j4WfLjro+TIPJCV/dm+Qy/8/isoR+gLyDpa13WrKlZznsPyKlVnuOknbZpS+n53f
	 dXqKN1S/n0Hn0dwEhGBXnVVfxF+z6hz72BTO92xQd8QhXh/XxMdiNkXNeSnkgQkKi
	 4gjS7UP75e6U9U/tZxf5+evbOmvXPh0ypDJpCstU795r1zCalYTxRhfy1vG8v32Mm
	 QN3LMtE6UspPpxLkaKgJqix3wszzUa6Ngrde2qPjMukO70RvAn/C1dfWB+lmC45B2
	 GWbkDUYLlSbM7Y2CWlApWiRABfHpmHk5/9ueBxMCCmOpajaAfugrjfjJRRiqJqaY+
	 sEZhY/kylq8B3psXwg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([146.52.47.213]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ma20k-1uHKLI1g3Q-00Yx0K; Sun, 22
 Jun 2025 18:28:20 +0200
Content-Type: multipart/mixed; boundary="------------rHa0QTlYFfFFgHfn5YX3Yeos"
Message-ID: <7d4c2db4-82e6-4a23-a96a-b5ca433675fd@public-files.de>
Date: Sun, 22 Jun 2025 16:28:00 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4l-utils] meson.build: use `localedir` for `LOCALEDIR` /
 fix meson target directories
From: Yarny <Yarny@public-files.de>
To: linux-media@vger.kernel.org
References: <867c4d2e-7871-4280-8c89-d4b654597f32@public-files.de>
Content-Language: de-DE, en-US
In-Reply-To: <867c4d2e-7871-4280-8c89-d4b654597f32@public-files.de>
X-Provags-ID: V03:K1:pA7xX867I7uI02yHf+AmnrC50OwN95a7BiTe/qe0coPcLJRBjgP
 ULdpj/dM2/CuhmwEJRRAP3ne+ZrLU+I2VarvDNdgCiTQrXv/zyHYwNGCzeeRD4erTieZg7/
 VendEglMY9BQestbRpceKEWKWdUQdJIYpczbwAx709rlgl3Ljhf39sZQLJyyN9tVlrpOmnd
 lF8wSr+WamlQEKvWh4fLw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XpNzUWtFGOE=;fYHXP+JENJYC7Z0tuWFUE2QtSy+
 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
 ehzEla/

This is a multi-part message in MIME format.
--------------rHa0QTlYFfFFgHfn5YX3Yeos
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi linux-media again,

inspired by

https://lore.kernel.org/linux-media/20250606095754.1013225b@foz.lan/

I'm sending the first patch again,
as patchwork apparently only caught the second one:

https://patchwork.linuxtv.org/project/linux-media/list/?series=3D16195

Apologies if this is the wrong approach.

Best regards -- Yarny



Am So 22 Jun 2025 um 17:35:00 schrieb Yarny:
> Hi linux-media,
>=20
> please find attached two patches for current v4l-utils
> master branch that fix packaging errors with meson.
> I stumbled over those bugs while I tried to package
> v4l-utils within the NixOS linux distribution.
>=20
> Thanks and best regards -- Yarny

--------------rHa0QTlYFfFFgHfn5YX3Yeos
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-meson.build-use-localedir-for-LOCALEDIR.patch"
Content-Disposition: attachment;
 filename="0001-meson.build-use-localedir-for-LOCALEDIR.patch"
Content-Transfer-Encoding: base64

RnJvbSBhZDQyY2VjNWFiZTg2MzUwYjM5Mjc2NzZkY2I3YjBhOGYxNTMyOGE3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBZYXJueTAgPFlhcm55QHB1YmxpYy1maWxlcy5kZT4K
RGF0ZTogRnJpLCAyMCBKdW4gMjAyNSAyMDoyMTo0NiArMDIwMApTdWJqZWN0OiBbUEFUQ0gg
djRsLXV0aWxzIDEvMl0gbWVzb24uYnVpbGQ6IHVzZSBgbG9jYWxlZGlyYCBmb3IgYExPQ0FM
RURJUmAKCk1lc29uIGtub3dzIGFib3V0IHRoZSBvcHRpb24gYGxvY2FsZWRpcmAuCgpodHRw
czovL21lc29uYnVpbGQuY29tL0J1aWx0aW4tb3B0aW9ucy5odG1sCgpXZSBzaG91bGQgdXNl
IGl0IGZvciBsb2NhbGUgZmlsZXMgc28gdGhleSBlbmQgdXAgaW4gdGhlIHByb3BlcgpwYWNr
YWdlIHdoZW4gdGhlIGJ1aWxkIG91dHB1dHMgYXJlIHNwbGl0IGludG8gc2VwYXJhdGUgcGFj
a2FnZXMuCi0tLQogbWVzb24uYnVpbGQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21l
c29uLmJ1aWxkCmluZGV4IDg4NzgxZTU5Li45MTlkNGI5OSAxMDA2NDQKLS0tIGEvbWVzb24u
YnVpbGQKKysrIGIvbWVzb24uYnVpbGQKQEAgLTE3Nyw3ICsxNzcsNyBAQCBpZiBjYy5oYXNf
ZnVuY3Rpb24oJ3N0cmVycm9ybmFtZV9ucCcpCiAgICAgY29uZi5zZXQoJ0hBVkVfU1RSRVJS
T1JOQU1FX05QJywgMSkKIGVuZGlmCiAKLWNvbmYuc2V0X3F1b3RlZCgnTE9DQUxFRElSJywg
Z2V0X29wdGlvbigncHJlZml4JykgLyBnZXRfb3B0aW9uKCdkYXRhZGlyJykgLyAnbG9jYWxl
JykKK2NvbmYuc2V0X3F1b3RlZCgnTE9DQUxFRElSJywgZ2V0X29wdGlvbigncHJlZml4Jykg
LyBnZXRfb3B0aW9uKCdsb2NhbGVkaXInKSkKIAogIyBNZXNvbiAwLjYwIGhhbmRsZXMgdGhl
IGljb252IGRlcGVuZGVuY3kgbmF0aXZlbHkuIEZvciBvbGRlciB2ZXJzaW9ucywgZmFsbAog
IyBiYWNrIHRvIG1hbnVhbCBjaGVja3MgZm9yIHRoZSBpY29udl9vcGVuIGZ1bmN0aW9uIGlu
IGxpYmMsIG9yIGZpbmRpbmcgYW4KLS0gCjIuNDkuMAoK

--------------rHa0QTlYFfFFgHfn5YX3Yeos--

