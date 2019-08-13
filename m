Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A70598B434
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 11:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbfHMJeH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 05:34:07 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:40349 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726811AbfHMJeG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 05:34:06 -0400
Received: from [IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531] ([IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531])
        by smtp-cloud9.xs4all.net with ESMTPA
        id xTBphemD6AffAxTBshTAnJ; Tue, 13 Aug 2019 11:34:05 +0200
Subject: Re: [PATCH] drm/bridge: dw-hdmi: move cec PA invalidation to
 dw_hdmi_setup_rx_sense()
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sean Paul <seanpaul@chromium.org>,
        Dariusz Marcinkiewicz <darekm@google.com>
References: <6099ff8a-e708-e466-5877-07c9102513f8@xs4all.nl>
Message-ID: <60547c6d-e8a1-0b2c-b8ae-acb2f4643be8@xs4all.nl>
Date:   Tue, 13 Aug 2019 11:34:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <6099ff8a-e708-e466-5877-07c9102513f8@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP9UUBEpNndwbGqoOzm7xPgHX1ay5qujSVAa6hJxC9j1a+kInaD52ub25WTlWnSW8L56oTREZezHowjHPtGNgthjQvsCzq9v6ZMxg+rnSf3rRrGlGHwW
 tKtr7RMItAJ2VnA5IqC8+OQwAD5OuI5F6Ne0q4VoxW9dpXipzSZ1o1dcLJ4QX4x5RJsXm0V/Fdfhj1Yap8OKkRN8FPVJW92mWweELwtguZICdweZ5cUEhAWd
 Ll2MwtZgDj5Duy6ktmvhLU2YrWX7GM/Nu3SkGVJCNAeqaqJA1pJky2FEwEdu7VIpQFXwM9goY6aFdclFnG7L8PCt3CCJYZZQ+Bq8DV7/ypQqohXoRT+8u9M8
 WtOi7AkLeagmTfIih6lDoY3OyX7yOz0dqSrnvXHooaQEOPkKfG9dP6bCKfRIiUX4iEOdUxkz351B3CrGLdJVeHNuKl2zYtvXT0fOH2mCkQxFC6O3FnnQZB5y
 ESFceP8mGd6h81r8fplzBw6MpezcMPRpKgSQE5drkZryYsyFccn+OWQpwZA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CC Dariusz as well, since this issue was discovered when testing his
CEC patches.

Regards,

	Hans

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

