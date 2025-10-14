Return-Path: <linux-media+bounces-44342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77974BD79A3
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A250818A4710
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 06:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD872D248A;
	Tue, 14 Oct 2025 06:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ga5U1W9x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8232F2C11F9
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760424268; cv=none; b=em/s17Kbdqlk+CVpLsRrTIJdZ0uajf10xls2lJvcpIu0DndNhO4i1ZFceAAns6SQbZkaExBIf7kCL5UWzKj/jPMxaxITzrofZzafUVNEVj5AlW/1MVXSTWodClclK2RpXmpON+OPw74fRUmNSS4eSWXWkZyYKZiENBqc1WkFKNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760424268; c=relaxed/simple;
	bh=V+CC6CqFHTaY1+NyeeC+80xDdqCLgT5Z9/vBgh37BLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kaJv6GuSLgciK7fhAobNaINs3NESJKdFmqeY9Hzs/YEhtwsHJ5ZkEGgGrgPCPjm73YzzpB1TljtSpaaLbVBzGEIK39zf57eTrP6c2QfCuCDTaJWmFgUna01ltJvBeQ9YKaZaBAUR9h+iPnlQ0X7qRQ77wpdtIzA1CBLag2lRlNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ga5U1W9x; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-375ff2b3ba4so49175061fa.0
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 23:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760424265; x=1761029065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f5+eQwI0Mb1HF7qS+pk7CGxcaFFpKMarYKASKjNogEU=;
        b=ga5U1W9x1f6TWvN0A/mf/H3nHmuu3XlT06iCzeKiwKQuOk05FS0Om3Dij8mkhf/Mhf
         TEnrOa0KiQo9IlUyITGbWd8UH/Pl3JKqAcagUPhZSCvKMLtXQBpiWS1Ayblr7iBV5DKY
         LNjAHEtNffqqgzbDOZCy/HXjxCGpGafOwecufUKroQQZLv1eaPxoPjjtFEDHaDmrxg8p
         HRfKvJh5xvWcSUo0DjQmLKx12m9c3SycTXkG0yp8CBl7YuoOz95DhC30i7Kv0hZv6s0a
         q318ZhDKyexwjOsCl4NJSM1NxDds+jGdiV/p9URr/OWZYBpp5a8vwhbegl4lZCtQODIk
         M84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760424265; x=1761029065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5+eQwI0Mb1HF7qS+pk7CGxcaFFpKMarYKASKjNogEU=;
        b=nHzkSU7PVORAaT+rpd0dENAxlzcpMKSRo0jJfcNo+6ztLoywnAhmTxLRUUXeLWvkZv
         hszDBnuSAjHO0vhce3ii2UfakGvfhuCmHbiAwj1wqKfaI5IuXITIly+VABIc7SRX7ewA
         1oS5qAT+2DM590yzBeM4EtG2MskzzIwiFuzamVBUyp91QqBmcLfrobbPmASYPKESA14q
         CXf1WEJ+zwOvDpjrCIxDh1gWAKYzSLs/+4iq+8mZCIeQnn7asXQH/ntpmlzBkqJZ+AWG
         VVEzK45UGbp1YaA3A75XSU9AnpyfEzLWNilDL0f8TG4Xi/uvfLT+IppKa4sWGATBqOP5
         8dRw==
X-Forwarded-Encrypted: i=1; AJvYcCVtcvCYKcth3q5hhXLgdGdXm8ieeA64IkbviBQ6bZrtaSrygQ2VQpnpbLE6LIJgAf2Gr4/UMurhMteIUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMolNMRyeXXUOPrjhHwYA1QoniJDJrCQ4aRh1RzHcWEIL8SB9H
	VMz6qbxm0SMlR4HiPF2VYmWqr4CfDwpOc2cnzyoUBbEz3M2J1fHWcVsU
X-Gm-Gg: ASbGncvtOdUIdZ/VASKbRwHM91mZKreJFOU9IXssBcvFhP3DE0guFnmtzwFjC+sR9Hu
	7Kk1mXRBaWLvsrwGLwN4tfhIadocab9k8EFA8465AQ36E4BuaDy11KU/7InZAiUVcqH/vffD7G4
	HNvLaNFyJOxeap0OQFbKZULVdAcAdWk7m+X/omKNClKjYK1r34duaSnmNduRYM9p0JuFZEz23Xo
	j+NJqSXLt1JU6PcaXT/Lr4P2D1UAWyfmXzM3liQfJLOnr7RgHDThb76MDayGKZECSJnNoYaNtyJ
	Un04PW2P64M2t9GNx7ATqm2WKaWBwggp07R115AwwiwOn+l2v9KtUBtKoEjYGOoe5V+x2dqNPm4
	DLgrlpspcdenLpEiknuzeSMn3DjclVbFnqjNMgpAVi16RERsJgtx3EuRN+KBksdXIons+RW/ywy
	YrCT66YmIp1jHUUHkXkE/d9vWR2Q407tSA7+/D7TrIwU3JGw==
X-Google-Smtp-Source: AGHT+IFmJuJ2Gq+zrXFJtzs/AN5vXoWk3MaDdcP/25nb997AM9Z7OgvW2leEKAh+3KjJwP/5Rhr/KA==
X-Received: by 2002:a05:651c:35c5:b0:36f:77e6:d25a with SMTP id 38308e7fff4ca-37609efd7d5mr59354151fa.43.1760424264333;
        Mon, 13 Oct 2025 23:44:24 -0700 (PDT)
Received: from localhost.localdomain (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e7b47ddsm37943311fa.21.2025.10.13.23.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 23:44:24 -0700 (PDT)
From: Alexandr Sapozhnikov <alsp705@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH v2] drm/i915/gem: handle drm_vma_node_allow_once() return value
Date: Tue, 14 Oct 2025 09:44:16 +0300
Message-ID: <20251014064420.11-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing return value handling of drm_vma_node_allow_once() 
since the failure to insert the file tag for the node should 
indicate the whole mmap_offset_attach() failed as well.

v2: update changelog and return error directly as Chris Wilson, 
    Andi Shyti and Ville Syrjala suggested.
link to v1: https://lore.kernel.org/all/20251002084828.11-1-alsp705@gmail.com/

Found by Linux Verification Center (linuxtesting.org) with svace.

Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 75f5b0e871ef..eb76f8f2bd95 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -758,8 +758,11 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
 	mmo = insert_mmo(obj, mmo);
 	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
 out:
-	if (file)
-		drm_vma_node_allow_once(&mmo->vma_node, file);
+	if (file) {
+		err = drm_vma_node_allow_once(&mmo->vma_node, file);
+		if (err)
+			return ERR_PTR(err);
+	}
 	return mmo;
 
 err:
-- 
2.43.0

