Return-Path: <linux-media+bounces-48824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB61BCBFCC9
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 21:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D6F0301CC5A
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 20:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD18322B75;
	Mon, 15 Dec 2025 20:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EPh/oprn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jZOzsmpN"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A913093AC
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 20:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765831324; cv=none; b=CMKgkswBDdhIj4ptQKNf+zd31ReJLN1sRwI63/bZbUDrrJcaOwDt5Kkm6a6sUcq2cha+5UTWZQiPF0+6rkK1jpAoYCDv/MBS3aGC6WXxR8+j64+IRLiOvKdE+yGhivJPH6CC8upYRVIV1Y6XOtW4pdaDmxIkIsGKNs0Tyso81A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765831324; c=relaxed/simple;
	bh=Tg2Hz5s/jJowltHvM8wwgjOW8nNKrG1QcZozg60XeFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctX+Zc7AB2kzrMu6X75J7s7o/y6bZVuS0N4d299vAp3w+rC1d7kkiP1cxMt+GwOnExUo4uUb8UgTtacWZG33kGPmtjFzs7kdHgeX+hPZf70Slulh4DP1ZJxMRNeAVRFYJ2OxpYOhLDqQ8TYvn+kyYdnduhP1+dXmgBLiUdyPBYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EPh/oprn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jZOzsmpN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765831321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vIugujDFg05cEDjSFPsNuy7/nXwlnSCGQEq9oeQZt8U=;
	b=EPh/oprnsVUrz2G+idS1ZC2AM/rwA1+1CYkP4vO+y+Y9/Ks+UhZD8GQD8uiF7UNWRmm+Q8
	lYIJDilFvfrR2WTE+Al8Yo+CZTbbsG+JMUiIqor8rbyfp6JC2rk0SbDtLjgj40Qo1Qhd62
	7HXSH1GHpkG+G8IPBcGjz75EAvWohL4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-7bN_2-WMOVGm0DUHKAnzRg-1; Mon, 15 Dec 2025 15:41:59 -0500
X-MC-Unique: 7bN_2-WMOVGm0DUHKAnzRg-1
X-Mimecast-MFC-AGG-ID: 7bN_2-WMOVGm0DUHKAnzRg_1765831318
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4775d110fabso27721095e9.1
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 12:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765831318; x=1766436118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vIugujDFg05cEDjSFPsNuy7/nXwlnSCGQEq9oeQZt8U=;
        b=jZOzsmpNQ8IM0eTqwUxKP4Ey+HqSdxApMvOpNiA+jWWmXPcpLV/A0Mcfjz0rB5zZwn
         CwvoQcTcySZgEQx2oMJ99ilBicTaG9lTrLud6zgI/4vPVBDNPBNQzai51JkBN5NHT8ht
         0BWZ4XEndfCJRolRG3tRana8GmgSko/VUs+5AfiunqdOz9skltG7tK+UybfnD8yu9ohZ
         iogSTSe/1nTdYunCd1zm83CRG+23mlN8vZmLCgCx3dp9FYNU3hxKFbYUYuFGtvHoyFFn
         oxx4z4mu44+Uy6o7bKq9fqpgr8sBWCQnleyp4JD5E/QXeUKGvENmgOtwF+VDJONsjbgG
         ZPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765831318; x=1766436118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIugujDFg05cEDjSFPsNuy7/nXwlnSCGQEq9oeQZt8U=;
        b=O5o7zx4svI3h86tNfmuQ1q0bBRK8cNBkA4jmqseOX57CABmD6u2nxuTLVL06KKjwvY
         Y8hNCMigzlQEPqKvlPkeQzxdoPOzhYFCh1WJUkIzM5Gr+Xbnx9G53XzzuSM0Y7Wtu1Hj
         PMldG3HBzizIuKkERlQWyE8U4/mwJrS9SQVriI+cybTxBgpuFJ3yzSBiEmaH9DyROLmZ
         sU0i5ZXcY+TqmMsvNEulyn/DFmtuHRtBN8n4hT7jJnuN74saJsn2AotdoIqhUvvcl0DJ
         GpkyizI8VH2SnfPQKn5828wPU6gzOReQEsaUIhSp0Ew3x2u+9leH5J1wj8GN3wGNKbvn
         0Ecw==
X-Forwarded-Encrypted: i=1; AJvYcCUKWY+FQf9BHMqeERNBFP0yMz37IqblSJ9e0U/MSGXeHcE954YIUtUUDfo94ekarP+BxDzCbYRO/vD7KA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHmdLIsGVJBxZQHZTSagYD/rIYNP7pJSQRPX3zleiF3H+Y4jzs
	ah0szqGDUBDi4rLTike/mL/fIy10dRNsSCfOEVTm/fNQahtvpUlwpmwyAFKpKG/plKAaDHHAAh8
	mGddxixupo3Y2y3YHPlxdq876cnWk2Gy4qe1N/2Ki8Z3ne7s/UXtLjrid9lEdGqnD
X-Gm-Gg: AY/fxX7kX3uQkEIEPCUG3Z3srF/+vIWya6OkqHlfCzD0B8VGliEwHYPz7SAN9pEJPAU
	OI4OALh4GsWJvJJn4CHWTh7wt4PHlug9afZXfskZOuPs/pfdEVCEkh5GBZhvkAdGx703HohmOQe
	sBEpkmMv79pZ0Xy/d3dcRcWb2gVrGcKG4EhPAVFDAGl7X5NcG9EqFLAdL1dERm6vEsBgpvTLJSZ
	kZV4wYbH8tuZSbhM1dX7129MZ0kXR9Yy0XzFItzXgwF0wenm0jHK9/mEbG7IH23m5jVCLpu0G6q
	EsOVtBoS1sQfTNRt+AHVyd4vXWd2gi/cYAHfdjb7y4B0KQT8KZVnL/4sYQIlYIIivsaDxdplN6P
	Yo8FMbS3keucqhLdjck5IwEuRzt0GH7YUlQ==
X-Received: by 2002:a05:600c:6290:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-47a8f8cdfd1mr164694775e9.16.1765831318227;
        Mon, 15 Dec 2025 12:41:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpvKxyv9KrTZN+I+gLKkWZxXPblkRG4VaB9KOKEG2SIjVVbTsH1HJ4pcy9Q9bDzIs00zZydQ==
X-Received: by 2002:a05:600c:6290:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-47a8f8cdfd1mr164694005e9.16.1765831317597;
        Mon, 15 Dec 2025 12:41:57 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f6f26ebsm211656485e9.14.2025.12.15.12.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 12:41:56 -0800 (PST)
Date: Mon, 15 Dec 2025 15:41:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Filesystems Development <linux-fsdevel@vger.kernel.org>,
	Linux Media <linux-media@vger.kernel.org>,
	linaro-mm-sig@lists.linaro.org, kasan-dev@googlegroups.com,
	Linux Virtualization <virtualization@lists.linux.dev>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Network Bridge <bridge@lists.linux.dev>,
	Linux Networking <netdev@vger.kernel.org>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Taimur Hassan <Syed.Hassan@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
	Alex Hung <alex.hung@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Dillon Varone <Dillon.Varone@amd.com>,
	George Shen <george.shen@amd.com>, Aric Cyr <aric.cyr@amd.com>,
	Cruise Hung <Cruise.Hung@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Dominik Kaszewski <dominik.kaszewski@amd.com>,
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
	Harry Yoo <harry.yoo@oracle.com>, Mateusz Guzik <mjguzik@gmail.com>,
	NeilBrown <neil@brown.name>, Amir Goldstein <amir73il@gmail.com>,
	Jeff Layton <jlayton@kernel.org>, Ivan Lipski <ivan.lipski@amd.com>,
	Tao Zhou <tao.zhou1@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
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
Subject: Re: [PATCH 06/14] virtio: Describe @map and @vmap members in
 virtio_device struct
Message-ID: <20251215154141-mutt-send-email-mst@kernel.org>
References: <20251215113903.46555-1-bagasdotme@gmail.com>
 <20251215113903.46555-7-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215113903.46555-7-bagasdotme@gmail.com>

On Mon, Dec 15, 2025 at 06:38:54PM +0700, Bagas Sanjaya wrote:
> Sphinx reports kernel-doc warnings:
> 
> WARNING: ./include/linux/virtio.h:181 struct member 'map' not described in 'virtio_device'
> WARNING: ./include/linux/virtio.h:181 struct member 'vmap' not described in 'virtio_device'
> 
> Describe these members.
> 
> Fixes: bee8c7c24b7373 ("virtio: introduce map ops in virtio core")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  include/linux/virtio.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> index 132a474e59140a..68ead8fda9c921 100644
> --- a/include/linux/virtio.h
> +++ b/include/linux/virtio.h
> @@ -150,11 +150,13 @@ struct virtio_admin_cmd {
>   * @id: the device type identification (used to match it with a driver).
>   * @config: the configuration ops for this device.
>   * @vringh_config: configuration ops for host vrings.
> + * @map: configuration ops for device's mapping buffer
>   * @vqs: the list of virtqueues for this device.
>   * @features: the 64 lower features supported by both driver and device.
>   * @features_array: the full features space supported by both driver and
>   *		    device.
>   * @priv: private pointer for the driver's use.
> + * @vmap: device virtual map
>   * @debugfs_dir: debugfs directory entry.
>   * @debugfs_filter_features: features to be filtered set by debugfs.
>   */
> -- 
> An old man doll... just what I always wanted! - Clara


