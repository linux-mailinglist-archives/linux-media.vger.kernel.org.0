Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B564A102357
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 12:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727640AbfKSLi1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 06:38:27 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:52923 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727557AbfKSLi0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 06:38:26 -0500
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1iX1px-0000Yw-8u; Tue, 19 Nov 2019 12:38:25 +0100
Message-ID: <3f4c87125e5021622fe80cc85411c5b1d25bc427.camel@pengutronix.de>
Subject: Re: [PATCH 4/5] input/rmi4/rmi_driver: check if irq_find_mapping
 returns 0
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nick Dyer <nick@shmanahar.org>,
        Christopher Heiny <cheiny@synaptics.com>,
        Vandana BN <bnvandana@gmail.com>
Date:   Tue, 19 Nov 2019 12:38:24 +0100
In-Reply-To: <20191119105118.54285-5-hverkuil-cisco@xs4all.nl>
References: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
         <20191119105118.54285-5-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Di, 2019-11-19 at 11:51 +0100, Hans Verkuil wrote:
> The irq_find_mapping() function can return 0 when called in the
> rmi_process_interrupt_requests() function.
> 
> This causes a kernel crash. Check for a 0 value and skip calling
> handle_nested_irq() in that case.
> 
> This was tested with the F54 function enabled on a Lenovo X1 Carbon.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution to irq_domain")

This is already fixed upstream by 549766ac2ac1
"Input: synaptics-rmi4 - clear IRQ enables for F54"

Regards,
Lucas

> ---
>  drivers/input/rmi4/rmi_driver.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
> index 772493b1f665..6085ec424a84 100644
> --- a/drivers/input/rmi4/rmi_driver.c
> +++ b/drivers/input/rmi4/rmi_driver.c
> @@ -154,8 +154,12 @@ static int rmi_process_interrupt_requests(struct rmi_device *rmi_dev)
>  	 */
>  	mutex_unlock(&data->irq_mutex);
>  
> -	for_each_set_bit(i, data->irq_status, data->irq_count)
> -		handle_nested_irq(irq_find_mapping(data->irqdomain, i));
> +	for_each_set_bit(i, data->irq_status, data->irq_count) {
> +		unsigned int irq = irq_find_mapping(data->irqdomain, i);
> +
> +		if (irq)
> +			handle_nested_irq(irq);
> +	}
>  
>  	if (data->input)
>  		input_sync(data->input);

