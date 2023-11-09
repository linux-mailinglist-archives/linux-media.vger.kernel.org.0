Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDE97E6589
	for <lists+linux-media@lfdr.de>; Thu,  9 Nov 2023 09:45:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233594AbjKIIpH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Nov 2023 03:45:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232572AbjKIIpG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Nov 2023 03:45:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF971FFB
        for <linux-media@vger.kernel.org>; Thu,  9 Nov 2023 00:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699519463;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eTFEp4CMLoFdUcZdEGfmISXt6fDITsZHDJnL/kZD0Z4=;
        b=cKbo6XHbnavfrKYxdPMwfU9izlpcdyoF8h7ZzedfYYH/SoodiUu/A3yjIKDib7TmpQWEzL
        SWgw/d9doEpWjyUJmxMaozSFido0MJWl+14keAR+kkFJ43+lmlul/J/PwWw95jyCxOKqGY
        vU+CMFFikuL6aNGAN9GmmPG6IDpBnrw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-HIaNUz_AMiWo9LN09OoUWg-1; Thu, 09 Nov 2023 03:44:22 -0500
X-MC-Unique: HIaNUz_AMiWo9LN09OoUWg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9bfacbcabb1so8612066b.0
        for <linux-media@vger.kernel.org>; Thu, 09 Nov 2023 00:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699519461; x=1700124261;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eTFEp4CMLoFdUcZdEGfmISXt6fDITsZHDJnL/kZD0Z4=;
        b=HvuRDn/PTt/ny9EfQTx2stkRU4G1xcqjjrLemcffiJqBOO8oIQYrtNImTTv/Xa7w3K
         eOaMpWBBUYv3s/Co1GqOj8jp24POBN+RPQnzYlRJXr776Q6OlVpLIRfT9/KAjJOYlR4F
         4GA8JN1sDzCW5bISvSSkdyVB8nnJJC1Hl+yvdxj+8j90w1YkEuT7V7VYtWZGWM4wExq8
         6LIx03pfoUY0Hya0CEIJVLjReLKzxSZaebQera4NTG11G2yHfm0zKpuB993QSUuPdNw7
         l24TPWGqX07EycszFzF768GXPSOs6Qt791pyBmSYIuwOgQkASWo4MGF5j+vbeIQdLNiH
         oTrw==
X-Gm-Message-State: AOJu0YwkfzZyxWi14QKlOD1htWdoG6nU3bvk47ovE9IvUgZeyZ1cB8bZ
        /i25wKWq7I5BFJ4Mf4Jndvs9xmLiM3vO/YXbwcOxlTs+6fO8zfRAWKpjIrTGzbAzAwl4n361W1R
        jtysZnkwae4GHVdvM8gKwh0Z4bVSIYkI=
X-Received: by 2002:a17:906:6a0e:b0:9ae:50de:1aaf with SMTP id qw14-20020a1709066a0e00b009ae50de1aafmr3323742ejc.4.1699519461248;
        Thu, 09 Nov 2023 00:44:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpt6f4OXVKtH4i3m412g4H1Y1OUcpmAtKJLGhLybamCWeX8G1/7ze6DLbaN+L9dFmPNZ/PZg==
X-Received: by 2002:a17:906:6a0e:b0:9ae:50de:1aaf with SMTP id qw14-20020a1709066a0e00b009ae50de1aafmr3323714ejc.4.1699519460914;
        Thu, 09 Nov 2023 00:44:20 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-228-197.dyn.eolo.it. [146.241.228.197])
        by smtp.gmail.com with ESMTPSA id ha12-20020a170906a88c00b0099d804da2e9sm2235687ejb.225.2023.11.09.00.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 00:44:20 -0800 (PST)
Message-ID: <21e4ef7d4a1b4ad298b0688f2b9ce8f5572e1e69.camel@redhat.com>
Subject: Re: [RFC PATCH v3 05/12] netdev: netdevice devmem allocator
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
        Praveen Kaligineedi <pkaligineedi@google.com>,
        Willem de Bruijn <willemb@google.com>,
        Kaiyuan Zhang <kaiyuanz@google.com>
Date:   Thu, 09 Nov 2023 09:44:18 +0100
In-Reply-To: <20231106024413.2801438-6-almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
         <20231106024413.2801438-6-almasrymina@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 2023-11-05 at 18:44 -0800, Mina Almasry wrote:
[...]
> +void netdev_free_devmem(struct page_pool_iov *ppiov)
> +{
> +	struct netdev_dmabuf_binding *binding =3D page_pool_iov_binding(ppiov);
> +
> +	refcount_set(&ppiov->refcount, 1);
> +
> +	if (gen_pool_has_addr(binding->chunk_pool,
> +			      page_pool_iov_dma_addr(ppiov), PAGE_SIZE))
> +		gen_pool_free(binding->chunk_pool,
> +			      page_pool_iov_dma_addr(ppiov), PAGE_SIZE);

Minor nit: what about caching the dma_addr value to make the above more
readable?

Cheers,

Paolo

