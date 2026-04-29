Return-Path: <linux-media+bounces-59999-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL0AFddD8mk+pQEAu9opvQ
	(envelope-from <linux-media+bounces-59999-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 19:45:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5BA498437
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 19:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57573301DADB
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 17:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604E441325C;
	Wed, 29 Apr 2026 17:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRVnuI1j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD9C37E2F8
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 17:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777484630; cv=none; b=M6mqandYdOa9OXkX3m3OZl3ZMfFKZ7CltKmBMwLdTbPb61adkL9VjC/FMg2qIFZ/rjtMQq2FmAvxRku3BnznQK6LjY3ksuWC4NkSASwnIHar3YDFcC+D0hHtB7Xwo5Mkvt5pjKv3d2PAhHwh/mDyzS+oCldQB1WhVLb4xLyQhgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777484630; c=relaxed/simple;
	bh=FWv8xAVhjOsHG/r8SYz7rgNmdbPMPP6ouQo9uLyMjRw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VhTuK4iV11uLBgyFg6OX//9n7IrYpHrGYsy/k2ceuzMsHRrRwOv7+1H4ERtlItfiGWlfVh7hYqD4KY/Z6gGrYVxBfLq9pB7VHTTYCVOXvWdKzuNjOvYuW8x/6OggV1GThfqC282uI79enoiPfHbtYzd1+QmGXlZc1eSLoQVlMNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRVnuI1j; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8eab809593cso2774585a.3
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 10:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777484627; x=1778089427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb+HxubCflTrwQdSnLZzamOr2XwbU81ZyZirOM/E8EU=;
        b=nRVnuI1jMhNB044yjYfONvJsA74m/bHB2KW+7gEB6PpQdzG/EBYp2+PKG5DIVRfV0C
         pGCodCuYZ6mifh6q8PLmHngnPyAh4ZLFqHR6VeafycfaKBcLfdFLilaxMWr3YHI7bluJ
         LPlJZblejYp/BiP9rVRO0CYXmh87mG3hadIHA0ASyLFlb4pqG8iE9v2pvPfBUa6Pf9ev
         GlJmxvutThupuhkK4Wd0GexmsIvB6reWKh90QHLVJDHfUK/Z0NcZj7HHyDJ/mcb5Pt+a
         Y04V3HFHvvV2W973w498h5HA5M0v7FKtYyHdB7MUFSCcn+U/BlqPVEnlPqRsEknUYJ9m
         Xeww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777484627; x=1778089427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tb+HxubCflTrwQdSnLZzamOr2XwbU81ZyZirOM/E8EU=;
        b=HK9sbCHyvi3ihT7TozEw/pK/l7qZcBnx9kciaDzTWu9ctzzfbgARWkemXdUVJOQxQR
         5WcsaU/NOl8vc3Q/zct4agiUE2FMPibu+13ue2HDA1KnDVnDdKAROpcSraOZNUGaVg0T
         e44rhkA3fECon+aCbPXVfvN1jbfjui9Q3GudJw7NHypT75A0WhrkTDdio+FyJBZ3g5+o
         Ku4urONWdkuVdT20hepUTJ57fgf7E+ogp2OljzWa+k67lkuS5+oauRznZcJkWrZpW+cy
         TCdQYFNHHEobOkoKpN7auJ4wkPAYSBrlMlMp8fvu9JLVTFc6X+0KCVO7WL+VozIMClWI
         EFyw==
X-Forwarded-Encrypted: i=1; AFNElJ+CeXcRwJF+atOSLGHYKYeqfQu7jvB8C8RrLre3J5MSaWyPcOxqIWlptcNr/qW9IsDJcxi6bTDW3X8BEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydMH48xRUhafSpgOIm+OLx4nhOwgdXb9YkhyEodKw/v44bI2mm
	EJ2tT4sThwtqriWP2JjxPne5LD3eW/vUG7QCLMjfkTGk45iMBtfZexD3bFQsfoLE3Ic=
X-Gm-Gg: AeBDiet7uDO0UHJVMMHwcNFciv8sxiLFpzZBGlFeWbjVjskIIVn85WaqLj5S3vjpCia
	wtF+7vRlE/CB8uMm1e3o1eZOidAfWB/z01640mmIheXoJ5nsewWSz6CMjdKDcJ6OlwHIawpm/QX
	Adt33CXCFIpfstDryza+8HzaBw8h5MsyR5jo3Y2TYkWoU1Cf+m/NLEwh+uDuJL3pQurqqtQGMuB
	wm1OwM/0H48nXqU26T4BlD0N22O+fS6kkd8t0m2RZ5ZR+pBbUPY67UMW9XFngnr6WIoNMRxUu2l
	TRxN7B8+ZCmvkSAJ07s0ePK8ny9Px0bgiNOHZflCZFpvjPVdU5f8MVmII6bYCKQVufwCv1AGzya
	7GHp5TFPPpG66ZgADfeKShxjXfCNwENjkl4Dmo/sgJtk+W0+hV3gfCJWOBtXb+ezPtRccJi0fbL
	vXCzcHWr9j/PcaT8wWZC9rJukpHbOvDN8USYKEuv5wpVqJIWoYzoC87p4qDz7TZQFcx6SV
X-Received: by 2002:a05:620a:258d:b0:8f2:4470:4796 with SMTP id af79cd13be357-8f7d783482fmr1098536685a.20.1777484627502;
        Wed, 29 Apr 2026 10:43:47 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:cdc9:3f29:858c:a856])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef7ea76esm25330926d6.26.2026.04.29.10.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:43:47 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: ia_css_stream_public: fix typo in ia_css_stream_public.h
Date: Wed, 29 Apr 2026 13:42:41 -0400
Message-Id: <20260429174241.5836-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AE5BA498437
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-59999-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahamaryamjavaid@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Fix spelling mistake: previosly -> previously

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/atomisp/pci/ia_css_stream_public.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
index a505f3797962..ad5c697350e7 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
@@ -225,7 +225,7 @@ ia_css_stream_stop(struct ia_css_stream *stream);
 bool
 ia_css_stream_has_stopped(struct ia_css_stream *stream);
 
-/* @brief	destroy a stream according to the stream seed previosly saved in the seed array.
+/* @brief	destroy a stream according to the stream seed previously saved in the seed array.
  * @param[in]	stream The stream.
  * @return	0 (no other errors are generated now)
  *
-- 
2.34.1


