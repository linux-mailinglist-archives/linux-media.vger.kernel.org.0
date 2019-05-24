Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4C9229489
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 11:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390199AbfEXJVe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 05:21:34 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:43657 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389745AbfEXJVe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 05:21:34 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id U6OGhZF2y0YQeU6OJh0wW4; Fri, 24 May 2019 11:21:31 +0200
Subject: Re: [PATCH v7 1/3] media: cec: expose HDMI connector to CEC dev
 mapping
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org, hans.verkuil@cisco.com
Cc:     linux-kernel@vger.kernel.org
References: <20190521105203.154043-1-darekm@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <16889839-b4e9-9984-2e36-5f07ceb7d7f2@xs4all.nl>
Date:   Fri, 24 May 2019 11:21:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521105203.154043-1-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfInCA4+pSmh33W6CoM96GKwYFFMAGnShfa3gESvaopVgSwHlupKlaCYfXID3XZduM+n92AyLtkKauD2dl06zDaBaa4Mi4tsbeBIaA2H5RaJ8jlLPRjAA
 dt88wjIAnBAqIy+EPfCAU0YiY+Mx0EqEzajYTBEOEMX1ha4TPuJqspbRIPkSr5maXJuMzKFam/8EzgINa47Nkim8mTofcDqogckkLsf3XFJtRa+RsOTRoEDd
 ekTEjNyxRES8wEHU4Rpw8QybfjwTaV7dQFsh0QOg8Co=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dariusz,

I did some more testing with the Khadas VIM2 and found another problem,
something that will, unfortunately, require some redesign.

See my comments below...

On 5/21/19 12:52 PM, Dariusz Marcinkiewicz wrote:
> This patch proposes to expose explicit mapping between HDMI connectors
> and /dev/cecX adapters to userland.
> 
> New structure with connector info (card number and connector id in case
> of DRM connectors) is added to cec_adapter. That connector info is expected
> to be provided when an adapter is created.
> 
> CEC notifier is extended so that it can be used to communicate the
> connector's info to CEC adapters' creators.
> 
> New ioctl, exposing connector info to userland, is added to /dev/cec.
> 
> Changes since v6:
>  - updated remaining cec_allocate_adapter calls
> Changes since v5:
>  - make the patch apply against the latest changes in the affected code
> Changes since v4:
>  - small tweaks + added documentation
> Changes since v3:
>  - cec_get_connter_conn takes connector_info as argument
> Changes since v2:
>  - cec_s_connector_info removed, the connector info is now passed to
>    cec_allocate_adapter
>  - updated commit message
> Changes since v1:
>  - removed the unnecessary event,
>  - extended cec_connctor_info to allow for various types of connectors.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> ---

<snip>

> diff --git a/drivers/media/cec/cec-notifier.c b/drivers/media/cec/cec-notifier.c
> index 9598c7778871a..36820d0d71677 100644
> --- a/drivers/media/cec/cec-notifier.c
> +++ b/drivers/media/cec/cec-notifier.c
> @@ -27,12 +27,16 @@ struct cec_notifier {
>  	void (*callback)(struct cec_adapter *adap, u16 pa);
>  
>  	u16 phys_addr;
> +	struct cec_connector_info connector_info;
>  };
>  
>  static LIST_HEAD(cec_notifiers);
>  static DEFINE_MUTEX(cec_notifiers_lock);
>  
> -struct cec_notifier *cec_notifier_get_conn(struct device *dev, const char *conn)
> +struct cec_notifier *
> +cec_notifier_get_conn(struct device *dev,
> +		      const char *conn,
> +		      const struct cec_connector_info *connector_info)
>  {
>  	struct cec_notifier *n;
>  
> @@ -52,6 +56,10 @@ struct cec_notifier *cec_notifier_get_conn(struct device *dev, const char *conn)
>  	if (conn)
>  		n->conn = kstrdup(conn, GFP_KERNEL);
>  	n->phys_addr = CEC_PHYS_ADDR_INVALID;
> +
> +	if (connector_info)
> +		n->connector_info = *connector_info;
> +

The core problem is that you do not know in which order the CEC and the HDMI
drivers are loaded. In the case of my configuration the CEC driver ao-cec.c
loads before the dw-hdmi driver. So cec_notifier_get_conn() is called when the
cec_notifier was already created by the CEC driver. And if you look at the
control flow in this function you'll see that the connector info is never
copied in that case.

But that's just one problem...

>  	mutex_init(&n->lock);
>  	kref_init(&n->kref);
>  	list_add_tail(&n->head, &cec_notifiers);
> @@ -107,9 +115,17 @@ void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
>  }
>  EXPORT_SYMBOL_GPL(cec_notifier_set_phys_addr_from_edid);
>  
> +const struct cec_connector_info *cec_notifier_get_conn_info(
> +	struct cec_notifier *n)
> +{
> +	return &n->connector_info;
> +}
> +EXPORT_SYMBOL_GPL(cec_notifier_get_conn_info);
> +
>  void cec_notifier_register(struct cec_notifier *n,
>  			   struct cec_adapter *adap,
> -			   void (*callback)(struct cec_adapter *adap, u16 pa))
> +			   void (*callback)(struct cec_adapter *adap,
> +					    u16 pa))
>  {
>  	kref_get(&n->kref);
>  	mutex_lock(&n->lock);

<snip>

> diff --git a/drivers/media/platform/meson/ao-cec.c b/drivers/media/platform/meson/ao-cec.c
> index facf9b029e797..c219925a7c5c7 100644
> --- a/drivers/media/platform/meson/ao-cec.c
> +++ b/drivers/media/platform/meson/ao-cec.c
> @@ -600,6 +600,7 @@ static const struct cec_adap_ops meson_ao_cec_ops = {
>  
>  static int meson_ao_cec_probe(struct platform_device *pdev)
>  {
> +	const struct cec_connector_info *conn_info;
>  	struct meson_ao_cec_device *ao_cec;
>  	struct device *hdmi_dev;
>  	struct resource *res;
> @@ -620,13 +621,16 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
>  	if (!ao_cec->notify)
>  		return -ENOMEM;
>  
> +	conn_info = cec_notifier_get_conn_info(ao_cec->notify);
> +
>  	ao_cec->adap = cec_allocate_adapter(&meson_ao_cec_ops, ao_cec,
>  					    "meson_ao_cec",
>  					    CEC_CAP_LOG_ADDRS |
>  					    CEC_CAP_TRANSMIT |
>  					    CEC_CAP_RC |
>  					    CEC_CAP_PASSTHROUGH,
> -					    1); /* Use 1 for now */
> +					    1, /* Use 1 for now */
> +					    conn_info);

The other problem is in the CEC driver: it creates the CEC device as
soon as the HDMI device is found (cec_notifier_parse_hdmi_phandle).

But that doesn't mean that the HDMI device also had registered itself
as a CEC notifier.

Until now that never mattered: as long as the HDMI device was found
the CEC adapter would function fine, it would just have no physical
address until so notified by the HDMI device once it registered its
CEC notifier.

But if we want to have valid connector info during the lifetime of
the CEC adapter, then this no longer works.

I'm not entirely sure how to handle this.

Another issue here is that when the HDMI driver removes the notifier,
then it should also zero the connector info. Remember that both the
HDMI and the CEC drivers can be loaded and unloaded independently from
one another.

I have the feeling that the cec-notifier framework is trying too hard
to be generic (i.e. without knowledge of whether a notifier is created
by an HDMI device or a CEC device). Instead I think we need functions
specifically for use with a HDMI device and functions specifically for
use with a CEC device.

I'll have to think about this a bit more early next week.

Regards,

	Hans

>  	if (IS_ERR(ao_cec->adap)) {
>  		ret = PTR_ERR(ao_cec->adap);
>  		goto out_probe_notify;
