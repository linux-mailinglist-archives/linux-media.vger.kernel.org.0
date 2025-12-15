Return-Path: <linux-media+bounces-48802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B6799CBDB54
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 13:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D990E301A6F9
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 12:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168063164D0;
	Mon, 15 Dec 2025 12:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q1qPQIc4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CAB3242D6
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765800509; cv=none; b=HQ45JBpc5CQzUh//u2R2NZb9xiGtNgJ5D8OJvkSbw2cHoL0CaeezBkNrff4dPr9vH4xyQ9OaEGvCflNrZ1ycokWJfb3Sy8MnUoS9C1V7UhlXHVoVKzBNcYpYGlsRmEeY0/iiqOBY2w/Byr/r/heLk82wmgHv3O57pZAYDVOTbhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765800509; c=relaxed/simple;
	bh=Ov8cS5KYxzY2mYfh/O4WmV6Fp6bmcasgAm++BTdClYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIjiVnae8EhWnfrWqYVvaBz6BqxYolhM2xhNmtu1DZ/Ccx0fpDKW9a//ocIQVgMdrb4/yKXHeGEQ22OMz6W5U/ZWrrjKLDSGqRySDCMiE6WgKxoN6IXOKXnvVlp/j0Jza7/2k1bSVhWZw1kjDguidExa1tCD0BsgAmAUSS0H//4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q1qPQIc4; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so3599823b3a.1
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 04:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765800501; x=1766405301; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+DGkbwvSveRrQtSlxFukYMul6SfDciYSPOsqEu5ZQPQ=;
        b=q1qPQIc4ugqGGvmnFRqQUZIooNx9pvIAzURJ8G8Yj3T8j1o7OyytcjgA0nJuxoZIR8
         0giWXtJ5+Ca9OavO3Cwt+jH9M1sx2y+Huldeoru1TkG2/lNq61NzufEYyPVbxWlGVs8g
         N2tt3rovceiPQMtxC1tBrTs+EO8bBsdWcDWCOU6R5kkAlUBTXQf+V0AKyxwfRfbYqEbi
         3tQfq2GetmwYRkCFCYdCfIZtOYCTeaRCoruys44WPGjvV+LoMnspsVJrmvCtynu87o7H
         JAcAGRW7hO+T/ttk8eZE4G3Uz7xc16gnxZmGdKJqRqztiMDY7Lm/ujLJGecz7Jw9dIsy
         TKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765800501; x=1766405301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DGkbwvSveRrQtSlxFukYMul6SfDciYSPOsqEu5ZQPQ=;
        b=btz6S4IB/WgyTjmwkHlU03aSVUWWiNtLzn7S1GaRzkwvAMiAFogAlUxv3hn3JXKaOB
         Y6H4rcUsYiYjpGhOi0yyA6ztJJaZz/u690n1UYBcny/Cfb2FvM7R1LPHmGtxWj5SnB4F
         kMhgUNbHqt1bPB2vA/UgEpZkOuK/Xu+KjQSwOi3Zt6xp7nZBvBuucqs67ahQaOP+I5t4
         DpJRRhDrIdzLDwv+pSvX6u192cettU27oDBWcKEl9i1Mhs6J9oVioPoA2WVzVrwH3UuE
         CM1HPNUThqXWJ0+/afCaent+6Wv0xLsAf6R/oGjP3EelEcE7TQz5d7WxWosQXDcwuW5o
         gMlg==
X-Forwarded-Encrypted: i=1; AJvYcCV8CiwO/Z3V1Zx6moFjJxyycrUhCLTzKEEmhSwT4B30WqWtSU9f/5Nlhiq4/i09GgJvtJyE+wHxIrjdVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLjvWKiRVIw+JAyNUAHgZlB408H6Ctn0k1PGfniF36u6T15Fgg
	AXofGhgCUQ7Jz4YnVIg3KPzNUDYyfWc9x8hdsdtsKmb5yzvRGgNPunblAkZ2sJwDNuPyEg5clpx
	T4/YKtwbtuHe6b9BEAoZLkFhiL/epI0+qTHRY9+zQ
X-Gm-Gg: AY/fxX5UNCupzVfySGIFLorClFLmAduOn1x3ZXSo1prQ5x3JRUPMY5OBilfpKbV/wat
	VppMrLDQbCwIW7btL31/0qnArP3FDmgk/mnPsxIWs6TqreUdFPODEPi3n2brFKeRhdLZv+gKpjB
	NvSL+FSMGnNmPMBK/5o0XAyrokzRx5baYAll3HC807rY2hi+9h3rsb0Xyx3I01R7TmXin6cnhqc
	/gRvLr7byZraoqEVxtmiyUH/RXupOszLKRJqDe8D9Lki5sExwCqPk2AbUZmAgwc1R+lD6RSZwF0
	6WOjvPt5Llp3M0zb4qzpmPtDwR6D5eba/hKQ
X-Google-Smtp-Source: AGHT+IEBC+acRqtjaBBJQBmhlbonF1wwGFrMO77Zlp8D2bmspUQHM2nItV5HpI3KRFKcy27LH5o2hYak0ysa4tYnvE8=
X-Received: by 2002:a05:701a:ca0d:b0:11b:8fc9:9f5d with SMTP id
 a92af1059eb24-11f34c4d15emr7306064c88.30.1765800500924; Mon, 15 Dec 2025
 04:08:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215113903.46555-1-bagasdotme@gmail.com> <20251215113903.46555-6-bagasdotme@gmail.com>
In-Reply-To: <20251215113903.46555-6-bagasdotme@gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 15 Dec 2025 13:07:43 +0100
X-Gm-Features: AQt7F2pEt11ob6m3jn_EvmNyiM9lcI5ir1gIqaEopvbMbWpYo3dEgZbn6PIAiFk
Message-ID: <CANpmjNNrHYCPp19A_FPeFY1kSTuyS0W_zjo21AUrmjqjqcYa0A@mail.gmail.com>
Subject: Re: [PATCH 05/14] mm, kfence: Describe @slab parameter in __kfence_obj_info()
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
	Dmitry Vyukov <dvyukov@google.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
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

On Mon, 15 Dec 2025 at 12:39, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> Sphinx reports kernel-doc warning:
>
> WARNING: ./include/linux/kfence.h:220 function parameter 'slab' not described in '__kfence_obj_info'
>
> Fix it by describing @slab parameter.
>
> Fixes: 2dfe63e61cc31e ("mm, kfence: support kmem_dump_obj() for KFENCE objects")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Acked-by: Marco Elver <elver@google.com>

Thanks!

> ---
>  include/linux/kfence.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/kfence.h b/include/linux/kfence.h
> index 0ad1ddbb8b996a..e5822f6e7f2794 100644
> --- a/include/linux/kfence.h
> +++ b/include/linux/kfence.h
> @@ -211,6 +211,7 @@ struct kmem_obj_info;
>   * __kfence_obj_info() - fill kmem_obj_info struct
>   * @kpp: kmem_obj_info to be filled
>   * @object: the object
> + * @slab: the slab
>   *
>   * Return:
>   * * false - not a KFENCE object
> --
> An old man doll... just what I always wanted! - Clara
>

