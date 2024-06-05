Return-Path: <linux-media+bounces-12577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DD68FC9C6
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 13:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C43001F22DC2
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 11:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51905192B96;
	Wed,  5 Jun 2024 11:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F2joNWnH"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0A7192B7E
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 11:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717585759; cv=none; b=mouX7iKycD6vrSRexqV5k9MH7O9jHHkgPxJ9UI8tif7kYlpsYXgxZ96JzmT9UDgdqX21v9LqcAP2nsT6fkEawkv+FIRZYXPEfO762pXD44/j7qGa/BPA4AP5LVOrPlbzdZGLiVC1ufWruuRq12wNJaTt9OuZXfbKZpjD8WHfhyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717585759; c=relaxed/simple;
	bh=iImGoKeFjJfWzgVTBUsLo958ohMslXbCGsb7K9S05tU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pkfi8Ddn9RuNlyOh0+FDfMRmR5R2qS8g9vIB8jm+mvSoF9GHZKO231uRvY9Tqyj5a0GeI9nID3MPKaoXEVYGbhs6RtQzR0RkrHhcTenXoS5u+aF3zbGXXHkLRJOKlJUa5XB+3SI7IuxuQ/x3IYq/Lbw+qto9lDLQ92nNWzyfffQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F2joNWnH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717585757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lV7Ow1TdzpOe7xTt5RFUvyWpCObgZAo3DQb2a1qFqI8=;
	b=F2joNWnHoIsDd2jQqgO7SUv6qdEJ1CAel3VCUBPire3FxRBImeU822rKig/x50OIPcpJ2q
	bp37mP5Zsf6rDRNi1rvj3myDsxYohbN3ggbVpQXxW5AxmUXT9SgWibKonhqenVmX9yIhSe
	z1keORqSddo9bLJdzIeiE43oP0yKBLs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-1GIAo8BHMJiuW_zTny7Xtg-1; Wed, 05 Jun 2024 07:09:16 -0400
X-MC-Unique: 1GIAo8BHMJiuW_zTny7Xtg-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-43fb0a1c81eso60848221cf.3
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2024 04:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717585755; x=1718190555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lV7Ow1TdzpOe7xTt5RFUvyWpCObgZAo3DQb2a1qFqI8=;
        b=FKE3Q4H5enmnsVc7tSWpkxmkNwdmNZcKjGLDv2qazQuFkGNwJmm8wIsmvGOEr9QTur
         LVGIef6b6IqFCtQ07iscuT8ZAruiSM0oheq76l4y2MYYEfAZZK+BxyAh4Vc18FfY0cFj
         dp9e27paI1xqOC7ofXCdPRqQm19Cg2AIWMxklCFoylyLsVqlzMg1JDroVwNCcDYLKzw4
         pO9vjPlZBlhlx5Z+eI7+frib4FGgN3NDprFUUx0plBeLS+tx8rKTohtRKQ2KwFV5ItzX
         p3wu0MLxxYJag9SnDg+VoP/O5SW7iwRKJFQtp03PAI4UJO6k6LUhEQKw5doAUKUoJ2V9
         ywnA==
X-Gm-Message-State: AOJu0YxU437MOoWlRYbvbW0ALIkEca3kOaa60JjsbFh8X7BeBmFOdOna
	4Y6BIKe14VzpT9uun0lyDaKQbO8Mcdh/77BEnFjJNLTnmMOkanj1ya1Hok2B+Di0iQrk7hy77fT
	2f4+yahqys9E21u4xu6xIsVYY6UvMKl9K9iUOkQyjF7m2Yo5OvVoL99vcjW4d4UZP2HCkTZIO99
	fCj3y0OGNK4SiH5Eg3pQfOC8xg+gdeqgkjcWyVL/O0r3Nh6TcKoL/BaNc=
X-Received: by 2002:ac8:5e08:0:b0:43f:f10b:6cd3 with SMTP id d75a77b69052e-4402b64b6d5mr22626941cf.28.1717585754628;
        Wed, 05 Jun 2024 04:09:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7Q7xKgVqeuPf96tBjlyMU0OsJQfSTbXTV/ekhJXqoxrRkBhf01TQK5XzFSIIIH58+lRBZ2w==
X-Received: by 2002:ac8:5e08:0:b0:43f:f10b:6cd3 with SMTP id d75a77b69052e-4402b64b6d5mr22626721cf.28.1717585754211;
        Wed, 05 Jun 2024 04:09:14 -0700 (PDT)
Received: from toolbox.redhat.com ([2001:9e8:89ab:ee00:9c20:c1a3:e856:8e0e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44004d1d721sm41751251cf.76.2024.06.05.04.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 04:09:13 -0700 (PDT)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/3] edid-decode: build: Use override_find_program to help subproject usage
Date: Wed,  5 Jun 2024 13:09:03 +0200
Message-ID: <20240605110907.621053-3-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240605110907.621053-1-sebastian.wick@redhat.com>
References: <20240605110907.621053-1-sebastian.wick@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the following possible when edid-decode is a subproject:

    subproject('edid-decode')
    edid_decode = find_program('edid-decode')

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git ./meson.build ../meson.build
index e61d544..a3f4512 100644
--- ./meson.build
+++ ../meson.build
@@ -67,4 +67,9 @@ edid_decode = executable(
 	install: true,
 )
 
-install_man('edid-decode.1')
\ No newline at end of file
+meson.override_find_program(
+	'edid-decode',
+	edid_decode,
+)
+
+install_man('edid-decode.1')
-- 
2.45.0


