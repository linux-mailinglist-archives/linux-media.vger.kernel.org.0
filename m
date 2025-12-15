Return-Path: <linux-media+bounces-48790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7440CBD93B
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 12:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0F0F304C5CD
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 11:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5B3331A6E;
	Mon, 15 Dec 2025 11:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvrDFpz5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A176F330B33
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765798757; cv=none; b=ZGEEF2wslViouc/7NdAuZ8R/38UCazmPnDNA2sj3BKg0FTGgp3X7wR+iU6pV787uOXsRp+3UfxzT+q8z9XWMc7dIFIHYs9ajTv3djJwzGcSSG1HlAyHq3KujMcsDmX1srtnTWM7JlUQjqTP9UBWG6tY2RSua67aDf3Y3I5GuoOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765798757; c=relaxed/simple;
	bh=mcnZ1soLgF/JTT1YuxC/XOQhVy9SZYDoshinxHejwDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ez7Qm4oh/q4aNSiSC63EctExUPZV7EmYES+KPImBAy6ca5r674zJ+9okAhHWVDeCNYR3oH7Ev9gOuK9GC2vd8FqCK5wMwZV8FuEHlIQUYgKLZjer/DCcXSNIp3mxpEYIA1G6LqeoAIDpfDn8JnQE0/cLKMM4KpF5WkIFLJiO0es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvrDFpz5; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b80fed1505so3224689b3a.3
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 03:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765798753; x=1766403553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lORwJoeOdmqWvp6Gaq9g1tKkad6KEP5mAC3mejLEu6E=;
        b=dvrDFpz59wUBAQj8mWk3dRETxpnBYFVsfn1kb2lz+IM9uRySwAiZd3SIwFvwBX5gEW
         jqUrf9C94sp6be2ivLljvjYd3OGkbYZBMKK0ebKge94fbdIVk+nWAEHGdTC/RaAF7KED
         kzbvDSqJMnjGmSuBWxyeokl21bELVCdKyfXYC/8hRsBBftYXaETMa7WSku6MIUCriAL6
         Hm/AI+wsn1WNk8maXf515OzgdeS9Xmuc4WM/xTSlVeK2VCCaMI/YTZof5ENPVWjh9eTo
         GF2n2QaFq/Q40woBy95lVKLwE0TjSYJtdXJtDUYKVkZmLUvSshxKR6/cnO2jcvONw5tq
         K0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765798753; x=1766403553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lORwJoeOdmqWvp6Gaq9g1tKkad6KEP5mAC3mejLEu6E=;
        b=xUK9/tmqoqfxVvym7hWbWncFYJKmho+z46VfWYyu1w/CTxI6yFhawfSfVXLklqnSRk
         wStt4D/IMsYkzstSk1iYAweOfewv9Id+swhrMEpTisjDeDGbrq01GTS9X5BTRdpWwd/h
         +FqqAPn0/3hVasqpo8x7VrMEsyA1n+thvWzyD41oxhJheiTfDvfgZtvWxUyi2GAr0bZx
         1PMC/fKiEkB1722m8ucRhEBamswiB5WQwzVkJQIf+e2K9wyKbARnuJU3BTdRvXgD9sjN
         0DYoi6bridwY9tIM1ud951SY/a4moe9xAHYZDFIy62mS02tNIF+ZJ2ln13prs3NSCrd2
         F9qg==
X-Forwarded-Encrypted: i=1; AJvYcCVhXvvTldUDZ0Kibk3oIOkYV27CY46bbFW5fuzHCP4i7leswKu+nGs/l60+hx7L92oYlyDmy8AAt1biEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU1AWWo10ikWZZ26ccVxyu8QpfVvUXr80+QmbdbHZSIU5OVWua
	oOJLfrXfQPSCjRNC8M8Qezs2mII6TJ61lkGW+igpgiab7a/fdKF5n3w9
X-Gm-Gg: AY/fxX4CZr3ite1TtPR45/lk/dywlbtoDmuu402wJENL18PkqBu+beW+EX3o+PL8x+v
	bWR6cNzgJDjxNmU5dSb35wHYfApgxJN+zLhTCr62TdAc5sEwtKS0SWOAhtWvZDR+iPByZ4LObNl
	6Ow+ef8xVN8rNLnxSR+vNf+rpt8GDCSSKsbeD39Y8OUmu1yXNg48fNy3xyX617CMB+k+YIOESqF
	fQJsvNYoxa9foXmXFi4h7pkJa0ztA8DTHm97pFM8rZzVuPJKBr7kUiatR0SJsMrDFCjrKrRZklZ
	uqImDcG+oIVQQWM0aJRTHgKUZHwFA6+PJ3aeX60vMCU/EvOMvvatC5nQ8prxBDHH15GZf6iSSok
	03RSjC4ZJp6UQkogm2IlvsppzlGySgMlev0q/CbKBGZkdkZWkqF4h4N9qrz6dSloE68wtiJ1G4A
	lcbXjgVMpR9MQ=
X-Google-Smtp-Source: AGHT+IH43ZxDlO+sXZpKsRY9ws0CLb4ZSMlMGi8iin8W4Uc9EL2/AE6hhR6bEKC++ztievLapVcsEA==
X-Received: by 2002:a05:6a20:6a28:b0:364:387:8f4e with SMTP id adf61e73a8af0-369ae490337mr10620715637.34.1765798752795;
        Mon, 15 Dec 2025 03:39:12 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2ae4e3casm12755809a12.21.2025.12.15.03.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 03:39:12 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 811FA444B394; Mon, 15 Dec 2025 18:39:06 +0700 (WIB)
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
Subject: [PATCH 05/14] mm, kfence: Describe @slab parameter in __kfence_obj_info()
Date: Mon, 15 Dec 2025 18:38:53 +0700
Message-ID: <20251215113903.46555-6-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215113903.46555-1-bagasdotme@gmail.com>
References: <20251215113903.46555-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=849; i=bagasdotme@gmail.com; h=from:subject; bh=mcnZ1soLgF/JTT1YuxC/XOQhVy9SZYDoshinxHejwDU=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJn2n4P0Tdf6vI2dt8iwUrrPLU6ToytxCmtRXso3wY/50 fGG9Ws6SlkYxLgYZMUUWSYl8jWd3mUkcqF9rSPMHFYmkCEMXJwCMBHZKwz/nVbIB4ee2zunpOHQ vBz35Ga7xwYL3V6/ES+tt/jmsMTsOCPDXNsiGd24sMjVrB9Z5rD2NZvPm8/+bp/rS8/i2IdH8rc yAgA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports kernel-doc warning:

WARNING: ./include/linux/kfence.h:220 function parameter 'slab' not described in '__kfence_obj_info'

Fix it by describing @slab parameter.

Fixes: 2dfe63e61cc31e ("mm, kfence: support kmem_dump_obj() for KFENCE objects")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 include/linux/kfence.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/kfence.h b/include/linux/kfence.h
index 0ad1ddbb8b996a..e5822f6e7f2794 100644
--- a/include/linux/kfence.h
+++ b/include/linux/kfence.h
@@ -211,6 +211,7 @@ struct kmem_obj_info;
  * __kfence_obj_info() - fill kmem_obj_info struct
  * @kpp: kmem_obj_info to be filled
  * @object: the object
+ * @slab: the slab
  *
  * Return:
  * * false - not a KFENCE object
-- 
An old man doll... just what I always wanted! - Clara


