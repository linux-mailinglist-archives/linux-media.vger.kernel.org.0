Return-Path: <linux-media+bounces-9300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C60FD8A4765
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 06:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C80E71C20F6A
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 04:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473561CD24;
	Mon, 15 Apr 2024 04:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeBlKFXN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5705F18E02
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 04:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713154969; cv=none; b=u5HMDzRxKElKdF5CBljmAqfRt+eYzU6Pv+NkjhO4QgbNNrA3dR12FvakVLd1FM9fWHo0cgcYAaomo8ADY0FV0ubutj1PTZ7gKIsfEARf5lqw9SoZ5zjOClY/X9/R0CyLRFkfLHfRHIYLOYwTZE7maKTPYOusma+MSqmeykhpeNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713154969; c=relaxed/simple;
	bh=BgTghdG3eMF7ikMFEoaaBG3Tj22wwszrpJ55r1RC1l0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjXKbRAQUxgd48cY3bug1OLcpkEZwbnvs0N1ajltP17IaiK2xK4Hr1htcTeLv4pgItg98tmNnDcPYa1jdTztWyAurtR58S469gqiOqkXfj+dvMPMPlYJOslT2GCfulYCyTieyQEEMc8iom4o6nUbNDwneliFe9dtw22O/Sc3yhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeBlKFXN; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so2657186276.3
        for <linux-media@vger.kernel.org>; Sun, 14 Apr 2024 21:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713154967; x=1713759767; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BgTghdG3eMF7ikMFEoaaBG3Tj22wwszrpJ55r1RC1l0=;
        b=IeBlKFXNKZS/mUoXr7GTC8Q2e8co/KBam2X8nBHNlxrLgri8Hj1NM72qxBzbeHgBOH
         YXhc38+/XQO7qc6Pa2B4bZt1mAqsp6eD6UzE1WTlqhFf7N/+SAPswEcn4QMLKrmK6ENN
         XsezRMJKn8QDgLnHRW696x5Gyik0Y2/L8MN16cXPxyOnzYplU9BGgAN5TUnssHDWFFuW
         l18nzquAz7QjvYXJhDuZrn33wQyP7jbNG/WSJ/7htx71pbSkTgZrlyX/et0Lt9U+TH4V
         8ZS27G9XcL2xIamta7dxL7eKyntEFEIzSYYnfrtnfiJUu/+Ns2XOpM7fT3OcmCtHwfBZ
         8UbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713154967; x=1713759767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BgTghdG3eMF7ikMFEoaaBG3Tj22wwszrpJ55r1RC1l0=;
        b=IXkyVqfswp2NnQavPh8hpVmwYLhVtW0a6ATKtk0Kp/q1BRZ4vHUWOFum+PH4AJCAPC
         P+vuDS0QmMOwOxeCauufLwNJFeXucZHZMsRq6jx+roqAdmzO89vJH+C/uC+5cS4bARUH
         DvVjVv5wd6Zow4fIcATQMDMHz9qN/kUxxXoaxrfUkf6MzMK7lTBbBd4BHh+F6uFDVRO3
         /9JDVspfs8pG21l4mum0A7KcTxqawh4rJOEwoTp3Hct1Wgw6AqKg/08Pc4waNHgWbk+2
         nmQiumUR4fF/JH6FBkJEGzDjq9qTOlu4dZcD+TJWnRrldYsCqTJvzzPTrPV3pRhD2LR0
         bOng==
X-Gm-Message-State: AOJu0Yy0b5+o7WO/coiRhbnZ2gKu/YAVV2n6uBHwwyFg0Je58UBz4SUU
	b0bC/jDaQB/wUIQzVNhRACFoDgVVB3x+Ra59s/+do1W8CFC01FO9Aw8PrAUKKJ55tBnK0GneEIl
	AJf9iqIMw4Lv6UQkRKv7ELZs1/BfKuzkt
X-Google-Smtp-Source: AGHT+IH+qh0kcwnlvWodN57TyEYpo5iLn3slmV/dLRlSu/Pm1d1KLCzjU6Wll/qlnPItzvPfcr5V1uOVsrGSqcqx/Mc=
X-Received: by 2002:a25:890b:0:b0:dbf:487b:1fe7 with SMTP id
 e11-20020a25890b000000b00dbf487b1fe7mr7156459ybl.17.1713154967128; Sun, 14
 Apr 2024 21:22:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALqtLOVAdrdv6VhVBwYvMePjoyVU4h-G-mDkMMEJ2_7CsDtRMQ@mail.gmail.com>
In-Reply-To: <CALqtLOVAdrdv6VhVBwYvMePjoyVU4h-G-mDkMMEJ2_7CsDtRMQ@mail.gmail.com>
From: ritesh sonawane <riteshsonawane1372@gmail.com>
Date: Mon, 15 Apr 2024 09:52:36 +0530
Message-ID: <CALqtLOXXQhFfXqTvsT5xvE8_tiPSW61Br7jh_318qo9yHsZT_A@mail.gmail.com>
Subject: Fwd: Help with uvcvideo
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Content-Type: multipart/mixed; boundary="000000000000434d9706161af99b"

--000000000000434d9706161af99b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: ritesh sonawane <riteshsonawane1372@gmail.com>
Date: Sat, Apr 13, 2024 at 9:27=E2=80=AFPM
Subject: Help with uvcvideo
To: <laurent.pinchart@ideasonboard.com>


Hey I need help with my webcam, unable to use it on linux but working
fine on windows, sharing the dmesg output and device info P.F.A for
it. I use fedora 39 with i3.

--000000000000434d9706161af99b
Content-Type: application/octet-stream; name=deviceinfo
Content-Disposition: attachment; filename=deviceinfo
Content-Transfer-Encoding: base64
Content-ID: <f_luya5y2k1>
X-Attachment-Id: f_luya5y2k1

djRsMi1jdGwgLWQgL2Rldi92aWRlbzIgLS1hbGwKRHJpdmVyIEluZm86CglEcml2ZXIgbmFtZSAg
ICAgIDogdXZjdmlkZW8KCUNhcmQgdHlwZSAgICAgICAgOiAxMDgwUCBXZWIgQ2FtZXJhOiAxMDgw
UCBXZWIgQ2FtCglCdXMgaW5mbyAgICAgICAgIDogdXNiLTAwMDA6MDA6MTQuMC00CglEcml2ZXIg
dmVyc2lvbiAgIDogNi44LjQKCUNhcGFiaWxpdGllcyAgICAgOiAweDg0YTAwMDAxCgkJVmlkZW8g
Q2FwdHVyZQoJCU1ldGFkYXRhIENhcHR1cmUKCQlTdHJlYW1pbmcKCQlFeHRlbmRlZCBQaXggRm9y
bWF0CgkJRGV2aWNlIENhcGFiaWxpdGllcwoJRGV2aWNlIENhcHMgICAgICA6IDB4MDQyMDAwMDEK
CQlWaWRlbyBDYXB0dXJlCgkJU3RyZWFtaW5nCgkJRXh0ZW5kZWQgUGl4IEZvcm1hdApNZWRpYSBE
cml2ZXIgSW5mbzoKCURyaXZlciBuYW1lICAgICAgOiB1dmN2aWRlbwoJTW9kZWwgICAgICAgICAg
ICA6IDEwODBQIFdlYiBDYW1lcmE6IDEwODBQIFdlYiBDYW0KCVNlcmlhbCAgICAgICAgICAgOiBT
TjAwMDIKCUJ1cyBpbmZvICAgICAgICAgOiB1c2ItMDAwMDowMDoxNC4wLTQKCU1lZGlhIHZlcnNp
b24gICAgOiA2LjguNAoJSGFyZHdhcmUgcmV2aXNpb246IDB4MDAwMDUwMDAgKDIwNDgwKQoJRHJp
dmVyIHZlcnNpb24gICA6IDYuOC40CkludGVyZmFjZSBJbmZvOgoJSUQgICAgICAgICAgICAgICA6
IDB4MDMwMDAwMDIKCVR5cGUgICAgICAgICAgICAgOiBWNEwgVmlkZW8KRW50aXR5IEluZm86CglJ
RCAgICAgICAgICAgICAgIDogMHgwMDAwMDAwMSAoMSkKCU5hbWUgICAgICAgICAgICAgOiAxMDgw
UCBXZWIgQ2FtZXJhOiAxMDgwUCBXZWIgQ2FtCglGdW5jdGlvbiAgICAgICAgIDogVjRMMiBJL08K
CUZsYWdzICAgICAgICAgICAgOiBkZWZhdWx0CglQYWQgMHgwMTAwMDAwNyAgIDogMDogU2luawoJ
ICBMaW5rIDB4MDIwMDAwMTA6IGZyb20gcmVtb3RlIHBhZCAweDEwMDAwMGEgb2YgZW50aXR5ICdF
eHRlbnNpb24gMycgKFZpZGVvIFBpeGVsIEZvcm1hdHRlcik6IERhdGEsIEVuYWJsZWQsIEltbXV0
YWJsZQpQcmlvcml0eTogMgpWaWRlbyBpbnB1dCA6IDAgKENhbWVyYSAxOiBvaykKRm9ybWF0IFZp
ZGVvIENhcHR1cmU6CglXaWR0aC9IZWlnaHQgICAgICA6IDEyODAvNzIwCglQaXhlbCBGb3JtYXQg
ICAgICA6ICdNSlBHJyAoTW90aW9uLUpQRUcpCglGaWVsZCAgICAgICAgICAgICA6IE5vbmUKCUJ5
dGVzIHBlciBMaW5lICAgIDogMAoJU2l6ZSBJbWFnZSAgICAgICAgOiAxODQzMjAwCglDb2xvcnNw
YWNlICAgICAgICA6IHNSR0IKCVRyYW5zZmVyIEZ1bmN0aW9uIDogRGVmYXVsdCAobWFwcyB0byBz
UkdCKQoJWUNiQ3IvSFNWIEVuY29kaW5nOiBEZWZhdWx0IChtYXBzIHRvIElUVS1SIDYwMSkKCVF1
YW50aXphdGlvbiAgICAgIDogRGVmYXVsdCAobWFwcyB0byBGdWxsIFJhbmdlKQoJRmxhZ3MgICAg
ICAgICAgICAgOgpDcm9wIENhcGFiaWxpdHkgVmlkZW8gQ2FwdHVyZToKCUJvdW5kcyAgICAgIDog
TGVmdCAwLCBUb3AgMCwgV2lkdGggMTI4MCwgSGVpZ2h0IDcyMAoJRGVmYXVsdCAgICAgOiBMZWZ0
IDAsIFRvcCAwLCBXaWR0aCAxMjgwLCBIZWlnaHQgNzIwCglQaXhlbCBBc3BlY3Q6IDEvMQpTZWxl
Y3Rpb24gVmlkZW8gQ2FwdHVyZTogY3JvcF9kZWZhdWx0LCBMZWZ0IDAsIFRvcCAwLCBXaWR0aCAx
MjgwLCBIZWlnaHQgNzIwLCBGbGFnczoKU2VsZWN0aW9uIFZpZGVvIENhcHR1cmU6IGNyb3BfYm91
bmRzLCBMZWZ0IDAsIFRvcCAwLCBXaWR0aCAxMjgwLCBIZWlnaHQgNzIwLCBGbGFnczoKU3RyZWFt
aW5nIFBhcmFtZXRlcnMgVmlkZW8gQ2FwdHVyZToKCUNhcGFiaWxpdGllcyAgICAgOiB0aW1lcGVy
ZnJhbWUKCUZyYW1lcyBwZXIgc2Vjb25kOiAzMC4wMDAgKDMwLzEpCglSZWFkIGJ1ZmZlcnMgICAg
IDogMAoKVXNlciBDb250cm9scwoKICAgICAgICAgICAgICAgICAgICAgYnJpZ2h0bmVzcyAweDAw
OTgwOTAwIChpbnQpICAgIDogbWluPTEgbWF4PTI1NSBzdGVwPTEgZGVmYXVsdD0xMjggdmFsdWU9
MTI4CiAgICAgICAgICAgICAgICAgICAgICAgY29udHJhc3QgMHgwMDk4MDkwMSAoaW50KSAgICA6
IG1pbj0xIG1heD0yNTUgc3RlcD0xIGRlZmF1bHQ9MTI4IHZhbHVlPTEyOAogICAgICAgICAgICAg
ICAgICAgICBzYXR1cmF0aW9uIDB4MDA5ODA5MDIgKGludCkgICAgOiBtaW49MTAgbWF4PTIwMCBz
dGVwPTEgZGVmYXVsdD0xMzUgdmFsdWU9MTM1CiAgICAgICAgd2hpdGVfYmFsYW5jZV9hdXRvbWF0
aWMgMHgwMDk4MDkwYyAoYm9vbCkgICA6IGRlZmF1bHQ9MSB2YWx1ZT0xCiAgICAgICAgICAgcG93
ZXJfbGluZV9mcmVxdWVuY3kgMHgwMDk4MDkxOCAobWVudSkgICA6IG1pbj0wIG1heD0yIGRlZmF1
bHQ9MSB2YWx1ZT0xICg1MCBIeikKCQkJCTA6IERpc2FibGVkCgkJCQkxOiA1MCBIegoJCQkJMjog
NjAgSHoKICAgICAgd2hpdGVfYmFsYW5jZV90ZW1wZXJhdHVyZSAweDAwOTgwOTFhIChpbnQpICAg
IDogbWluPTI4MDAgbWF4PTY1MDAgc3RlcD0xIGRlZmF1bHQ9NDY1MCB2YWx1ZT00NjUwIGZsYWdz
PWluYWN0aXZlCiAgICAgICAgICAgICAgICAgICAgICBzaGFycG5lc3MgMHgwMDk4MDkxYiAoaW50
KSAgICA6IG1pbj0xIG1heD0yNTUgc3RlcD0xIGRlZmF1bHQ9MTI4IHZhbHVlPTEyOAoKQ2FtZXJh
IENvbnRyb2xzCgogICAgICAgICAgICAgICAgICB6b29tX2Fic29sdXRlIDB4MDA5YTA5MGQgKGlu
dCkgICAgOiBtaW49MSBtYXg9MTUwIHN0ZXA9MSBkZWZhdWx0PTEgdmFsdWU9MQogICAgICAgICAg
ICAgICAgem9vbV9jb250aW51b3VzIDB4MDA5YTA5MGYgKGludCkgICAgOiBtaW49MCBtYXg9MCBz
dGVwPTAgZGVmYXVsdD0wIHZhbHVlPTA=
--000000000000434d9706161af99b
Content-Type: application/octet-stream; name=dmesgoutput
Content-Disposition: attachment; filename=dmesgoutput
Content-Transfer-Encoding: base64
Content-ID: <f_luya5y1s0>
X-Attachment-Id: f_luya5y1s0

YFsgMTQzNy41ODQ4NDRdIHVzYiAxLTQ6IG5ldyBoaWdoLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVy
IDkgdXNpbmcgeGhjaV9oY2QKWyAxNDM3LjcxMzQ3N10gdXNiIDEtNDogTmV3IFVTQiBkZXZpY2Ug
Zm91bmQsIGlkVmVuZG9yPTJiZGYsIGlkUHJvZHVjdD0wMjgwLCBiY2REZXZpY2U9NTAuMDAKWyAx
NDM3LjcxMzQ5Ml0gdXNiIDEtNDogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTEsIFByb2R1
Y3Q9MiwgU2VyaWFsTnVtYmVyPTMKWyAxNDM3LjcxMzQ5N10gdXNiIDEtNDogUHJvZHVjdDogMTA4
MFAgV2ViIENhbWVyYQpbIDE0MzcuNzEzNTAyXSB1c2IgMS00OiBNYW51ZmFjdHVyZXI6IFNOMDAw
MgpbIDE0MzcuNzEzNTA1XSB1c2IgMS00OiBTZXJpYWxOdW1iZXI6IFNOMDAwMgpbIDE0MzcuNzE3
Mzk2XSB1c2IgMS00OiBGb3VuZCBVVkMgMS4wMCBkZXZpY2UgMTA4MFAgV2ViIENhbWVyYSAoMmJk
ZjowMjgwKQpbIDE0NTIuOTY4MDMxXSB1c2IgMS00OiBGYWlsZWQgdG8gcXVlcnkgKEdFVF9ERUYp
IFVWQyBjb250cm9sIDIgb24gdW5pdCAyOiAtMTEwIChleHAuIDIpLgpbIDE0NTguMDg4MDIzXSB1
c2IgMS00OiBGYWlsZWQgdG8gcXVlcnkgKEdFVF9ERUYpIFVWQyBjb250cm9sIDIgb24gdW5pdCAy
OiAtMTEwIChleHAuIDIpLgpbIDE0NTguMDg4NzA3XSB1c2IgMS00OiAzOjE6IHVzYl9zZXRfaW50
ZXJmYWNlIGZhaWxlZCAoLTExMCkKWyAxNDYzLjIwODA5OV0gdXNiIDEtNDogRmFpbGVkIHRvIHF1
ZXJ5IChHRVRfREVGKSBVVkMgY29udHJvbCAxMSBvbiB1bml0IDE6IC0xMTAgKGV4cC4gMikuClsg
MTQ2My4yMDg3NzldIHVzYiAxLTQ6IDM6MTogdXNiX3NldF9pbnRlcmZhY2UgZmFpbGVkICgtMTEw
KQpbIDE0NjguMzI4Mjc1XSB1c2IgMS00OiBGYWlsZWQgdG8gcXVlcnkgKEdFVF9ERUYpIFVWQyBj
b250cm9sIDIgb24gdW5pdCAyOiAtMTEwIChleHAuIDIpLgpbIDE0NjguMzI5MDIzXSB1c2IgMS00
OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTExMCkKWyAxNDczLjQ0ODI5MV0gdXNi
IDEtNDogRmFpbGVkIHRvIHF1ZXJ5IChHRVRfREVGKSBVVkMgY29udHJvbCAxMSBvbiB1bml0IDE6
IC0xMTAgKGV4cC4gMikuClsgMTQ3My40NDg5MTVdIHVzYiAxLTQ6IDM6MTogdXNiX3NldF9pbnRl
cmZhY2UgZmFpbGVkICgtMTEwKQpbIDE0NzguNTY5MDkwXSB1c2IgMS00OiAzOjE6IHVzYl9zZXRf
aW50ZXJmYWNlIGZhaWxlZCAoLTExMCkKWyAxNDgzLjY4OTAyMF0gdXNiIDEtNDogMzoxOiB1c2Jf
c2V0X2ludGVyZmFjZSBmYWlsZWQgKC0xMTApClsgMTQ4OC44MDkwMjZdIHVzYiAxLTQ6IDM6MTog
dXNiX3NldF9pbnRlcmZhY2UgZmFpbGVkICgtMTEwKQpbIDE0OTMuOTI5MDQ1XSB1c2IgMS00OiAz
OjE6IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTExMCkKWyAxNDk5LjA0OTA1OV0gdXNiIDEt
NDogMzoxOiB1c2Jfc2V0X2ludGVyZmFjZSBmYWlsZWQgKC0xMTApClsgMTUwNC4xNjkxMjldIHVz
YiAxLTQ6IDM6MTogdXNiX3NldF9pbnRlcmZhY2UgZmFpbGVkICgtMTEwKQpbIDE1MDkuMjg5MDkw
XSB1c2IgMS00OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTExMCkKWyAxNTE0LjQw
OTA5Ml0gdXNiIDEtNDogMzoxOiB1c2Jfc2V0X2ludGVyZmFjZSBmYWlsZWQgKC0xMTApClsgMTUx
OS41MjkxMDldIHVzYiAxLTQ6IDM6MTogdXNiX3NldF9pbnRlcmZhY2UgZmFpbGVkICgtMTEwKQpb
IDE1MjQuNjQ5MDY2XSB1c2IgMS00OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTEx
MCkKWyAxNTI5Ljc2OTA2MV0gdXNiIDEtNDogMzoxOiB1c2Jfc2V0X2ludGVyZmFjZSBmYWlsZWQg
KC0xMTApClsgMTUzNC44ODkwMzZdIHVzYiAxLTQ6IDM6MTogdXNiX3NldF9pbnRlcmZhY2UgZmFp
bGVkICgtMTEwKQpbIDE1NDAuMDA5MjI4XSB1c2IgMS00OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNl
IGZhaWxlZCAoLTExMCkKWyAxNTQ1LjEyOTk2Ml0gdXNiIDEtNDogMzoxOiB1c2Jfc2V0X2ludGVy
ZmFjZSBmYWlsZWQgKC0xMTApYA==
--000000000000434d9706161af99b--

