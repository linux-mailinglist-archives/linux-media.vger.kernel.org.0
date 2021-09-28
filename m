Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 529FC41B4C6
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 19:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241973AbhI1RPR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 13:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241935AbhI1RPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 13:15:16 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54A8C061746
        for <linux-media@vger.kernel.org>; Tue, 28 Sep 2021 10:13:31 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id f15so7685528qtv.9
        for <linux-media@vger.kernel.org>; Tue, 28 Sep 2021 10:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3Xx8rNIZkvMliD68DmgFcYOoQ1tpCBrX2+RD4NaKqi4=;
        b=LanYIHwLUugO1SYhA4R1tjx/4/Za+1W69P8OiSvyrQXmlYAdpbyB85E23JmtXfGDHt
         wDUzXSyVeUosO2AwtC5ep6h56UygytauvIz8Qdi86oR2WYIgror7+r5XdKdNZJMXADW2
         teFMQtLGF7zsP8hzV4AhfTM5awwdCuByO0G9yhkwWenLgruL7//YkdwrSbP1PqEhcnI1
         xUu62EKpnImnUhUZbYkhDetuXiAugos4PsWbBV0yxXz9ylLSun90NzDflFzhWGUHiSz7
         yZUUnYjocHsdZep+d5DWuEVLKnZME54O4Wvij6NNlm4cWTy92Y5NiAt/MEFNlvAFiMmx
         Tqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3Xx8rNIZkvMliD68DmgFcYOoQ1tpCBrX2+RD4NaKqi4=;
        b=ZkghxS5J/qdVPMDWY0m6eeVprMNN8T7KGWqvrpbC3kQvKpjIkQIVoe66WbSleg9psT
         FW2KABrtw2/Jz9+hJhLYmalt+R3e6zp+1JMkmJyyIwOzRX0MW/Ohbvy1o1vZUxPVR0YR
         wnmRg4T8HZlK8BLPxlErqBKRoGOQSHinCsXB1mQt+SG7rIdmPudVWdUDT43jsi8g9pT+
         7JBw9g+S2AIK+XPVTR+Evi+sp21iumD+CSaWQ3PQGNJ01qrMNqPYaBbGFSsdnbgfq8OT
         1TZ6JP24BuVcba5HzcwzvhGKyg8eHOf6Qb1ZXys+TGNNTPlAIy8FDiFpi2xKD5TFNs4O
         lvjw==
X-Gm-Message-State: AOAM533BQGL+GxpRyi6VBwsjAQ3n4My5WyTd6LTXzKTZM31OZE+4ztr9
        f9DEcc+uk/ZhdCv7ssw7UnyR+Q==
X-Google-Smtp-Source: ABdhPJwySofKZpBkD7jy6Vdb6WsNA3yiKbulrnJQTRUb8BGGkmyWflBOTfaYOzfqm6nDJlcs8e0wag==
X-Received: by 2002:a05:622a:178b:: with SMTP id s11mr7167370qtk.13.1632849210891;
        Tue, 28 Sep 2021 10:13:30 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id p12sm14912297qkj.54.2021.09.28.10.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 10:13:30 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mVGfZ-007Dzq-MQ; Tue, 28 Sep 2021 14:13:29 -0300
Date:   Tue, 28 Sep 2021 14:13:29 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Oded Gabbay <ogabbay@kernel.org>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        christian.koenig@amd.com, daniel.vetter@ffwll.ch,
        galpress@amazon.com, sleybo@amazon.com,
        dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
        linux-media@vger.kernel.org, dledford@redhat.com,
        airlied@gmail.com, alexander.deucher@amd.com, leonro@nvidia.com,
        hch@lst.de, amd-gfx@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v6 1/2] habanalabs: define uAPI to export FD for DMA-BUF
Message-ID: <20210928171329.GF3544071@ziepe.ca>
References: <20210912165309.98695-1-ogabbay@kernel.org>
 <20210912165309.98695-2-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210912165309.98695-2-ogabbay@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 12, 2021 at 07:53:08PM +0300, Oded Gabbay wrote:
>  	/* HL_MEM_OP_* */
>  	__u32 op;
> -	/* HL_MEM_* flags */
> +	/* HL_MEM_* flags.
> +	 * For the HL_MEM_OP_EXPORT_DMABUF_FD opcode, this field holds the
> +	 * DMA-BUF file/FD flags.
> +	 */
>  	__u32 flags;
>  	/* Context ID - Currently not in use */
>  	__u32 ctx_id;
> @@ -1072,6 +1091,13 @@ struct hl_mem_out {
>  
>  			__u32 pad;
>  		};
> +
> +		/* Returned in HL_MEM_OP_EXPORT_DMABUF_FD. Represents the
> +		 * DMA-BUF object that was created to describe a memory
> +		 * allocation on the device's memory space. The FD should be
> +		 * passed to the importer driver
> +		 */
> +		__u64 fd;

fd's should be a s32 type in a fixed width uapi.

I usually expect to see the uapi changes inside the commit that
consumes them, splitting the patch like this seems strange but
harmless.

Jason
