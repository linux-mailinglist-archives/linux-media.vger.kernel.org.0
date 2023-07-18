Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8785C757479
	for <lists+linux-media@lfdr.de>; Tue, 18 Jul 2023 08:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbjGRGkC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jul 2023 02:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbjGRGj6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jul 2023 02:39:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ACFF199
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 23:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689662348;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uGWZGJs7iJ0bHkmNYO8V4KcHUQKd/vxJD2N3uDsccto=;
        b=IRbE4c7c4pQAae/NzCYywxsyBNRMIGYA/zV2Icpxn0d0rVIfX+DPXQegz/RbIVXwjDrsoi
        Yz9EDYlPsiJ7Gin75zkZkDV6lyiO/T0ur5CiqU1HcASuuIoXU4dADCUFg5uEIWr4NOEMh0
        RcCBcg4oaHE+KotI7H5RZa2jyLkdVls=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-QVURrRJzOEKiCRLJ6sFaEA-1; Tue, 18 Jul 2023 02:39:05 -0400
X-MC-Unique: QVURrRJzOEKiCRLJ6sFaEA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-30e6153f0eeso2936041f8f.0
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 23:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689662344; x=1692254344;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uGWZGJs7iJ0bHkmNYO8V4KcHUQKd/vxJD2N3uDsccto=;
        b=FWS+wtZd90ka7DRM8YnlWvkd09aGgIF2UAdPMSOiWS6x5v1sLw3PYlco2HH2EYwvs3
         orVBGQMusHHhAPIXz+G7Aox8YamR9/iB4Zn+qQQ+sSxhp5K3aR0bmgqdMh7A98GLQsXl
         isWcqnTlgd6am7POd82ukD5DzPAkUbNqk4vu6L6N0RJY5n0xTyxI70DYkzoRgtPBZz8P
         NV6+XFiGUezbfQX9QSgXN+HRoxkf750JIqXWlKpHJr36XlfaD9RPeuBZn8MBB5hpV0/W
         da8WAgAfM1rqOS93jL27hQldZBlLFjJScvXSYZeVXK81yHUzYt/A2TjcH4k3eBk+IW+B
         wXug==
X-Gm-Message-State: ABy/qLZ8i92UtjNDlfd/m06MP+GsNs1IOm6P4Yrhabtq1VBdZa8OfulQ
        sPulF/sQqc/Y41GikUuZPRFC/4cUlbFw0wymKFa/ma1aGuETYVx8wswLFZ0bXVWdD+GVz6W5r4Z
        piAy4lD1Y8OBRlwwZ7Fpj16k=
X-Received: by 2002:adf:d4c7:0:b0:314:268b:21f1 with SMTP id w7-20020adfd4c7000000b00314268b21f1mr11320608wrk.18.1689662344258;
        Mon, 17 Jul 2023 23:39:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHv18uaI93wFrqmmHeM+/M9p05Ssvf+TiET1HDtjWoK2EEJHqu10sNXHiTb6Zw0EgXCaxftWA==
X-Received: by 2002:adf:d4c7:0:b0:314:268b:21f1 with SMTP id w7-20020adfd4c7000000b00314268b21f1mr11320599wrk.18.1689662343997;
        Mon, 17 Jul 2023 23:39:03 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c7-20020adfe747000000b003143c9beeaesm1393087wrn.44.2023.07.17.23.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 23:39:03 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Luc Ma <onion0709@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        onion0709@gmail.com
Subject: Re: [PATCH] dma-buf: remove unintended hyphen in the sysfs path
In-Reply-To: <64b5dc93.170a0220.243d5.1d63@mx.google.com>
References: <64b5dc93.170a0220.243d5.1d63@mx.google.com>
Date:   Tue, 18 Jul 2023 08:39:03 +0200
Message-ID: <87zg3tiv08.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Luc Ma <onion0709@gmail.com> writes:

> From: Luc Ma <luc@sietium.com>
>
> Signed-off-by: Luc Ma <luc@sietium.com>
> ---

Even when is a trivial change I would add something as commit message, i.e:

"The kernel-doc mentions /sys/kernel/dma-buf/buffers but the correct path
is /sys/kernel/dmabuf/buffers instead. Fix the typo in the documentation".

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

