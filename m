Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43ED7273A0C
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 07:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728853AbgIVFON (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 01:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728290AbgIVFON (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 01:14:13 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 604CAC061755;
        Mon, 21 Sep 2020 22:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=5HqyDHXhBaJ+WGESDYJm9qtSqTzlNFPQXKLp06OXmXw=; b=s+5DtIJDJ8A4+st8nmMkTiApfr
        eEnnu68u0cZuwC4J4O05jTx2L0VouJHlO4VSb7yDugn8mfDO7ClS0w9NVXLBgZpEmgy+zEu3NueyC
        icP5QmKGnFB3NkVf9K9t12lle7tdiClaru5vsjlIszVOQ7R41aRZOMaktsA1BiW5C3EjwnWRp8Jut
        jySpxt1rg2Nr1oKwjbGGxWfb5N25O4xKVcrMkjcFyJ+esVmfhrryerg82YUWTuEj50PNELGEsaDKj
        TyTFjoy0ksgFRv6HRaKANc6uaBd9EVVuOf3mfWpGvng4RKAc0zJ/KLzu4092OCVOdaqvUuOifLL38
        bcaeerfA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kKacx-0007vR-0y; Tue, 22 Sep 2020 05:14:07 +0000
Date:   Tue, 22 Sep 2020 06:14:06 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH RFT/RFC 24/49] staging: media: zoran: Use DMA coherent
 for stat_com
Message-ID: <20200922051406.GB29480@infradead.org>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
 <1600683624-5863-25-git-send-email-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600683624-5863-25-git-send-email-clabbe@baylibre.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 21, 2020 at 10:19:59AM +0000, Corentin Labbe wrote:
> Instead of using a fragile virt_to_bus, let's use proper DMA coherent
> for the stat_com entry.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  drivers/staging/media/zoran/zoran.h        |  2 ++
>  drivers/staging/media/zoran/zoran_card.c   | 20 +++++++++++++-------
>  drivers/staging/media/zoran/zoran_device.c |  3 +--
>  3 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
> index aa2a8f688a01..8f3faa4eb60f 100644
> --- a/drivers/staging/media/zoran/zoran.h
> +++ b/drivers/staging/media/zoran/zoran.h
> @@ -351,6 +351,8 @@ struct zoran {
>  	unsigned long frame_num;
>  
>  	wait_queue_head_t test_q;
> +
> +	dma_addr_t p_sc;
>  };
>  
>  static inline struct zoran *to_zoran(struct v4l2_device *v4l2_dev)
> diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
> index 3a7895be3341..a8d23bf126c3 100644
> --- a/drivers/staging/media/zoran/zoran_card.c
> +++ b/drivers/staging/media/zoran/zoran_card.c
> @@ -931,11 +931,15 @@ static int zr36057_init(struct zoran *zr)
>  	zoran_open_init_params(zr);
>  
>  	/* allocate memory *before* doing anything to the hardware in case allocation fails */
> -	zr->stat_com = kzalloc(BUZ_NUM_STAT_COM * 4, GFP_KERNEL);
>  	zr->video_dev = video_device_alloc();
> -	if (!zr->stat_com || !zr->video_dev) {
> +	if (!zr->video_dev) {
>  		err = -ENOMEM;
> -		goto exit_free;
> +		goto exit;
> +	}
> +	zr->stat_com = dma_alloc_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32), &zr->p_sc, GFP_KERNEL);

Again, don't write junk coe like this.  Stick to the 80 lines unless
you have a very good reason.
