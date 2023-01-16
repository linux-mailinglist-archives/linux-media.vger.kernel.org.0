Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B80966CF55
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 20:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233411AbjAPTHX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 14:07:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbjAPTHT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 14:07:19 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1530E298E7
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 11:07:17 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkwpftty8y--hfpj0xqfy-3.rev.dnainternet.fi [IPv6:2001:14ba:4498:4840:1c07:fe62:30fe:9b48])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id D2DFE1B002E4;
        Mon, 16 Jan 2023 21:07:15 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1673896036;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=D2PKKy43KTOp2swvTUauXqJVmunvfs+8JS5xuuJCzVI=;
        b=Jq1hZIFJmPk9VZexsj5oGuw6iN+EosdRzjg5M7UnA6L+Y7q8gETfCv3glUP9hBgNGonOp9
        z7WWnjCMMfOzQtAJqDTCfGudvrIpxYRQQseBoDLUWL4bsM2yJrrtzsh0g+Llx/rsjCjrbE
        CDx7wzC06fa385U/78vetPcaHx5x852s6TUqA90vWgqE1uCw0LTeAATrPDbwZUOgdeX9tQ
        Jf/HXmKZwpfA010auFXDDtw38IumOpBiXLOzDRV1iWPiJ01zacoReapAFT/Ske3EH31VU3
        KeHTW8kQ93rmaVrql8AVSfl0CNq9NJCTXgHvXauPmhZ7QyNU5s9kTUQqAaClbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1673896035;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=D2PKKy43KTOp2swvTUauXqJVmunvfs+8JS5xuuJCzVI=;
        b=pzYo5EmaAyADNpYlnBQfFc9jo9kwKfCIvHHDe/LhSwmEuCrmSBW80IqNvWWanstD8vuj2i
        EfYVfRZPiuYo8HBLguqu5HI63GVfC985WP1uhWqvjSMpWcK4sLGxsYNQUE/+AZE947pF/0
        VHkz79x+jXHAynZkJs97h55VQih4oQzHWSEYEvwcrPcOmglh4Wh8ar1v1B3Rsj4YFF/ziN
        tcIcfeSEYglVa2wXYMvfs6UoP4xBb+8Vp24pbv5y+W7QQ1COQHdNVIN4DShth2LVULnjBW
        f8OXhonSpONPP+GHt+q5d24FUMI5d8ET7ykPgjs0/pG+OtOQgW4QFvc+RTUdeA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1673896035; a=rsa-sha256;
        cv=none;
        b=S3CzU+QeJni+1wZdFDqA022nfVRdaDP6yiUhUtNnhX0vUI7wtzHgGgefaGLBS6p8MFUP4O
        vGxpoTQ8jAEswByDnJgFrlYrOgpL94ogKCFucIyJnlGfZqLHJ4fxBduRU7dCJiGUIbh/at
        tzBfqQBlG8s4v2RGtamRg4qqaqP9guSikbMrM5NRPVzLwHhowfJvNKy9fWZUifyGxPiBsT
        N47kkfPRoQtDFRMkYiAevvOuxoyJewwtRU3cT657k6B8qZ9na+afOyZvy12pxPnDBaV2O/
        4DNXZSejbkR/ASV5qJkqOwaSZCeYIrfSuftnuSynK9krGZYlssCWYxDWFicgpA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 413C7634C91;
        Mon, 16 Jan 2023 21:07:15 +0200 (EET)
Date:   Mon, 16 Jan 2023 21:07:15 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Oleg Verych <olecom@gmail.com>
Cc:     "open list:ARM/Allwinner sunXi SoC support" 
        <linux-sunxi@lists.linux.dev>, Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH] media: sun4i-csi: Use CSI_INT_STA_REG name, fix typo in
 a comment
Message-ID: <Y8WgY74zWjF3kvln@valkosipuli.retiisi.eu>
References: <20230107083749.2419-1-olecom@gmail.com>
 <20230109202457.3067-1-olecom@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109202457.3067-1-olecom@gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Oleg,

On Mon, Jan 09, 2023 at 11:24:56PM +0300, Oleg Verych wrote:

Please add a more elaborate description of the patch here. Looks good
otherwise.

> ---
>  drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
> index a3e826a75..95b5633b7 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
> @@ -245,7 +245,7 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	 * We need a scratch buffer in case where we'll not have any
>  	 * more buffer queued so that we don't error out. One of those
>  	 * cases is when you end up at the last frame to capture, you
> -	 * don't havea any buffer queued any more, and yet it doesn't
> +	 * don't have any buffer queued any more, and yet it doesn't
>  	 * really matter since you'll never reach the next buffer.
>  	 *
>  	 * Since we support the multi-planar API, we need to have a
> @@ -311,7 +311,7 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	writel(CSI_BUF_CTRL_DBE, csi->regs + CSI_BUF_CTRL_REG);
>  
>  	/* Clear the pending interrupts */
> -	writel(CSI_INT_FRM_DONE, csi->regs + 0x34);
> +	writel(CSI_INT_FRM_DONE, csi->regs + CSI_INT_STA_REG);
>  
>  	/* Enable frame done interrupt */
>  	writel(CSI_INT_FRM_DONE, csi->regs + CSI_INT_EN_REG);

-- 
Kind regards,

Sakari Ailus
