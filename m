Return-Path: <linux-media+bounces-48786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A35CBD8EA
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 12:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE4C23027A59
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 11:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F26330D5E;
	Mon, 15 Dec 2025 11:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dp7qmVKc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC5332F756
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 11:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765798754; cv=none; b=OLAO/G8aaitOAQK/AKJPPU/dlDNzATlkD9GfXiOTxGThhMFI35vuCiJkyLRBmHl5fLsZWO5UtERFvNTe4cXd/kzjnQvdw3oaoa4U9hIYmKbEMNWEyN84AET1WZA3X6Ia0xtvb1UJx+bE0yaeMreU10biV+I6yHS2RyJrAyWpWXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765798754; c=relaxed/simple;
	bh=zPsruu4atyDYOaQCsKIEqnFkDKfYqb53HHp2txNqt3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OZgbqTXOTyoyoD1sr1pX6vJhgabnlaO2zC6u7QWcBlYywUiBmcbDrULvttvpBsQc/qhs5TKV8TLivzhYt+fP6RnJZm5Qevs75TSt6APmv4IPROSXMGk3wFFRmDY+vmxD1Mhs/oBOn8pwHprwiLwLpnmGdJVH3+9I0h1z1rGxNx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dp7qmVKc; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34a2acb736eso2597373a91.1
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 03:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765798750; x=1766403550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rTcY4k7PJNNctnILuEp0lcvqj1X2scOTc/Z894ZNYfE=;
        b=Dp7qmVKcExXctNON7Rvr0aEjsaCCoZNzWrSMPhhfOviKwg7VNGmmxGyyA2Pe64uOM0
         hKv8rnuJBeHdJjKgryy35NmqVHt0jhdO1F4uoITmCiewOfdg/RHQsXK0kTGSWjrwPiDA
         /icOsW9xAH7gYJhTCqd3SeDs3UN9BbC7UbrD56I7u79mFF2a1PvNxAudCEjIYmxc52lp
         WYI0bxxpXk8bgrE17zBdEGZeQdVwVdZbM6RMpI5tmBr1FgPN0KLQV8uKlUS51Ta4ZYFj
         UKculz7RBCZ1yE2Y/jh+KhsjU9feJToSej57Q2kj/TpnFW2K/sInFKdnldrIlRH6G5Sx
         1Kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765798750; x=1766403550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTcY4k7PJNNctnILuEp0lcvqj1X2scOTc/Z894ZNYfE=;
        b=ShltqiJFPwnjSCg6PgEgqHhDBUQZ/1KY1BjZhlakKQvjakznDcdprUYLHhsZqt6Rky
         DB1y36CqvWUlkHDC+vFxbLYcIeCBnbpLAvPSIA+63xbC9JtuxblXjjj52s56irIWWBDU
         5ZfeL1ycpWiDF+EuwWF5yiEz5C0ok3QvxaVCgLrPoQaZAjNjEUIptKaRI/TzjSf++KNl
         G8ynw4TmWMbyzn8BTTlwAjLBmQkUDhsRRxAhq6dTVLvr8u71w2W8WPXvWpgfXmxhIRzo
         GlUuiee95vgVqQIykd0/qNAuXOZ9A4Dxao0PuEQHPa5AQzLNyf00H0pJuzYtl3bhaN9z
         xOoA==
X-Forwarded-Encrypted: i=1; AJvYcCXHpRIidyewRlkKVWEz82FsVol1m66pNGJEYVQjNASXZQohbI4Lv7+rL/jNvxtweO/rnfJy7vXf48ZNNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKe/wMZVWSyB+PF1jcBQIJU/y1qDCrnbPQKYPrKKvILbepx80f
	rK710DHKIChusn/14U0fdxJC4A3KZ60ck5HZyzTCWNQTe063qM+xKqTG
X-Gm-Gg: AY/fxX7VdahB9AwecVksCvjRrXSv9tWUz7v4NojG2uMTMfyT17PBLBSSvnl3JyCZRMM
	nHN5foiqVfOEneUOSGMHmyT0s3s1YBpa0d/nuFgmXtV3ZcJX13WIYumZESOsOqNtqaUA93Bcl4Z
	AFziyyAMHfC6EYJb7NvIxgTRhz5i2I5ARa7xz9ewVM52Uc7FMUd5gGcTQU2RQAWuXZe58KEYTCl
	U9avQtKie/JD9QFziI5hPZ8yL2eHvIpynRuRJ3EYMoj+fzrJhBfT3yKZAaD+T5HbIKSd8bSt7G2
	GEhCZ9+hB24nuiOWctXnRUYdgBS36uLVifelzY5MkbQeZ7ecE5ihRrKsdnk7u05H7MuyVb3OU1v
	L9jDMP4IkO72FdD4WpP6HmWuCLsimqJZa0t9T4p89i7+cIVfLln1WsbvSbF3CBBrGeglcth16VL
	cVHqn5Y4HESbYKYBlYdi0xzg==
X-Google-Smtp-Source: AGHT+IH7Y0ZP0SVYlRqXrzHx+fOVv/+/V5Bjimjq/e2I+okG90jQDlqbjW8VY0Em0JiciGGZ262G7g==
X-Received: by 2002:a17:902:c402:b0:295:c2e7:7199 with SMTP id d9443c01a7336-29f23c7b8b9mr114062105ad.29.1765798749863;
        Mon, 15 Dec 2025 03:39:09 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b3850csm133386495ad.17.2025.12.15.03.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 03:39:08 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id AC75C444B38F; Mon, 15 Dec 2025 18:39:05 +0700 (WIB)
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
Subject: [PATCH 00/14] Assorted kernel-doc fixes
Date: Mon, 15 Dec 2025 18:38:48 +0700
Message-ID: <20251215113903.46555-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2064; i=bagasdotme@gmail.com; h=from:subject; bh=zPsruu4atyDYOaQCsKIEqnFkDKfYqb53HHp2txNqt3A=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJn2n4MMm/867RRu9s/LeXucS+TRacFsjy3x8goRK//G7 Jyfu8O1o5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABOJ+cjwP9rl0j2O1i3mgnEF j0tV/6z5nLTvdKmsJY/NvB286XtLTzEy7D+8+dTHe63Sb6bPXnHWT1NH5vPMzba75Xe45yw3OaR ZzAUA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here are assorted kernel-doc fixes for 6.19 cycle. As the name
implies, for the merging strategy, the patches can be taken by
respective maintainers to appropriate fixes branches (targetting
6.19 of course) (e.g. for mm it will be mm-hotfixes).

Enjoy!

Bagas Sanjaya (14):
  genalloc: Describe @start_addr parameter in genpool_algo_t
  mm: Describe @flags parameter in memalloc_flags_save()
  textsearch: Describe @list member in ts_ops search
  mm: vmalloc: Fix up vrealloc_node_align() kernel-doc macro name
  mm, kfence: Describe @slab parameter in __kfence_obj_info()
  virtio: Describe @map and @vmap members in virtio_device struct
  fs: Describe @isnew parameter in ilookup5_nowait()
  VFS: fix __start_dirop() kernel-doc warnings
  drm/amd/display: Don't use kernel-doc comment in
    dc_register_software_state struct
  drm/amdgpu: Describe @AMD_IP_BLOCK_TYPE_RAS in amd_ip_block_type enum
  drm/gem/shmem: Describe @shmem and @size parameters
  drm/scheduler: Describe @result in drm_sched_job_done()
  drm/gpusvm: Fix drm_gpusvm_pages_valid_unlocked() kernel-doc comment
  net: bridge: Describe @tunnel_hash member in net_bridge_vlan_group
    struct

 drivers/gpu/drm/amd/display/dc/dc.h      | 2 +-
 drivers/gpu/drm/amd/include/amd_shared.h | 1 +
 drivers/gpu/drm/drm_gem_shmem_helper.c   | 3 ++-
 drivers/gpu/drm/drm_gpusvm.c             | 4 ++--
 drivers/gpu/drm/scheduler/sched_main.c   | 1 +
 fs/inode.c                               | 1 +
 fs/namei.c                               | 3 ++-
 include/linux/genalloc.h                 | 1 +
 include/linux/kfence.h                   | 1 +
 include/linux/sched/mm.h                 | 1 +
 include/linux/textsearch.h               | 1 +
 include/linux/virtio.h                   | 2 ++
 mm/vmalloc.c                             | 2 +-
 net/bridge/br_private.h                  | 1 +
 14 files changed, 18 insertions(+), 6 deletions(-)


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
An old man doll... just what I always wanted! - Clara


