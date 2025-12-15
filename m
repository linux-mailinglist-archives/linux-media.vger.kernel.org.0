Return-Path: <linux-media+bounces-48794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A32F1CBD9A1
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 12:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31FA63098F80
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 11:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6886C333729;
	Mon, 15 Dec 2025 11:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZ2bPcSy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA19B2BE65C
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765798766; cv=none; b=kr9g69t1+CSrMrD5TcLleGz6paOuGd27EQO9hNfxRnHTJ5XJbB/h7X9zCsXkDZvACHNLvLjfupHm4m4zsMgzZDphq6o+Ic/Uo+fH77XwEP1MQ852sk4nSgNwjshrr6x12WT5IoHGOrz9tePShxsp8DMLALsuUbYz5T9FH4Q/djU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765798766; c=relaxed/simple;
	bh=g0JdaQypaND4lTcW0ZqbYUYcFFa4BCtHp67rCXQ3qdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NVk82lBe/kvO/b+q9FSWZeydiBkLdcVXc2DWC/MdPv1rJFMxYemZ8B0fZntDpjlCbzVN5UTKdHJE0dRtx6ADh0z9Zy0UCnIJGvN6GYbck8EYqecSZf1dRk1alu3hbI6iJTNYeX7YRX/yVYS3jP3U3Eh7mCrMDDOJkaVdLBTred4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZ2bPcSy; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c277ea011so2178408a91.1
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 03:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765798763; x=1766403563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1jHunOtVkIwedmQvRsrzJgL7loZmMhygmTOE5iX6PY=;
        b=QZ2bPcSyG+tJ9fGX18Feb1vqd5n6XetH4ZtDRsUSqe0yejhEagRkvX3mCWc9U94+os
         UODT9B5wXa1p5HcV0/d7C76dd+2ygUmpCdkootvGaVvfnhlLHxZ/KdI3X0SXJVnslw7L
         TwcGhGKgfT1eOdXW9QVdN4wmX8pKMsLeR2c9heaLY49BFjfBZIGrvlKGCDVDTVea54+A
         MM6Nslk1bnsdoYjnf3uMszpQX236vcsnlq7OtjvnbT7de/tNjHxKkYVFkv8fd45JZ8GK
         KsDAMNCiVcJ8e3d1MmzQvF8yVqocfFa+3lW3kPt6OUamaQVk9jX7DHYZNtESB8qvJFZg
         aytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765798763; x=1766403563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c1jHunOtVkIwedmQvRsrzJgL7loZmMhygmTOE5iX6PY=;
        b=PpJCCtoGYLNxsxG2KsH1l2fJGJCauNzOq0o74o80ET2shnIhGpjfoSVD5ZyJ8bt2Iu
         DQPVWJloi9dN0KPUpCKafRAaEwxYC1IbYRQTvsfkBWeB0gPLC8BjoPepIP3ff5VjmxMa
         X7vbj9Mqlm/GFN5WEj8mhzXd6oieluR7r4ZLlGj4jLvEibAYaJtDust/LzCOPm5sT3DA
         bu4sKJsYqZR41V4FUM1rt5hoCi8WPXuJjtrkiBpfcptrKAL93s+kg571RI4R5sUf4LYq
         3OS1BJ3xi/UUY8ltapWKKtPXh17+ARTnA4qn2llrRUXYqxtjOLIWizPxgQLsBLyMj9CP
         ly1g==
X-Forwarded-Encrypted: i=1; AJvYcCWbImfa2K2JPN9PIpdJMD9IncPwV7EvUw++L5PWvFe4t6FocaaaJsHQJuHE6H5GGSYV0MJWjqwWtDe0kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygHGI83ts7pkEE0/Zfq5aw8V9/aUPfqMw6vIvHvXeTaFoAwlmu
	zZxfJSum1iDgGEa5V5ETwCxDIdu8I664A4FWdD88rTQoI4DLtr5SZ4CA
X-Gm-Gg: AY/fxX7YOnk9x7Kgb+wCblJChawx6E1Oi+BO0TiPWq9H25cbmgUItwMAK6GrvQ0Z1E/
	v2KQ3ToHnaePo6jkyORoZDJI59jV62FRs2lHdYWkrEsS9C9RiXBa75V0uIIwGEiDhFvnJQfvKKN
	DAIA0QTWYHhifHdd4BqyE+og96nQ4vQN8LiwqItjQOADmjWIWuG2RMqkbu1sOYFVcx3hMI7djtP
	4/A8oDIcj1KHP4cL+VPWWIxAYssEt8zphEUaZfE/8U1/ddH2fyFnygYqntuFQX96nm3967ZSBui
	ZKDBfjhT777dKmn1nVy59xFbmJazrGRLqtnxOFXqhcdsN8JYrhCdIHOVDfz16dPc/tI3IZ2lfVs
	3iKdovq/CYU4IOoaIDkXyuA44yKGIjwYPS3JliP2oZ/yIslvMMf1xCOtZ1BNrEMXDwI9tU5ST5M
	iPDK/cSCR48UE=
X-Google-Smtp-Source: AGHT+IGkBlvtTJJI36YenJR2Mj5A83uVH+1orPi0BLwAvata7acR5hue/qogcd9VSy03MC0if9MWYQ==
X-Received: by 2002:a17:902:dad1:b0:2a0:b066:3f55 with SMTP id d9443c01a7336-2a0b06646d5mr58199625ad.10.1765798762558;
        Mon, 15 Dec 2025 03:39:22 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d394easm129684215ad.25.2025.12.15.03.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 03:39:18 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id DE7F144588D6; Mon, 15 Dec 2025 18:39:06 +0700 (WIB)
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
Subject: [PATCH 09/14] drm/amd/display: Don't use kernel-doc comment in dc_register_software_state struct
Date: Mon, 15 Dec 2025 18:38:57 +0700
Message-ID: <20251215113903.46555-10-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215113903.46555-1-bagasdotme@gmail.com>
References: <20251215113903.46555-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238; i=bagasdotme@gmail.com; h=from:subject; bh=g0JdaQypaND4lTcW0ZqbYUYcFFa4BCtHp67rCXQ3qdI=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJn2n4OZ3cRMgut038Q1Mvx+WnR34qt26aRSjxQZU2vjg 6FirXs7SlkYxLgYZMUUWSYl8jWd3mUkcqF9rSPMHFYmkCEMXJwCMJFN+xkZVrl1e0394/7u+RLu +RrXLfO4ZDZ3GN7cIROa8FQ8sjv1CCPD78WiQS1yNZrTC6Ti9OZz7YjK/sxnP51XNFzRTCM96w0 nAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports kernel-doc warning:

WARNING: ./drivers/gpu/drm/amd/display/dc/dc.h:2796 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
 * Software state variables used to program register fields across the display pipeline

Don't use kernel-doc comment syntax to fix it.

Fixes: b0ff344fe70cd2 ("drm/amd/display: Add interface to capture expected HW state from SW state")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 29edfa51ea2cc0..0a9758a042586f 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -2793,7 +2793,7 @@ void dc_get_underflow_debug_data_for_otg(struct dc *dc, int primary_otg_inst, st
 
 void dc_get_power_feature_status(struct dc *dc, int primary_otg_inst, struct power_features *out_data);
 
-/**
+/*
  * Software state variables used to program register fields across the display pipeline
  */
 struct dc_register_software_state {
-- 
An old man doll... just what I always wanted! - Clara


