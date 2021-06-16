Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C96113A9A86
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 14:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbhFPMfH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 08:35:07 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:57873 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230197AbhFPMfH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 08:35:07 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id tUj2lv5vOhqlttUj5lw9Zd; Wed, 16 Jun 2021 14:33:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623846780; bh=3WAZZPvtq7tHZAUFW1IOnUzW7XaOr60Zli50JP31iCY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=s5AwnDz/MhHwEkTN/Gc/k++T5v7qiDbPf5bTLwrnwrAWsPnaPqIqyTVC7FZmZzDKO
         EVEnnaFeI3IFBB5kliVrLp1fh9xtjAntthQDFghaWdae/OUtr6qsM4VewHOb4i3A+c
         7u4CgpYsZkuoJEV9AR+iw+Iu9MN3nddfWuF/A0nGNfDEQwMbsNyJg9eZbOOCmNL9+b
         1F1A7nPEUmJwwNJNl6AaQ6rCr14g6YGmTylF5CbBDn91Ne1gzIDZaLiyeORYAsU/zW
         Y6ziNnSCSgAIdggQvvPuui25XNzV8zM0MxJGBa9phOf0PlcvzHdUy4iDsqKx2tVT8R
         7yBVpis+ZzqNw==
Subject: Re: [PATCH 08/11] media: adv7842: better document EDID block size
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <cover.1623846327.git.mchehab+huawei@kernel.org>
 <6bed7a69367856080a62e3ee89df6a2a3d0d5f20.1623846327.git.mchehab+huawei@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <766eecb1-253d-d866-401c-40c48685fb96@xs4all.nl>
Date:   Wed, 16 Jun 2021 14:32:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <6bed7a69367856080a62e3ee89df6a2a3d0d5f20.1623846327.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLp8EIerXbU2LY156rvXvHuLzkHPIbjhYFll2+5AP7rP35I0rDJfbmeRCX1tC3VbFiGvQn4/74iarsB2Uu5eBTI5iZbmmdiJFxutnD54Zplefrjhore5
 ZJ58e8NhKLu22ZW+P38+n0LTqWesj2MxA6lDkBJYG+9J0n/LtP1iwpE0Fq+76697YgsegMBkK393QT3GSTAHdil3jpLYbtVjPWNqFm2SmUoQFysguxpcJmBE
 ehfEPtx7X/EPUswaBzqqLbGT1oYabPEq+3in1NOV9+JYhdU6aQXjbpkpYv7USjHKEPUp0dUPYD7oMxPcGbFYwonvo8q3z59uO/tZ5g+u5MRHlDo0B9MwN375
 UapNzbTzSpzafeBxhAkhg7NTo9x2gQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/06/2021 14:28, Mauro Carvalho Chehab wrote:
> While the logic there is correct, it leads to smatch warnings:
> 	/home/hans/work/build/media-git/drivers/media/i2c/adv7842.c:2538 adv7842_set_edid() error: memcpy() '&state->vga_edid.edid' too small (128 vs 512)
> 
> Because the code tricks static analyzers by doing:
> 	memcpy(&state->hdmi_edid.edid, e->edid, 128 * e->blocks);
> 
> for ADV7842_EDID_PORT_VGA, where a logic before that makes
> e->blocks being either 0 or 1.
> 
> Yet, it is ugly to see the "128" magic number all spread about the
> EDID code. So, while here, replace 128 (and 4 x 128) by macros:
> 
> And ensure that the logic which copy into the VGA block
> will use EDID_MAX_VGA_BLOCKS.

Please drop this patch, there is already another patch from me for adv7842 in a pending PR.

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/i2c/adv7842.c | 33 ++++++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
> index 78e61fe6f2f0..30bddab320b9 100644
> --- a/drivers/media/i2c/adv7842.c
> +++ b/drivers/media/i2c/adv7842.c
> @@ -85,6 +85,10 @@ struct adv7842_format_info {
>  	u8 op_format_sel;
>  };
>  
> +#define EDID_BLOCK_SIZE		128
> +#define EDID_MAX_HDMI_BLOCKS	4
> +#define EDID_MAX_VGA_BLOCKS	1
> +
>  struct adv7842_state {
>  	struct adv7842_platform_data pdata;
>  	struct v4l2_subdev sd;
> @@ -98,12 +102,12 @@ struct adv7842_state {
>  
>  	v4l2_std_id norm;
>  	struct {
> -		u8 edid[512];
> +		u8 edid[EDID_BLOCK_SIZE * EDID_MAX_HDMI_BLOCKS];
>  		u32 blocks;
>  		u32 present;
>  	} hdmi_edid;
>  	struct {
> -		u8 edid[128];
> +		u8 edid[EDID_MAX_VGA_BLOCKS * EDID_MAX_VGA_BLOCKS];
>  		u32 blocks;
>  		u32 present;
>  	} vga_edid;
> @@ -732,12 +736,13 @@ static int edid_write_vga_segment(struct v4l2_subdev *sd)
>  	/* edid segment pointer '1' for VGA port */
>  	rep_write_and_or(sd, 0x77, 0xef, 0x10);
>  
> -	for (i = 0; !err && i < blocks * 128; i += I2C_SMBUS_BLOCK_MAX)
> +	for (i = 0; && i < blocks * EDID_BLOCK_SIZE; i += I2C_SMBUS_BLOCK_MAX) {

Besides, this change won't compile, so:

Nacked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

>  		err = i2c_smbus_write_i2c_block_data(state->i2c_edid, i,
>  						     I2C_SMBUS_BLOCK_MAX,
>  						     edid + i);
> -	if (err)
> -		return err;
> +		if (err)
> +			return err;
> +	}
>  
>  	/* Calculates the checksums and enables I2C access
>  	 * to internal EDID ram from VGA DDC port.
> @@ -785,7 +790,7 @@ static int edid_write_hdmi_segment(struct v4l2_subdev *sd, u8 port)
>  		return 0;
>  	}
>  
> -	pa = v4l2_get_edid_phys_addr(edid, blocks * 128, &spa_loc);
> +	pa = v4l2_get_edid_phys_addr(edid, blocks * EDID_BLOCK_SIZE, &spa_loc);
>  	err = v4l2_phys_addr_validate(pa, &parent_pa, NULL);
>  	if (err)
>  		return err;
> @@ -800,7 +805,7 @@ static int edid_write_hdmi_segment(struct v4l2_subdev *sd, u8 port)
>  	}
>  
>  
> -	for (i = 0; !err && i < blocks * 128; i += I2C_SMBUS_BLOCK_MAX) {
> +	for (i = 0; !err && i < blocks * EDID_BLOCK_SIZE; i += I2C_SMBUS_BLOCK_MAX) {
>  		/* set edid segment pointer for HDMI ports */
>  		if (i % 256 == 0)
>  			rep_write_and_or(sd, 0x77, 0xef, i >= 256 ? 0x10 : 0x00);
> @@ -2491,7 +2496,9 @@ static int adv7842_get_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
>  	if (edid->start_block + edid->blocks > blocks)
>  		edid->blocks = blocks - edid->start_block;
>  
> -	memcpy(edid->edid, data + edid->start_block * 128, edid->blocks * 128);
> +	memcpy(edid->edid,
> +	       data + edid->start_block * EDID_BLOCK_SIZE,
> +	       edid->blocks * EDID_BLOCK_SIZE);
>  
>  	return 0;
>  }
> @@ -2506,9 +2513,12 @@ static int adv7842_get_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
>  static int adv7842_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *e)
>  {
>  	struct adv7842_state *state = to_state(sd);
> -	unsigned int max_blocks = e->pad == ADV7842_EDID_PORT_VGA ? 1 : 4;
> +	unsigned int max_blocks;
>  	int err = 0;
>  
> +	max_blocks = e->pad == ADV7842_EDID_PORT_VGA ?
> +		     EDID_MAX_VGA_BLOCKS  : EDID_MAX_HDMI_BLOCKS;
> +
>  	memset(e->reserved, 0, sizeof(e->reserved));
>  
>  	if (e->pad > ADV7842_EDID_PORT_VGA)
> @@ -2535,7 +2545,7 @@ static int adv7842_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *e)
>  		state->vga_edid.blocks = e->blocks;
>  		state->vga_edid.present = e->blocks ? 0x1 : 0x0;
>  		if (e->blocks)
> -			memcpy(&state->vga_edid.edid, e->edid, 128 * e->blocks);
> +			memcpy(&state->vga_edid.edid, e->edid, EDID_BLOCK_SIZE);
>  		err = edid_write_vga_segment(sd);
>  		break;
>  	case ADV7842_EDID_PORT_A:
> @@ -2544,7 +2554,8 @@ static int adv7842_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *e)
>  		state->hdmi_edid.blocks = e->blocks;
>  		if (e->blocks) {
>  			state->hdmi_edid.present |= 0x04 << e->pad;
> -			memcpy(&state->hdmi_edid.edid, e->edid, 128 * e->blocks);
> +			memcpy(&state->hdmi_edid.edid, e->edid,
> +			       EDID_BLOCK_SIZE * e->blocks);
>  		} else {
>  			state->hdmi_edid.present &= ~(0x04 << e->pad);
>  			adv7842_s_detect_tx_5v_ctrl(sd);
> 

