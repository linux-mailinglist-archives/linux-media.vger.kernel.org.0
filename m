Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0F87E693D
	for <lists+linux-media@lfdr.de>; Thu,  9 Nov 2023 12:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233789AbjKILKc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Nov 2023 06:10:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233651AbjKILKa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Nov 2023 06:10:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C76272C
        for <linux-media@vger.kernel.org>; Thu,  9 Nov 2023 03:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699528183;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ezu0iXe5WM3zfDfpiwhiAtccNmWTLMMx0akG9lcRF/g=;
        b=CjyTf0bPtHLHNbCf/Zc/P5nwyWCg9EJN7rTfDtuTIsESPnGzL1TLk3Uxe7i4S8C5s8qPqO
        FY4BqMBJTMAMJmOEFb84kEVlp7H97WGguv/j+gmAOKmvGIoT2K3xGuYGH8iXkU7sanhJnr
        gu1/QsT1NWIeoqJ5Dww1Zte7JaFY/7c=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-o0OdKhw-NluPAVcxdiMlrA-1; Thu, 09 Nov 2023 06:09:42 -0500
X-MC-Unique: o0OdKhw-NluPAVcxdiMlrA-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-41cbafdb4b6so2245581cf.0
        for <linux-media@vger.kernel.org>; Thu, 09 Nov 2023 03:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699528182; x=1700132982;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ezu0iXe5WM3zfDfpiwhiAtccNmWTLMMx0akG9lcRF/g=;
        b=OKFNsyJ88D28fM7d5OR9MsGUqE160OYmDQbicvPwii44HHQmr4nnMQddl22rhiNfac
         bayLs7n2no3gce9fx/cUOSqosHlWfSdyy1EG7kggj8JpV5ErINdaQrlKbzG9DLHPsUAm
         7XpBo6EQRRlk1zwagunuvHGA3653QSV+Sj6HG5myeFaahgy0z1o9pc45TSzmajaPNyGf
         A1vDKZtQJAklK/UWEtHQG+T2dAo32kgNg/AGZCzxlq/buIG9Tj9pO/osEE6w1L3xtXzs
         zAMlzAxU89rCn/tHdqYfYiuK5gN/rrOTgQCiNLiSPii6V8j33Sn9xU916FZhe1u1D9QO
         TqRw==
X-Gm-Message-State: AOJu0YxFXTaoMzsEtmr9Mvln7FnT4SEeN4/KXzjrA/iACR8urSFQ9l2d
        j6IIxfv9Qj/vbCF7dlpweGUnJ2DZCiqt/QaV+3+wiv4AeKfXTNwbLQY4pn0SvFqAy7hfK+tRnym
        otS+SjJ79wU2xMVK+2zXuNik=
X-Received: by 2002:a05:622a:2b46:b0:41c:d433:6c86 with SMTP id hb6-20020a05622a2b4600b0041cd4336c86mr5854584qtb.4.1699528182027;
        Thu, 09 Nov 2023 03:09:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEczlBkEToxT5HA1bWloT/vSc9WPJn4E7V19w/sRlEABI2nrBuMePu+oCzKYFBd5r1xDIeGg==
X-Received: by 2002:a05:622a:2b46:b0:41c:d433:6c86 with SMTP id hb6-20020a05622a2b4600b0041cd4336c86mr5854566qtb.4.1699528181732;
        Thu, 09 Nov 2023 03:09:41 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-228-197.dyn.eolo.it. [146.241.228.197])
        by smtp.gmail.com with ESMTPSA id n5-20020ac86745000000b0041977932fc6sm1828045qtp.18.2023.11.09.03.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 03:09:41 -0800 (PST)
Message-ID: <fdf6b2e9c5a734b1a03336f7d5bcfd06bdef47c5.camel@redhat.com>
Subject: Re: [RFC PATCH v3 02/12] net: page_pool: create hooks for custom
 page providers
From:   Paolo Abeni <pabeni@redhat.com>
To:     Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Ahern <dsahern@kernel.org>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Shakeel Butt <shakeelb@google.com>,
        Jeroen de Borst <jeroendb@google.com>,
        Praveen Kaligineedi <pkaligineedi@google.com>
Date:   Thu, 09 Nov 2023 12:09:37 +0100
In-Reply-To: <20231106024413.2801438-3-almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
         <20231106024413.2801438-3-almasrymina@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 2023-11-05 at 18:44 -0800, Mina Almasry wrote:
> diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.=
h
> index 6fc5134095ed..d4bea053bb7e 100644
> --- a/include/net/page_pool/types.h
> +++ b/include/net/page_pool/types.h
> @@ -60,6 +60,8 @@ struct page_pool_params {
>  	int		nid;
>  	struct device	*dev;
>  	struct napi_struct *napi;
> +	u8		memory_provider;
> +	void            *mp_priv;

Minor nit: swapping the above 2 fields should make the struct smaller.

>  	enum dma_data_direction dma_dir;
>  	unsigned int	max_len;
>  	unsigned int	offset;
> @@ -118,6 +120,19 @@ struct page_pool_stats {
>  };
>  #endif
> =20
> +struct mem_provider;
> +
> +enum pp_memory_provider_type {
> +	__PP_MP_NONE, /* Use system allocator directly */
> +};
> +
> +struct pp_memory_provider_ops {
> +	int (*init)(struct page_pool *pool);
> +	void (*destroy)(struct page_pool *pool);
> +	struct page *(*alloc_pages)(struct page_pool *pool, gfp_t gfp);
> +	bool (*release_page)(struct page_pool *pool, struct page *page);
> +};
> +
>  struct page_pool {
>  	struct page_pool_params p;
> =20
> @@ -165,6 +180,9 @@ struct page_pool {
>  	 */
>  	struct ptr_ring ring;
> =20
> +	const struct pp_memory_provider_ops *mp_ops;
> +	void *mp_priv;

Why the mp_ops are not part of page_pool_params? why mp_priv is
duplicated here?

Cheers,

Paolo

