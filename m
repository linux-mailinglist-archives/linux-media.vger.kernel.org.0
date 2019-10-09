Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF2D0D0CE6
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 12:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729320AbfJIKhW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 06:37:22 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:49825 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726579AbfJIKhW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Oct 2019 06:37:22 -0400
Received: from [IPv6:2001:983:e9a7:1:2801:e038:f2c3:e060] ([IPv6:2001:983:e9a7:1:2801:e038:f2c3:e060])
        by smtp-cloud8.xs4all.net with ESMTPA
        id I9LKibmEEop0AI9LLiOw8P; Wed, 09 Oct 2019 12:37:19 +0200
Subject: Re: [PATCH v2] media: cec-adap: add debounce support when setting an
 invalid phys addr
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <DB6PR06MB400724D0DD41B208D405F44FACBF0@DB6PR06MB4007.eurprd06.prod.outlook.com>
 <HE1PR06MB40115700084D1D875673D60EAC9D0@HE1PR06MB4011.eurprd06.prod.outlook.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e1ea769e-f3d0-767e-9671-86d6d107b49c@xs4all.nl>
Date:   Wed, 9 Oct 2019 12:37:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <HE1PR06MB40115700084D1D875673D60EAC9D0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfB6tmS3eQjyUK1ZE74PH7TgesnJiWQN8a3HrnmTeueCrjXg61xMu6d3En0Iie/HgTnEYI8X4ZBodTT03m0ib5nr07DMBSsEqYWWovSFHk9XiwXoFXQL5
 FD5LzbG+0NGdWI2OvVX3Zp9DhhVnEqbNM9GVVXu5osGK1SbnFGLoUBAVgLXPtwCLwO1XuZ+MFFBdC8CL7Rrllrum++oZy4i3LtmjGoaEQwIwtiueG7D9sSs1
 3lXhFcr91qxQhViz67bGVlVGAxeHeRvQpfJsZdURaPpTULGMoS4EcPVovJtOTOlxI4IYFXQJKUqgwlD98ICiVyE14BJE31Oniw6LQun1xiMSGiyjf9KlSHu+
 UC/+aMKAXrBRgEQ1jLc9KkaTjLMpLA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonas,

On 10/1/19 10:52 PM, Jonas Karlman wrote:
> When EDID is refreshed, HDMI cable is unplugged/replugged or
> an AVR is power cycled the CEC phys addr gets invalidated.
> 
> This can cause some disruption of CEC communication when
> adapter is being reconfigured.
> 
> Add a debounce module option that can be used to debounce setting
> an invalid phys addr. Default is not to use debouncing.
> 
> Using a configured debounce of e.g. 5000 ms, cec reconfiguring
> could be avoided when AVR was power cycled on my setup.
> 
> Power off AVR (default cec.debounce=0):
> [  101.536866] cec-dw_hdmi: new physical address f.f.f.f
> [  102.495686] cec-dw_hdmi: new physical address 2.1.0.0
> [  102.495913] cec-dw_hdmi: physical address: 2.1.0.0, claim 1 logical addresses
> [  102.628574] cec-dw_hdmi: config: la 1 pa 2.1.0.0
> [  105.130115] cec-dw_hdmi: new physical address f.f.f.f
> [  106.979705] cec-dw_hdmi: new physical address 2.1.0.0
> [  106.979872] cec-dw_hdmi: physical address: 2.1.0.0, claim 1 logical addresses
> [  107.112399] cec-dw_hdmi: config: la 1 pa 2.1.0.0
> [  108.979408] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 5
> [  109.205386] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 11
> 
> Power on AVR (default cec.debounce=0):
> [  158.398447] cec-dw_hdmi: new physical address f.f.f.f
> [  161.977714] cec-dw_hdmi: new physical address 2.1.0.0
> [  161.978766] cec-dw_hdmi: physical address: 2.1.0.0, claim 1 logical addresses
> [  162.115624] cec-dw_hdmi: config: la 1 pa 2.1.0.0
> [  162.402750] cec-dw_hdmi: new physical address f.f.f.f
> [  162.403389] cec-dw_hdmi: cec_transmit_msg_fh: adapter is unconfigured
> [  162.886757] cec-dw_hdmi: new physical address 2.1.0.0
> [  162.886964] cec-dw_hdmi: physical address: 2.1.0.0, claim 1 logical addresses
> [  163.510725] cec-dw_hdmi: config: la 1 pa 2.1.0.0
> [  173.034200] cec-dw_hdmi: message 10 89 02 05 timed out
> 
> Power off AVR (cec.debounce=5000):
> [  251.720471] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 5
> [  251.922432] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 11
> 
> Power on AVR (cec.debounce=5000):
> [  291.154262] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 5
> [  291.296199] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 11
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/media/cec/cec-adap.c |  9 ++++++++-
>  drivers/media/cec/cec-core.c | 18 ++++++++++++++++++
>  drivers/media/cec/cec-priv.h |  1 +
>  include/media/cec.h          |  2 ++
>  4 files changed, 29 insertions(+), 1 deletion(-)

This patch looks pretty good. It's surprisingly little code for a feature like this,
nice!

This module option should be documented in Documentation/media/uapi/cec/cec-intro.rst.
Make a section "1.1 Debouncing" that explains this module option.

I also have one code comment:

> 
> diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
> index 5ef7daeb8cbd..4c94f6da526b 100644
> --- a/drivers/media/cec/cec-adap.c
> +++ b/drivers/media/cec/cec-adap.c
> @@ -1593,8 +1593,15 @@ void cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
>  	if (IS_ERR_OR_NULL(adap))
>  		return;
>  
> +	cancel_delayed_work_sync(&adap->debounce_work);
> +
>  	mutex_lock(&adap->lock);
> -	__cec_s_phys_addr(adap, phys_addr, block);
> +	if (cec_debounce > 0 && !block && phys_addr == CEC_PHYS_ADDR_INVALID &&
> +	    adap->phys_addr != phys_addr)
> +		schedule_delayed_work(&adap->debounce_work,
> +				      msecs_to_jiffies(cec_debounce));
> +	else
> +		__cec_s_phys_addr(adap, phys_addr, block);
>  	mutex_unlock(&adap->lock);
>  }
>  EXPORT_SYMBOL_GPL(cec_s_phys_addr);
> diff --git a/drivers/media/cec/cec-core.c b/drivers/media/cec/cec-core.c
> index 9c610e1e99b8..fa93a724d7aa 100644
> --- a/drivers/media/cec/cec-core.c
> +++ b/drivers/media/cec/cec-core.c
> @@ -28,6 +28,10 @@ static bool debug_phys_addr;
>  module_param(debug_phys_addr, bool, 0644);
>  MODULE_PARM_DESC(debug_phys_addr, "add CEC_CAP_PHYS_ADDR if set");
>  
> +int cec_debounce;
> +module_param_named(debounce, cec_debounce, int, 0644);
> +MODULE_PARM_DESC(debounce, "debounce invalid phys addr");

This should say: "invalid physical address debounce time in ms"

I also recommend renaming 'debounce' to 'debounce_ms' to signal that this
is in ms.

Regards,

	Hans

> +
>  static dev_t cec_dev_t;
>  
>  /* Active devices */
> @@ -174,6 +178,8 @@ static void cec_devnode_unregister(struct cec_adapter *adap)
>  	devnode->unregistered = true;
>  	mutex_unlock(&devnode->lock);
>  
> +	cancel_delayed_work_sync(&adap->debounce_work);
> +
>  	mutex_lock(&adap->lock);
>  	__cec_s_phys_addr(adap, CEC_PHYS_ADDR_INVALID, false);
>  	__cec_s_log_addrs(adap, NULL, false);
> @@ -250,6 +256,17 @@ static const struct file_operations cec_error_inj_fops = {
>  };
>  #endif
>  
> +static void cec_s_phys_addr_debounce(struct work_struct *work)
> +{
> +	struct delayed_work *delayed_work = to_delayed_work(work);
> +	struct cec_adapter *adap =
> +		container_of(delayed_work, struct cec_adapter, debounce_work);
> +
> +	mutex_lock(&adap->lock);
> +	__cec_s_phys_addr(adap, CEC_PHYS_ADDR_INVALID, false);
> +	mutex_unlock(&adap->lock);
> +}
> +
>  struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
>  					 void *priv, const char *name, u32 caps,
>  					 u8 available_las)
> @@ -293,6 +310,7 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
>  	INIT_LIST_HEAD(&adap->transmit_queue);
>  	INIT_LIST_HEAD(&adap->wait_queue);
>  	init_waitqueue_head(&adap->kthread_waitq);
> +	INIT_DELAYED_WORK(&adap->debounce_work, cec_s_phys_addr_debounce);
>  
>  	/* adap->devnode initialization */
>  	INIT_LIST_HEAD(&adap->devnode.fhs);
> diff --git a/drivers/media/cec/cec-priv.h b/drivers/media/cec/cec-priv.h
> index 7bdf855aaecd..65176294fcf0 100644
> --- a/drivers/media/cec/cec-priv.h
> +++ b/drivers/media/cec/cec-priv.h
> @@ -27,6 +27,7 @@ static inline bool msg_is_raw(const struct cec_msg *msg)
>  
>  /* cec-core.c */
>  extern int cec_debug;
> +extern int cec_debounce;
>  int cec_get_device(struct cec_devnode *devnode);
>  void cec_put_device(struct cec_devnode *devnode);
>  
> diff --git a/include/media/cec.h b/include/media/cec.h
> index 4d59387bc61b..4d96ece01ba2 100644
> --- a/include/media/cec.h
> +++ b/include/media/cec.h
> @@ -195,6 +195,8 @@ struct cec_adapter {
>  	wait_queue_head_t kthread_waitq;
>  	wait_queue_head_t waitq;
>  
> +	struct delayed_work debounce_work;
> +
>  	const struct cec_adap_ops *ops;
>  	void *priv;
>  	u32 capabilities;
> 

