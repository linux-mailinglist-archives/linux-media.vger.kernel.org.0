Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88E3C1A17E2
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 00:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgDGWT7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 18:19:59 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45178 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgDGWT7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 18:19:59 -0400
Received: by mail-lf1-f67.google.com with SMTP id f8so3581688lfe.12
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 15:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=EjUazTmq9zd47WnZzyFQyNLzb7LsJUhlnT7RjSu3CWs=;
        b=H3+tqnuCOfwUBjHz92ctQzhMFomMzKHF6Sf7xdx2vUSB8L+o8J6HtQS2L2Nj9PYyik
         NmRh1/xlZ0nXYdLq2VOXX0BdOcWXLa6Pybep5pe0ZM3ss1v3jcjjSxTlQ47YxU/3z4Rk
         xr6d+6X9sht5pofaMeGL4oocwBtlpB+4uwEK2vyjZVDWttsHYbrlwMU6xwjADlQiYkNj
         FmN40oeKIL9gp6odL7wG1FyBtkBboIhizpjQCf1Krl9BoA3Xg014japJLuIt7I/87f5w
         2tdMak80YDNmQNkgiq3ZY3NbWS4qvJwp07KP3iAlIic8zth+15cToFSr9trBaweuPqQI
         UQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EjUazTmq9zd47WnZzyFQyNLzb7LsJUhlnT7RjSu3CWs=;
        b=DnRh51Epv22kkVd4KVuSv0CyOlcB4YwOhe8BPxCPSN2laG0ur1cKzzOQLMBHWDbReH
         ka0sLlKqSAaE89Jkmhgp+V9CpLA1UHK4ywpRRxz80+Y9E/eGdjoT/UvYIM6TjdbPuefq
         6YPxe6AjtbVW525yiD9eQ6GHD32Me84aoF3WrjZvr7ZLQIGP60Jh8B9U/I5CtV6RBEBr
         ephvjGHKF+lClH0qQtk38razH+NegiXP2Wq+aWVZXNuuz4bETOnz3uxCzf2gKaekxMm1
         oTEfn3WqDrf4cQhmjtP59DLoViv1QGSkqkbZ/QcnsSxsWdEzLxKK1S2bS67SWiVsa10O
         J1jQ==
X-Gm-Message-State: AGi0PuY1D+75o5DUsIGSgC1LyXj+FaJwjacwOF3dQeY3/o/WGdMNo0dc
        lJjILDyqWzagUiXkIHYuVE0cbw==
X-Google-Smtp-Source: APiQypJF1nFNdEDgryfY/6KHb3GTYQcvfIQL0j7LjxJ/fXi8lRlQ7ehyA3eVb6UIq52PXDMXDzQdbQ==
X-Received: by 2002:ac2:46c4:: with SMTP id p4mr2669205lfo.37.1586297995773;
        Tue, 07 Apr 2020 15:19:55 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id h3sm14367836lfk.30.2020.04.07.15.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 15:19:54 -0700 (PDT)
Date:   Wed, 8 Apr 2020 00:19:54 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] media: i2c: adv748x: Adjust TXA data lanes number
Message-ID: <20200407221954.GR1716317@oden.dyn.berto.se>
References: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
 <20200313144035.401430-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200313144035.401430-2-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for your work.

On 2020-03-13 15:40:32 +0100, Jacopo Mondi wrote:
> When outputting SD-Core output through the TXA MIPI CSI-2 interface,
> the number of enabled data lanes should be reduced in order to guarantee
> the two video format produced by the SD-Core (480i and 576i) generate a
> MIPI CSI-2 link clock frequency compatible with the MIPI D-PHY
> specifications.
> 
> Limit the number of enabled data lanes to 2, which is guaranteed to
> support 480i and 576i formats.
> 
> Cache the number of enabled data lanes to be able to report it through
> the new get_mbus_config operation introduced in the following patches.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Small nit, I would switch 1/4 and 2/4 in this series ;-)

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/i2c/adv748x/adv748x-core.c | 31 ++++++++++++++++++------
>  drivers/media/i2c/adv748x/adv748x.h      |  1 +
>  2 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index 23e02ff27b17..1fe7f97c6d52 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -241,10 +241,10 @@ static int adv748x_power_up_tx(struct adv748x_csi2 *tx)
>  	int ret = 0;
>  
>  	/* Enable n-lane MIPI */
> -	adv748x_write_check(state, page, 0x00, 0x80 | tx->num_lanes, &ret);
> +	adv748x_write_check(state, page, 0x00, 0x80 | tx->active_lanes, &ret);
>  
>  	/* Set Auto DPHY Timing */
> -	adv748x_write_check(state, page, 0x00, 0xa0 | tx->num_lanes, &ret);
> +	adv748x_write_check(state, page, 0x00, 0xa0 | tx->active_lanes, &ret);
>  
>  	/* ADI Required Write */
>  	if (tx->src == &state->hdmi.sd) {
> @@ -270,7 +270,7 @@ static int adv748x_power_up_tx(struct adv748x_csi2 *tx)
>  	usleep_range(2000, 2500);
>  
>  	/* Power-up CSI-TX */
> -	adv748x_write_check(state, page, 0x00, 0x20 | tx->num_lanes, &ret);
> +	adv748x_write_check(state, page, 0x00, 0x20 | tx->active_lanes, &ret);
>  	usleep_range(1000, 1500);
>  
>  	/* ADI Required Writes */
> @@ -292,7 +292,7 @@ static int adv748x_power_down_tx(struct adv748x_csi2 *tx)
>  	adv748x_write_check(state, page, 0x1e, 0x00, &ret);
>  
>  	/* Enable n-lane MIPI */
> -	adv748x_write_check(state, page, 0x00, 0x80 | tx->num_lanes, &ret);
> +	adv748x_write_check(state, page, 0x00, 0x80 | tx->active_lanes, &ret);
>  
>  	/* i2c_mipi_pll_en - 1'b1 */
>  	adv748x_write_check(state, page, 0xda, 0x01, &ret);
> @@ -357,14 +357,29 @@ static int adv748x_link_setup(struct media_entity *entity,
>  	if (state->afe.tx) {
>  		/* AFE Requires TXA enabled, even when output to TXB */
>  		io10 |= ADV748X_IO_10_CSI4_EN;
> -		if (is_txa(tx))
> +		if (is_txa(tx)) {
> +			/*
> +			 * Output from the SD-core (480i and 576i) from the TXA
> +			 * interface requires reducing the number of enabled
> +			 * data lanes in order to guarantee a valid link
> +			 * frequency.
> +			 */
> +			tx->active_lanes = min(tx->num_lanes, 2U);
>  			io10 |= ADV748X_IO_10_CSI4_IN_SEL_AFE;
> -		else
> +		} else {
> +			/* TXB has a single data lane, no need to adjust. */
>  			io10 |= ADV748X_IO_10_CSI1_EN;
> +		}
>  	}
>  
> -	if (state->hdmi.tx)
> +	if (state->hdmi.tx) {
> +		/*
> +		 * Restore the number of active lanes, in case we have gone
> +		 * through an AFE->TXA streaming sessions.
> +		 */
> +		tx->active_lanes = tx->num_lanes;
>  		io10 |= ADV748X_IO_10_CSI4_EN;
> +	}
>  
>  	return io_clrset(state, ADV748X_IO_10, io10_mask, io10);
>  }
> @@ -596,6 +611,7 @@ static int adv748x_parse_csi2_lanes(struct adv748x_state *state,
>  		}
>  
>  		state->txa.num_lanes = num_lanes;
> +		state->txa.active_lanes = num_lanes;
>  		adv_dbg(state, "TXA: using %u lanes\n", state->txa.num_lanes);
>  	}
>  
> @@ -607,6 +623,7 @@ static int adv748x_parse_csi2_lanes(struct adv748x_state *state,
>  		}
>  
>  		state->txb.num_lanes = num_lanes;
> +		state->txb.active_lanes = num_lanes;
>  		adv_dbg(state, "TXB: using %u lanes\n", state->txb.num_lanes);
>  	}
>  
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> index fccb388ce179..1061f425ece5 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -79,6 +79,7 @@ struct adv748x_csi2 {
>  	unsigned int page;
>  	unsigned int port;
>  	unsigned int num_lanes;
> +	unsigned int active_lanes;
>  
>  	struct media_pad pads[ADV748X_CSI2_NR_PADS];
>  	struct v4l2_ctrl_handler ctrl_hdl;
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
