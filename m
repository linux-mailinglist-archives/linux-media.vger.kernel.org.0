Return-Path: <linux-media+bounces-32234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE453AB283C
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 14:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40FCC3A3850
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 12:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE9E4A32;
	Sun, 11 May 2025 12:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="XEjtWJoM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-10698.protonmail.ch (mail-10698.protonmail.ch [79.135.106.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7E4137C2A
	for <linux-media@vger.kernel.org>; Sun, 11 May 2025 12:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746966875; cv=none; b=OggQCxWMBCsAHOgmvFvQ60cdztZDDpQgvsUvofAGgvjf2Z4LT+KqMBYAqqXnCAbizNke9n4KStJ5MJ/NDxzJjevKZEUJq3oc4hqrzv04rlF4IvKooW1G/fRwS6K8mNeJfaUbKr7/Wb96ipzKhM341vSUp6G2uqTCZh0NGtsCjLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746966875; c=relaxed/simple;
	bh=0IEvocJlNyGlKBjZ4e5PGRTnCBe/qg1zECn+oOKhPqg=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=A9Z8CC3xu/HoCo8/mhadtKCRtX04H/1wKsfJejgEeW2y9FWbifJwde3MPdsDmD8jLZLDhxMID1Kv1gQEIX1Z9BGFkPDDyD1F201cS7ozJbWzc7YZiAdkEC/JFztb6jauf+AJNpthMoNsjI8YsQHi1jmcwOM5XCNJSSs6xUtnXls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=XEjtWJoM; arc=none smtp.client-ip=79.135.106.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1746966870; x=1747226070;
	bh=eESH0QPdAhl2r6w9kR1WKQ6SRGHu827Z2XeA5NtcYuo=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=XEjtWJoMVtFmyQTfy8dyazr1h807cqElNf5S8OG0fF+FeMStATmsi55tq6WSURZt6
	 2CPJ4BeyC7C2FSz1bpsj5uM99RHWGvErDjeLUV8f6Qbajt15a0C/4VhTetmB2pzHws
	 XVkFVvIej9nM6CA++BRNSbel+rqKEPagoJ6uNmATKKBdsNRZGAdKjRDW12ptLfrLXc
	 3Lb1VX0ivA33kFcBkBsVq3IlXUM0xBbaP7ApyCVyKHHoNoA2UeN/r1Qu4wupjBrZB8
	 x7a2XTeIlzZgSZOC3NEFBLXbdBAlM1chDYUJe5+XDZflSDaj/ETFkO6bEglK3rxKxY
	 YJTfEj78e8Pzg==
Date: Sun, 11 May 2025 12:34:28 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: =?utf-8?Q?Zsolt_Vad=C3=A1sz?= <zsolt_vadasz@protonmail.com>
Subject: [PATCH] v4l2-tracer: Allow building on systems using musl
Message-ID: <4dgJekVdP7lLqOQ6JNW05sRHSkRmLLMMQnEn8NGUHPoHDn4SBkaGlHUW89vkJJu3IeFDAh3p6mlplTJJlWJx8V4rr62-hd83quCJ2sIuqoA=@protonmail.com>
Feedback-ID: 28710920:user:proton
X-Pm-Message-ID: faceba73bc1439f9f5ae4b44d247f48da6fbcc58
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zsolt Vadasz <zsolt_vadasz@protonmail.com>
---
 utils/v4l2-tracer/retrace.cpp | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 010936c0..0acce10c 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -10,10 +10,14 @@ extern struct retrace_context ctx_retrace;
 void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
 {
 =09json_object *mmap_args_obj;
+#if defined(linux) && defined(__GLIBC__)
 =09if (is_mmap64)
 =09=09json_object_object_get_ex(mmap_obj, "mmap64", &mmap_args_obj);
 =09else
 =09=09json_object_object_get_ex(mmap_obj, "mmap", &mmap_args_obj);
+#else
+=09json_object_object_get_ex(mmap_obj, "mmap", &mmap_args_obj);
+#endif
=20
 =09json_object *len_obj;
 =09json_object_object_get_ex(mmap_args_obj, "len", &len_obj);
@@ -46,16 +50,24 @@ void retrace_mmap(json_object *mmap_obj, bool is_mmap64=
)
 =09=09return;
=20
 =09void *buf_address_retrace_pointer =3D nullptr;
+#if defined(linux) && defined(__GLIBC__)
 =09if (is_mmap64)
 =09=09buf_address_retrace_pointer =3D mmap64(0, len, prot, flags, fd_retra=
ce, off);
 =09else
 =09=09buf_address_retrace_pointer =3D mmap(0, len, prot, flags, fd_retrace=
, off);
+#else
+=09buf_address_retrace_pointer =3D mmap(0, len, prot, flags, fd_retrace, o=
ff);
+#endif
=20
 =09if (buf_address_retrace_pointer =3D=3D MAP_FAILED) {
+#if defined(linux) && defined(__GLIBC__)
 =09=09if (is_mmap64)
 =09=09=09perror("mmap64");
 =09=09else
 =09=09=09perror("mmap");
+#else
+        perror("mmap");
+#endif
 =09=09debug_line_info();
 =09=09print_context();
 =09=09exit(EXIT_FAILURE);
@@ -116,10 +128,14 @@ void retrace_open(json_object *jobj, bool is_open64)
 =09int fd_trace =3D json_object_get_int(fd_trace_obj);
=20
 =09json_object *open_args_obj;
+#if defined(linux) && defined(__GLIBC__)
 =09if (is_open64)
 =09=09json_object_object_get_ex(jobj, "open64", &open_args_obj);
 =09else
 =09=09json_object_object_get_ex(jobj, "open", &open_args_obj);
+#else
+=09json_object_object_get_ex(jobj, "open", &open_args_obj);
+#endif
=20
 =09json_object *path_obj;
 =09std::string path_trace;
@@ -148,10 +164,14 @@ void retrace_open(json_object *jobj, bool is_open64)
 =09=09mode =3D s2number(json_object_get_string(mode_obj));
=20
 =09int fd_retrace =3D 0;
+#if defined(linux) && defined(__GLIBC__)
 =09if (is_open64)
 =09=09fd_retrace =3D open64(path_retrace.c_str(), oflag, mode);
 =09else
 =09=09fd_retrace =3D open(path_retrace.c_str(), oflag, mode);
+#else
+=09fd_retrace =3D open(path_retrace.c_str(), oflag, mode);
+#endif
=20
 =09if (fd_retrace <=3D 0) {
 =09=09line_info("\n\tCan't open: %s", path_retrace.c_str());
@@ -162,10 +182,14 @@ void retrace_open(json_object *jobj, bool is_open64)
=20
 =09if (is_verbose() || errno !=3D 0) {
 =09=09fprintf(stderr, "path: %s ", path_retrace.c_str());
+#if defined(linux) && defined(__GLIBC__)
 =09=09if (is_open64)
 =09=09=09perror("open64");
 =09=09else
 =09=09=09perror("open");
+#else
+=09=09perror("open");
+#endif
 =09=09debug_line_info();
 =09=09print_context();
 =09}
--=20
2.34.1


