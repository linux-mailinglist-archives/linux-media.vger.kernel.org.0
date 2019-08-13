Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 955C18B766
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfHMLnr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:43:47 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:38275 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725981AbfHMLnq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:43:46 -0400
Received: from [IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531] ([IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xVDJhL1FBqTdhxVDMh9SIg; Tue, 13 Aug 2019 13:43:45 +0200
Subject: Re: [PATCH] drm/bridge: dw-hdmi: move cec PA invalidation to
 dw_hdmi_setup_rx_sense()
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sean Paul <seanpaul@chromium.org>,
        Jonas Karlman <jonas@kwiboo.se>
References: <6099ff8a-e708-e466-5877-07c9102513f8@xs4all.nl>
Message-ID: <c05b6989-a2a2-e728-7fef-3342b14fa655@xs4all.nl>
Date:   Tue, 13 Aug 2019 13:43:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <6099ff8a-e708-e466-5877-07c9102513f8@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCfBj3n1jiC7g/yEvfloDkQZ47sgqu4BIQ1dE8mdh/f1LEtJ/cKK1eRFwim1wIi1ATBGrF9wZJgXxLmtTq+yKHPPLdzUbflWH0MXLnQKnQSWjyLFlabu
 NTNn360cBVtujfi2XKidkCY6n8EjdRP4sa0/frbl9IiWv8O5NR9H1ouOkhfkv9+OVRtjpmaWDJ60DbTaVgoOjQ70g/n6jvI5d5Hwu+pDXOgd72CoUmuE/6zn
 8copieRApT+aCUdtTTdu9nWPko84jCKc2K5ovbNARCPFJ4cjazjk/xaSHubgDur+4Op5z1DtVg5r4/T0KNDmSdRfv0DjwKG0zA4+ra6B7nbRCffwpVmEbbwd
 C4R0t7wzcb2t28eGCNLm6mmynOw4EqwN7cLDdPXR2IpyueKlGz1VevIZBTHoXs4HP50rcBR98gHWhzp+S/MY2ipyQIv53bD7GbEqZ2z/kgL1VWel/3X4n7js
 QaSlxhSJprssmVstsVQVe1r/+6b0icC/pXG8Nz1RXoHtADxSaEyeQLm4b9c=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/13/19 11:32 AM, Hans Verkuil wrote:
> When testing CEC on the AML-S905X-CC board I noticed that the CEC physical
> address was not invalidated when the HDMI cable was unplugged. Some more
> digging showed that meson uses meson_dw_hdmi.c to handle the HPD.
> 
> Both dw_hdmi_irq() and dw_hdmi_top_thread_irq() (in meson_dw_hdmi.c) call
> the dw_hdmi_setup_rx_sense() function. So move the code to invalidate the
> CEC physical address to that function, so that it is independent of where
> the HPD interrupt happens.
> 
> Tested with both a AML-S905X-CC and a Khadas VIM2 board.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Please disregard this patch, Jonas Karlman will post a different series
which will fix this in a different way.

Regards,

	Hans

> ---
> Note: an alternative would be to make a new dw-hdmi function such as
> dw_hdmi_cec_phys_addr_invalidate() that is called from meson_dw_hdmi.c.
> I decided not to do that since this patch is minimally invasive, but
> that can obviously be changed if that approach is preferred.
> ---
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index c5a854af54f8..e899b31e1432 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2329,6 +2329,13 @@ void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense)
>  		dw_hdmi_update_power(hdmi);
>  		dw_hdmi_update_phy_mask(hdmi);
>  	}
> +	if (!hpd && !rx_sense) {
> +		struct cec_notifier *notifier = READ_ONCE(hdmi->cec_notifier);
> +
> +		if (notifier)
> +			cec_notifier_phys_addr_invalidate(notifier);
> +	}
> +
>  	mutex_unlock(&hdmi->mutex);
>  }
>  EXPORT_SYMBOL_GPL(dw_hdmi_setup_rx_sense);
> @@ -2369,14 +2376,6 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>  		dw_hdmi_setup_rx_sense(hdmi,
>  				       phy_stat & HDMI_PHY_HPD,
>  				       phy_stat & HDMI_PHY_RX_SENSE);
> -
> -		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0) {
> -			struct cec_notifier *notifier;
> -
> -			notifier = READ_ONCE(hdmi->cec_notifier);
> -			if (notifier)
> -				cec_notifier_phys_addr_invalidate(notifier);
> -		}
>  	}
> 
>  	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
> 

