Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA7B38B4F5
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 19:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235125AbhETRLn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 13:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbhETRLm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 13:11:42 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19D1C061574;
        Thu, 20 May 2021 10:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=R1db04gCDc88M4j8lnXXQGGvma3BzvTlALwCNoaW7ZY=; b=ZuqbPud8IMqoIg8wQCoWYWFCxF
        3LJ7i1WAFtF1pqdMe12k7h+GxLKi2/TRBUgJyMFZIRWjQRYnVONi0HJwVqguD00YZqKWtcvepYxMi
        uz9OIDYUkiWk7O3WlAjPUK2RvD48HEMJnzRm2tkm6pv7cfHRoAp6Fve0G0CGPI5gcX63WiyyzPEGq
        wDSew9B1GCVhRrkord1QtTgxPzz9YabZMV2AqzdDY8Vq8M5HuX8/ZlwqNqumkV8cSmlmk/aQvtYJ7
        RQMO++7cgFM2RaO2Is52x7EHalCU6HDVUXBdP96PPWJz7AmxWAvqC9p1cD6SQa0SJMNacKUUvSUDs
        /htdn7dg==;
Received: from [2601:1c0:6280:3f0::7376]
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1ljmBe-00GXCA-GN; Thu, 20 May 2021 17:10:18 +0000
Subject: Re: [PATCH] media: davinci: fix two kernel-doc comments
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <89cf71e62cd39da12e7a6e36ae6db126391ca9e2.1621519649.git.mchehab+huawei@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <76df28ed-9243-8fb5-be67-aa9130b5a174@infradead.org>
Date:   Thu, 20 May 2021 10:10:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <89cf71e62cd39da12e7a6e36ae6db126391ca9e2.1621519649.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/20/21 7:07 AM, Mauro Carvalho Chehab wrote:
> A typo there is causing two warnings:
> 	drivers/media/platform/davinci/vpif_display.c:114: warning: Function parameter or member 'nplanes' not described in 'vpif_buffer_queue_setup'
> 	drivers/media/platform/davinci/vpif_capture.c:112: warning: Function parameter or member 'nplanes' not described in 'vpif_buffer_queue_setup'
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/davinci/vpif_capture.c | 2 +-
>  drivers/media/platform/davinci/vpif_display.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
> index 8d2e165bf7de..c034e25dd9aa 100644
> --- a/drivers/media/platform/davinci/vpif_capture.c
> +++ b/drivers/media/platform/davinci/vpif_capture.c
> @@ -99,7 +99,7 @@ static int vpif_buffer_prepare(struct vb2_buffer *vb)
>   * vpif_buffer_queue_setup : Callback function for buffer setup.

    * vpif_buffer_queue_setup - Callback ...

>   * @vq: vb2_queue ptr
>   * @nbuffers: ptr to number of buffers requested by application
> - * @nplanes:: contains number of distinct video planes needed to hold a frame
> + * @nplanes: contains number of distinct video planes needed to hold a frame
>   * @sizes: contains the size (in bytes) of each plane.
>   * @alloc_devs: ptr to allocation context
>   *
> diff --git a/drivers/media/platform/davinci/vpif_display.c b/drivers/media/platform/davinci/vpif_display.c
> index e5f61d9b221d..59f6b782e104 100644
> --- a/drivers/media/platform/davinci/vpif_display.c
> +++ b/drivers/media/platform/davinci/vpif_display.c
> @@ -101,7 +101,7 @@ static int vpif_buffer_prepare(struct vb2_buffer *vb)
>   * vpif_buffer_queue_setup : Callback function for buffer setup.

same (s/ : / - /)

>   * @vq: vb2_queue ptr
>   * @nbuffers: ptr to number of buffers requested by application
> - * @nplanes:: contains number of distinct video planes needed to hold a frame
> + * @nplanes: contains number of distinct video planes needed to hold a frame
>   * @sizes: contains the size (in bytes) of each plane.
>   * @alloc_devs: ptr to allocation context
>   *
> 

Thanks.
-- 
~Randy

