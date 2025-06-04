Return-Path: <linux-media+bounces-34070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E33ACE48E
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 20:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25A753A7B47
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 18:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D94A1F463B;
	Wed,  4 Jun 2025 18:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGrJfKF5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A59320F
	for <linux-media@vger.kernel.org>; Wed,  4 Jun 2025 18:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749063493; cv=none; b=YxLrZt1MzWVAlVbodvcOxxsZVBXB5oJVt7//mNmXo2Hm3G4Wtu61u9OUBW0Q9Bo0JH/0s2hG5gKd6L4WXB/kSeF9HaZye/OQP5aXX4HAdB1OsowY9/P1S4hhagTqSpPsEPL1DCq75C70XjoiMR981/kgq7BFZ1QboDx9bVEpmJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749063493; c=relaxed/simple;
	bh=LyAnEx2LgQsLitAKkQnIjbqTZBWfxuGFtiCSTVp8BuI=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:From:Subject; b=Uqa4pprQbXh8mPnSq7Ku1DNCCkrGTZ73etGWhvBITcuUOiXlZLxk3q7SZmeCXXpuDWHpZ0Nmr5UjxaAF1ejTZK8dCw4DzSH4gp+9huuR9p2AztmjIYJ1DX6ro5jiYSV2qfCV2APJlMDhCBT9d5tKiWO/fAoaBoy+fdFjh1Au/LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGrJfKF5; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f8b2682d61so14563716d6.0
        for <linux-media@vger.kernel.org>; Wed, 04 Jun 2025 11:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749063491; x=1749668291; darn=vger.kernel.org;
        h=autocrypt:subject:from:content-language:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hijD0ofYdhgnfrtnv1tsWJ9DsisObGgUc4tYK/GKiCc=;
        b=XGrJfKF5GZjIlX+fC0tduZG3bOm0Cyi5fd3xG6SigQb/DjvFFj370+zoGZ/XKOLp9N
         kE1MQEXJJCmtMwj9HSxhUIh7cJvlCQIfuSu6i6kZoaRGB3Zr2TvcmopxaD2P7v0Wg2V9
         Xp82QiAoquvl5+g35AU+rtajr2gHOMx+t7+j4CjbLypBeJaHR6yCnxx7QbIZ+37I/45f
         efU50NhT+kssq0QNCFijX2WxnLQYzcKoRj4ju4nkPXP7Y5Kkfh8m6xaHfwBhfA7v1QDc
         9ZefyamTabUyPaJUBJDW6ewjyCQ8kv9y3cmmnJHMfU9DK2Fp32A6EdWY4X353mhpgRBH
         h3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749063491; x=1749668291;
        h=autocrypt:subject:from:content-language:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hijD0ofYdhgnfrtnv1tsWJ9DsisObGgUc4tYK/GKiCc=;
        b=M24gOlciwGxnLJc0aAchZyflDxC9zja06TGDCSRYjCW1nAczNwYBnf3XvtzAw6GEP+
         Wi7Y6bJFrx96MH/pSOHRjvLBgp2ieDXybpSTGYFp7z66PBWEYLNIpjn0o1jCmH4cYn2c
         yffUuvMoKy1Rsyt9W7cH8Q3uyRIQLyVtAork3rAg8SFXLR564Ms/p4v26dBGorN20Fmp
         +1y0HtOlzWoZKArtBqf/I91CFeij2b0NRPz4oRhAXIlyXzcdGxqyD0YY5Zsyb0vOGnct
         gg3hgoq8bWZxtFcrRsjpCrOmlZEa9bzWIj8/vNknV5XYjhq9tuOZIf4VP6N31VIF5k18
         slBw==
X-Gm-Message-State: AOJu0Yxmc/Jg5lhjpaYVCKQTp8R90rPhVuRpLd4OkPZikYY9ztURwIqe
	xG3ALSKQXGkw2tY0TTfuTdNnUMiei9dxeKEDuO+/QaxGg2wo2gdpX4/1gLK0AA==
X-Gm-Gg: ASbGncuplXbgZWdzeHQDziDNRfob4J5jPfPD8G1PR+o80d6GvA2WRz0Ov2jnaLPYjYb
	2pccBxtAdEy40hACDCU/vkgHva5dxE3zLO+8NaW+n7bWrebhq8A2j1i66lWy1hezixC4dCM6bDw
	Inx6L9GO0iuUiCgdIpXmc9hspf8yEesXoRYSJW8LklIdFAI1YPw3OnVUDmhZLZoeCbalwLzMDQR
	7gk62oYIlBjiYAFXVc/SoiEKdUFCwachREk3B3f2PJAhpWOt86BbK/CvbEcyjNnTjyIb6sN5DIb
	OTiZR4W2C4NUIFTAID1o6+H2Xs+Xr0rAyNdDu2tOsfuIpQsuoCLri42j0z4rT59SSS7gH9fIofO
	Xs26Pm3BriXjdzfr2YCktMapWAJc2zujAhNLmaFZnmg==
X-Google-Smtp-Source: AGHT+IE4HT7XeiUX/dr+fh9gTZ7Mxlzxyu4tv9eJexGYduYbnDmiGfl2TxLP9v40yYKDJH87+YWKFQ==
X-Received: by 2002:a05:6214:529a:b0:6f5:372f:1c5b with SMTP id 6a1803df08f44-6faffe78889mr8877896d6.11.1749063490665;
        Wed, 04 Jun 2025 11:58:10 -0700 (PDT)
Received: from [192.168.1.35] (99-104-239-121.lightspeed.livnmi.sbcglobal.net. [99.104.239.121])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d35155sm104843056d6.7.2025.06.04.11.58.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 11:58:09 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------IdMolam9fGDqNVU5ZWS63VOa"
Message-ID: <f75fa09d-190e-47f9-99f0-e2f1b1637e51@gmail.com>
Date: Wed, 4 Jun 2025 14:58:08 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-media@vger.kernel.org
Content-Language: en-US-large
From: Leo Izen <leo.izen@gmail.com>
Subject: [v4l-utils] [PATCH] libv4l2: prefix HAVE_POSIX_IOCTL with LIBV4L_ for
 public, header
Autocrypt: addr=leo.izen@gmail.com; keydata=
 xjMEZZw8HxYJKwYBBAHaRw8BAQdAgcfI+LbtjWarA7LQu6/WAPlKkn9tn4HalmHgGVhMUdzN
 KkxlbyBJemVuIChUcmFuZXB0b3JhKSA8bGVvLml6ZW5AZ21haWwuY29tPsKTBBMWCgA7FiEE
 HYMKC85GcJ4gOyb8dk5I6kgiGDMFAmWcPB8CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQdk5I6kgiGDOnGAEA+oJFwblAblnhK+T5a5EuEbXMTZG4FkYTYz0VmjJ0NHIA/Rn9
 ZE9+EEsH8fmT0hRJSiM3+zbkwQJA9gVVYAek9kMKzjgEZZw8HxIKKwYBBAGXVQEFAQEHQDes
 4thejF9AU2rkGuDuut3CQYwB4SVpI4EzU8uvPJgfAwEIB8J4BBgWCgAgFiEEHYMKC85GcJ4g
 Oyb8dk5I6kgiGDMFAmWcPB8CGwwACgkQdk5I6kgiGDOv3QD+PLXrL0Ihk675Ip5FG+VJOodN
 6e+5n3iYC6wJ75eqG3EA/1nCywoGXlCYuzXgq3el6NOn+8awwaXcTVJFzZCRbe8M

This is a multi-part message in MIME format.
--------------IdMolam9fGDqNVU5ZWS63VOa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 From b80603d4088fd30fd9d7b6b56490e7e138551e9d Mon Sep 17 00:00:00 2001
From: Leo Izen <leo.izen@gmail.com>
Date: Wed, 4 Jun 2025 14:50:05 -0400
Subject: [PATCH] libv4l2: prefix HAVE_POSIX_IOCTL with LIBV4L_ for public
  header

Commit fd882f9e77b13cbc6a669e6836c3943393b44152 introduced the flag
HAVE_POSIX_IOCTL to change which v4l2_ioctl function is declared in
libv4l2.h, but this is a public header and may conflict with another
project which may use HAVE_POSIX_IOCTL on its own to determine which
ioctl funtion it should declare.

This commit namespaces the flag so it can't conflict with another
project's configuration. Notably, if it uses #if instead of #ifdef and
defines HAVE_POSIX_IOCTL to be 0, then it will create an incompatible
function signature between v4l2_ioctl and the project's.

Signed-off-by: Leo Izen <leo.izen@gmail.com>
---
  lib/include/libv4l2.h     | 2 +-
  lib/libv4l1/v4l1compat.c  | 2 +-
  lib/libv4l2/libv4l2.c     | 2 +-
  lib/libv4l2/v4l2convert.c | 2 +-
  meson.build               | 2 +-
  5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/include/libv4l2.h b/lib/include/libv4l2.h
index 16565555..25ababc7 100644
--- a/lib/include/libv4l2.h
+++ b/lib/include/libv4l2.h
@@ -63,7 +63,7 @@ LIBV4L_PUBLIC extern FILE *v4l2_log_file;
  LIBV4L_PUBLIC int v4l2_open(const char *file, int oflag, ...);
  LIBV4L_PUBLIC int v4l2_close(int fd);
  LIBV4L_PUBLIC int v4l2_dup(int fd);
-#ifdef HAVE_POSIX_IOCTL
+#ifdef LIBV4L_HAVE_POSIX_IOCTL
  LIBV4L_PUBLIC int v4l2_ioctl(int fd, int request, ...);
  #else
  LIBV4L_PUBLIC int v4l2_ioctl(int fd, unsigned long int request, ...);
diff --git a/lib/libv4l1/v4l1compat.c b/lib/libv4l1/v4l1compat.c
index 2db68423..c4ca3a70 100644
--- a/lib/libv4l1/v4l1compat.c
+++ b/lib/libv4l1/v4l1compat.c
@@ -90,7 +90,7 @@ LIBV4L_PUBLIC int dup(int fd)
  	return v4l1_dup(fd);
  }

-#ifdef HAVE_POSIX_IOCTL
+#ifdef LIBV4L_HAVE_POSIX_IOCTL
  LIBV4L_PUBLIC int ioctl(int fd, int request, ...)
  #else
  LIBV4L_PUBLIC int ioctl(int fd, unsigned long int request, ...)
diff --git a/lib/libv4l2/libv4l2.c b/lib/libv4l2/libv4l2.c
index 1607ec35..289501d9 100644
--- a/lib/libv4l2/libv4l2.c
+++ b/lib/libv4l2/libv4l2.c
@@ -1051,7 +1051,7 @@ static int v4l2_s_fmt(int index, struct 
v4l2_format *dest_fmt)
  	return 0;
  }

-#ifdef HAVE_POSIX_IOCTL
+#ifdef LIBV4L_HAVE_POSIX_IOCTL
  int v4l2_ioctl(int fd, int request, ...)
  #else
  int v4l2_ioctl(int fd, unsigned long int request, ...)
diff --git a/lib/libv4l2/v4l2convert.c b/lib/libv4l2/v4l2convert.c
index 396ed3ea..b33472e5 100644
--- a/lib/libv4l2/v4l2convert.c
+++ b/lib/libv4l2/v4l2convert.c
@@ -123,7 +123,7 @@ LIBV4L_PUBLIC int dup(int fd)
  	return v4l2_dup(fd);
  }

-#ifdef HAVE_POSIX_IOCTL
+#ifdef LIBV4L_HAVE_POSIX_IOCTL
  LIBV4L_PUBLIC int ioctl(int fd, int request, ...)
  #else
  LIBV4L_PUBLIC int ioctl(int fd, unsigned long int request, ...)
diff --git a/meson.build b/meson.build
index 88781e59..590ef11e 100644
--- a/meson.build
+++ b/meson.build
@@ -365,7 +365,7 @@ ioctl_posix_test = '''
  int ioctl (int, int, ...);
  '''
  if cc.compiles(ioctl_posix_test)
-    conf.set('HAVE_POSIX_IOCTL', 1)
+    conf.set('LIBV4L_HAVE_POSIX_IOCTL', 1)
  endif

  c_arguments = []
-- 
2.49.0

--------------IdMolam9fGDqNVU5ZWS63VOa
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-libv4l2-prefix-HAVE_POSIX_IOCTL-with-LIBV4L_-for-pub.patch"
Content-Disposition: attachment;
 filename*0="0001-libv4l2-prefix-HAVE_POSIX_IOCTL-with-LIBV4L_-for-pub.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBiODA2MDNkNDA4OGZkMzBmZDlkN2I2YjU2NDkwZTdlMTM4NTUxZTlkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBMZW8gSXplbiA8bGVvLml6ZW5AZ21haWwuY29tPgpE
YXRlOiBXZWQsIDQgSnVuIDIwMjUgMTQ6NTA6MDUgLTA0MDAKU3ViamVjdDogW1BBVENIXSBs
aWJ2NGwyOiBwcmVmaXggSEFWRV9QT1NJWF9JT0NUTCB3aXRoIExJQlY0TF8gZm9yIHB1Ymxp
YwogaGVhZGVyCgpDb21taXQgZmQ4ODJmOWU3N2IxM2NiYzZhNjY5ZTY4MzZjMzk0MzM5M2I0
NDE1MiBpbnRyb2R1Y2VkIHRoZSBmbGFnCkhBVkVfUE9TSVhfSU9DVEwgdG8gY2hhbmdlIHdo
aWNoIHY0bDJfaW9jdGwgZnVuY3Rpb24gaXMgZGVjbGFyZWQgaW4KbGlidjRsMi5oLCBidXQg
dGhpcyBpcyBhIHB1YmxpYyBoZWFkZXIgYW5kIG1heSBjb25mbGljdCB3aXRoIGFub3RoZXIK
cHJvamVjdCB3aGljaCBtYXkgdXNlIEhBVkVfUE9TSVhfSU9DVEwgb24gaXRzIG93biB0byBk
ZXRlcm1pbmUgd2hpY2gKaW9jdGwgZnVudGlvbiBpdCBzaG91bGQgZGVjbGFyZS4KClRoaXMg
Y29tbWl0IG5hbWVzcGFjZXMgdGhlIGZsYWcgc28gaXQgY2FuJ3QgY29uZmxpY3Qgd2l0aCBh
bm90aGVyCnByb2plY3QncyBjb25maWd1cmF0aW9uLiBOb3RhYmx5LCBpZiBpdCB1c2VzICNp
ZiBpbnN0ZWFkIG9mICNpZmRlZiBhbmQKZGVmaW5lcyBIQVZFX1BPU0lYX0lPQ1RMIHRvIGJl
IDAsIHRoZW4gaXQgd2lsbCBjcmVhdGUgYW4gaW5jb21wYXRpYmxlCmZ1bmN0aW9uIHNpZ25h
dHVyZSBiZXR3ZWVuIHY0bDJfaW9jdGwgYW5kIHRoZSBwcm9qZWN0J3MuCgpTaWduZWQtb2Zm
LWJ5OiBMZW8gSXplbiA8bGVvLml6ZW5AZ21haWwuY29tPgotLS0KIGxpYi9pbmNsdWRlL2xp
YnY0bDIuaCAgICAgfCAyICstCiBsaWIvbGlidjRsMS92NGwxY29tcGF0LmMgIHwgMiArLQog
bGliL2xpYnY0bDIvbGlidjRsMi5jICAgICB8IDIgKy0KIGxpYi9saWJ2NGwyL3Y0bDJjb252
ZXJ0LmMgfCAyICstCiBtZXNvbi5idWlsZCAgICAgICAgICAgICAgIHwgMiArLQogNSBmaWxl
cyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvbGliL2luY2x1ZGUvbGlidjRsMi5oIGIvbGliL2luY2x1ZGUvbGlidjRsMi5oCmluZGV4
IDE2NTY1NTU1Li4yNWFiYWJjNyAxMDA2NDQKLS0tIGEvbGliL2luY2x1ZGUvbGlidjRsMi5o
CisrKyBiL2xpYi9pbmNsdWRlL2xpYnY0bDIuaApAQCAtNjMsNyArNjMsNyBAQCBMSUJWNExf
UFVCTElDIGV4dGVybiBGSUxFICp2NGwyX2xvZ19maWxlOwogTElCVjRMX1BVQkxJQyBpbnQg
djRsMl9vcGVuKGNvbnN0IGNoYXIgKmZpbGUsIGludCBvZmxhZywgLi4uKTsKIExJQlY0TF9Q
VUJMSUMgaW50IHY0bDJfY2xvc2UoaW50IGZkKTsKIExJQlY0TF9QVUJMSUMgaW50IHY0bDJf
ZHVwKGludCBmZCk7Ci0jaWZkZWYgSEFWRV9QT1NJWF9JT0NUTAorI2lmZGVmIExJQlY0TF9I
QVZFX1BPU0lYX0lPQ1RMCiBMSUJWNExfUFVCTElDIGludCB2NGwyX2lvY3RsKGludCBmZCwg
aW50IHJlcXVlc3QsIC4uLik7CiAjZWxzZQogTElCVjRMX1BVQkxJQyBpbnQgdjRsMl9pb2N0
bChpbnQgZmQsIHVuc2lnbmVkIGxvbmcgaW50IHJlcXVlc3QsIC4uLik7CmRpZmYgLS1naXQg
YS9saWIvbGlidjRsMS92NGwxY29tcGF0LmMgYi9saWIvbGlidjRsMS92NGwxY29tcGF0LmMK
aW5kZXggMmRiNjg0MjMuLmM0Y2EzYTcwIDEwMDY0NAotLS0gYS9saWIvbGlidjRsMS92NGwx
Y29tcGF0LmMKKysrIGIvbGliL2xpYnY0bDEvdjRsMWNvbXBhdC5jCkBAIC05MCw3ICs5MCw3
IEBAIExJQlY0TF9QVUJMSUMgaW50IGR1cChpbnQgZmQpCiAJcmV0dXJuIHY0bDFfZHVwKGZk
KTsKIH0KIAotI2lmZGVmIEhBVkVfUE9TSVhfSU9DVEwKKyNpZmRlZiBMSUJWNExfSEFWRV9Q
T1NJWF9JT0NUTAogTElCVjRMX1BVQkxJQyBpbnQgaW9jdGwoaW50IGZkLCBpbnQgcmVxdWVz
dCwgLi4uKQogI2Vsc2UKIExJQlY0TF9QVUJMSUMgaW50IGlvY3RsKGludCBmZCwgdW5zaWdu
ZWQgbG9uZyBpbnQgcmVxdWVzdCwgLi4uKQpkaWZmIC0tZ2l0IGEvbGliL2xpYnY0bDIvbGli
djRsMi5jIGIvbGliL2xpYnY0bDIvbGlidjRsMi5jCmluZGV4IDE2MDdlYzM1Li4yODk1MDFk
OSAxMDA2NDQKLS0tIGEvbGliL2xpYnY0bDIvbGlidjRsMi5jCisrKyBiL2xpYi9saWJ2NGwy
L2xpYnY0bDIuYwpAQCAtMTA1MSw3ICsxMDUxLDcgQEAgc3RhdGljIGludCB2NGwyX3NfZm10
KGludCBpbmRleCwgc3RydWN0IHY0bDJfZm9ybWF0ICpkZXN0X2ZtdCkKIAlyZXR1cm4gMDsK
IH0KIAotI2lmZGVmIEhBVkVfUE9TSVhfSU9DVEwKKyNpZmRlZiBMSUJWNExfSEFWRV9QT1NJ
WF9JT0NUTAogaW50IHY0bDJfaW9jdGwoaW50IGZkLCBpbnQgcmVxdWVzdCwgLi4uKQogI2Vs
c2UKIGludCB2NGwyX2lvY3RsKGludCBmZCwgdW5zaWduZWQgbG9uZyBpbnQgcmVxdWVzdCwg
Li4uKQpkaWZmIC0tZ2l0IGEvbGliL2xpYnY0bDIvdjRsMmNvbnZlcnQuYyBiL2xpYi9saWJ2
NGwyL3Y0bDJjb252ZXJ0LmMKaW5kZXggMzk2ZWQzZWEuLmIzMzQ3MmU1IDEwMDY0NAotLS0g
YS9saWIvbGlidjRsMi92NGwyY29udmVydC5jCisrKyBiL2xpYi9saWJ2NGwyL3Y0bDJjb252
ZXJ0LmMKQEAgLTEyMyw3ICsxMjMsNyBAQCBMSUJWNExfUFVCTElDIGludCBkdXAoaW50IGZk
KQogCXJldHVybiB2NGwyX2R1cChmZCk7CiB9CiAKLSNpZmRlZiBIQVZFX1BPU0lYX0lPQ1RM
CisjaWZkZWYgTElCVjRMX0hBVkVfUE9TSVhfSU9DVEwKIExJQlY0TF9QVUJMSUMgaW50IGlv
Y3RsKGludCBmZCwgaW50IHJlcXVlc3QsIC4uLikKICNlbHNlCiBMSUJWNExfUFVCTElDIGlu
dCBpb2N0bChpbnQgZmQsIHVuc2lnbmVkIGxvbmcgaW50IHJlcXVlc3QsIC4uLikKZGlmZiAt
LWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKaW5kZXggODg3ODFlNTkuLjU5MGVm
MTFlIDEwMDY0NAotLS0gYS9tZXNvbi5idWlsZAorKysgYi9tZXNvbi5idWlsZApAQCAtMzY1
LDcgKzM2NSw3IEBAIGlvY3RsX3Bvc2l4X3Rlc3QgPSAnJycKIGludCBpb2N0bCAoaW50LCBp
bnQsIC4uLik7CiAnJycKIGlmIGNjLmNvbXBpbGVzKGlvY3RsX3Bvc2l4X3Rlc3QpCi0gICAg
Y29uZi5zZXQoJ0hBVkVfUE9TSVhfSU9DVEwnLCAxKQorICAgIGNvbmYuc2V0KCdMSUJWNExf
SEFWRV9QT1NJWF9JT0NUTCcsIDEpCiBlbmRpZgogCiBjX2FyZ3VtZW50cyA9IFtdCi0tIAoy
LjQ5LjAKCg==

--------------IdMolam9fGDqNVU5ZWS63VOa--

