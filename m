Return-Path: <linux-media+bounces-48843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7131CC0F59
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 06:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F57830730FF
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 04:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A67330319;
	Tue, 16 Dec 2025 04:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A5NjXvGD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CyTJx4tN"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74144310784
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 04:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765858711; cv=none; b=u82InhShKWH7azjiEvfY0tOJvJwbY+7KZyrB1cv89npjHvI9JLsF5laQPR3L3eigIgcRLjKvo86xX4S3mERzgc+sBnJpINNwKYS9vqQeOPdmq7rxGt/6KlAhOEqURgCFKes2JwIL3Gc5f1GCU4aQd0JK6joJn1Uq+LSE+N8wP6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765858711; c=relaxed/simple;
	bh=8DUjCNr/nxXg5R3wmw4ZM/MLoFfePhldzOpxojnv4JY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k0KCYnOdSSsYTGnNXUD7ZbxmMiRtX3ZP+4Te5nTuMsLq74KnMhZ2ce4zoSa0NgCEJ0pgtOVKJjU40JA3OjvcSyO/HjfeDALyamdUwseEW/1irUELNZ4Ap92OIGiX5P/KtP9JJ6uobguhqpNXKT1hR2jnAD40hQEIvEdJ+udcAUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A5NjXvGD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CyTJx4tN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765858695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8DUjCNr/nxXg5R3wmw4ZM/MLoFfePhldzOpxojnv4JY=;
	b=A5NjXvGDLxOTN7i8uepsASxQWSK+oQpP3F8+IpOowT8SlHQppyg8ggIXB/AXVsF6wvN9Zc
	e4n+5xZo2YaMJ9Jc5jT9MTjoQYNQLN37nWLpWB/8Lxdf3qMrrFknQ+bDByT9jRse1kPp7l
	hfLB5XcwzeaHGrLpxhvy11YrzrW+NsQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-DsPkx24VMyyrhgs8T1JWfw-1; Mon, 15 Dec 2025 23:18:14 -0500
X-MC-Unique: DsPkx24VMyyrhgs8T1JWfw-1
X-Mimecast-MFC-AGG-ID: DsPkx24VMyyrhgs8T1JWfw_1765858693
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-341616a6fb7so4616717a91.0
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 20:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765858693; x=1766463493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DUjCNr/nxXg5R3wmw4ZM/MLoFfePhldzOpxojnv4JY=;
        b=CyTJx4tNG74Ha6RIouJPM7V8dlIlz+CarkHGK1SkkbKw28aNhixeIFf2AvpFoIsFbc
         XZPlzyq55NBS8U0i7TwTC86fUaGlXen5C5E9AR4nrAGxb5BeBw9sFTTs0SPFPHjLDgvO
         q8BmCMJicJOStoOzqRcDKspG21tVyoLB5lako0NbU+cfmEzV66e3gT8V4n7sU2WxPxMa
         lZvWaSmup6XnmtwIHsiOoon84bJCIaNPC4OuOjXQ1fs8/p/00PMN9tUd4ECoRnYuLWKH
         RqJZEzRdrxh3UbwZPIPmXdQfXOrtwwcGkJPI2Dd0Zv9C8a1f3imVyCqGMXBP8DmUQ645
         kwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765858693; x=1766463493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8DUjCNr/nxXg5R3wmw4ZM/MLoFfePhldzOpxojnv4JY=;
        b=uVlQZB7rBPb4UEISwSfizuYBJeodJjHYh4Q560G2YKrOEndbOW+Oxh2qb27Q/eA7hq
         7cGQ80izubLwiqS4JpJhu2tAzV5xmnve7rbKuNUoE/i7khHVAy+l+8QRE7KCjvxEFQEQ
         tEsLEdqMqn+PXKZyjonx7tecdRdDvmADLPRr40qHiZoPwMw2RnwujxB7wow+rw4XzUjC
         ajcLLWKTBMbFCDuXaFDBSyfHIHzqFGdQBMdGKouzwYNh95Ng7E8I8INOtaZQxMTP4pBH
         IVsoJ8LKpXH4LR8/fHKE6n4PtR8/vUmEUeVQRCEsKgIv9+QK2ytkF6ov46ibZEdPPk7Q
         p37w==
X-Forwarded-Encrypted: i=1; AJvYcCWFr9Tg/wGA9K2PLvoIhs4tAEUL2Ec4YaKTnBfYE7pQJ34FyiZbfpgjl8VZb5eua648LpWdHWR3li2diA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCwnOnaUFzR/gV7+wcaW+QT+7BPzBDX7X2Ga+yH63B3jDTu/WG
	FkZxM+3sDsACsgFRUkMVl1c3QqR40cs8vs+oQDSF11LFMyOy8271tLurJUgjXPmGZMXZw3AXspB
	T2/g8bbbsRuqtBG86XC4kuhzsBTOEymt4n/mGokvAINUC0wf9/JyYfOUA70MK1zpyG6VBDhbA3F
	jj9MIJ82zqhP7KMqks1qOLCoaT6lzNxYXnSPTZKoU=
X-Gm-Gg: AY/fxX5UoHfUANp33dwtpzVIhFDmfITUXDbM78MisWMLPAWPrzWPlhyxAJVVtQB4Pw1
	ACdoQOXcHerFYCAB+APU9vUzoHjjCgEBjmQ8xN8kMYwihJA2MZ/QI+lAT+F090T5z+bbI4iS9TO
	i1KgUmL7ENCCtLai3NX3UOtLJjf//IqPE1wQ7yT0Ln0oUjDcZ+/WUdy3oP6YmoAMKFlg==
X-Received: by 2002:a17:90b:2ccf:b0:340:f05a:3ec2 with SMTP id 98e67ed59e1d1-34abd81733amr14699563a91.17.1765858692970;
        Mon, 15 Dec 2025 20:18:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHD77DQk18dayngXtbIw3fsOCk15EBfDyLwaFsEN4158FtjFJzrWxy8+rjy6tA50q0hvVxRQAeZswAuqcmTXkc=
X-Received: by 2002:a17:90b:2ccf:b0:340:f05a:3ec2 with SMTP id
 98e67ed59e1d1-34abd81733amr14699535a91.17.1765858692536; Mon, 15 Dec 2025
 20:18:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215113903.46555-1-bagasdotme@gmail.com> <20251215113903.46555-7-bagasdotme@gmail.com>
In-Reply-To: <20251215113903.46555-7-bagasdotme@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 16 Dec 2025 12:17:59 +0800
X-Gm-Features: AQt7F2q1idGMqOnPlq5afbA61NEyezJumJNhfdWiFdPMuPeC3DZ1U_cOOaqg6iI
Message-ID: <CACGkMEtJt7Df5kXWex8EoKdakdB8_xLjgCXQt5pUvk0dkGzVMA@mail.gmail.com>
Subject: Re: [PATCH 06/14] virtio: Describe @map and @vmap members in
 virtio_device struct
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux AMDGPU <amd-gfx@lists.freedesktop.org>, 
	Linux DRI Development <dri-devel@lists.freedesktop.org>, 
	Linux Filesystems Development <linux-fsdevel@vger.kernel.org>, Linux Media <linux-media@vger.kernel.org>, 
	linaro-mm-sig@lists.linaro.org, kasan-dev@googlegroups.com, 
	Linux Virtualization <virtualization@lists.linux.dev>, 
	Linux Memory Management List <linux-mm@kvack.org>, Linux Network Bridge <bridge@lists.linux.dev>, 
	Linux Networking <netdev@vger.kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Matthew Brost <matthew.brost@intel.com>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Taimur Hassan <Syed.Hassan@amd.com>, Wayne Lin <Wayne.Lin@amd.com>, Alex Hung <alex.hung@amd.com>, 
	Aurabindo Pillai <aurabindo.pillai@amd.com>, Dillon Varone <Dillon.Varone@amd.com>, 
	George Shen <george.shen@amd.com>, Aric Cyr <aric.cyr@amd.com>, 
	Cruise Hung <Cruise.Hung@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Sunil Khatri <sunil.khatri@amd.com>, Dominik Kaszewski <dominik.kaszewski@amd.com>, 
	David Hildenbrand <david@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Max Kellermann <max.kellermann@ionos.com>, 
	"Nysal Jan K.A." <nysal@linux.ibm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Alexey Skidanov <alexey.skidanov@intel.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Vitaly Wool <vitaly.wool@konsulko.se>, 
	Harry Yoo <harry.yoo@oracle.com>, Mateusz Guzik <mjguzik@gmail.com>, NeilBrown <neil@brown.name>, 
	Amir Goldstein <amir73il@gmail.com>, Jeff Layton <jlayton@kernel.org>, 
	Ivan Lipski <ivan.lipski@amd.com>, Tao Zhou <tao.zhou1@amd.com>, 
	YiPeng Chai <YiPeng.Chai@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, 
	Lyude Paul <lyude@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Luben Tuikov <luben.tuikov@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
	Roopa Prabhu <roopa@cumulusnetworks.com>, Mao Zhu <zhumao001@208suo.com>, 
	Shaomin Deng <dengshaomin@cdjrlc.com>, Charles Han <hanchunchao@inspur.com>, 
	Jilin Yuan <yuanjilin@cdjrlc.com>, Swaraj Gaikwad <swarajgaikwad1925@gmail.com>, 
	George Anthony Vernon <contact@gvernon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 7:39=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> Sphinx reports kernel-doc warnings:
>
> WARNING: ./include/linux/virtio.h:181 struct member 'map' not described i=
n 'virtio_device'
> WARNING: ./include/linux/virtio.h:181 struct member 'vmap' not described =
in 'virtio_device'
>
> Describe these members.
>
> Fixes: bee8c7c24b7373 ("virtio: introduce map ops in virtio core")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks


