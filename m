Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515E91BEE4B
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 04:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgD3C11 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 22:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726282AbgD3C11 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 22:27:27 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC498C035495
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 19:27:26 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id t3so4322144qkg.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 19:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=n0ueUL4qNH47b8rihpaXCJX1CS3A2QwjcGlCkj6DNLU=;
        b=StXRVF2Z/oF8mgEHbwGRd4ZgjZsl1Cy/jpVXd7mPocE9mQASuyBOR1afSdGwqz+pLD
         TLSZZ6hrfL900AHs6UFdkzuJ6T1ZIk+8KDQvcRKfkMf6iqskQGzMHwIcyp0KTBN/B3Jr
         g3/ic6KlxS4zOurl1rvIPyzp3eTCZukVKBygeVeFutnK0wkK+eLJKsoIADyrDo/uCvih
         rTNF99Bba52PPEijHtMcy1tXNvF6zHwU2dZvDJkYaxB48lBe5mwH4Ei+O/6Idefys5Rh
         Cmsk5oB1YL4dIxX9vuDKpKwwnFbv6l0RYfgogeXgN9var+eGCXLr6FRuw71Dv55AOOnH
         qk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=n0ueUL4qNH47b8rihpaXCJX1CS3A2QwjcGlCkj6DNLU=;
        b=iznhcdBisycrkvAd9qa9npZmdgWRyEfnSORVDXbAj6EMjFfTAY49UrD/mGKlVR8Zmh
         p7teCvDnYfS557RyEG3TgV4aqysd+JC92Q4IH7qNA+oINsE9mXyRMwLDw5+VZjbQYfw+
         ZTQmw6dcIEYqCS8o6m4Tqar5D/faVWNO6r95+UGlyAeVg4+EpjF3cspiLVAzpdmpH7XS
         mDqGruYMMXwxId0vDDHBfgYVrZpen1uw5v0AEkVvLQDW5TMvGLKEA+7s/EZ+TcTN6Snj
         cQ4MeG45UNx584p42165Np4wQZQye6VKcjTtdifUEQuiaN7VHSF3SkhUuzPd9UwmGimi
         2A/Q==
X-Gm-Message-State: AGi0Pubnaj/e5czGdyCKmwCUB37x+JK1Kvz/y5GWP7PsgkTiEMVkb8op
        x3FOn5jDWK3yBAhWblTe8fGyTzQHlfWOwg==
X-Google-Smtp-Source: APiQypJIgieYBZmgtgtmw8KT3AWQ292kizhBLwc90lYViUzaNYyqOUctQH/KIfh3FW1L9bc3b6KCrg==
X-Received: by 2002:a37:a312:: with SMTP id m18mr1455117qke.251.1588213645884;
        Wed, 29 Apr 2020 19:27:25 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id o33sm953420qtj.62.2020.04.29.19.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 19:27:25 -0700 (PDT)
Message-ID: <0463c90cfbe2036235010c5f8b92af6a96c20f74.camel@massaru.org>
Subject: Re: [PATCH] dma-buf: Documentation: fix: `make htmldocs` warnings
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     Randy Dunlap <rdunlap@infradead.org>,
        dri-devel@lists.freedesktop.org
Cc:     sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        brendanhiggins@google.com, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Date:   Wed, 29 Apr 2020 23:27:22 -0300
In-Reply-To: <cb4d93a0-b967-f37d-ea01-0368c91b896e@infradead.org>
References: <20200430015930.32224-1-vitor@massaru.org>
         <cb4d93a0-b967-f37d-ea01-0368c91b896e@infradead.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2020-04-29 at 19:06 -0700, Randy Dunlap wrote:
> On 4/29/20 6:59 PM, Vitor Massaru Iha wrote:
> > Add missed ":" on kernel-doc function parameter.
> > 
> > This patch fixes this warnings from `make htmldocs`:
> > ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or
> > member 'importer_ops' not described in 'dma_buf_dynamic_attach'
> > ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or
> > member 'importer_priv' not described in 'dma_buf_dynamic_attach'
> > 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  drivers/dma-buf/dma-buf.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index ccc9eda1bc28..0756d2155745 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -655,8 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
> >   * calls attach() of dma_buf_ops to allow device-specific attach
> > functionality
> >   * @dmabuf:		[in]	buffer to attach device to.
> >   * @dev:		[in]	device to be attached.
> > - * @importer_ops	[in]	importer operations for the
> > attachment
> > - * @importer_priv	[in]	importer private pointer for the
> > attachment
> > + * @importer_ops:	[in]	importer operations for the
> > attachment
> > + * @importer_priv:	[in]	importer private pointer for the
> > attachment
> >   *
> >   * Returns struct dma_buf_attachment pointer for this attachment.
> > Attachments
> >   * must be cleaned up by calling dma_buf_detach().
> > 
> 
> Sumit said that he would be applying my patch from April 7:
> https://lore.kernel.org/linux-media/7bcbe6fe-0b4b-87da-d003-b68a26eb4cf0@infradead.org/
> 
> thanks.

Sorry. I didn't check if the patch has already been sent.

