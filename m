Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2EEE3AF1C3
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 19:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbhFURVG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 13:21:06 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:34783 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230059AbhFURVF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 13:21:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id vNZLlceJThqltvNZPlH6Al; Mon, 21 Jun 2021 19:18:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1624295929; bh=hCM/Fzbw8Wex7Gv3tCGEKfT20tGCYOq2TORoB41pF4s=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rDvltCMlimjx65rtRIpHWa7k0iYLYSG+N2nr96W85zhRBPzMBlatd4RENsFVcDgli
         AXmRWoD/FCB6OWQb3FPjbkzeupSHlkgEz5RlOUaDxyRijUSuLG0Ex6Fx0jXUd4sdb7
         d0jV6E122hdN9Smba3NXTVv2Gl+bYwUf0amS//PWneRf/zNU+7epMzlt8Hjtj+7bcQ
         GuvjWJoZV43Z/gLAEdWesRFI8q3ydhvZchmCwIVORKSAHsPGk7MKTTti3HaHG6F7Pu
         zLWsCiYimebWbRbjMxn9+v6gf+Zr6MshhF1sl2LRd+T+bTBxLwrRw60IBbcLURJ7fy
         bvuLtkTwKUWqw==
Subject: Re: [PATCH v2] media: ivtv: prevent going past the hw arrays
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <d624c9d2f16f17ccc0448cf5256b7ae3c8852a62.1624293556.git.mchehab+huawei@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <99ff71d6-1545-1f26-b277-ae83e270c1ad@xs4all.nl>
Date:   Mon, 21 Jun 2021 19:18:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <d624c9d2f16f17ccc0448cf5256b7ae3c8852a62.1624293556.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPZIx4BgtyP0JHMhWeUmlSyxdN8X+/PSC79sdfIp6ThjhyfXV1XnvEnbfg9A1IrOP6+4LShybYO+qMu0NW8nTa5TzVeWmcmrZCyVu43JXZ+LmUPRGnzs
 p3KOgWnJxHqa862tZNQ1vnN6rrK1DttUOVA4inzVoK8DUCvK0FO92g6iw60FKlizExPfE7B48CWphdqdzuAim7P3gT1disPcfQXZE7pUz+sMcCQL49lXBZv/
 sRAOl+AAx5Yr5+aM1Tz0SBQKjO2hC3CyBrt0c2tfdl8j0GCxjxjqTgX8mJHJLOKHjJFuUpIcm1vzJ5yBwE2wYQAuEQWGgGRJfmKQIBFsSnFSDSVbeZq+yqKt
 MPFchIVX5XgKljNBccVULdEKW/bn2fmtuwGt1s30mbkngH1rCDvrD7Ol47C3IjtcD36B4Jnq
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/06/2021 18:39, Mauro Carvalho Chehab wrote:
> As warned by smatch:
> 
> 	drivers/media/pci/ivtv/ivtv-i2c.c:245 ivtv_i2c_register() error: buffer overflow 'hw_devicenames' 21 <= 31
> 	drivers/media/pci/ivtv/ivtv-i2c.c:266 ivtv_i2c_register() error: buffer overflow 'hw_addrs' 21 <= 31
> 	drivers/media/pci/ivtv/ivtv-i2c.c:269 ivtv_i2c_register() error: buffer overflow 'hw_addrs' 21 <= 31
> 	drivers/media/pci/ivtv/ivtv-i2c.c:275 ivtv_i2c_register() error: buffer overflow 'hw_addrs' 21 <= 31
> 	drivers/media/pci/ivtv/ivtv-i2c.c:280 ivtv_i2c_register() error: buffer overflow 'hw_addrs' 21 <= 31
> 	drivers/media/pci/ivtv/ivtv-i2c.c:290 ivtv_i2c_register() error: buffer overflow 'hw_addrs' 21 <= 31
> 
> The logic at ivtv_i2c_register() could let buffer overflows at
> hw_devicenames and hw_addrs arrays.
> 
> This won't happen in practice due to a carefully-contructed
> logic, but it is not error-prune.
> 
> Change the logic in a way that will make clearer that the
> I2C hardware flags will affect the size of those two
> arrays, and add an explicit check to avoid buffer overflows.
> 
> While here, use the bit macro.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  drivers/media/pci/ivtv/ivtv-cards.h | 68 ++++++++++++++++++++---------
>  drivers/media/pci/ivtv/ivtv-i2c.c   | 16 ++++---
>  2 files changed, 58 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/pci/ivtv/ivtv-cards.h b/drivers/media/pci/ivtv/ivtv-cards.h
> index f3e2c5634962..c252733df340 100644
> --- a/drivers/media/pci/ivtv/ivtv-cards.h
> +++ b/drivers/media/pci/ivtv/ivtv-cards.h
> @@ -78,27 +78,53 @@
>  #define IVTV_PCI_ID_SONY		0x104d
>  
>  /* hardware flags, no gaps allowed */
> -#define IVTV_HW_CX25840			(1 << 0)
> -#define IVTV_HW_SAA7115			(1 << 1)
> -#define IVTV_HW_SAA7127			(1 << 2)
> -#define IVTV_HW_MSP34XX			(1 << 3)
> -#define IVTV_HW_TUNER			(1 << 4)
> -#define IVTV_HW_WM8775			(1 << 5)
> -#define IVTV_HW_CS53L32A		(1 << 6)
> -#define IVTV_HW_TVEEPROM		(1 << 7)
> -#define IVTV_HW_SAA7114			(1 << 8)
> -#define IVTV_HW_UPD64031A		(1 << 9)
> -#define IVTV_HW_UPD6408X		(1 << 10)
> -#define IVTV_HW_SAA717X			(1 << 11)
> -#define IVTV_HW_WM8739			(1 << 12)
> -#define IVTV_HW_VP27SMPX		(1 << 13)
> -#define IVTV_HW_M52790			(1 << 14)
> -#define IVTV_HW_GPIO			(1 << 15)
> -#define IVTV_HW_I2C_IR_RX_AVER		(1 << 16)
> -#define IVTV_HW_I2C_IR_RX_HAUP_EXT	(1 << 17) /* External before internal */
> -#define IVTV_HW_I2C_IR_RX_HAUP_INT	(1 << 18)
> -#define IVTV_HW_Z8F0811_IR_HAUP		(1 << 19)
> -#define IVTV_HW_I2C_IR_RX_ADAPTEC	(1 << 20)
> +enum ivtv_hw_bits {
> +	IVTV_HW_BIT_CX25840,
> +	IVTV_HW_BIT_SAA7115,
> +	IVTV_HW_BIT_SAA7127,
> +	IVTV_HW_BIT_MSP34XX,
> +	IVTV_HW_BIT_TUNER,
> +	IVTV_HW_BIT_WM8775,
> +	IVTV_HW_BIT_CS53L32A,
> +	IVTV_HW_BIT_TVEEPROM,
> +	IVTV_HW_BIT_SAA7114,
> +	IVTV_HW_BIT_UPD64031A,
> +	IVTV_HW_BIT_UPD6408X,
> +	IVTV_HW_BIT_SAA717X,
> +	IVTV_HW_BIT_WM8739,
> +	IVTV_HW_BIT_VP27SMPX,
> +	IVTV_HW_BIT_M52790,
> +	IVTV_HW_BIT_GPIO,
> +	IVTV_HW_BIT_I2C_IR_RX_AVER,
> +	IVTV_HW_BIT_I2C_IR_RX_HAUP_EXT,		 /* External before internal */
> +	IVTV_HW_BIT_I2C_IR_RX_HAUP_INT,
> +	IVTV_HW_BIT_Z8F0811_IR_HAUP,
> +	IVTV_HW_BIT_I2C_IR_RX_ADAPTEC,
> +
> +	IVTV_HW_MAX_BITS	/* Should be the last one */
> +};
> +
> +#define IVTV_HW_CX25840			BIT(IVTV_HW_BIT_CX25840)
> +#define IVTV_HW_SAA7115			BIT(IVTV_HW_BIT_SAA7115)
> +#define IVTV_HW_SAA7127			BIT(IVTV_HW_BIT_SAA7127)
> +#define IVTV_HW_MSP34XX			BIT(IVTV_HW_BIT_MSP34XX)
> +#define IVTV_HW_TUNER			BIT(IVTV_HW_BIT_TUNER)
> +#define IVTV_HW_WM8775			BIT(IVTV_HW_BIT_WM8775)
> +#define IVTV_HW_CS53L32A		BIT(IVTV_HW_BIT_CS53L32A)
> +#define IVTV_HW_TVEEPROM		BIT(IVTV_HW_BIT_TVEEPROM)
> +#define IVTV_HW_SAA7114			BIT(IVTV_HW_BIT_SAA7114)
> +#define IVTV_HW_UPD64031A		BIT(IVTV_HW_BIT_UPD64031A)
> +#define IVTV_HW_UPD6408X		BIT(IVTV_HW_BIT_UPD6408X)
> +#define IVTV_HW_SAA717X			BIT(IVTV_HW_BIT_SAA717X)
> +#define IVTV_HW_WM8739			BIT(IVTV_HW_BIT_WM8739)
> +#define IVTV_HW_VP27SMPX		BIT(IVTV_HW_BIT_VP27SMPX)
> +#define IVTV_HW_M52790			BIT(IVTV_HW_BIT_M52790)
> +#define IVTV_HW_GPIO			BIT(IVTV_HW_BIT_GPIO)
> +#define IVTV_HW_I2C_IR_RX_AVER		BIT(IVTV_HW_BIT_I2C_IR_RX_AVER)
> +#define IVTV_HW_I2C_IR_RX_HAUP_EXT	BIT(IVTV_HW_BIT_I2C_IR_RX_HAUP_EXT)
> +#define IVTV_HW_I2C_IR_RX_HAUP_INT	BIT(IVTV_HW_BIT_I2C_IR_RX_HAUP_INT)
> +#define IVTV_HW_Z8F0811_IR_HAUP		BIT(IVTV_HW_BIT_Z8F0811_IR_HAUP)
> +#define IVTV_HW_I2C_IR_RX_ADAPTEC	BIT(IVTV_HW_BIT_I2C_IR_RX_ADAPTEC)
>  
>  #define IVTV_HW_SAA711X   (IVTV_HW_SAA7115 | IVTV_HW_SAA7114)
>  
> diff --git a/drivers/media/pci/ivtv/ivtv-i2c.c b/drivers/media/pci/ivtv/ivtv-i2c.c
> index 982045c4eea8..c052c57c6dce 100644
> --- a/drivers/media/pci/ivtv/ivtv-i2c.c
> +++ b/drivers/media/pci/ivtv/ivtv-i2c.c
> @@ -85,7 +85,7 @@
>  #define IVTV_ADAPTEC_IR_ADDR		0x6b
>  
>  /* This array should match the IVTV_HW_ defines */
> -static const u8 hw_addrs[] = {
> +static const u8 hw_addrs[IVTV_HW_MAX_BITS] = {
>  	IVTV_CX25840_I2C_ADDR,
>  	IVTV_SAA7115_I2C_ADDR,
>  	IVTV_SAA7127_I2C_ADDR,
> @@ -110,7 +110,7 @@ static const u8 hw_addrs[] = {
>  };
>  
>  /* This array should match the IVTV_HW_ defines */
> -static const char * const hw_devicenames[] = {
> +static const char * const hw_devicenames[IVTV_HW_MAX_BITS] = {
>  	"cx25840",
>  	"saa7115",
>  	"saa7127_auto",	/* saa7127 or saa7129 */
> @@ -240,10 +240,16 @@ void ivtv_i2c_new_ir_legacy(struct ivtv *itv)
>  
>  int ivtv_i2c_register(struct ivtv *itv, unsigned idx)
>  {
> -	struct v4l2_subdev *sd;
>  	struct i2c_adapter *adap = &itv->i2c_adap;
> -	const char *type = hw_devicenames[idx];
> -	u32 hw = 1 << idx;
> +	struct v4l2_subdev *sd;
> +	const char *type;
> +	u32 hw;
> +
> +	if (idx >= IVTV_HW_MAX_BITS)
> +		return -ENODEV;
> +
> +	type = hw_devicenames[idx];
> +	hw = 1 << idx;
>  
>  	if (hw == IVTV_HW_TUNER) {
>  		/* special tuner handling */
> 

