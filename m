Return-Path: <linux-media+bounces-48800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D40CBD9CE
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 12:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E121830138D3
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 11:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C383370F4;
	Mon, 15 Dec 2025 11:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpSESMca"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0EA336EC2
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 11:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765799327; cv=none; b=ceN9Tv6durJUsoFaJjzGYz+eLBqPeisYc/JO35UuVUnq4BMWr5+4hfuIQsCu8FXEfca92EPkRZBh1NqpYqrYBvJnxGeYHG2/ZN4cSrrjCmUj5eNzLDgpodT8aFG6M1b4xaYKWAe8M+MY85m9inf+ig6pORT8pgOIs8jsTZG1Ycs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765799327; c=relaxed/simple;
	bh=Q9RPGjCwe41o18D04IVKznpQEFsNHpWb2BdI9cEOKh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B54m8Vl7e+ZRPk1IcinMl65ZJTGyNTVQMxGu/NJB5uoYg/Pekn8hkBlHSDPveWrREKnw4fXiWnBRHjdbOeNfGcwPGUElDlBZ++2bnOnYwycEZkIDuj1rJDAb5YuNOvP1GE8twaKoRyiAoaxd5C0mJDWKn67AzOhYOF739dRTBzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpSESMca; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c363eb612so1719794a91.0
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 03:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765799324; x=1766404124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8E8ZSVvZ3A1H5XIeWol9WzN+P6GbKkkMDrw9AgBsXoI=;
        b=PpSESMca9zudoTMspgIgOE05PYrCKHU5oSEkrtpRSPOqj+2mkUyuoygCFjDOlNVKfI
         G0XrVXf3zJ5ltu0ydicv9rkfF4xIaveYq0KStgVAyTVS9j8EIFfnB+D4QHfazVqINpXP
         jpeqGs3PpSMSWrmeDw2Db4RaZrPuBsMCKVA5rAVNlnjaBvdMUUXE9nLKYTfgU0fuCmij
         sHKzibIkAnbae/yc92j2O4sE8kgpxCbRoIleCbe3f6tocTN9qc928IgbR0Nu3dPmFhpz
         1oaBvQIcTU031h8p5ST29ZwXna616Zb/4Hn1KW4KaBIfRXD4zWOlMsUzNFdNCO4uWkfK
         mEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765799324; x=1766404124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8E8ZSVvZ3A1H5XIeWol9WzN+P6GbKkkMDrw9AgBsXoI=;
        b=bJVIramX0A3dVfBpCDIPYkUgTJvclRVGv6l2ZUYf4QaZnzFRjRYJAz78h47PzR8MVu
         H5VF2lU25/xj5rnT8JWfabRDQrI+mU/oQ3JXfwul2fECH2InoucqFhQWs6Z5TMeQbVi5
         GfsDXDFM1mfLqK6bulrk4TZO01o18D8/h7jg9skL13vcHR12PHGv2wirl1I5w9Wab14v
         1e8+4mrcSJe2uPK5N3pBnm8quMfczzNjMmkgnjOcGz/Fe0VeWN2CZRuUYuR37ZkoKHVC
         kYSM2Ernl1fk0ygBPzHk79Cap1X2BLmEzOwtQJEhrfBrF3pP4EJUrHUBIrBc2r5GAKWM
         N7fA==
X-Forwarded-Encrypted: i=1; AJvYcCV8W6NGeasAFleZ8TyRO+nF80VhcqQ0h5d6iC9aNO237gh7QDR/DNrZgna/0uTrBvve6/DwZYZl74dPcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww6gD8FHn6l43wdQVeiNQdhLsORcusGUf2MUUUINQIn0ZAWR6m
	h/iRU9CsA3B45O64zANwjnknywBe5eVjGVzWkjLmpxP/Xzot6F2MSv+g
X-Gm-Gg: AY/fxX4/9uQQIxbj2cWxCZPt/2Mo46/wn+MyciwaO0dP1mHbNdJOylEFLA1T+BJ3PfD
	/7KSXe8PTVNgQCQ2ZyT5QPt9XxOlnfBGaEEvxaFmsLTykZq0B7+9nYZybKTKJZXheUut4Zbc/39
	/kE3TBYMlZXixY/qewCk9WEMderFXCyxtmKSybBJYKcMCjbGA/2hyEkfeMWX8ijbl26ClvpuNe8
	hbpRGwMd8eIpPOszNqZvgUWfXKjw011G2B4ymM6WILkoyTRFTxl/GmumzUoFVKNeoAkRdu43LT2
	X8SO/6VLPzncn8d3iZSu52UTJZ09OS+rw44UjTUNFxEI4Vh4J5Q4JuaObd965hy1JWlnsvveG1S
	HGMSTJUtFLJ+z1ZHH7TqPn4pfbZJ6i6G4aYV/QmufVLLHAxtITIUzwu8t0X5vLBvJu9GD7Bo+YJ
	BNmO2vXPVyG97GhM70dplIEA==
X-Google-Smtp-Source: AGHT+IFGPLXocnh0bsYmKlmGLz0U7nywcuz+b0WgS325GJYSuSdFNXAMsV5RYXPrF9APc0Uu9mi/Dg==
X-Received: by 2002:a17:90b:2692:b0:340:54a1:d6fe with SMTP id 98e67ed59e1d1-34abd6e705bmr9983263a91.15.1765799324036;
        Mon, 15 Dec 2025 03:48:44 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2c48bf7asm12763568a12.32.2025.12.15.03.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 03:48:42 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 711C5447330D; Mon, 15 Dec 2025 18:39:07 +0700 (WIB)
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
Subject: [PATCH 14/14] net: bridge: Describe @tunnel_hash member in net_bridge_vlan_group struct
Date: Mon, 15 Dec 2025 18:39:02 +0700
Message-ID: <20251215113903.46555-15-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215113903.46555-1-bagasdotme@gmail.com>
References: <20251215113903.46555-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=bagasdotme@gmail.com; h=from:subject; bh=Q9RPGjCwe41o18D04IVKznpQEFsNHpWb2BdI9cEOKh8=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJn2n0POW63OZ/vV5HO1nI0n8+fcu08SpWN+KD02YL721 ObASlnjjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAExESpiR4Y+mRyzDrR2tsxn8 /5W9nMso8ZF7PQPXv0v9ETpvN1g+X8rw39Gt4w5/EGPqsSVHKrba3jn4a/bV+2uL/9ts2fkotu6 9MRMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports kernel-doc warning:

WARNING: ./net/bridge/br_private.h:267 struct member 'tunnel_hash' not described in 'net_bridge_vlan_group'

Fix it by describing @tunnel_hash member.

Fixes: efa5356b0d9753 ("bridge: per vlan dst_metadata netlink support")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 net/bridge/br_private.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
index 7280c4e9305f36..bf441ac1c4d38a 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -247,6 +247,7 @@ struct net_bridge_vlan {
  * struct net_bridge_vlan_group
  *
  * @vlan_hash: VLAN entry rhashtable
+ * @tunnel_hash: tunnel rhashtable
  * @vlan_list: sorted VLAN entry list
  * @num_vlans: number of total VLAN entries
  * @pvid: PVID VLAN id
-- 
An old man doll... just what I always wanted! - Clara


