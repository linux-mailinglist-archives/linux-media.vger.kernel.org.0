Return-Path: <linux-media+bounces-48910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD50CC3F8D
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F38663046143
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D4D354ACA;
	Tue, 16 Dec 2025 15:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFjcEzt9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723FB345CB0
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 15:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898423; cv=none; b=mnCx744w/QL2IMBNJk8r9egLkJooSBcRaqcoMDbY5T66Vzi8+GW/0a5mAQffjtgo6L5yfiyuIC3PtU93F4A2bCr8M0OO4gpFkpGLJT4uBMi/ctDCU8Y9XKmRDSzApqbKOVAGAj1tqA9+YLzBjeEBiPUhIREkq2OBp7x5/YJIc+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898423; c=relaxed/simple;
	bh=2h3WBnEQJKctPY2asYyEGA7td2QJtLLqP+/9R300ga8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBSYbAjqDMDFymdRnv7ISC1xeVNgTCGNYTnSNPl7bIXqBe0qpE4UNU5tU+YM3qQAYx+lPBNeejxZweLDWXJnskjEmFyMM7TWcRZbqwtD1/YF/Ar0WY71qMa3jwojx2+tgmb+fFJkbKyBEugIDCT8mIFfYbwoPXmtNipv+xS7E9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFjcEzt9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a08c65fceeso5973435ad.2
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 07:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765898421; x=1766503221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um9j1NvhAvuOmXHqodLfor6UadH2pWBjGMeLJlrrYrA=;
        b=BFjcEzt9N/sUxLsL1YXXjS4rMHkP65c8YUcNCtRkmt9uJj/mjYdqpUqB0TYE6H+73g
         bYjLM13S9SVHd8XBqDS9BwC53oSw+T6nakevm+1zQEkIsL1U+xOvV6WLtZHEfxVg/ah2
         c4HN+rK+UAT5ozClxJB1l4fVbw16AOcyV9GCYAUCUfWHPto70ZWgTHcDeBqPgQ/vEXz5
         V67njGbW1YHRXsPGTksAsJULlyShbvQrgrgW8w9uw3ql5ayUJRWbHjLM9VMxnDDljXfg
         5QO24DMH8lEFwP1P1D9RRwYMQtFT/W6eZiMaAiiGM7MUg+MRmMtgLY4XS2b9pfXvdIVm
         R8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765898421; x=1766503221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Um9j1NvhAvuOmXHqodLfor6UadH2pWBjGMeLJlrrYrA=;
        b=fFJtxaNTLlYMvEwVVfRB9xzz3/zt8sniv8x5I28/2XlPt3Aln/cYwCaPnGQ2Lt4VTO
         giPsE7y15R9rccx3hhdo9VZEnF8okNu/WQZ8MSLKw574HOLlx4lqj6G8XGkr+Dn6MyIe
         z2s2XeDgsChr9/0Hr7sF3jO9iYL5xPtfp36Z5BCg2OsqLQMCU3pwnUO/+3DoYqBxqAs/
         6Z4rYOARIw1068ORlY82LKVOvfvMlZswWSHUsLt+heXHMjZ1heJaQ9LJZHnuzAF+07X4
         4rrO8gPBSzg8t5dGULqfr5qzPyN0L5flCZ/oWTpYquMs1R93OLIcvG6EbwvO9UoVS0Lk
         bc8w==
X-Forwarded-Encrypted: i=1; AJvYcCVsomLFpe7PH0ALMQzGMSOwVH2ZhwK2FV6tvvzwI1yKiPuNuswRLk2qShoxyvXKs8sT6ngrQnXUVGjO0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHzfzuJgccnTwfMfUSZ1upXUnMeZ+DgiM+ivVUjk+n/KUyrIOQ
	qP+vTfbEMWKp2/EWh4I3SDlJYUz9T/lFENgejC6/dJQeJJoJ2P1wdLZLvkdFW5hy+D1VSVYjJGo
	rEO6Xp6POQylfaPgxv/WvK5G9+f3qCVE=
X-Gm-Gg: AY/fxX4EkXk1gHXB9Xfm0PD8kFCENwJw7FwF5pPGfIJkgLCPJIIaqSJkP7ZZkIIgFWo
	nC9PEtuEIPkVUkfu+Hj6xC8TjJ7CyOuv96fnVoDQMEgpVgitwNOQY8+ZbxBwMXMISDexmwurKY1
	BBa8kCQSE3q4AZV77y/FjfSU85GWQUe12q35jiEJBhj+B97zjvaEjiGrco4T9zGfN73xuOt+wNx
	ous78SwM0NEdGVtIvA8zuM/Q3/XBggrNZ4R6tVU87xX9LpspDVcekJyJp5h3YJfhKQNveB9AOCm
	Vof8dtU=
X-Google-Smtp-Source: AGHT+IGYJpLwVd3WmfTCVN6vD/x/9T3gUFCIaNjQX2AnDfzywCiHaDROcEgCyN90fYOeDZvtNwbDXrs4JcvDTNG1WwM=
X-Received: by 2002:a05:7022:3a0d:b0:11e:3e9:3ea4 with SMTP id
 a92af1059eb24-11f34c52cc5mr5906109c88.6.1765898419103; Tue, 16 Dec 2025
 07:20:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215113903.46555-1-bagasdotme@gmail.com> <20251215113903.46555-11-bagasdotme@gmail.com>
In-Reply-To: <20251215113903.46555-11-bagasdotme@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Dec 2025 10:20:06 -0500
X-Gm-Features: AQt7F2ra4W4DJMCA0k4t80_q2saRqZRxc2HY97wTRTVoyOkAEkAv1EtqbtLiuMo
Message-ID: <CADnq5_P04522xETHty9hn5JO=mNbKSg3Pa68=u8cZ+JgNLt1Jg@mail.gmail.com>
Subject: Re: [PATCH 10/14] drm/amdgpu: Describe @AMD_IP_BLOCK_TYPE_RAS in
 amd_ip_block_type enum
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
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
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

On Mon, Dec 15, 2025 at 6:48=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> Sphinx reports kernel-doc warning:
>
> WARNING: ./drivers/gpu/drm/amd/include/amd_shared.h:113 Enum value 'AMD_I=
P_BLOCK_TYPE_RAS' not described in enum 'amd_ip_block_type'
>
> Describe the value to fix it.
>
> Fixes: 7169e706c82d7b ("drm/amdgpu: Add ras module ip block to amdgpu dis=
covery")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  drivers/gpu/drm/amd/include/amd_shared.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/a=
md/include/amd_shared.h
> index 17945094a13834..d8ed3799649172 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -89,6 +89,7 @@ enum amd_apu_flags {
>  * @AMD_IP_BLOCK_TYPE_VPE: Video Processing Engine
>  * @AMD_IP_BLOCK_TYPE_UMSCH_MM: User Mode Scheduler for Multimedia
>  * @AMD_IP_BLOCK_TYPE_ISP: Image Signal Processor
> +* @AMD_IP_BLOCK_TYPE_RAS: RAS

Reliability, Availability, Serviceability.  I've fixed this up locally
and applied the patch.

Thanks,

Alex

>  * @AMD_IP_BLOCK_TYPE_NUM: Total number of IP block types
>  */
>  enum amd_ip_block_type {
> --
> An old man doll... just what I always wanted! - Clara
>

