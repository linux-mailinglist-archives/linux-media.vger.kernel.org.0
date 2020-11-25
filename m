Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E622C3F9E
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 13:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729076AbgKYMKN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 07:10:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39014 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728077AbgKYMKN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 07:10:13 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8557292;
        Wed, 25 Nov 2020 13:10:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606306211;
        bh=giDXLChFp9LbnM3gnQGSg9tacVhc0i29BXsOAR22WR4=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=QLIrG6XC0Ayub/TFNdPf5qMH6PkUelKw0CGhKX2Lgy+Jjfal3Q2CnNV+k0OgntVC+
         c39X11BMg8c14SyncNn2aDzuTEUOBHnKVXlQPIcrT2VJNYJcFmpXSPVMQZWnF88zSa
         4X+aJvKcnpOMG7SDBsDZesf+v3keJyfC/ddWsmEw=
Subject: Re: [PATCH 1/3] adv748x: afe: Select input port when device is reset
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se>
 <20201122163637.3590465-2-niklas.soderlund+renesas@ragnatech.se>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <99e2a13b-fc63-4ead-77e4-878574a5cbe0@ideasonboard.com>
Date:   Wed, 25 Nov 2020 12:10:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201122163637.3590465-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 22/11/2020 16:36, Niklas Söderlund wrote:
> It's not enough to select the AFE input port during probe it also needs
> to be set when the device is reset. Move the port selection to
> adv748x_reset() that is called during probe and when the device needs to
> be reset.
> 

Should we instead have an adv748x_afe_reset(), rather than expose the
AFE internals to the top level core?

That said, shouldn't we be able to take advantage of regmap to restore
registers in this instance?

--
Kieran


> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/i2c/adv748x/adv748x-afe.c  | 6 +-----
>  drivers/media/i2c/adv748x/adv748x-core.c | 4 ++++
>  drivers/media/i2c/adv748x/adv748x.h      | 1 +
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
> index dbbb1e4d63637a33..4052cf67bf16c7fb 100644
> --- a/drivers/media/i2c/adv748x/adv748x-afe.c
> +++ b/drivers/media/i2c/adv748x/adv748x-afe.c
> @@ -154,7 +154,7 @@ static void adv748x_afe_set_video_standard(struct adv748x_state *state,
>  		   (sdpstd & 0xf) << ADV748X_SDP_VID_SEL_SHIFT);
>  }
>  
> -static int adv748x_afe_s_input(struct adv748x_afe *afe, unsigned int input)
> +int adv748x_afe_s_input(struct adv748x_afe *afe, unsigned int input)
>  {
>  	struct adv748x_state *state = adv748x_afe_to_state(afe);
>  
> @@ -520,10 +520,6 @@ int adv748x_afe_init(struct adv748x_afe *afe)
>  		}
>  	}
>  
> -	adv748x_afe_s_input(afe, afe->input);
> -
> -	adv_dbg(state, "AFE Default input set to %d\n", afe->input);
> -
>  	/* Entity pads and sinks are 0-indexed to match the pads */
>  	for (i = ADV748X_AFE_SINK_AIN0; i <= ADV748X_AFE_SINK_AIN7; i++)
>  		afe->pads[i].flags = MEDIA_PAD_FL_SINK;
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index 00966fe104881a14..8676ad2428856dd3 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -516,6 +516,10 @@ static int adv748x_reset(struct adv748x_state *state)
>  	if (ret)
>  		return ret;
>  
> +	adv748x_afe_s_input(&state->afe, state->afe.input);
> +
> +	adv_dbg(state, "AFE Default input set to %d\n", state->afe.input);
> +
>  	/* Reset TXA and TXB */
>  	adv748x_tx_power(&state->txa, 1);
>  	adv748x_tx_power(&state->txa, 0);
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> index 1061f425ece5989e..747947ea3e316451 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -435,6 +435,7 @@ int adv748x_tx_power(struct adv748x_csi2 *tx, bool on);
>  
>  int adv748x_afe_init(struct adv748x_afe *afe);
>  void adv748x_afe_cleanup(struct adv748x_afe *afe);
> +int adv748x_afe_s_input(struct adv748x_afe *afe, unsigned int input);
>  
>  int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx);
>  void adv748x_csi2_cleanup(struct adv748x_csi2 *tx);
> 

