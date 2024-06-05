Return-Path: <linux-media+bounces-12576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC258FC9C4
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 13:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F07181F22DE5
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 11:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B94C192B7F;
	Wed,  5 Jun 2024 11:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BfwyfXZ7"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC1A19149B
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 11:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717585757; cv=none; b=eoGnwbXQLyZNgthj9C3iw0R+4KOaQrKkIYZo/IU3Ejz+1bguw16jbE6VfbfkgenCeoFoVNPFeWVVY2liLkfI61pJ/aGd/2CUAbDsoVvNejfH3mVJ64SUSC7za+BmB8EfiYo6ZEqlAwNlIrfm5vP42sxfceh9abrjo5c358ekEss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717585757; c=relaxed/simple;
	bh=NfhTMeeFZ0gdnrW8NaC8fVPJp5q34DVNef9uCbb6ZUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RLpZhJs9c+kLYqNl3lO+7ZhkQU2PGA9vCcmC6oWK9gTBMZMXRk3Bqs4TIsCJ1akrCxTLqtQtmJ8/LCtGNUgX5zEABqYepPNSi8rkB/+dxK15zqFO5x39sCKDrtjeC1TmXInBZNXc+RQ4Li2EJg2AGLCgmPD4qdMpGI9YgF2Pcaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BfwyfXZ7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717585755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mfaWYxcmiaPvF0UmOwWEXRvpz9w/dNWmHf2Berf4sEE=;
	b=BfwyfXZ7Vlo7phwPL9+K2HDn+ObOhR9nsbbCFMpCAlR+Am2Tiwbc+y/2o09FDoibfMPdLH
	QQICz5HT1xIbIXryBAAZmjFRMs53pfKOC4UN3A2+ekgKIKoOgXuNU4nQT7KBXVfMN5Vqln
	NEmK4w1+JPrOAuiIb3oAJ793V7yxdps=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-GEg4YfAyP4uZfIr0GbYYBw-1; Wed, 05 Jun 2024 07:09:14 -0400
X-MC-Unique: GEg4YfAyP4uZfIr0GbYYBw-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-44029d337c6so11415841cf.3
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2024 04:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717585753; x=1718190553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfaWYxcmiaPvF0UmOwWEXRvpz9w/dNWmHf2Berf4sEE=;
        b=Z0/5QBHU8+z++MBvC5osJjAE1BB7DH62p5sk2nxH9dSekYUWSQFUCS0BxPHydrNIh4
         7P0NzCN5k9SWiceTCPk2jsZT48V9+hVaiiH7PekuxxX9zqntU2GgKWVMWq229n7HzGF6
         DcYyuAhsvF6RQYdtBFJfRh7wNfZAG/KT1N4ueSc41FCu44pShJXCuYmcbODTaqM5i6V5
         1VPrk06amjG3twDnCXocCBXseCE2vlg6sf8P12LkwxPBhoEDL1AvV5warXagI/qU8wXZ
         5BbEekOXLSMgOemfBmtjGHyHOwRAdKVgzYPwNGtxuI1hxGJxgpMSTIU+PbjPiL918nn6
         OkXg==
X-Gm-Message-State: AOJu0Yxy1XlYELVyUui8BsdS3RLgPIElut8jNV3xPp9tYV9t56fKuYKv
	MgK8oJmM5KsPuLT2gHPoJVdK07dIBzgnW2mkbKZHyOvYfzea8esBPZaMwegWR7Tu3Ytg/GkC9lc
	rcIH4RMVCYwT/L97srCff1a9CpL5VLJIBARbw8o/+zG8qcmnvrr38ftcMaL5u3+3xsxBFgGxzVS
	m0R5EaQXaoSxYyjKjU4a62JoiZlyyn7IEt4O+GSvDQOj0Ffu/7GwwNYFE=
X-Received: by 2002:ac8:5a86:0:b0:440:287b:3479 with SMTP id d75a77b69052e-4402b57eccamr26780731cf.14.1717585752797;
        Wed, 05 Jun 2024 04:09:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaf+a29T7/X8vZO9pY//Ui1jK3hJqHedOajgnXJR9AeLGRiV9HpcseLKJ+CvCi09tfOVqLzQ==
X-Received: by 2002:ac8:5a86:0:b0:440:287b:3479 with SMTP id d75a77b69052e-4402b57eccamr26780411cf.14.1717585752227;
        Wed, 05 Jun 2024 04:09:12 -0700 (PDT)
Received: from toolbox.redhat.com ([2001:9e8:89ab:ee00:9c20:c1a3:e856:8e0e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44004d1d721sm41751251cf.76.2024.06.05.04.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 04:09:11 -0700 (PDT)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/3] edid-decode: build: Move sources to its own variable and fix formatting
Date: Wed,  5 Jun 2024 13:09:02 +0200
Message-ID: <20240605110907.621053-2-sebastian.wick@redhat.com>
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

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 meson.build | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git ./meson.build ../meson.build
index 80f810f..e61d544 100644
--- ./meson.build
+++ ../meson.build
@@ -47,8 +47,7 @@ if target_machine.system() == 'emscripten'
 	endforeach
 endif
 
-edid_decode = executable(
-	'edid-decode',
+edid_decode_sources = [
 	'calc-gtf-cvt.cpp',
 	'calc-ovt.cpp',
 	'edid-decode.cpp',
@@ -58,9 +57,14 @@ edid_decode = executable(
 	'parse-displayid-block.cpp',
 	'parse-ls-ext-block.cpp',
 	'parse-vtb-ext-block.cpp',
-	cpp_args : edid_decode_args,
+]
+
+edid_decode = executable(
+	'edid-decode',
+	sources: edid_decode_sources,
+	cpp_args: edid_decode_args,
 	link_args: edid_decode_link_args,
-	install : true,
+	install: true,
 )
 
 install_man('edid-decode.1')
\ No newline at end of file
-- 
2.45.0


