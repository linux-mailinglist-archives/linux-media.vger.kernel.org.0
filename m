Return-Path: <linux-media+bounces-13226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86960908401
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 08:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B69EA1F215B2
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 06:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A10148313;
	Fri, 14 Jun 2024 06:53:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B05919D894;
	Fri, 14 Jun 2024 06:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718347992; cv=none; b=Yp5LzjKlFnjbdi9Aa4AvOo0EYe4TBn/2YXB8o3xaG0E1GlZheeL3B7pIRxEa9vtiApjffXIzMy9ulf9Fti9ZRmLVPuTf8evZoI03r566QRc9uzq6FIQmQV5sUyPYxiRnX6rZLonoWUn1azHhvvaTpNYY0CPokI7BIEaPUBUDQn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718347992; c=relaxed/simple;
	bh=DzowO7mpKl28afN4lIvqf/PsmBahlQWa+R40noXPqpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sd8Agg/TouWYeoP6aEaosmnbHZ3hrHg37qWAJ7Nr+4KM+bgc0DPROKpSoUePlx4lxe95fizY7GFVQQpIPkhPhJc4lMG5dFumi1+vWyiiQFPbo46KC3Y3yznPjvBMePgKaGEIhsXeSI3GTEUVkfWO3pXLAByNDskQMdL8tHEIBGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE43C2BD10;
	Fri, 14 Jun 2024 06:53:09 +0000 (UTC)
Message-ID: <2bd8dbf4-4151-4fae-ac8a-35f26f696f4d@xs4all.nl>
Date: Fri, 14 Jun 2024 08:53:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: Convert from tasklet to BH workqueue
To: Allen Pais <allen.lkml@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
 Anton Sviridenko <anton@corp.bluecherry.net>,
 Andrey Utkin <andrey.utkin@corp.bluecherry.net>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240612235006.211471-1-allen.lkml@gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240612235006.211471-1-allen.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Allen,

On 13/06/2024 01:50, Allen Pais wrote:
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts drivers/media/* from tasklet to BH workqueue.
> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
> 
> v4:
>   - fixed styling issues.
>   - rename work to bh_work [Hans Verkuil]

I noticed that there are still places where 'work' is used instead of 'bh_work'.
See below. Otherwise this builds fine and looks good. So I expect to be able to
merge v5.

>   - Fixed mantis build failure [Hans Verkuil]
> 
> v3:
> https://lore.kernel.org/all/20240425183127.11409-1-apais@linux.microsoft.com/
> 
> v2:
> https://lore.kernel.org/all/20240327160314.9982-9-apais@linux.microsoft.com/
> 
>  drivers/media/pci/bt8xx/bt878.c               |  8 ++--
>  drivers/media/pci/bt8xx/bt878.h               |  3 +-
>  drivers/media/pci/bt8xx/dvb-bt8xx.c           |  9 +++--
>  drivers/media/pci/ddbridge/ddbridge.h         |  2 +-
>  drivers/media/pci/mantis/hopper_cards.c       |  2 +-
>  drivers/media/pci/mantis/mantis_cards.c       |  2 +-
>  drivers/media/pci/mantis/mantis_common.h      |  2 +-
>  drivers/media/pci/mantis/mantis_dma.c         |  4 +-
>  drivers/media/pci/mantis/mantis_dma.h         |  2 +-
>  drivers/media/pci/mantis/mantis_dvb.c         | 12 +++---
>  drivers/media/pci/ngene/ngene-core.c          | 22 +++++-----
>  drivers/media/pci/ngene/ngene.h               |  5 ++-
>  drivers/media/pci/smipcie/smipcie-main.c      | 18 ++++-----
>  drivers/media/pci/smipcie/smipcie.h           |  3 +-
>  drivers/media/pci/ttpci/budget-av.c           |  3 +-
>  drivers/media/pci/ttpci/budget-ci.c           | 27 +++++++------
>  drivers/media/pci/ttpci/budget-core.c         | 10 ++---
>  drivers/media/pci/ttpci/budget.h              |  5 ++-
>  drivers/media/pci/tw5864/tw5864-core.c        |  2 +-
>  drivers/media/pci/tw5864/tw5864-video.c       | 13 +++---
>  drivers/media/pci/tw5864/tw5864.h             |  7 ++--
>  drivers/media/platform/intel/pxa_camera.c     | 15 +++----
>  drivers/media/platform/marvell/mcam-core.c    |  8 ++--
>  drivers/media/platform/marvell/mcam-core.h    |  3 +-
>  .../st/sti/c8sectpfe/c8sectpfe-core.c         | 14 +++----
>  .../st/sti/c8sectpfe/c8sectpfe-core.h         |  2 +-
>  drivers/media/radio/wl128x/fmdrv.h            |  5 ++-
>  drivers/media/radio/wl128x/fmdrv_common.c     | 40 +++++++++----------
>  drivers/media/rc/mceusb.c                     |  2 +-
>  drivers/media/usb/ttusb-dec/ttusb_dec.c       | 21 +++++-----
>  30 files changed, 142 insertions(+), 129 deletions(-)
> 
> diff --git a/drivers/media/pci/bt8xx/bt878.c b/drivers/media/pci/bt8xx/bt878.c
> index 90972d6952f1..dedf82b76e28 100644
> --- a/drivers/media/pci/bt8xx/bt878.c
> +++ b/drivers/media/pci/bt8xx/bt878.c
> @@ -300,8 +300,8 @@ static irqreturn_t bt878_irq(int irq, void *dev_id)
>  		}
>  		if (astat & BT878_ARISCI) {
>  			bt->finished_block = (stat & BT878_ARISCS) >> 28;
> -			if (bt->tasklet.callback)
> -				tasklet_schedule(&bt->tasklet);
> +			if (bt->bh_work.func)
> +				queue_work(system_bh_wq, &bt->bh_work);
>  			break;
>  		}
>  		count++;
> @@ -478,8 +478,8 @@ static int bt878_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
>  	btwrite(0, BT878_AINT_MASK);
>  	bt878_num++;
>  
> -	if (!bt->tasklet.func)
> -		tasklet_disable(&bt->tasklet);
> +	if (!bt->bh_work.func)
> +		disable_work_sync(&bt->bh_work);
>  
>  	return 0;
>  
> diff --git a/drivers/media/pci/bt8xx/bt878.h b/drivers/media/pci/bt8xx/bt878.h
> index fde8db293c54..5b1c7f56e553 100644
> --- a/drivers/media/pci/bt8xx/bt878.h
> +++ b/drivers/media/pci/bt8xx/bt878.h
> @@ -14,6 +14,7 @@
>  #include <linux/sched.h>
>  #include <linux/spinlock.h>
>  #include <linux/mutex.h>
> +#include <linux/workqueue.h>
>  
>  #include "bt848.h"
>  #include "bttv.h"
> @@ -120,7 +121,7 @@ struct bt878 {
>  	dma_addr_t risc_dma;
>  	u32 risc_pos;
>  
> -	struct tasklet_struct tasklet;
> +	struct work_struct bh_work;
>  	int shutdown;
>  };
>  
> diff --git a/drivers/media/pci/bt8xx/dvb-bt8xx.c b/drivers/media/pci/bt8xx/dvb-bt8xx.c
> index 390cbba6c065..45074af3de66 100644
> --- a/drivers/media/pci/bt8xx/dvb-bt8xx.c
> +++ b/drivers/media/pci/bt8xx/dvb-bt8xx.c
> @@ -15,6 +15,7 @@
>  #include <linux/delay.h>
>  #include <linux/slab.h>
>  #include <linux/i2c.h>
> +#include <linux/workqueue.h>
>  
>  #include <media/dmxdev.h>
>  #include <media/dvbdev.h>
> @@ -39,9 +40,9 @@ DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
>  
>  #define IF_FREQUENCYx6 217    /* 6 * 36.16666666667MHz */
>  
> -static void dvb_bt8xx_task(struct tasklet_struct *t)
> +static void dvb_bt8xx_work(struct work_struct *t)
>  {
> -	struct bt878 *bt = from_tasklet(bt, t, tasklet);
> +	struct bt878 *bt = from_work(bt, t, bh_work);
>  	struct dvb_bt8xx_card *card = dev_get_drvdata(&bt->adapter->dev);
>  
>  	dprintk("%d\n", card->bt->finished_block);
> @@ -782,7 +783,7 @@ static int dvb_bt8xx_load_card(struct dvb_bt8xx_card *card, u32 type)
>  		goto err_disconnect_frontend;
>  	}
>  
> -	tasklet_setup(&card->bt->tasklet, dvb_bt8xx_task);
> +	INIT_WORK(&card->bt->bh_work, dvb_bt8xx_work);
>  
>  	frontend_init(card, type);
>  
> @@ -922,7 +923,7 @@ static void dvb_bt8xx_remove(struct bttv_sub_device *sub)
>  	dprintk("dvb_bt8xx: unloading card%d\n", card->bttv_nr);
>  
>  	bt878_stop(card->bt);
> -	tasklet_kill(&card->bt->tasklet);
> +	cancel_work_sync(&card->bt->bh_work);
>  	dvb_net_release(&card->dvbnet);
>  	card->demux.dmx.remove_frontend(&card->demux.dmx, &card->fe_mem);
>  	card->demux.dmx.remove_frontend(&card->demux.dmx, &card->fe_hw);
> diff --git a/drivers/media/pci/ddbridge/ddbridge.h b/drivers/media/pci/ddbridge/ddbridge.h
> index f3699dbd193f..f01ecdb0b627 100644
> --- a/drivers/media/pci/ddbridge/ddbridge.h
> +++ b/drivers/media/pci/ddbridge/ddbridge.h
> @@ -298,7 +298,7 @@ struct ddb_link {
>  	spinlock_t             lock; /* lock link access */
>  	struct mutex           flash_mutex; /* lock flash access */
>  	struct ddb_lnb         lnb;
> -	struct tasklet_struct  tasklet;
> +	struct work_struct     bh_work;
>  	struct ddb_ids         ids;
>  
>  	spinlock_t             temp_lock; /* lock temp chip access */
> diff --git a/drivers/media/pci/mantis/hopper_cards.c b/drivers/media/pci/mantis/hopper_cards.c
> index c0bd5d7e148b..b85aef4e2b24 100644
> --- a/drivers/media/pci/mantis/hopper_cards.c
> +++ b/drivers/media/pci/mantis/hopper_cards.c
> @@ -116,7 +116,7 @@ static irqreturn_t hopper_irq_handler(int irq, void *dev_id)
>  	if (stat & MANTIS_INT_RISCI) {
>  		dprintk(MANTIS_DEBUG, 0, "<%s>", label[8]);
>  		mantis->busy_block = (stat & MANTIS_INT_RISCSTAT) >> 28;
> -		tasklet_schedule(&mantis->tasklet);
> +		queue_work(system_bh_wq, &mantis->bh_work);
>  	}
>  	if (stat & MANTIS_INT_I2CDONE) {
>  		dprintk(MANTIS_DEBUG, 0, "<%s>", label[9]);
> diff --git a/drivers/media/pci/mantis/mantis_cards.c b/drivers/media/pci/mantis/mantis_cards.c
> index 906e4500d87d..b44b4cf42f86 100644
> --- a/drivers/media/pci/mantis/mantis_cards.c
> +++ b/drivers/media/pci/mantis/mantis_cards.c
> @@ -125,7 +125,7 @@ static irqreturn_t mantis_irq_handler(int irq, void *dev_id)
>  	if (stat & MANTIS_INT_RISCI) {
>  		dprintk(MANTIS_DEBUG, 0, "<%s>", label[8]);
>  		mantis->busy_block = (stat & MANTIS_INT_RISCSTAT) >> 28;
> -		tasklet_schedule(&mantis->tasklet);
> +		queue_work(system_bh_wq, &mantis->bh_work);
>  	}
>  	if (stat & MANTIS_INT_I2CDONE) {
>  		dprintk(MANTIS_DEBUG, 0, "<%s>", label[9]);
> diff --git a/drivers/media/pci/mantis/mantis_common.h b/drivers/media/pci/mantis/mantis_common.h
> index d88ac280226c..6e563ecd94e8 100644
> --- a/drivers/media/pci/mantis/mantis_common.h
> +++ b/drivers/media/pci/mantis/mantis_common.h
> @@ -125,7 +125,7 @@ struct mantis_pci {
>  	__le32			*risc_cpu;
>  	dma_addr_t		risc_dma;
>  
> -	struct tasklet_struct	tasklet;
> +	struct work_struct	bh_work;
>  	spinlock_t		intmask_lock;
>  
>  	struct i2c_adapter	adapter;
> diff --git a/drivers/media/pci/mantis/mantis_dma.c b/drivers/media/pci/mantis/mantis_dma.c
> index 80c843936493..eeb210a2862f 100644
> --- a/drivers/media/pci/mantis/mantis_dma.c
> +++ b/drivers/media/pci/mantis/mantis_dma.c
> @@ -200,9 +200,9 @@ void mantis_dma_stop(struct mantis_pci *mantis)
>  }
>  
>  
> -void mantis_dma_xfer(struct tasklet_struct *t)
> +void mantis_dma_xfer(struct work_struct *t)
>  {
> -	struct mantis_pci *mantis = from_tasklet(mantis, t, tasklet);
> +	struct mantis_pci *mantis = from_work(mantis, t, bh_work);
>  	struct mantis_hwconfig *config = mantis->hwconfig;
>  
>  	while (mantis->last_block != mantis->busy_block) {
> diff --git a/drivers/media/pci/mantis/mantis_dma.h b/drivers/media/pci/mantis/mantis_dma.h
> index 37da982c9c29..5db0d3728f15 100644
> --- a/drivers/media/pci/mantis/mantis_dma.h
> +++ b/drivers/media/pci/mantis/mantis_dma.h
> @@ -13,6 +13,6 @@ extern int mantis_dma_init(struct mantis_pci *mantis);
>  extern int mantis_dma_exit(struct mantis_pci *mantis);
>  extern void mantis_dma_start(struct mantis_pci *mantis);
>  extern void mantis_dma_stop(struct mantis_pci *mantis);
> -extern void mantis_dma_xfer(struct tasklet_struct *t);
> +extern void mantis_dma_xfer(struct work_struct *t);
>  
>  #endif /* __MANTIS_DMA_H */
> diff --git a/drivers/media/pci/mantis/mantis_dvb.c b/drivers/media/pci/mantis/mantis_dvb.c
> index c7ba4a76e608..398e32f44692 100644
> --- a/drivers/media/pci/mantis/mantis_dvb.c
> +++ b/drivers/media/pci/mantis/mantis_dvb.c
> @@ -105,7 +105,7 @@ static int mantis_dvb_start_feed(struct dvb_demux_feed *dvbdmxfeed)
>  	if (mantis->feeds == 1)	 {
>  		dprintk(MANTIS_DEBUG, 1, "mantis start feed & dma");
>  		mantis_dma_start(mantis);
> -		tasklet_enable(&mantis->tasklet);
> +		enable_and_queue_work(system_bh_wq, &mantis->bh_work);
>  	}
>  
>  	return mantis->feeds;
> @@ -125,7 +125,7 @@ static int mantis_dvb_stop_feed(struct dvb_demux_feed *dvbdmxfeed)
>  	mantis->feeds--;
>  	if (mantis->feeds == 0) {
>  		dprintk(MANTIS_DEBUG, 1, "mantis stop feed and dma");
> -		tasklet_disable(&mantis->tasklet);
> +		disable_work_sync(&mantis->bh_work);
>  		mantis_dma_stop(mantis);
>  	}
>  
> @@ -205,8 +205,8 @@ int mantis_dvb_init(struct mantis_pci *mantis)
>  	}
>  
>  	dvb_net_init(&mantis->dvb_adapter, &mantis->dvbnet, &mantis->demux.dmx);
> -	tasklet_setup(&mantis->tasklet, mantis_dma_xfer);
> -	tasklet_disable(&mantis->tasklet);
> +	INIT_WORK(&mantis->bh_work, mantis_dma_xfer);
> +	disable_work_sync(&mantis->bh_work);
>  	if (mantis->hwconfig) {
>  		result = config->frontend_init(mantis, mantis->fe);
>  		if (result < 0) {
> @@ -235,7 +235,7 @@ int mantis_dvb_init(struct mantis_pci *mantis)
>  
>  	/* Error conditions ..	*/
>  err5:
> -	tasklet_kill(&mantis->tasklet);
> +	cancel_work_sync(&mantis->bh_work);
>  	dvb_net_release(&mantis->dvbnet);
>  	if (mantis->fe) {
>  		dvb_unregister_frontend(mantis->fe);
> @@ -273,7 +273,7 @@ int mantis_dvb_exit(struct mantis_pci *mantis)
>  		dvb_frontend_detach(mantis->fe);
>  	}
>  
> -	tasklet_kill(&mantis->tasklet);
> +	cancel_work_sync(&mantis->bh_work);
>  	dvb_net_release(&mantis->dvbnet);
>  
>  	mantis->demux.dmx.remove_frontend(&mantis->demux.dmx, &mantis->fe_mem);
> diff --git a/drivers/media/pci/ngene/ngene-core.c b/drivers/media/pci/ngene/ngene-core.c
> index 24ec576dc3bf..9641f23b2247 100644
> --- a/drivers/media/pci/ngene/ngene-core.c
> +++ b/drivers/media/pci/ngene/ngene-core.c
> @@ -50,9 +50,9 @@ DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
>  /* nGene interrupt handler **************************************************/
>  /****************************************************************************/
>  
> -static void event_tasklet(struct tasklet_struct *t)
> +static void event_bh_work(struct work_struct *t)
>  {
> -	struct ngene *dev = from_tasklet(dev, t, event_tasklet);
> +	struct ngene *dev = from_work(dev, t, event_bh_work);
>  
>  	while (dev->EventQueueReadIndex != dev->EventQueueWriteIndex) {
>  		struct EVENT_BUFFER Event =
> @@ -68,9 +68,9 @@ static void event_tasklet(struct tasklet_struct *t)
>  	}
>  }
>  
> -static void demux_tasklet(struct tasklet_struct *t)
> +static void demux_bh_work(struct work_struct *t)
>  {
> -	struct ngene_channel *chan = from_tasklet(chan, t, demux_tasklet);
> +	struct ngene_channel *chan = from_work(chan, t, demux_bh_work);
>  	struct device *pdev = &chan->dev->pci_dev->dev;
>  	struct SBufferHeader *Cur = chan->nextBuffer;
>  
> @@ -204,7 +204,7 @@ static irqreturn_t irq_handler(int irq, void *dev_id)
>  			dev->EventQueueOverflowFlag = 1;
>  		}
>  		dev->EventBuffer->EventStatus &= ~0x80;
> -		tasklet_schedule(&dev->event_tasklet);
> +		queue_work(system_bh_wq, &dev->event_bh_work);
>  		rc = IRQ_HANDLED;
>  	}
>  
> @@ -217,8 +217,8 @@ static irqreturn_t irq_handler(int irq, void *dev_id)
>  			     ngeneBuffer.SR.Flags & 0xC0) == 0x80) {
>  				dev->channel[i].nextBuffer->
>  					ngeneBuffer.SR.Flags |= 0x40;
> -				tasklet_schedule(
> -					&dev->channel[i].demux_tasklet);
> +				queue_work(system_bh_wq,
> +					&dev->channel[i].demux_bh_work);
>  				rc = IRQ_HANDLED;
>  			}
>  		}
> @@ -1181,7 +1181,7 @@ static void ngene_init(struct ngene *dev)
>  	struct device *pdev = &dev->pci_dev->dev;
>  	int i;
>  
> -	tasklet_setup(&dev->event_tasklet, event_tasklet);
> +	INIT_WORK(&dev->event_bh_work, event_bh_work);
>  
>  	memset_io(dev->iomem + 0xc000, 0x00, 0x220);
>  	memset_io(dev->iomem + 0xc400, 0x00, 0x100);
> @@ -1395,7 +1395,7 @@ static void release_channel(struct ngene_channel *chan)
>  	if (chan->running)
>  		set_transfer(chan, 0);
>  
> -	tasklet_kill(&chan->demux_tasklet);
> +	cancel_work_sync(&chan->demux_bh_work);
>  
>  	if (chan->ci_dev) {
>  		dvb_unregister_device(chan->ci_dev);
> @@ -1445,7 +1445,7 @@ static int init_channel(struct ngene_channel *chan)
>  	struct ngene_info *ni = dev->card_info;
>  	int io = ni->io_type[nr];
>  
> -	tasklet_setup(&chan->demux_tasklet, demux_tasklet);
> +	INIT_WORK(&chan->demux_bh_work, demux_bh_work);
>  	chan->users = 0;
>  	chan->type = io;
>  	chan->mode = chan->type;	/* for now only one mode */
> @@ -1649,7 +1649,7 @@ void ngene_remove(struct pci_dev *pdev)
>  	struct ngene *dev = pci_get_drvdata(pdev);
>  	int i;
>  
> -	tasklet_kill(&dev->event_tasklet);
> +	cancel_work_sync(&dev->event_bh_work);
>  	for (i = MAX_STREAM - 1; i >= 0; i--)
>  		release_channel(&dev->channel[i]);
>  	if (dev->ci.en)
> diff --git a/drivers/media/pci/ngene/ngene.h b/drivers/media/pci/ngene/ngene.h
> index d1d7da84cd9d..9f989420b9e7 100644
> --- a/drivers/media/pci/ngene/ngene.h
> +++ b/drivers/media/pci/ngene/ngene.h
> @@ -16,6 +16,7 @@
>  #include <linux/scatterlist.h>
>  
>  #include <linux/dvb/frontend.h>
> +#include <linux/workqueue.h>
>  
>  #include <media/dmxdev.h>
>  #include <media/dvbdev.h>
> @@ -621,7 +622,7 @@ struct ngene_channel {
>  	int                   users;
>  	struct video_device  *v4l_dev;
>  	struct dvb_device    *ci_dev;
> -	struct tasklet_struct demux_tasklet;
> +	struct work_struct    demux_bh_work;
>  
>  	struct SBufferHeader *nextBuffer;
>  	enum KSSTATE          State;
> @@ -717,7 +718,7 @@ struct ngene {
>  	struct EVENT_BUFFER   EventQueue[EVENT_QUEUE_SIZE];
>  	int                   EventQueueOverflowCount;
>  	int                   EventQueueOverflowFlag;
> -	struct tasklet_struct event_tasklet;
> +	struct work_struct    event_bh_work;
>  	struct EVENT_BUFFER  *EventBuffer;
>  	int                   EventQueueWriteIndex;
>  	int                   EventQueueReadIndex;
> diff --git a/drivers/media/pci/smipcie/smipcie-main.c b/drivers/media/pci/smipcie/smipcie-main.c
> index 0c300d019d9c..7db6d443fc54 100644
> --- a/drivers/media/pci/smipcie/smipcie-main.c
> +++ b/drivers/media/pci/smipcie/smipcie-main.c
> @@ -279,10 +279,10 @@ static void smi_port_clearInterrupt(struct smi_port *port)
>  		(port->_dmaInterruptCH0 | port->_dmaInterruptCH1));
>  }
>  
> -/* tasklet handler: DMA data to dmx.*/
> -static void smi_dma_xfer(struct tasklet_struct *t)
> +/* BH work handler: DMA data to dmx.*/
> +static void smi_dma_xfer(struct work_struct *t)
>  {
> -	struct smi_port *port = from_tasklet(port, t, tasklet);
> +	struct smi_port *port = from_work(port, t, bh_work);
>  	struct smi_dev *dev = port->dev;
>  	u32 intr_status, finishedData, dmaManagement;
>  	u8 dmaChan0State, dmaChan1State;
> @@ -426,8 +426,8 @@ static int smi_port_init(struct smi_port *port, int dmaChanUsed)
>  	}
>  
>  	smi_port_disableInterrupt(port);
> -	tasklet_setup(&port->tasklet, smi_dma_xfer);
> -	tasklet_disable(&port->tasklet);
> +	INIT_WORK(&port->bh_work, smi_dma_xfer);
> +	disable_work_sync(&port->bh_work);
>  	port->enable = 1;
>  	return 0;
>  err:
> @@ -438,7 +438,7 @@ static int smi_port_init(struct smi_port *port, int dmaChanUsed)
>  static void smi_port_exit(struct smi_port *port)
>  {
>  	smi_port_disableInterrupt(port);
> -	tasklet_kill(&port->tasklet);
> +	cancel_work_sync(&port->bh_work);
>  	smi_port_dma_free(port);
>  	port->enable = 0;
>  }
> @@ -452,7 +452,7 @@ static int smi_port_irq(struct smi_port *port, u32 int_status)
>  		smi_port_disableInterrupt(port);
>  		port->_int_status = int_status;
>  		smi_port_clearInterrupt(port);
> -		tasklet_schedule(&port->tasklet);
> +		queue_work(system_bh_wq, &port->bh_work);
>  		handled = 1;
>  	}
>  	return handled;
> @@ -823,7 +823,7 @@ static int smi_start_feed(struct dvb_demux_feed *dvbdmxfeed)
>  		smi_port_clearInterrupt(port);
>  		smi_port_enableInterrupt(port);
>  		smi_write(port->DMA_MANAGEMENT, dmaManagement);
> -		tasklet_enable(&port->tasklet);
> +		enable_and_queue_work(system_bh_wq, &port->bh_work);
>  	}
>  	return port->users;
>  }
> @@ -837,7 +837,7 @@ static int smi_stop_feed(struct dvb_demux_feed *dvbdmxfeed)
>  	if (--port->users)
>  		return port->users;
>  
> -	tasklet_disable(&port->tasklet);
> +	disable_work_sync(&port->bh_work);
>  	smi_port_disableInterrupt(port);
>  	smi_clear(port->DMA_MANAGEMENT, 0x30003);
>  	return 0;
> diff --git a/drivers/media/pci/smipcie/smipcie.h b/drivers/media/pci/smipcie/smipcie.h
> index 2b5e0154814c..98e44edaab9e 100644
> --- a/drivers/media/pci/smipcie/smipcie.h
> +++ b/drivers/media/pci/smipcie/smipcie.h
> @@ -17,6 +17,7 @@
>  #include <linux/pci.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/slab.h>
> +#include <linux/workqueue.h>
>  #include <media/rc-core.h>
>  
>  #include <media/demux.h>
> @@ -257,7 +258,7 @@ struct smi_port {
>  	u32 _dmaInterruptCH0;
>  	u32 _dmaInterruptCH1;
>  	u32 _int_status;
> -	struct tasklet_struct tasklet;
> +	struct work_struct bh_work;
>  	/* dvb */
>  	struct dmx_frontend hw_frontend;
>  	struct dmx_frontend mem_frontend;
> diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci/budget-av.c
> index 2e62c938e2cb..dd915bf5d2a4 100644
> --- a/drivers/media/pci/ttpci/budget-av.c
> +++ b/drivers/media/pci/ttpci/budget-av.c
> @@ -36,6 +36,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/input.h>
>  #include <linux/spinlock.h>
> +#include <linux/workqueue.h>
>  
>  #include <media/dvb_ca_en50221.h>
>  
> @@ -54,7 +55,7 @@ struct budget_av {
>  	struct video_device vd;
>  	int cur_input;
>  	int has_saa7113;
> -	struct tasklet_struct ciintf_irq_tasklet;
> +	struct work_struct ciintf_irq_work;

ciintf_irq_work -> ciintf_irq_bh_work

>  	int slot_status;
>  	struct dvb_ca_en50221 ca;
>  	u8 reinitialise_demod:1;
> diff --git a/drivers/media/pci/ttpci/budget-ci.c b/drivers/media/pci/ttpci/budget-ci.c
> index 76de40e3c802..8187e26a0b3d 100644
> --- a/drivers/media/pci/ttpci/budget-ci.c
> +++ b/drivers/media/pci/ttpci/budget-ci.c
> @@ -18,6 +18,7 @@
>  #include <linux/slab.h>
>  #include <linux/interrupt.h>
>  #include <linux/spinlock.h>
> +#include <linux/workqueue.h>
>  #include <media/rc-core.h>
>  
>  #include "budget.h"
> @@ -81,7 +82,7 @@ DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
>  
>  struct budget_ci_ir {
>  	struct rc_dev *dev;
> -	struct tasklet_struct msp430_irq_tasklet;
> +	struct work_struct msp430_irq_work;

msp430_irq_bh_work

>  	char name[72]; /* 40 + 32 for (struct saa7146_dev).name */
>  	char phys[32];
>  	int rc5_device;
> @@ -92,7 +93,7 @@ struct budget_ci_ir {
>  
>  struct budget_ci {
>  	struct budget budget;
> -	struct tasklet_struct ciintf_irq_tasklet;
> +	struct work_struct ciintf_irq_work;

ciintf_irq_bh_work

>  	int slot_status;
>  	int ci_irq;
>  	struct dvb_ca_en50221 ca;
> @@ -100,9 +101,9 @@ struct budget_ci {
>  	u8 tuner_pll_address; /* used for philips_tdm1316l configs */
>  };
>  
> -static void msp430_ir_interrupt(struct tasklet_struct *t)
> +static void msp430_ir_interrupt(struct work_struct *t)
>  {
> -	struct budget_ci_ir *ir = from_tasklet(ir, t, msp430_irq_tasklet);
> +	struct budget_ci_ir *ir = from_work(ir, t, msp430_irq_work);
>  	struct budget_ci *budget_ci = container_of(ir, typeof(*budget_ci), ir);
>  	struct rc_dev *dev = budget_ci->ir.dev;
>  	u32 command = ttpci_budget_debiread(&budget_ci->budget, DEBINOSWAP, DEBIADDR_IR, 2, 1, 0) >> 8;
> @@ -231,7 +232,7 @@ static int msp430_ir_init(struct budget_ci *budget_ci)
>  
>  	budget_ci->ir.dev = dev;
>  
> -	tasklet_setup(&budget_ci->ir.msp430_irq_tasklet, msp430_ir_interrupt);
> +	INIT_WORK(&budget_ci->ir.msp430_irq_work, msp430_ir_interrupt);
>  
>  	SAA7146_IER_ENABLE(saa, MASK_06);
>  	saa7146_setgpio(saa, 3, SAA7146_GPIO_IRQHI);
> @@ -245,7 +246,7 @@ static void msp430_ir_deinit(struct budget_ci *budget_ci)
>  
>  	SAA7146_IER_DISABLE(saa, MASK_06);
>  	saa7146_setgpio(saa, 3, SAA7146_GPIO_INPUT);
> -	tasklet_kill(&budget_ci->ir.msp430_irq_tasklet);
> +	cancel_work_sync(&budget_ci->ir.msp430_irq_work);
>  
>  	rc_unregister_device(budget_ci->ir.dev);
>  }
> @@ -349,10 +350,10 @@ static int ciintf_slot_ts_enable(struct dvb_ca_en50221 *ca, int slot)
>  	return 0;
>  }
>  
> -static void ciintf_interrupt(struct tasklet_struct *t)
> +static void ciintf_interrupt(struct work_struct *t)
>  {
> -	struct budget_ci *budget_ci = from_tasklet(budget_ci, t,
> -						   ciintf_irq_tasklet);
> +	struct budget_ci *budget_ci = from_work(budget_ci, t,
> +						   ciintf_irq_work);
>  	struct saa7146_dev *saa = budget_ci->budget.dev;
>  	unsigned int flags;
>  
> @@ -491,7 +492,7 @@ static int ciintf_init(struct budget_ci *budget_ci)
>  
>  	// Setup CI slot IRQ
>  	if (budget_ci->ci_irq) {
> -		tasklet_setup(&budget_ci->ciintf_irq_tasklet, ciintf_interrupt);
> +		INIT_WORK(&budget_ci->ciintf_irq_work, ciintf_interrupt);
>  		if (budget_ci->slot_status != SLOTSTATUS_NONE)
>  			saa7146_setgpio(saa, 0, SAA7146_GPIO_IRQLO);
>  		else
> @@ -530,7 +531,7 @@ static void ciintf_deinit(struct budget_ci *budget_ci)
>  	if (budget_ci->ci_irq) {
>  		SAA7146_IER_DISABLE(saa, MASK_03);
>  		saa7146_setgpio(saa, 0, SAA7146_GPIO_INPUT);
> -		tasklet_kill(&budget_ci->ciintf_irq_tasklet);
> +		cancel_work_sync(&budget_ci->ciintf_irq_work);
>  	}
>  
>  	// reset interface
> @@ -556,13 +557,13 @@ static void budget_ci_irq(struct saa7146_dev *dev, u32 *isr)
>  	dprintk(8, "dev: %p, budget_ci: %p\n", dev, budget_ci);
>  
>  	if (*isr & MASK_06)
> -		tasklet_schedule(&budget_ci->ir.msp430_irq_tasklet);
> +		queue_work(system_bh_wq, &budget_ci->ir.msp430_irq_work);
>  
>  	if (*isr & MASK_10)
>  		ttpci_budget_irq10_handler(dev, isr);
>  
>  	if ((*isr & MASK_03) && (budget_ci->budget.ci_present) && (budget_ci->ci_irq))
> -		tasklet_schedule(&budget_ci->ciintf_irq_tasklet);
> +		queue_work(system_bh_wq, &budget_ci->ciintf_irq_work);
>  }
>  
>  static u8 philips_su1278_tt_inittab[] = {
> diff --git a/drivers/media/pci/ttpci/budget-core.c b/drivers/media/pci/ttpci/budget-core.c
> index d33adeca196f..ebcae1baedfe 100644
> --- a/drivers/media/pci/ttpci/budget-core.c
> +++ b/drivers/media/pci/ttpci/budget-core.c
> @@ -172,9 +172,9 @@ static int budget_read_fe_status(struct dvb_frontend *fe,
>  	return ret;
>  }
>  
> -static void vpeirq(struct tasklet_struct *t)
> +static void vpeirq(struct work_struct *t)
>  {
> -	struct budget *budget = from_tasklet(budget, t, vpe_tasklet);
> +	struct budget *budget = from_work(budget, t, vpe_work);
>  	u8 *mem = (u8 *) (budget->grabbing);
>  	u32 olddma = budget->ttbp;
>  	u32 newdma = saa7146_read(budget->dev, PCI_VDP3);
> @@ -525,7 +525,7 @@ int ttpci_budget_init(struct budget *budget, struct saa7146_dev *dev,
>  	/* upload all */
>  	saa7146_write(dev, GPIO_CTRL, 0x000000);
>  
> -	tasklet_setup(&budget->vpe_tasklet, vpeirq);
> +	INIT_WORK(&budget->vpe_work, vpeirq);
>  
>  	/* frontend power on */
>  	if (bi->type != BUDGET_FS_ACTIVY)
> @@ -565,7 +565,7 @@ int ttpci_budget_deinit(struct budget *budget)
>  
>  	budget_unregister(budget);
>  
> -	tasklet_kill(&budget->vpe_tasklet);
> +	cancel_work_sync(&budget->vpe_work);
>  
>  	saa7146_vfree_destroy_pgtable(dev->pci, budget->grabbing, &budget->pt);
>  
> @@ -584,7 +584,7 @@ void ttpci_budget_irq10_handler(struct saa7146_dev *dev, u32 *isr)
>  	dprintk(8, "dev: %p, budget: %p\n", dev, budget);
>  
>  	if (*isr & MASK_10)
> -		tasklet_schedule(&budget->vpe_tasklet);
> +		queue_work(system_bh_wq, &budget->vpe_work);
>  }
>  EXPORT_SYMBOL_GPL(ttpci_budget_irq10_handler);
>  
> diff --git a/drivers/media/pci/ttpci/budget.h b/drivers/media/pci/ttpci/budget.h
> index 83ead34dc766..54bf96a2f5b5 100644
> --- a/drivers/media/pci/ttpci/budget.h
> +++ b/drivers/media/pci/ttpci/budget.h
> @@ -18,6 +18,7 @@
>  
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/workqueue.h>
>  
>  #include <media/drv-intf/saa7146.h>
>  
> @@ -54,8 +55,8 @@ struct budget {
>  	unsigned char *grabbing;
>  	struct saa7146_pgtable pt;
>  
> -	struct tasklet_struct fidb_tasklet;
> -	struct tasklet_struct vpe_tasklet;
> +	struct work_struct fidb_work;

fidb_bh_work

> +	struct work_struct vpe_work;

vpe_bh_work

>  
>  	struct dmxdev dmxdev;
>  	struct dvb_demux demux;
> diff --git a/drivers/media/pci/tw5864/tw5864-core.c b/drivers/media/pci/tw5864/tw5864-core.c
> index 560ff1ddcc83..4d33caf83307 100644
> --- a/drivers/media/pci/tw5864/tw5864-core.c
> +++ b/drivers/media/pci/tw5864/tw5864-core.c
> @@ -144,7 +144,7 @@ static void tw5864_h264_isr(struct tw5864_dev *dev)
>  		cur_frame->gop_seqno = input->frame_gop_seqno;
>  
>  		dev->h264_buf_w_index = next_frame_index;
> -		tasklet_schedule(&dev->tasklet);
> +		queue_work(system_bh_wq, &dev->bh_work);
>  
>  		cur_frame = next_frame;
>  
> diff --git a/drivers/media/pci/tw5864/tw5864-video.c b/drivers/media/pci/tw5864/tw5864-video.c
> index 8b1aae4b6319..4f35c159efe5 100644
> --- a/drivers/media/pci/tw5864/tw5864-video.c
> +++ b/drivers/media/pci/tw5864/tw5864-video.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/module.h>
> +#include <linux/workqueue.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-event.h>
>  #include <media/videobuf2-dma-contig.h>
> @@ -175,7 +176,7 @@ static const unsigned int intra4x4_lambda3[] = {
>  static v4l2_std_id tw5864_get_v4l2_std(enum tw5864_vid_std std);
>  static enum tw5864_vid_std tw5864_from_v4l2_std(v4l2_std_id v4l2_std);
>  
> -static void tw5864_handle_frame_task(struct tasklet_struct *t);
> +static void tw5864_handle_frame_work(struct work_struct *t);
>  static void tw5864_handle_frame(struct tw5864_h264_frame *frame);
>  static void tw5864_frame_interval_set(struct tw5864_input *input);
>  
> @@ -1062,7 +1063,7 @@ int tw5864_video_init(struct tw5864_dev *dev, int *video_nr)
>  	dev->irqmask |= TW5864_INTR_VLC_DONE | TW5864_INTR_TIMER;
>  	tw5864_irqmask_apply(dev);
>  
> -	tasklet_setup(&dev->tasklet, tw5864_handle_frame_task);
> +	INIT_WORK(&dev->bh_work, tw5864_handle_frame_work);
>  
>  	for (i = 0; i < TW5864_INPUTS; i++) {
>  		dev->inputs[i].root = dev;
> @@ -1079,7 +1080,7 @@ int tw5864_video_init(struct tw5864_dev *dev, int *video_nr)
>  	for (i = last_input_nr_registered; i >= 0; i--)
>  		tw5864_video_input_fini(&dev->inputs[i]);
>  
> -	tasklet_kill(&dev->tasklet);
> +	cancel_work_sync(&dev->bh_work);
>  
>  free_dma:
>  	for (i = last_dma_allocated; i >= 0; i--) {
> @@ -1198,7 +1199,7 @@ void tw5864_video_fini(struct tw5864_dev *dev)
>  {
>  	int i;
>  
> -	tasklet_kill(&dev->tasklet);
> +	cancel_work_sync(&dev->bh_work);
>  
>  	for (i = 0; i < TW5864_INPUTS; i++)
>  		tw5864_video_input_fini(&dev->inputs[i]);
> @@ -1315,9 +1316,9 @@ static int tw5864_is_motion_triggered(struct tw5864_h264_frame *frame)
>  	return detected;
>  }
>  
> -static void tw5864_handle_frame_task(struct tasklet_struct *t)
> +static void tw5864_handle_frame_work(struct work_struct *t)
>  {
> -	struct tw5864_dev *dev = from_tasklet(dev, t, tasklet);
> +	struct tw5864_dev *dev = from_work(dev, t, bh_work);
>  	unsigned long flags;
>  	int batch_size = H264_BUF_CNT;
>  
> diff --git a/drivers/media/pci/tw5864/tw5864.h b/drivers/media/pci/tw5864/tw5864.h
> index a8b6fbd5b710..2da5f4215fd9 100644
> --- a/drivers/media/pci/tw5864/tw5864.h
> +++ b/drivers/media/pci/tw5864/tw5864.h
> @@ -12,6 +12,7 @@
>  #include <linux/mutex.h>
>  #include <linux/io.h>
>  #include <linux/interrupt.h>
> +#include <linux/workqueue.h>
>  
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-ioctl.h>
> @@ -85,7 +86,7 @@ struct tw5864_input {
>  	int nr; /* input number */
>  	struct tw5864_dev *root;
>  	struct mutex lock; /* used for vidq and vdev */
> -	spinlock_t slock; /* used for sync between ISR, tasklet & V4L2 API */
> +	spinlock_t slock; /* used for sync between ISR, bh_work & V4L2 API */
>  	struct video_device vdev;
>  	struct v4l2_ctrl_handler hdl;
>  	struct vb2_queue vidq;
> @@ -142,7 +143,7 @@ struct tw5864_h264_frame {
>  
>  /* global device status */
>  struct tw5864_dev {
> -	spinlock_t slock; /* used for sync between ISR, tasklet & V4L2 API */
> +	spinlock_t slock; /* used for sync between ISR, bh_work & V4L2 API */
>  	struct v4l2_device v4l2_dev;
>  	struct tw5864_input inputs[TW5864_INPUTS];
>  #define H264_BUF_CNT 4
> @@ -150,7 +151,7 @@ struct tw5864_dev {
>  	int h264_buf_r_index;
>  	int h264_buf_w_index;
>  
> -	struct tasklet_struct tasklet;
> +	struct work_struct bh_work;
>  
>  	int encoder_busy;
>  	/* Input number to check next for ready raw picture (in RR fashion) */
> diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
> index d904952bf00e..f118aaac0b38 100644
> --- a/drivers/media/platform/intel/pxa_camera.c
> +++ b/drivers/media/platform/intel/pxa_camera.c
> @@ -43,6 +43,7 @@
>  #include <linux/videodev2.h>
>  
>  #include <linux/platform_data/media/camera-pxa.h>
> +#include <linux/workqueue.h>
>  
>  #define PXA_CAM_VERSION "0.0.6"
>  #define PXA_CAM_DRV_NAME "pxa27x-camera"
> @@ -683,7 +684,7 @@ struct pxa_camera_dev {
>  	unsigned int		buf_sequence;
>  
>  	struct pxa_buffer	*active;
> -	struct tasklet_struct	task_eof;
> +	struct work_struct	eof_bh_work;
>  
>  	u32			save_cicr[5];
>  };
> @@ -1146,9 +1147,9 @@ static void pxa_camera_deactivate(struct pxa_camera_dev *pcdev)
>  	clk_disable_unprepare(pcdev->clk);
>  }
>  
> -static void pxa_camera_eof(struct tasklet_struct *t)
> +static void pxa_camera_eof_bh_work(struct work_struct *t)
>  {
> -	struct pxa_camera_dev *pcdev = from_tasklet(pcdev, t, task_eof);
> +	struct pxa_camera_dev *pcdev = from_work(pcdev, t, eof_bh_work);
>  	unsigned long cifr;
>  	struct pxa_buffer *buf;
>  
> @@ -1185,7 +1186,7 @@ static irqreturn_t pxa_camera_irq(int irq, void *data)
>  	if (status & CISR_EOF) {
>  		cicr0 = __raw_readl(pcdev->base + CICR0) | CICR0_EOFM;
>  		__raw_writel(cicr0, pcdev->base + CICR0);
> -		tasklet_schedule(&pcdev->task_eof);
> +		queue_work(system_bh_wq, &pcdev->eof_bh_work);
>  	}
>  
>  	return IRQ_HANDLED;
> @@ -2383,7 +2384,7 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	tasklet_setup(&pcdev->task_eof, pxa_camera_eof);
> +	INIT_WORK(&pcdev->eof_bh_work, pxa_camera_eof_bh_work);
>  
>  	pxa_camera_activate(pcdev);
>  
> @@ -2409,7 +2410,7 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	return 0;
>  exit_deactivate:
>  	pxa_camera_deactivate(pcdev);
> -	tasklet_kill(&pcdev->task_eof);
> +	cancel_work_sync(&pcdev->eof_bh_work);
>  exit_free_dma:
>  	dma_release_channel(pcdev->dma_chans[2]);
>  exit_free_dma_u:
> @@ -2428,7 +2429,7 @@ static void pxa_camera_remove(struct platform_device *pdev)
>  	struct pxa_camera_dev *pcdev = platform_get_drvdata(pdev);
>  
>  	pxa_camera_deactivate(pcdev);
> -	tasklet_kill(&pcdev->task_eof);
> +	cancel_work_sync(&pcdev->eof_bh_work);
>  	dma_release_channel(pcdev->dma_chans[0]);
>  	dma_release_channel(pcdev->dma_chans[1]);
>  	dma_release_channel(pcdev->dma_chans[2]);
> diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
> index 66688b4aece5..fa7ebf2fcfac 100644
> --- a/drivers/media/platform/marvell/mcam-core.c
> +++ b/drivers/media/platform/marvell/mcam-core.c
> @@ -439,9 +439,9 @@ static void mcam_ctlr_dma_vmalloc(struct mcam_camera *cam)
>  /*
>   * Copy data out to user space in the vmalloc case
>   */
> -static void mcam_frame_tasklet(struct tasklet_struct *t)
> +static void mcam_frame_work(struct work_struct *t)
>  {
> -	struct mcam_camera *cam = from_tasklet(cam, t, s_tasklet);
> +	struct mcam_camera *cam = from_work(cam, t, s_work);
>  	int i;
>  	unsigned long flags;
>  	struct mcam_vb_buffer *buf;
> @@ -493,7 +493,7 @@ static int mcam_check_dma_buffers(struct mcam_camera *cam)
>  
>  static void mcam_vmalloc_done(struct mcam_camera *cam, int frame)
>  {
> -	tasklet_schedule(&cam->s_tasklet);
> +	queue_work(system_bh_wq, &cam->s_work);
>  }
>  
>  #else /* MCAM_MODE_VMALLOC */
> @@ -1305,7 +1305,7 @@ static int mcam_setup_vb2(struct mcam_camera *cam)
>  		break;
>  	case B_vmalloc:
>  #ifdef MCAM_MODE_VMALLOC
> -		tasklet_setup(&cam->s_tasklet, mcam_frame_tasklet);
> +		INIT_WORK(&cam->s_work, mcam_frame_work);
>  		vq->ops = &mcam_vb2_ops;
>  		vq->mem_ops = &vb2_vmalloc_memops;
>  		cam->dma_setup = mcam_ctlr_dma_vmalloc;
> diff --git a/drivers/media/platform/marvell/mcam-core.h b/drivers/media/platform/marvell/mcam-core.h
> index 51e66db45af6..0d4b953dbb23 100644
> --- a/drivers/media/platform/marvell/mcam-core.h
> +++ b/drivers/media/platform/marvell/mcam-core.h
> @@ -9,6 +9,7 @@
>  
>  #include <linux/list.h>
>  #include <linux/clk-provider.h>
> +#include <linux/workqueue.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-dev.h>
> @@ -167,7 +168,7 @@ struct mcam_camera {
>  	unsigned int dma_buf_size;	/* allocated size */
>  	void *dma_bufs[MAX_DMA_BUFS];	/* Internal buffer addresses */
>  	dma_addr_t dma_handles[MAX_DMA_BUFS]; /* Buffer bus addresses */
> -	struct tasklet_struct s_tasklet;
> +	struct work_struct s_work;

s_bh_work

>  #endif
>  	unsigned int sequence;		/* Frame sequence number */
>  	unsigned int buf_seq[MAX_DMA_BUFS]; /* Sequence for individual bufs */
> diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
> index 2f58a0d0df85..7bbb26a5b366 100644
> --- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
> +++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
> @@ -72,16 +72,16 @@ static void c8sectpfe_timer_interrupt(struct timer_list *t)
>  
>  		/* is this descriptor initialised and TP enabled */
>  		if (channel->irec && readl(channel->irec + DMA_PRDS_TPENABLE))
> -			tasklet_schedule(&channel->tsklet);
> +			queue_work(system_bh_wq, &channel->bh_work);
>  	}
>  
>  	fei->timer.expires = jiffies +	msecs_to_jiffies(POLL_MSECS);
>  	add_timer(&fei->timer);
>  }
>  
> -static void channel_swdemux_tsklet(struct tasklet_struct *t)
> +static void channel_swdemux_bh_work(struct work_struct *t)
>  {
> -	struct channel_info *channel = from_tasklet(channel, t, tsklet);
> +	struct channel_info *channel = from_work(channel, t, bh_work);
>  	struct c8sectpfei *fei;
>  	unsigned long wp, rp;
>  	int pos, num_packets, n, size;
> @@ -210,7 +210,7 @@ static int c8sectpfe_start_feed(struct dvb_demux_feed *dvbdmxfeed)
>  
>  		dev_dbg(fei->dev, "Starting channel=%p\n", channel);
>  
> -		tasklet_setup(&channel->tsklet, channel_swdemux_tsklet);
> +		INIT_WORK(&channel->bh_work, channel_swdemux_bh_work);
>  
>  		/* Reset the internal inputblock sram pointers */
>  		writel(channel->fifo,
> @@ -303,7 +303,7 @@ static int c8sectpfe_stop_feed(struct dvb_demux_feed *dvbdmxfeed)
>  		/* disable this channels descriptor */
>  		writel(0,  channel->irec + DMA_PRDS_TPENABLE);
>  
> -		tasklet_disable(&channel->tsklet);
> +		disable_work_sync(&channel->bh_work);
>  
>  		/* now request memdma channel goes idle */
>  		idlereq = (1 << channel->tsin_id) | IDLEREQ;
> @@ -630,8 +630,8 @@ static int configure_memdma_and_inputblock(struct c8sectpfei *fei,
>  	writel(tsin->back_buffer_busaddr, tsin->irec + DMA_PRDS_BUSWP_TP(0));
>  	writel(tsin->back_buffer_busaddr, tsin->irec + DMA_PRDS_BUSRP_TP(0));
>  
> -	/* initialize tasklet */
> -	tasklet_setup(&tsin->tsklet, channel_swdemux_tsklet);
> +	/* initialize work */
> +	INIT_WORK(&tsin->bh_work, channel_swdemux_bh_work);
>  
>  	return 0;
>  
> diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.h b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.h
> index bf377cc82225..c1b124c6ef12 100644
> --- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.h
> +++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.h
> @@ -51,7 +51,7 @@ struct channel_info {
>  	unsigned long  fifo;
>  
>  	struct completion idle_completion;
> -	struct tasklet_struct tsklet;
> +	struct work_struct bh_work;
>  
>  	struct c8sectpfei *fei;
>  	void __iomem *irec;
> diff --git a/drivers/media/radio/wl128x/fmdrv.h b/drivers/media/radio/wl128x/fmdrv.h
> index da8920169df8..03117a41dbd4 100644
> --- a/drivers/media/radio/wl128x/fmdrv.h
> +++ b/drivers/media/radio/wl128x/fmdrv.h
> @@ -15,6 +15,7 @@
>  #include <sound/core.h>
>  #include <sound/initval.h>
>  #include <linux/timer.h>
> +#include <linux/workqueue.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-device.h>
> @@ -200,10 +201,10 @@ struct fmdev {
>  	int streg_cbdata; /* status of ST registration */
>  
>  	struct sk_buff_head rx_q;	/* RX queue */
> -	struct tasklet_struct rx_task;	/* RX Tasklet */
> +	struct work_struct rx_bh_work;	/* RX BH Work */
>  
>  	struct sk_buff_head tx_q;	/* TX queue */
> -	struct tasklet_struct tx_task;	/* TX Tasklet */
> +	struct work_struct tx_bh_work;	/* TX BH Work */
>  	unsigned long last_tx_jiffies;	/* Timestamp of last pkt sent */
>  	atomic_t tx_cnt;	/* Number of packets can send at a time */
>  
> diff --git a/drivers/media/radio/wl128x/fmdrv_common.c b/drivers/media/radio/wl128x/fmdrv_common.c
> index 3da8e5102bec..37ed1ed664e0 100644
> --- a/drivers/media/radio/wl128x/fmdrv_common.c
> +++ b/drivers/media/radio/wl128x/fmdrv_common.c
> @@ -9,7 +9,7 @@
>   *     one Channel-8 command to be sent to the chip).
>   *  2) Sending each Channel-8 command to the chip and reading
>   *     response back over Shared Transport.
> - *  3) Managing TX and RX Queues and Tasklets.
> + *  3) Managing TX and RX Queues and BH Works.
>   *  4) Handling FM Interrupt packet and taking appropriate action.
>   *  5) Loading FM firmware to the chip (common, FM TX, and FM RX
>   *     firmware files based on mode selection)
> @@ -244,10 +244,10 @@ void fmc_update_region_info(struct fmdev *fmdev, u8 region_to_set)
>  }
>  
>  /*
> - * FM common sub-module will schedule this tasklet whenever it receives
> + * FM common sub-module will queue this work whenever it receives
>   * FM packet from ST driver.
>   */
> -static void recv_tasklet(struct tasklet_struct *t)
> +static void recv_bh_work(struct work_struct *t)
>  {
>  	struct fmdev *fmdev;
>  	struct fm_irq *irq_info;
> @@ -256,7 +256,7 @@ static void recv_tasklet(struct tasklet_struct *t)
>  	u8 num_fm_hci_cmds;
>  	unsigned long flags;
>  
> -	fmdev = from_tasklet(fmdev, t, tx_task);
> +	fmdev = from_work(fmdev, t, tx_bh_work);
>  	irq_info = &fmdev->irq_info;
>  	/* Process all packets in the RX queue */
>  	while ((skb = skb_dequeue(&fmdev->rx_q))) {
> @@ -322,22 +322,22 @@ static void recv_tasklet(struct tasklet_struct *t)
>  
>  		/*
>  		 * Check flow control field. If Num_FM_HCI_Commands field is
> -		 * not zero, schedule FM TX tasklet.
> +		 * not zero, queue FM TX work.
>  		 */
>  		if (num_fm_hci_cmds && atomic_read(&fmdev->tx_cnt))
>  			if (!skb_queue_empty(&fmdev->tx_q))
> -				tasklet_schedule(&fmdev->tx_task);
> +				queue_work(system_bh_wq, &fmdev->tx_bh_work);
>  	}
>  }
>  
> -/* FM send tasklet: is scheduled when FM packet has to be sent to chip */
> -static void send_tasklet(struct tasklet_struct *t)
> +/* FM send_bh_work: is scheduled when FM packet has to be sent to chip */
> +static void send_bh_work(struct work_struct *t)
>  {
>  	struct fmdev *fmdev;
>  	struct sk_buff *skb;
>  	int len;
>  
> -	fmdev = from_tasklet(fmdev, t, tx_task);
> +	fmdev = from_work(fmdev, t, tx_bh_work);
>  
>  	if (!atomic_read(&fmdev->tx_cnt))
>  		return;
> @@ -366,7 +366,7 @@ static void send_tasklet(struct tasklet_struct *t)
>  	if (len < 0) {
>  		kfree_skb(skb);
>  		fmdev->resp_comp = NULL;
> -		fmerr("TX tasklet failed to send skb(%p)\n", skb);
> +		fmerr("TX work failed to send skb(%p)\n", skb);
>  		atomic_set(&fmdev->tx_cnt, 1);
>  	} else {
>  		fmdev->last_tx_jiffies = jiffies;
> @@ -374,7 +374,7 @@ static void send_tasklet(struct tasklet_struct *t)
>  }
>  
>  /*
> - * Queues FM Channel-8 packet to FM TX queue and schedules FM TX tasklet for
> + * Queues FM Channel-8 packet to FM TX queue and schedules FM TX work for
>   * transmission
>   */
>  static int fm_send_cmd(struct fmdev *fmdev, u8 fm_op, u16 type,	void *payload,
> @@ -440,7 +440,7 @@ static int fm_send_cmd(struct fmdev *fmdev, u8 fm_op, u16 type,	void *payload,
>  
>  	fm_cb(skb)->completion = wait_completion;
>  	skb_queue_tail(&fmdev->tx_q, skb);
> -	tasklet_schedule(&fmdev->tx_task);
> +	queue_work(system_bh_wq, &fmdev->tx_bh_work);
>  
>  	return 0;
>  }
> @@ -462,7 +462,7 @@ int fmc_send_cmd(struct fmdev *fmdev, u8 fm_op, u16 type, void *payload,
>  
>  	if (!wait_for_completion_timeout(&fmdev->maintask_comp,
>  					 FM_DRV_TX_TIMEOUT)) {
> -		fmerr("Timeout(%d sec),didn't get regcompletion signal from RX tasklet\n",
> +		fmerr("Timeout(%d sec),didn't get regcompletion signal from RX work\n",
>  			   jiffies_to_msecs(FM_DRV_TX_TIMEOUT) / 1000);
>  		return -ETIMEDOUT;
>  	}
> @@ -1455,7 +1455,7 @@ static long fm_st_receive(void *arg, struct sk_buff *skb)
>  
>  	memcpy(skb_push(skb, 1), &skb->cb[0], 1);
>  	skb_queue_tail(&fmdev->rx_q, skb);
> -	tasklet_schedule(&fmdev->rx_task);
> +	queue_work(system_bh_wq, &fmdev->rx_bh_work);
>  
>  	return 0;
>  }
> @@ -1537,13 +1537,13 @@ int fmc_prepare(struct fmdev *fmdev)
>  	spin_lock_init(&fmdev->rds_buff_lock);
>  	spin_lock_init(&fmdev->resp_skb_lock);
>  
> -	/* Initialize TX queue and TX tasklet */
> +	/* Initialize TX queue and TX work */

I noticed that in most comments 'tasklet' is replaced by 'work', but perhaps
that should also be 'BH work' (you do that in a few comments). It would be
nice if you can go through the patch and update comments where appropriate.

It is not a blocker, but it would make it a bit more consistent.

>  	skb_queue_head_init(&fmdev->tx_q);
> -	tasklet_setup(&fmdev->tx_task, send_tasklet);
> +	INIT_WORK(&fmdev->tx_bh_work, send_bh_work);
>  
> -	/* Initialize RX Queue and RX tasklet */
> +	/* Initialize RX Queue and RX work */
>  	skb_queue_head_init(&fmdev->rx_q);
> -	tasklet_setup(&fmdev->rx_task, recv_tasklet);
> +	INIT_WORK(&fmdev->rx_bh_work, recv_bh_work);
>  
>  	fmdev->irq_info.stage = 0;
>  	atomic_set(&fmdev->tx_cnt, 1);
> @@ -1589,8 +1589,8 @@ int fmc_release(struct fmdev *fmdev)
>  	/* Service pending read */
>  	wake_up_interruptible(&fmdev->rx.rds.read_queue);
>  
> -	tasklet_kill(&fmdev->tx_task);
> -	tasklet_kill(&fmdev->rx_task);
> +	cancel_work_sync(&fmdev->tx_bh_work);
> +	cancel_work_sync(&fmdev->rx_bh_work);
>  
>  	skb_queue_purge(&fmdev->tx_q);
>  	skb_queue_purge(&fmdev->rx_q);
> diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
> index c76ba24c1f55..01b65451228d 100644
> --- a/drivers/media/rc/mceusb.c
> +++ b/drivers/media/rc/mceusb.c
> @@ -774,7 +774,7 @@ static void mceusb_dev_printdata(struct mceusb_dev *ir, u8 *buf, int buf_len,
>  
>  /*
>   * Schedule work that can't be done in interrupt handlers
> - * (mceusb_dev_recv() and mce_write_callback()) nor tasklets.
> + * (mceusb_dev_recv() and mce_write_callback()) nor BH work.
>   * Invokes mceusb_deferred_kevent() for recovering from
>   * error events specified by the kevent bit field.
>   */
> diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
> index 79faa2560613..c8bc84f4aefb 100644
> --- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
> +++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
> @@ -19,6 +19,7 @@
>  #include <linux/input.h>
>  
>  #include <linux/mutex.h>
> +#include <linux/workqueue.h>
>  
>  #include <media/dmxdev.h>
>  #include <media/dvb_demux.h>
> @@ -139,7 +140,7 @@ struct ttusb_dec {
>  	int			v_pes_postbytes;
>  
>  	struct list_head	urb_frame_list;
> -	struct tasklet_struct	urb_tasklet;
> +	struct work_struct	urb_work;

urb_bh_work

>  	spinlock_t		urb_frame_list_lock;
>  
>  	struct dvb_demux_filter	*audio_filter;
> @@ -766,9 +767,9 @@ static void ttusb_dec_process_urb_frame(struct ttusb_dec *dec, u8 *b,
>  	}
>  }
>  
> -static void ttusb_dec_process_urb_frame_list(struct tasklet_struct *t)
> +static void ttusb_dec_process_urb_frame_list(struct work_struct *t)
>  {
> -	struct ttusb_dec *dec = from_tasklet(dec, t, urb_tasklet);
> +	struct ttusb_dec *dec = from_work(dec, t, urb_work);
>  	struct list_head *item;
>  	struct urb_frame *frame;
>  	unsigned long flags;
> @@ -822,7 +823,7 @@ static void ttusb_dec_process_urb(struct urb *urb)
>  				spin_unlock_irqrestore(&dec->urb_frame_list_lock,
>  						       flags);
>  
> -				tasklet_schedule(&dec->urb_tasklet);
> +				queue_work(system_bh_wq, &dec->urb_work);
>  			}
>  		}
>  	} else {
> @@ -1198,11 +1199,11 @@ static int ttusb_dec_alloc_iso_urbs(struct ttusb_dec *dec)
>  	return 0;
>  }
>  
> -static void ttusb_dec_init_tasklet(struct ttusb_dec *dec)
> +static void ttusb_dec_init_work(struct ttusb_dec *dec)
>  {
>  	spin_lock_init(&dec->urb_frame_list_lock);
>  	INIT_LIST_HEAD(&dec->urb_frame_list);
> -	tasklet_setup(&dec->urb_tasklet, ttusb_dec_process_urb_frame_list);
> +	INIT_WORK(&dec->urb_work, ttusb_dec_process_urb_frame_list);
>  }
>  
>  static int ttusb_init_rc( struct ttusb_dec *dec)
> @@ -1588,12 +1589,12 @@ static void ttusb_dec_exit_usb(struct ttusb_dec *dec)
>  	ttusb_dec_free_iso_urbs(dec);
>  }
>  
> -static void ttusb_dec_exit_tasklet(struct ttusb_dec *dec)
> +static void ttusb_dec_exit_work(struct ttusb_dec *dec)
>  {
>  	struct list_head *item;
>  	struct urb_frame *frame;
>  
> -	tasklet_kill(&dec->urb_tasklet);
> +	cancel_work_sync(&dec->urb_work);
>  
>  	while ((item = dec->urb_frame_list.next) != &dec->urb_frame_list) {
>  		frame = list_entry(item, struct urb_frame, urb_frame_list);
> @@ -1703,7 +1704,7 @@ static int ttusb_dec_probe(struct usb_interface *intf,
>  
>  	ttusb_dec_init_v_pes(dec);
>  	ttusb_dec_init_filters(dec);
> -	ttusb_dec_init_tasklet(dec);
> +	ttusb_dec_init_work(dec);
>  
>  	dec->active = 1;
>  
> @@ -1729,7 +1730,7 @@ static void ttusb_dec_disconnect(struct usb_interface *intf)
>  	dprintk("%s\n", __func__);
>  
>  	if (dec->active) {
> -		ttusb_dec_exit_tasklet(dec);
> +		ttusb_dec_exit_work(dec);
>  		ttusb_dec_exit_filters(dec);
>  		if(enable_rc)
>  			ttusb_dec_exit_rc(dec);

Regards,

	Hans

