Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1E383AEC44
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 17:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbhFUP1W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 11:27:22 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:42921 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230318AbhFUP1L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 11:27:11 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id vLn5lDgTHhg8ZvLn9ldWnf; Mon, 21 Jun 2021 17:24:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1624289093; bh=hOQLMrRrfFJzxZFToK3CIhIvlLxdCa2uAglYNpU8vAU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=f0Sv+rswJHBTHjDKgV8UNShO42aIx2KohoGcil6NJJxzWug4pwk0m07BkimUt3aLm
         sp6fePmbBsZZFwfppHpWdiui+6eDsmn0s6eNsvES1V6RAyXnltg/aIcXjwdqkfSxng
         lkBrIklDrWcpKF6ve2W329A1tQFO+HnwaLXDwqMY32iPRwhhAI714sVHzhcR51xpXi
         iYdKc0d1p8CheHDCJh6UHwEMl3xqWBlBND5FrS0rwyR7IMBBbSha7Wdb97jw/rZGxG
         OYuc9Z4R/S/YJqrhQICyUwJNnc43GEz+aviHZzrS0GDKRb9F74H9/IJxgHZQ+TuxDz
         EOR4qsSWcT1gg==
Subject: Re: [PATCH 4/5] media: ivtv: prevent going past the hw arrays
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <cover.1624276137.git.mchehab+huawei@kernel.org>
 <94334c02c246fad023ec04a02c43b708d853b0cc.1624276138.git.mchehab+huawei@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <39c0801c-d79f-5a80-77a3-47001d55be07@xs4all.nl>
Date:   Mon, 21 Jun 2021 17:24:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <94334c02c246fad023ec04a02c43b708d853b0cc.1624276138.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEKO8qt75kqyu7AyJxyNLd7LWlMIHGnbEQe21Q5nxfdpDvAxAWhLK3+pGW6RQ5lSAzRb7odYxw4gsZDVCdETicox1n42t6TWm8/hRw3eZGM7CI8639rI
 t4iWX7xQbuMaqsrAmbQB56Fw3H8gKqYzuCYkDePiWknExWPQXwnZQPi6EZ6Sn8oddlfYDlNWkgpK0akJaX7RATxpHuK1vL0h66zIFjgSMxAUOYehFxiYeLJr
 ZHOLLvL7QWb8VwB7v8E5sy4Z+cw5akDDMXeVppSGl1dmAunXkeKEt+1wAP7FBONQecIGy0VTVEPPclD/x7pOw3v08/VA0dKDxOVspYxt7yDVYht0Tie4hzv0
 Zpr2imiqPziQz62Q82xpBikpk2wOHVNdUdn0zISAwBcx7BQf9v1PprcsdmoUErJ3alW2kqiX
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/06/2021 13:56, Mauro Carvalho Chehab wrote:
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
> ---
>  drivers/media/pci/ivtv/ivtv-cards.h | 68 ++++++++++++++++++++---------
>  drivers/media/pci/ivtv/ivtv-i2c.c   | 16 ++++---
>  2 files changed, 58 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/pci/ivtv/ivtv-cards.h b/drivers/media/pci/ivtv/ivtv-cards.h
> index f3e2c5634962..494982e4165d 100644
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
> +	IVTV_HW_BIT_CX25840		= 0,
> +	IVTV_HW_BIT_SAA7115		= 1,
> +	IVTV_HW_BIT_SAA7127		= 2,
> +	IVTV_HW_BIT_MSP34XX		= 3,
> +	IVTV_HW_BIT_TUNER		= 4,
> +	IVTV_HW_BIT_WM8775		= 5,
> +	IVTV_HW_BIT_CS53L32A		= 6,
> +	IVTV_HW_BIT_TVEEPROM		= 7,
> +	IVTV_HW_BIT_SAA7114		= 8,
> +	IVTV_HW_BIT_UPD64031A		= 9,
> +	IVTV_HW_BIT_UPD6408X		= 10,
> +	IVTV_HW_BIT_SAA717X		= 11,
> +	IVTV_HW_BIT_WM8739		= 12,
> +	IVTV_HW_BIT_VP27SMPX		= 13,
> +	IVTV_HW_BIT_M52790		= 14,
> +	IVTV_HW_BIT_GPIO		= 15,
> +	IVTV_HW_BIT_I2C_IR_RX_AVER	= 16,
> +	IVTV_HW_BIT_I2C_IR_RX_HAUP_EXT	= 17, /* External before internal */
> +	IVTV_HW_BIT_I2C_IR_RX_HAUP_INT	= 18,
> +	IVTV_HW_BIT_Z8F0811_IR_HAUP	= 19,
> +	IVTV_HW_BIT_I2C_IR_RX_ADAPTEC	= 20,
> +
> +	IVTV_HW_MAX_BITS		= 21	/* Should be the last bit + 1 */

It's an enum, so you can drop the '= nr' bit.

Other than that it looks OK to me.

Regards,

	Hans

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

