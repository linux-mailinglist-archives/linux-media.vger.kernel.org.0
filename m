Return-Path: <linux-media+bounces-12574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1620E8FC9BE
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 13:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A95FD28263F
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 11:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF451922F6;
	Wed,  5 Jun 2024 11:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ffAS1vBu"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388B71946D3
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 11:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717585756; cv=none; b=mHP3+nBKndVN154e+1iyc7zK9n0faefB736OzQ+wQ4y0yUC5yAufWkDwUmBDoSuabcqI1bN97L8pMo1z2aq0C5XsCbsToyKoFCNRnolj/fmpDLYzVfVwEMrA1E6RVf4zFKVV3wVK1VJYLCj6rOz6X0wn0YIH8iWjFtEO+ffkXdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717585756; c=relaxed/simple;
	bh=8Xx1ouwwexCtSNH14UOczjxunvtAa6ek+PdnfDHEF/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f4FGU8ICLFruN/jfMtbjT73qQt/lMz6qJdo1TxAtC5ik+Y5z1YXQ1U8OodG3wYhWXyC+3j17KcmkWGChnSU4Mbo0AUx5r6Q6m+tb9yxtHbZtfAy5AOSALlYhKYfwpHvQYxDESduiYVnJKQaQpHQ4nztxkQqMITwK0se4M85da3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ffAS1vBu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717585754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tncC1Ez6NP/HHqgcRSeNYywzHgA1laaS8gNo9KdTqbI=;
	b=ffAS1vBu5hYs3pR8XqtgAaDaNR0K5lcK7L82Gk4mUvZOwaGJlcUyhnzLO2GzO+sCNi5IZR
	vI5O5006SvqDxcUNcLAZFn2kNvs0qqwmSS8pFnEl0EYMzvoR0basouXpd80gjCWwdq4ajn
	BwZFAV2Ujtz9E6lo4EwUz3sv/anE/Wg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-sKZnt866ND2m4CtqHN9HhA-1; Wed, 05 Jun 2024 07:09:12 -0400
X-MC-Unique: sKZnt866ND2m4CtqHN9HhA-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7951f93b044so100750385a.1
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2024 04:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717585751; x=1718190551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tncC1Ez6NP/HHqgcRSeNYywzHgA1laaS8gNo9KdTqbI=;
        b=K6+wFx6BDMdzBUG16Kvs6LsiRVho6B35tJ5z1yPRC5/cvkq+7cpBDg9Y1FQTj6fCMn
         jPHeOO3iWCoRvcFT0f7klZKD3xFrTxa41FBxaZX0tqJHWj43loFm6akXvsZmLyX9EhNx
         mGddWCUN1dRRD+C2sks91NrmNJXqJD7i/5ErAXWT47qYpiyGoMd0Ei2JdqaYwkPiro+N
         KFxKnL72Fr+UE6abkQAgSc46aO/1TsGW14+e37u1EMeFtSHqniI8XCqEQwtRom1UDqtk
         IyeFUsHS/0QRRDALemnqv8Dd2nj1BYoaRmlaiywUbXgfOehv1aOagHwWqHRfyLGBitwm
         zWRw==
X-Gm-Message-State: AOJu0Yy22uFtZ2WcG9ilPmFBrTL2WBGqzjj10aOO5IBtSMBIq0Ts07Dy
	WaMJRWoqlxsa1u2CSOv28naxEE+GXyy4CufmNBg65A6N22P7sDwUsYoogwsR1+Vu6qICH3C+xPN
	oGp6fj22/JL5TYrbratOilSg0eL6XDzYbOfUG9KptJ1puB0kvMvQ0tnZVShDR0g96SsnIlgIsYz
	B6Q0rWczKYo97RJEQxCKio2DRXZKQjiYlZghMTEg+XuieU5zahaO8gtLc=
X-Received: by 2002:a05:6214:3da1:b0:6ad:9cc3:4e0a with SMTP id 6a1803df08f44-6b030a86602mr22245826d6.58.1717585750907;
        Wed, 05 Jun 2024 04:09:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeUoMOpT6N8jHTEiIoA//pq3/H+gTrcVWJpuhNcN7bglDP9qYU60nE4P/hUHBHlVwZ55aOKQ==
X-Received: by 2002:a05:6214:3da1:b0:6ad:9cc3:4e0a with SMTP id 6a1803df08f44-6b030a86602mr22245676d6.58.1717585750445;
        Wed, 05 Jun 2024 04:09:10 -0700 (PDT)
Received: from toolbox.redhat.com ([2001:9e8:89ab:ee00:9c20:c1a3:e856:8e0e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44004d1d721sm41751251cf.76.2024.06.05.04.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 04:09:10 -0700 (PDT)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/3] edid-decode: build: compile with -Wno-variadic-macros
Date: Wed,  5 Jun 2024 13:09:01 +0200
Message-ID: <20240605110907.621053-1-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git ./meson.build ../meson.build
index ca57652..80f810f 100644
--- ./meson.build
+++ ../meson.build
@@ -7,6 +7,7 @@ edid_decode_args = [
 	'-Wno-missing-field-initializers',
 	'-Wno-unused-parameter',
 	'-Wimplicit-fallthrough',
+	'-Wno-variadic-macros',
 ]
 edid_decode_link_args = []
 
-- 
2.45.0


