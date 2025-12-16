Return-Path: <linux-media+bounces-48911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1670DCC412B
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4B643022598
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6470835CBC9;
	Tue, 16 Dec 2025 15:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1s/18BY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E5A352F85
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 15:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898496; cv=none; b=QOypb4dl5bQyWAVK0DyhlUeNO8JLfYL3Lvejj3uRAUhMmvblCDd5Tyg8SdO1U4B4ZNkRiNXWb4doJO0a0dUnP4SLpkHzssLEjB8QQhYle1/FV0RTcTp0LReSFXO1uHqtmGJuQgEL0UHSv5hvbG1xajMDUxRa/gnEmmXPPJ1he0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898496; c=relaxed/simple;
	bh=kUqJrtaM24NDu8J1LFBz422ot+phR2OLYLy5w6GVNNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OO49SSAou7CI2CWyb+PESc6YXalZufxiJ6ZQC+x5dSB17vTIhsLc9MJlYBEEip2zELm91DfHbtNn1HmNEPU32Kw4R3fAo3rfpq8JXvxlsIDgSRkVdcUe6G/GioH6JG+KG4NzrLN/stklvGulAbk9yCPrIxHaTjXS2cKD7h0VTEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1s/18BY; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7baa5787440so369899b3a.0
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 07:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765898490; x=1766503290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6A3FJy1wSkXfE42mqpxDchsxNCyuEhZg+omH3hGmm4=;
        b=O1s/18BYXzws8mK8UZFFV20BTkxvofAuiz4xpx4eKUDctx+f91J+v0cLmvqsTCbaOb
         QB4aMVGENSsAm3YW6Wa8VFaG1DET7Iq27W98kQjWx3w5z/7gBqNJs4jiKEVESk6PgWpb
         OnFDc8gRjZc+e9bX6GJsHkbaTe8SxcL+tPQoAmYEq5qmziB0/rMCCotDxuGLhfqshBQP
         ENkLSZgKAc7BnS0EYNFZmPSnlhH7x78cnAR/JemulzrVYIB7CyOIcKyaqIeMtI0xkbW7
         xvsQE+6FaK/D8QPMsprcLqXzDXbipLMdSTBkBmYDy7CjW1bTN+AzQS0zD8xCrvdNqfZS
         Btbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765898490; x=1766503290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G6A3FJy1wSkXfE42mqpxDchsxNCyuEhZg+omH3hGmm4=;
        b=dIUngACoFG3DyEMgPDJYKlZsVPPErMfw/3zhoLbXiiaH2yRYtNr63zSN6o3rLavdAa
         e0JuLjb0hVCYwxn64S7i3xK7MOzCkZmC8amBvqWF/6Gclt6yx2tgZMrtq4p3HuX7VKZ1
         cVAg/H/k0O22IabFmhC+SeldXSRKZ/ylRTHuL+4RP2IFyoY7aF1qgVnW0DNzkM0jTHmd
         wY6YF/Lom3Z6I1NXtKYjtM3OexZ5mD4lpfHRLDGxjQ0nZ24blZrALuoxmh2GaWK3n2Yr
         nTh+yaFNiiTwV/eg7gotVQWXthoAFYgHhPCwoj5RhhWO+YGWfDVjPvmffMKC6oSFLTvN
         J3dA==
X-Forwarded-Encrypted: i=1; AJvYcCWL0KQynUJsHgYomTuxCEgZgsnhbA/yQ7Rb1XNJbIdMYmOISSIATSv6uN1QCX+bgvBYmg2es/lbxf++DA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzJlWSY+sT+xSnYDWjhmmw3NV5L5J1zX+E2HPhcmhdu9uMv+6B
	OviJEcDWRUaLE+5kDuTsIPna/yRTaSQWok5MAUtfcyxQj8OLK4q8Pmi4VGRd/r5Upa//dmebLAd
	2/yfdO+W8LMTZ10j6AQdciKqesg7/l44=
X-Gm-Gg: AY/fxX7eGkX/Ptw3dxNRp1Vl7oUSI12AuLiEPVOwq+wnO1cA+DjuScYziVOHSljKhp+
	geuYl9HIBWZ2365ibeKRpOyH+E3Ar77hhQ0i3aOsBetNB0bVCuHuisUeFC3IfZVV8/ayoTcjuZm
	uOKZBIQ396XIRTE3CbQ9IeylRqpF5Xh9+zXAYd9jc35QceWKth/jqPtocHb0CVSp+fZ+6x9Gfyz
	Ed41lBgMs4WdwEJkjSTBuqdM6MgxKrHlinIb+lUnNxK0WoXh+daI5lhJ9M/fWCBeoaBGJPJ
X-Google-Smtp-Source: AGHT+IFq0qaYbGK7y/3ERMab5mfBMJZm2RVpJeQ2PDWWvVrS9uWYHKl8nJo9NGLv/zMgaMY45LKm9slZF+vnfJuCU/o=
X-Received: by 2002:a05:7022:b98:b0:11e:3e9:3e89 with SMTP id
 a92af1059eb24-11f34c5d690mr6648024c88.7.1765898489968; Tue, 16 Dec 2025
 07:21:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215113903.46555-1-bagasdotme@gmail.com> <20251215113903.46555-10-bagasdotme@gmail.com>
In-Reply-To: <20251215113903.46555-10-bagasdotme@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Dec 2025 10:21:18 -0500
X-Gm-Features: AQt7F2rE8ID9d6NCh1LRY2rQdA6w_Kl1ZhHVictIiyXPuu3Pg_xadHkkj9RiiLU
Message-ID: <CADnq5_NsELxchDeka2CX1283p9mn4+P9_V9Mi+SNiWwM_sQepw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 09/14] drm/amd/display: Don't use
 kernel-doc comment in dc_register_software_state struct
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
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
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

Applied.  Thanks!

On Mon, Dec 15, 2025 at 6:41=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> Sphinx reports kernel-doc warning:
>
> WARNING: ./drivers/gpu/drm/amd/display/dc/dc.h:2796 This comment starts w=
ith '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide=
/kernel-doc.rst
>  * Software state variables used to program register fields across the di=
splay pipeline
>
> Don't use kernel-doc comment syntax to fix it.
>
> Fixes: b0ff344fe70cd2 ("drm/amd/display: Add interface to capture expecte=
d HW state from SW state")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/di=
splay/dc/dc.h
> index 29edfa51ea2cc0..0a9758a042586f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -2793,7 +2793,7 @@ void dc_get_underflow_debug_data_for_otg(struct dc =
*dc, int primary_otg_inst, st
>
>  void dc_get_power_feature_status(struct dc *dc, int primary_otg_inst, st=
ruct power_features *out_data);
>
> -/**
> +/*
>   * Software state variables used to program register fields across the d=
isplay pipeline
>   */
>  struct dc_register_software_state {
> --
> An old man doll... just what I always wanted! - Clara
>
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

