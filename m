Return-Path: <linux-media+bounces-48801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8D7CBDA70
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 12:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 939D5305A627
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 11:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C4233710F;
	Mon, 15 Dec 2025 11:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jugKXGms"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D50C336ECE
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765799327; cv=none; b=P8HFviHK+CHy5+vL+N3waoHEIUBpXPOT68vQWOmd8JOXRZw/ZKEtdR8JfNUKv3DlbOxLdpPpMSxw/g2/Cw4n3FdxT/NVWNI55rPXu7l4WOwmlAqlTz6gilzW20/RG4ToQcYW4UkOYXHqAEM66DsaVgJaDsABzaaQK+4KoQtqKLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765799327; c=relaxed/simple;
	bh=j4BXJJMKUhATWUahdKX0lx9i399WYlQDn9Ep3/iweMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o7WZ62QFLfJIaeBGa0uZoxHtJwluy6rP0YH1ss4z24qzXMadOCZo3lgtWudiah46PGVaq9QG6SszOestU86e3iLdn5lT9znIfr6qJVYX2pDn6Pr/bafHy+N/etRSdLbrvmLiq8StOUmWk4kZZd1WmYn8skzlG82hccld2ExJ/5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jugKXGms; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34c2f52585fso2095625a91.1
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 03:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765799325; x=1766404125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPi/WFWmImBnVQgsxNvJvJyvieXM1xBFzKoWis67Gg4=;
        b=jugKXGms55KjI7dm+Ngj5mkaNRmEES0y5Y4XUHHbi0cafbA7zcE3YYjZANhHpp1mNX
         udPxqSNE9bs8fKuDobrDGOQLjqo5sy93hhb+2yTKDIgHzvN/UYLLbvE874kCNAROCX8u
         xK/ZZHstkmWGuuoNqrknGGmGQE0C4oCK7t8tegdv2wy7W8Yf7eV92nwqyet9rcFRZlLx
         RPV6oFJl3KZB9hOrZRnX7eyF/t43UWIdx4ZwYg7ty4R3z97ccbApd5GjB2a0zLj3yfWE
         vRs5Vu7vSGjCB954n8oagczLg3R5uNMOc1hF1lN5KqMqFsjQUFzFuxvjGdKOSCaHfXn3
         ML0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765799325; x=1766404125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HPi/WFWmImBnVQgsxNvJvJyvieXM1xBFzKoWis67Gg4=;
        b=vemDTp9Cai/2LfDTT6r2+VyLWZeXvktlMQ11vfn8HGOzqIa3GmczaiFHKdyjG7DGQi
         nanBWERZiQyHwBu4cmjZZR9q6tDXsU+h7jiv41qXHHr1bxfJgI3+jEUzPuICqW5+DSBL
         ib9nxjnN8oGHNNAZk5NWcd/o7dSg9D2zfKd8p2CfiPhI/fdej9ah9iAQZJNku7US2tGa
         E1z0h0DrIqB/Kk6JWp10R2Wwc6Zs8/bIObvDB0YliR7quHmEPiW1dQuAZ1uJ6Clj0oHe
         kOW5xnN1vH88+lVv4RyMYxkJzmGNU5zN4yWwDkPjoYhmTfyCntm8/zPwS6ATiPOZXrVb
         W73Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYUwtl0nTlAs+mzM4iUk6bAmGKNjpmHG+JG39YcQHi1jzVfK0lskFuVHeccud5HwdCDfiGEvCt2Uukuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmgXSQLGvOSmmIKHXt0Htx3tFBTOqDA9xSdQbe4o+V0+8UIQ1A
	Bnv9T0I/P8wujotMwEJJxyQDhciuwua0uk05tx+6qDCJY9zJIUdA+3uy
X-Gm-Gg: AY/fxX6Agv5wGVwYh3OfBXU0isssccLUAC9nQCaA7FBiu9D1nqFlwuwV0Z+5MdCq4y3
	j0x7KlGPeSZY8RWREX1LAPL115jzgAur+pSovXPDN22H5z3E4/6eysRgodm+GnkUyKi4Rs/Ii1u
	YE69RWE/KpB2YXD3nt6uz9x1uhQUMdQGqX4ekSsGn72JHycFc2tc+UkGwLbRuCuidDJkQyXwSag
	D4SPAv+3rW3oJUQLP3l5JvhGvNRVS6wJBFfHAG/rVLB2jvGpAG9GNLggCiIMgSScZlPEyKipWem
	kewS1KKDtjJZVT6r/le8JyvqDgnVnsBSNXoKimQjz35SNYUZIUOQ/UVs2L5fTfBjID2PbUjdaWi
	pMnzcnaU685ZYE/+j1o1OpZzXsXx9gAXtqSSV3xhuHPVmPAYF6RxzS/HyBaa0hcKoA2vmqbMDBF
	W0RgrfvBXrE8JseO1eUEqz1Q==
X-Google-Smtp-Source: AGHT+IHySr1buuGxwyvRmyNwB1yX2aGVZnCno4j9FG3NSChYg8gy/QOhSf79+qyZQv+BzWWdtgvcAQ==
X-Received: by 2002:a17:90b:388a:b0:340:be40:fe0c with SMTP id 98e67ed59e1d1-34abe4a6b3amr9032481a91.36.1765799324639;
        Mon, 15 Dec 2025 03:48:44 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe3ba59bsm9003471a91.7.2025.12.15.03.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 03:48:42 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 60C6F447330B; Mon, 15 Dec 2025 18:39:07 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Filesystems Development <linux-fsdevel@vger.kernel.org>,
	Linux Media <linux-media@vger.kernel.org>,
	linaro-mm-sig@lists.linaro.org,
	kasan-dev@googlegroups.com,
	Linux Virtualization <virtualization@lists.linux.dev>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Network Bridge <bridge@lists.linux.dev>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Taimur Hassan <Syed.Hassan@amd.com>,
	Wayne Lin <Wayne.Lin@amd.com>,
	Alex Hung <alex.hung@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Dillon Varone <Dillon.Varone@amd.com>,
	George Shen <george.shen@amd.com>,
	Aric Cyr <aric.cyr@amd.com>,
	Cruise Hung <Cruise.Hung@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Dominik Kaszewski <dominik.kaszewski@amd.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	"Nysal Jan K.A." <nysal@linux.ibm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Alexey Skidanov <alexey.skidanov@intel.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Vitaly Wool <vitaly.wool@konsulko.se>,
	Harry Yoo <harry.yoo@oracle.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	NeilBrown <neil@brown.name>,
	Amir Goldstein <amir73il@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Ivan Lipski <ivan.lipski@amd.com>,
	Tao Zhou <tao.zhou1@amd.com>,
	YiPeng Chai <YiPeng.Chai@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Luben Tuikov <luben.tuikov@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Roopa Prabhu <roopa@cumulusnetworks.com>,
	Mao Zhu <zhumao001@208suo.com>,
	Shaomin Deng <dengshaomin@cdjrlc.com>,
	Charles Han <hanchunchao@inspur.com>,
	Jilin Yuan <yuanjilin@cdjrlc.com>,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
	George Anthony Vernon <contact@gvernon.com>
Subject: [PATCH 13/14] drm/gpusvm: Fix drm_gpusvm_pages_valid_unlocked() kernel-doc comment
Date: Mon, 15 Dec 2025 18:39:01 +0700
Message-ID: <20251215113903.46555-14-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215113903.46555-1-bagasdotme@gmail.com>
References: <20251215113903.46555-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611; i=bagasdotme@gmail.com; h=from:subject; bh=j4BXJJMKUhATWUahdKX0lx9i399WYlQDn9Ep3/iweMY=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJn2n0OumS5gNW5/3GqYe0vV4BnvxdVlFyqnrRPWP9PpP u3FMcecjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEykPJ/hF9Pft9/+BqzKa/W8 rdg9vSMz5a6N4PnTByKYzgTJnWZ/P5Hhn+aKvLS4vrtB9w7NNb77cZZgzZ2+T776O+w93L/xls2 5xAgA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Commit 6364afd532bcab ("drm/gpusvm: refactor core API to use pages struct")
renames drm_gpusvm_range_pages_valid_unlocked() to
drm_gpusvm_pages_valid_unlocked(), but its kernel-doc comment gets
stale, hence kernel-doc complains:

WARNING: ./drivers/gpu/drm/drm_gpusvm.c:1229 function parameter 'svm_pages' not described in 'drm_gpusvm_pages_valid_unlocked'
WARNING: ./drivers/gpu/drm/drm_gpusvm.c:1229 expecting prototype for drm_gpusvm_range_pages_valid_unlocked(). Prototype was for drm_gpusvm_pages_valid_unlocked() instead

Fix them up.

Fixes: 6364afd532bcab ("drm/gpusvm: refactor core API to use pages struct")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 73e550c8ff8c98..fcfbe8c062bf6d 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1216,9 +1216,9 @@ bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
 
 /**
- * drm_gpusvm_range_pages_valid_unlocked() - GPU SVM range pages valid unlocked
+ * drm_gpusvm_pages_valid_unlocked() - GPU SVM range pages valid unlocked
  * @gpusvm: Pointer to the GPU SVM structure
- * @range: Pointer to the GPU SVM range structure
+ * @svm_pages: Pointer to the GPU SVM pages
  *
  * This function determines if a GPU SVM range pages are valid. Expected be
  * called without holding gpusvm->notifier_lock.
-- 
An old man doll... just what I always wanted! - Clara


