Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 202F56EDCC6
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 09:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbjDYHgz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 03:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233420AbjDYHgW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 03:36:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DF5D322
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 00:36:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8111C62B6F
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 07:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CD4C4339B;
        Tue, 25 Apr 2023 07:36:12 +0000 (UTC)
Message-ID: <ad50e0d1-6ee7-4619-980c-78bf9302b5ba@xs4all.nl>
Date:   Tue, 25 Apr 2023 09:36:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 11/13] media: bttv: refactor bttv_set_dma()
Content-Language: en-US
To:     Deborah Brouwer <deborah.brouwer@collabora.com>,
        linux-media@vger.kernel.org
References: <cover.1682379348.git.deborah.brouwer@collabora.com>
 <61d01a118bc3458767e6fde0810fb761aa02c04a.1682379348.git.deborah.brouwer@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <61d01a118bc3458767e6fde0810fb761aa02c04a.1682379348.git.deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/04/2023 02:10, Deborah Brouwer wrote:
> Break bttv_set_dma() into several smaller, separate functions so it is
> easier to read the risc and dma code. Replace numeric values with
> descriptive macros. Also remove the unused field btv->cap_ctl.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  drivers/media/pci/bt8xx/bttv-risc.c | 109 ++++++++++++++++++----------
>  drivers/media/pci/bt8xx/bttvp.h     |   1 -
>  2 files changed, 70 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
> index 97248e340a28..697924b3dc11 100644
> --- a/drivers/media/pci/bt8xx/bttv-risc.c
> +++ b/drivers/media/pci/bt8xx/bttv-risc.c
> @@ -360,56 +360,87 @@ bttv_apply_geo(struct bttv *btv, struct bttv_geometry *geo, int odd)
>  /* ---------------------------------------------------------- */
>  /* risc group / risc main loop / dma management               */
>  
> -void
> -bttv_set_dma(struct bttv *btv, int override)
> +static void bttv_set_risc_status(struct bttv *btv)
>  {
> -	unsigned long cmd;
> -	int capctl;
> +	unsigned long cmd = BT848_RISC_JUMP;
> +	/*
> +	 * The value of btv->loop_irq sets or resets the RISC_STATUS for video
> +	 * and/or vbi by setting the value of bits [23:16] in the first dword
> +	 * of the JUMP instruction:
> +	 * video risc: set (1) and reset (~1)
> +	 * vbi risc: set(4) and reset (~4)
> +	 */
> +	if (btv->loop_irq) {
> +		cmd |= BT848_RISC_IRQ;
> +		cmd |= (btv->loop_irq  & 0x0f) << 16;
> +		cmd |= (~btv->loop_irq & 0x0f) << 20;
> +	}
> +	btv->main.cpu[RISC_SLOT_LOOP] = cpu_to_le32(cmd);
> +}
> +
> +static void bttv_set_irq_timer(struct bttv *btv)
> +{
> +	if (btv->curr.frame_irq || btv->loop_irq || btv->cvbi)
> +		mod_timer(&btv->timeout, jiffies + BTTV_TIMEOUT);
> +	else
> +		del_timer(&btv->timeout);
> +}
> +
> +static int bttv_set_capture_control(struct bttv *btv, int override)
> +{
> +	int capctl = 0;
> +
> +	if (btv->curr.top || btv->curr.bottom)
> +		capctl = (BT848_CAP_CTL_CAPTURE_ODD |
> +			  BT848_CAP_CTL_CAPTURE_EVEN);

You can drop the () here, and probably keep it in one line.

>  
> -	btv->cap_ctl = 0;
> -	if (NULL != btv->curr.top)      btv->cap_ctl |= 0x02;
> -	if (NULL != btv->curr.bottom)   btv->cap_ctl |= 0x01;
> -	if (NULL != btv->cvbi)          btv->cap_ctl |= 0x0c;
> +	if (btv->cvbi)
> +		capctl |= (BT848_CAP_CTL_CAPTURE_VBI_ODD |
> +			   BT848_CAP_CTL_CAPTURE_VBI_EVEN);

Ditto.

>  
> -	capctl  = 0;
> -	capctl |= (btv->cap_ctl & 0x03) ? 0x03 : 0x00;  /* capture  */
> -	capctl |= (btv->cap_ctl & 0x0c) ? 0x0c : 0x00;  /* vbi data */
>  	capctl |= override;

The name 'override' should be renamed to something else. It's
very unclear what it means.

If I understand this correctly, then when override is non-0 it will
start the video or VBI capture.

So at minimum the calls to bttv_set_dma with a non-0 value should use
the BT848_CAP_CTL_* defines rather than 0x03 or 0x0c. But it might be
better to perhaps change the 'int override' to something like:
'bool start_video, bool start_vbi'. It's much more descriptive.

In any case, thank you for refactoring this function. It makes it easier
to follow.

Regards,

	Hans

>  
> +	btaor(capctl, ~0x0f, BT848_CAP_CTL);
> +
> +	return capctl;
> +}
> +
> +static void bttv_start_dma(struct bttv *btv)
> +{
> +	if (btv->dma_on)
> +		return;
> +	btwrite(btv->main.dma, BT848_RISC_STRT_ADD);
> +	btor(0x3, BT848_GPIO_DMA_CTL);
> +	btv->dma_on = 1;
> +}
> +
> +static void bttv_stop_dma(struct bttv *btv)
> +{
> +	if (!btv->dma_on)
> +		return;
> +	btand(~0x3, BT848_GPIO_DMA_CTL);
> +	btv->dma_on = 0;
> +}
> +
> +void bttv_set_dma(struct bttv *btv, int override)
> +{
> +	int capctl = 0;
> +
> +	bttv_set_risc_status(btv);
> +	bttv_set_irq_timer(btv);
> +	capctl = bttv_set_capture_control(btv, override);
> +
> +	if (capctl)
> +		bttv_start_dma(btv);
> +	else
> +		bttv_stop_dma(btv);
> +
>  	d2printk("%d: capctl=%x lirq=%d top=%08llx/%08llx even=%08llx/%08llx\n",
>  		 btv->c.nr,capctl,btv->loop_irq,
>  		 btv->cvbi         ? (unsigned long long)btv->cvbi->top.dma            : 0,
>  		 btv->curr.top     ? (unsigned long long)btv->curr.top->top.dma        : 0,
>  		 btv->cvbi         ? (unsigned long long)btv->cvbi->bottom.dma         : 0,
>  		 btv->curr.bottom  ? (unsigned long long)btv->curr.bottom->bottom.dma  : 0);
> -
> -	cmd = BT848_RISC_JUMP;
> -	if (btv->loop_irq) {
> -		cmd |= BT848_RISC_IRQ;
> -		cmd |= (btv->loop_irq  & 0x0f) << 16;
> -		cmd |= (~btv->loop_irq & 0x0f) << 20;
> -	}
> -	if (btv->curr.frame_irq || btv->loop_irq || btv->cvbi) {
> -		mod_timer(&btv->timeout, jiffies+BTTV_TIMEOUT);
> -	} else {
> -		del_timer(&btv->timeout);
> -	}
> -	btv->main.cpu[RISC_SLOT_LOOP] = cpu_to_le32(cmd);
> -
> -	btaor(capctl, ~0x0f, BT848_CAP_CTL);
> -	if (capctl) {
> -		if (btv->dma_on)
> -			return;
> -		btwrite(btv->main.dma, BT848_RISC_STRT_ADD);
> -		btor(3, BT848_GPIO_DMA_CTL);
> -		btv->dma_on = 1;
> -	} else {
> -		if (!btv->dma_on)
> -			return;
> -		btand(~3, BT848_GPIO_DMA_CTL);
> -		btv->dma_on = 0;
> -	}
> -	return;
>  }
>  
>  int
> diff --git a/drivers/media/pci/bt8xx/bttvp.h b/drivers/media/pci/bt8xx/bttvp.h
> index bce2401de9bd..b750dfbc75cc 100644
> --- a/drivers/media/pci/bt8xx/bttvp.h
> +++ b/drivers/media/pci/bt8xx/bttvp.h
> @@ -430,7 +430,6 @@ struct bttv {
>  	int                     loop_irq;
>  	int                     new_input;
>  
> -	unsigned long cap_ctl;
>  	unsigned long dma_on;
>  	struct timer_list timeout;
>  	struct bttv_suspend_state state;

