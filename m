Return-Path: <linux-media+bounces-48798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCFBCBD98F
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 12:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6F6A300CA12
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 11:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0666A33557E;
	Mon, 15 Dec 2025 11:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAd6h6l4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804743314C8
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 11:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765799323; cv=none; b=TTrmgeAlHPP6c5fI9ngiFX21W1Jlab3orftkIj01eF3aioyR6UeBwMrsHzAxXNrkAh3vv9dPsnQcyAq8qdbDuxCePaPBf8DE4Ep17UCXOXRjvohJ9Zbhk15Fnrx8RFNghszXtfaJQeE05UHnKQZNowjDZxVKEfHrNTlHTm2QHVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765799323; c=relaxed/simple;
	bh=kdwYayfiPuGdbX+6/rKZkI1jkonQkDY24KG3T7ZKuZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0YG8/XaLonhj+snt4wqZaP2V/7snRi0hOtoeEY4OZoCcmILgoaHHb2xm+R8wyEPUyXCfVluj+dWASVNBBOx3kWGVAJxDhkZTTA1whJCMHS7R+jm7SsqYshIA9RGsLZdKMMlUBYKI80ziRLQs+eFoxwg6JQwnWRp8jmjXoyp3fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAd6h6l4; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a081c163b0so20802485ad.0
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 03:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765799320; x=1766404120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUAs+7T6aM5YvKJFQXSXqoVkTtSxZtzq470O+YaXF94=;
        b=MAd6h6l4/YKSc10LnEFfm3OhEEbVLEKRuYqfPLONcXog2pLTf6OojvodUTKSpLiJCk
         hJm9lRC4I6IyLOPZy4uZz7WzMI9zvRoeGHTOvJdgXYWcY4SZPosskSgjiLKoHz7zUFh6
         bQhz1MNPYg1GHlpA+j8THPjt1R5oGeKktMBTQHBFR1q+a+mpKcSg902hA92IYeEqpenf
         KYyg3sXuv6N4qdzs2XOq7uXib2ucnunNa8MyP9z7TODJagWiisdYEhT3inIPSTtsAF6l
         n3MkoL0gMOOGDYLeqch/50JvIBVgu3YXwwjQUWzGsq6kdI+nrFMWHijpbp8gMrB082St
         p92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765799320; x=1766404120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JUAs+7T6aM5YvKJFQXSXqoVkTtSxZtzq470O+YaXF94=;
        b=eP5NTm9w4RyNmakm1fLpo4zRFdet35OfsscH1mwLba81jlh73D+CmlxU9Xqi3rO9bK
         5lpschLHeeO2opSYHHoCEZau2VjHWEZat4yeAEr5aO1dGhzndpZTeofHkCyRQ3myfLiA
         hNjvWOUA0YPDGn7im6dqOA3Slt+6vZXKd0wlEAvodgn8FnbWT4Fk5IvYisCbenEJL4UN
         yIBrltCNxCCzg7JPmCiBaeb0BIcPSbN4vVInmNwCXFIotvjlGgpyrIkBtPwT1+zaREHq
         K+o13xlwZePgpHbNy1VVuffCnHfWxdb2mzQjFF/MTPrxIb+fPfmzjXxJCBD2uJW1eMs7
         yI9A==
X-Forwarded-Encrypted: i=1; AJvYcCU8PEHKAqdsKaQl/9P5XIqULp8hLMit1B108ha7+C1VLAk1LUQPMoabv/58BUHq7uQ7vC3r372VTA6k2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPLqBS45OOMRlyQkaJnmC9YwoglecBE33bFx7haWIP21YwwNsl
	b7ZcMqpQxxjWQ7psVZVQNmMZWrVTodIAlh3plFNMQzQ+e62YOgBLKTwr
X-Gm-Gg: AY/fxX4iDgBk/Gn0OxhCH2UoHfqO0/EdfPcrxbvaWnqn8on4bSlduZqJzqYkHY0mSWz
	5KscVYbMroumkptcCpOyQ3rUiGc9PbRYJ7/0Ymm0XvQA7H024F6VcnT3+gYk3Ht0JIBF0jm3eHb
	vNEWpdbNPXiHCD4ytPMAOtIpGaCrWiX9JcCSye1AaEMYsOF7YX2GvFIRO25OKgE7/u9BOX78uqa
	iECbOCgBc4VEBxQ53xF5drxqJZuwdKZ/fxsqLKNzcgObxNYIeVvRydrcz9sd6QFKaNUzUZzs5L/
	f9tmxQJEBjLAiDPLMtMdwavIzPiIfwHjmgAcg5N5UubbDXBkwebQYiwR7d+cTxjQLabFo08YlOA
	K2qkzx9wiSmQyFCVqiMUmlAp4cK5+JVHbzUtsCwGN5kUBoVonAB0/I6C6P6ul7Dnuc0fxs64tBS
	QKGsIcWMIHZz0=
X-Google-Smtp-Source: AGHT+IEA4ldqjntSU1IZe10aX19mQKLjoCVDqCMnCNeqo44SOanRLtLHyqhQX8MxC8RVHbAWKM2xrg==
X-Received: by 2002:a17:903:1a2e:b0:2a0:b02b:2105 with SMTP id d9443c01a7336-2a0b02b228amr63659225ad.56.1765799319837;
        Mon, 15 Dec 2025 03:48:39 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0867ebe9dsm77190525ad.40.2025.12.15.03.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 03:48:39 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 46E2D447330A; Mon, 15 Dec 2025 18:39:06 +0700 (WIB)
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
Subject: [PATCH 12/14] drm/scheduler: Describe @result in drm_sched_job_done()
Date: Mon, 15 Dec 2025 18:39:00 +0700
Message-ID: <20251215113903.46555-13-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215113903.46555-1-bagasdotme@gmail.com>
References: <20251215113903.46555-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=982; i=bagasdotme@gmail.com; h=from:subject; bh=kdwYayfiPuGdbX+6/rKZkI1jkonQkDY24KG3T7ZKuZA=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJn2n4Pfzvv2aMJ6/2fiW3RmVPTpTFSM/fBW4Nu0ikdP3 J/+EMyq6ShlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBENP8y/FN2WnBW9dYhDc+y QzUe+4R7v/wRO/L/c0NDkJC4klf71CqG3yyrLnq/ur5px+nadXME75rW9sxVOp7eMOmL58xwZZ6 TlnwA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports kernel-doc warning:

WARNING: ./drivers/gpu/drm/scheduler/sched_main.c:367 function parameter 'result' not described in 'drm_sched_job_done'

Describe @result parameter to fix it.

Fixes: 539f9ee4b52a8b ("drm/scheduler: properly forward fence errors")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 1d4f1b822e7b76..4f844087fd48eb 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -361,6 +361,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
+ * @result: job result
  *
  * Finish the job's fence and resubmit the work items.
  */
-- 
An old man doll... just what I always wanted! - Clara


