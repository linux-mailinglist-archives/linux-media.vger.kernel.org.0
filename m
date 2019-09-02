Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28F43A5503
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 13:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730382AbfIBLeE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 07:34:04 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:44751 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730148AbfIBLeE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Sep 2019 07:34:04 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 4karidVj0zaKO4kaviXSof; Mon, 02 Sep 2019 13:34:02 +0200
Subject: Re: [PATCH] media: cec-notifier: debounce reporing of invalid phys
 addr
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <DB6PR06MB400724D0DD41B208D405F44FACBF0@DB6PR06MB4007.eurprd06.prod.outlook.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <4754781f-3a3b-ef01-881e-c53848f542d8@xs4all.nl>
Date:   Mon, 2 Sep 2019 13:33:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <DB6PR06MB400724D0DD41B208D405F44FACBF0@DB6PR06MB4007.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP5JnqS6IAOndfVuApgWk+ozlmOnMT6o2ensM1jUQVb2K6GthH+EWhPrc2RDemz2sVGkOynb4Lfgz6VttXXkjPAsLREb4bWMU+RKvQxG6grD++IrsH/D
 fzNZ/N6hcfuyfuhvNDhIKgVgxzhaXTjCYBX6TRJA0R6w4ugttuWO4AgUPICiOx34qOps8MO0WYxRUz77Gyzd4n96jeR1GcPxzaA/zRXAQzkZgf/GcWJeFevB
 2b+oTJp2bLG5TMs+b4fSulM4vFzt4PoVI2rRIaJcRgQSOviN/LdESJeO+HE2iFts
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonas,

On 9/1/19 9:45 PM, Jonas Karlman wrote:
> When EDID is refreshed, HDMI cable is unplugged/replugged or
> an AVR is power cycled the CEC phys addr gets invalidated.
> 
> This can cause some disruption of CEC communication when
> adapter is being reconfigured.
> 
> Add a debounce option that can be used to debounce setting
> an invalid phys addr.

Debouncing can be dangerous since there are scenarios where there
is a quick unplug/replug such as in HDMI splitters.

So by default this should be off: I have yet to see issues with
just assuming the sink was unplugged and a potentially different
sink was plugged in.

That said, it would be nice to have a debounce module option, but
this doesn't belong in cec-notifier. Instead, this should be done
in the cec_s_phys_addr() function itself.

Regards,

	Hans

> 
> Power off AVR (debounce = 0):
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
> Power on AVR (debounce = 0):
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
> Power off AVR (debounce = 5000):
> [  251.720471] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 5
> [  251.922432] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 11
> 
> Power on AVR (debounce = 5000):
> [  291.154262] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 5
> [  291.296199] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 11
> 
> Using a debounce of 5000 ms reconfiguring can be avoided.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/media/cec/cec-core.c     |  4 ++++
>  drivers/media/cec/cec-notifier.c | 23 ++++++++++++++++++++++-
>  drivers/media/cec/cec-priv.h     |  1 +
>  3 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/cec/cec-core.c b/drivers/media/cec/cec-core.c
> index 9c610e1e99b8..c5094fd9b664 100644
> --- a/drivers/media/cec/cec-core.c
> +++ b/drivers/media/cec/cec-core.c
> @@ -28,6 +28,10 @@ static bool debug_phys_addr;
>  module_param(debug_phys_addr, bool, 0644);
>  MODULE_PARM_DESC(debug_phys_addr, "add CEC_CAP_PHYS_ADDR if set");
>  
> +int cec_debounce;
> +module_param_named(debounce, cec_debounce, int, 0644);
> +MODULE_PARM_DESC(debounce, "debounce invalid phys addr");
> +
>  static dev_t cec_dev_t;
>  
>  /* Active devices */
> diff --git a/drivers/media/cec/cec-notifier.c b/drivers/media/cec/cec-notifier.c
> index 4d82a5522072..0157d468cfe4 100644
> --- a/drivers/media/cec/cec-notifier.c
> +++ b/drivers/media/cec/cec-notifier.c
> @@ -12,11 +12,14 @@
>  #include <linux/list.h>
>  #include <linux/kref.h>
>  #include <linux/of_platform.h>
> +#include <linux/workqueue.h>
>  
>  #include <media/cec.h>
>  #include <media/cec-notifier.h>
>  #include <drm/drm_edid.h>
>  
> +#include "cec-priv.h"
> +
>  struct cec_notifier {
>  	struct mutex lock;
>  	struct list_head head;
> @@ -28,11 +31,25 @@ struct cec_notifier {
>  	void (*callback)(struct cec_adapter *adap, u16 pa);
>  
>  	u16 phys_addr;
> +	struct delayed_work work;
>  };
>  
>  static LIST_HEAD(cec_notifiers);
>  static DEFINE_MUTEX(cec_notifiers_lock);
>  
> +static void cec_notifier_delayed_work(struct work_struct *work)
> +{
> +	struct cec_notifier *n =
> +		container_of(to_delayed_work(work), struct cec_notifier, work);
> +
> +	mutex_lock(&n->lock);
> +	if (n->callback)
> +		n->callback(n->cec_adap, n->phys_addr);
> +	else if (n->cec_adap)
> +		cec_s_phys_addr(n->cec_adap, n->phys_addr, false);
> +	mutex_unlock(&n->lock);
> +}
> +
>  struct cec_notifier *
>  cec_notifier_get_conn(struct device *hdmi_dev, const char *conn_name)
>  {
> @@ -62,6 +79,7 @@ cec_notifier_get_conn(struct device *hdmi_dev, const char *conn_name)
>  	}
>  	n->phys_addr = CEC_PHYS_ADDR_INVALID;
>  
> +	INIT_DELAYED_WORK(&n->work, cec_notifier_delayed_work);
>  	mutex_init(&n->lock);
>  	kref_init(&n->kref);
>  	list_add_tail(&n->head, &cec_notifiers);
> @@ -172,9 +190,12 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)
>  	if (n == NULL)
>  		return;
>  
> +	cancel_delayed_work_sync(&n->work);
>  	mutex_lock(&n->lock);
>  	n->phys_addr = pa;
> -	if (n->callback)
> +	if (cec_debounce > 0 && pa == CEC_PHYS_ADDR_INVALID)
> +		schedule_delayed_work(&n->work, msecs_to_jiffies(cec_debounce));
> +	else if (n->callback)
>  		n->callback(n->cec_adap, n->phys_addr);
>  	else if (n->cec_adap)
>  		cec_s_phys_addr(n->cec_adap, n->phys_addr, false);
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
> 

