Return-Path: <linux-media+bounces-55861-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NoCIMa/t2n5UwEAu9opvQ
	(envelope-from <linux-media+bounces-55861-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:31:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2110D296318
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6030930293F8
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 08:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E45374739;
	Mon, 16 Mar 2026 08:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdnn4047"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B64354AFC;
	Mon, 16 Mar 2026 08:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649799; cv=none; b=fM4hqylJok+rpxz2Dq9L+NxChf2QyJ9S+KiWwizigv0f7hoWtgqK4dLCs1QZn6LLwUmJfjRWT7BbgY2SiOVoXxx4O+lbWIBudp9GQ6P6zTv8Jeczr0OGelIwabPBUITdY0DP9nhhdGrz9UMUS3tahftvTaCtPJujy8BmmhEKR6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649799; c=relaxed/simple;
	bh=ZleLRHDOHBip+HjzKZfgbCdexqRYELee4obevGjagA4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hg/HU7fT88c/aRIOQ5Rbji+HOPBXeJxotjFyFmHzGbfUdJcCJQRoM7owpTsYT0CpEq+bYnsVyueH+09nKFd62FdrGGgVE2F1pl+mDEZ4wYwH42A6PoffAUT8nDU5EkswVhvncVTLfvg80iq724qMnAoytSRvpHZtccp0os5edj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdnn4047; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870B9C19421;
	Mon, 16 Mar 2026 08:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773649799;
	bh=ZleLRHDOHBip+HjzKZfgbCdexqRYELee4obevGjagA4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=kdnn4047r/PTpjAKHd4omIMsOpl4ztjzFI5kQfAUHqX34ZPsmSn81reSSVgRSu89L
	 23+I9JxdTSXW1Dtu8OD62Jknq6sVuNAgNgFFG5QTKl3P9oWtSnR5TnzkAib8OoB80m
	 IzP0p4pdzZwAEvZFrBftxiPl0XRkbYaXutmNVoJUxk14TYt9HSiD/Ud4M8rgJcJiWt
	 Jjrsf0NhBzFKRsgH1b9oxEFZjq0Jv4BOfLXqL4n6qn8PVHGsXaQwxoXgwDZYY2uT7Z
	 eOGFtrH4AuPzlfaTtRpXuNRMih137kjkvsYvuaEcu1V5czsaiYolnUDslf/GhryY+g
	 z99YJ8m1u/W0Q==
Message-ID: <76fd11b2-7789-47c1-a832-12907155ead1@kernel.org>
Date: Mon, 16 Mar 2026 09:29:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 01/13] media: saa7134: rename i2c_dbg() to
 saa7134_i2c_dbg()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>,
 Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
 Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <20260223-i2c-printk-helpers-v2-1-13b2a97762af@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260223-i2c-printk-helpers-v2-1-13b2a97762af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55861-lists,linux-media=lfdr.de,cisco];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,sang-engineering.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 2110D296318
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bartosz,

Apologize, the earlier patches for this fell through the cracks so never
made it to v7.0.

For this v2:

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Do you want to merge this through the i2c subsystem? Or do you want me to
merge this patch through the media subsystem?

Regards,

	Hans

On 23/02/2026 09:59, Bartosz Golaszewski wrote:
> Ahead of introducing I2C-adapter-specific printk() helpers, preemptively
> avoid a conflict with the upcoming i2c_dbg() and rename the local macro
> in the saa7134 driver to saa7134_i2c_dbg().
> 
> Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/media/pci/saa7134/saa7134-i2c.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/pci/saa7134/saa7134-i2c.c b/drivers/media/pci/saa7134/saa7134-i2c.c
> index 04e85765373ecc0f0759eba539c20bcdc9716ca8..1164e91cbb7b7f5250dc02bc086f5cc06ea8f5a5 100644
> --- a/drivers/media/pci/saa7134/saa7134-i2c.c
> +++ b/drivers/media/pci/saa7134/saa7134-i2c.c
> @@ -28,7 +28,7 @@ static unsigned int i2c_scan;
>  module_param(i2c_scan, int, 0444);
>  MODULE_PARM_DESC(i2c_scan,"scan i2c bus at insmod time");
>  
> -#define i2c_dbg(level, fmt, arg...) do { \
> +#define saa7134_i2c_dbg(level, fmt, arg...) do { \
>  	if (i2c_debug == level) \
>  		printk(KERN_DEBUG pr_fmt("i2c: " fmt), ## arg); \
>  	} while (0)
> @@ -84,20 +84,20 @@ static inline enum i2c_status i2c_get_status(struct saa7134_dev *dev)
>  	enum i2c_status status;
>  
>  	status = saa_readb(SAA7134_I2C_ATTR_STATUS) & 0x0f;
> -	i2c_dbg(2, "i2c stat <= %s\n", str_i2c_status[status]);
> +	saa7134_i2c_dbg(2, "i2c stat <= %s\n", str_i2c_status[status]);
>  	return status;
>  }
>  
>  static inline void i2c_set_status(struct saa7134_dev *dev,
>  				  enum i2c_status status)
>  {
> -	i2c_dbg(2, "i2c stat => %s\n", str_i2c_status[status]);
> +	saa7134_i2c_dbg(2, "i2c stat => %s\n", str_i2c_status[status]);
>  	saa_andorb(SAA7134_I2C_ATTR_STATUS,0x0f,status);
>  }
>  
>  static inline void i2c_set_attr(struct saa7134_dev *dev, enum i2c_attr attr)
>  {
> -	i2c_dbg(2, "i2c attr => %s\n", str_i2c_attr[attr]);
> +	saa7134_i2c_dbg(2, "i2c attr => %s\n", str_i2c_attr[attr]);
>  	saa_andorb(SAA7134_I2C_ATTR_STATUS,0xc0,attr << 6);
>  }
>  
> @@ -160,7 +160,7 @@ static int i2c_reset(struct saa7134_dev *dev)
>  	enum i2c_status status;
>  	int count;
>  
> -	i2c_dbg(2, "i2c reset\n");
> +	saa7134_i2c_dbg(2, "i2c reset\n");
>  	status = i2c_get_status(dev);
>  	if (!i2c_is_error(status))
>  		return true;
> @@ -198,7 +198,7 @@ static inline int i2c_send_byte(struct saa7134_dev *dev,
>  //	dword |= 0x40 << 16;  /* 400 kHz */
>  	dword |= 0xf0 << 24;
>  	saa_writel(SAA7134_I2C_ATTR_STATUS >> 2, dword);
> -	i2c_dbg(2, "i2c data => 0x%x\n", data);
> +	saa7134_i2c_dbg(2, "i2c data => 0x%x\n", data);
>  
>  	if (!i2c_is_busy_wait(dev))
>  		return -EIO;
> @@ -220,7 +220,7 @@ static inline int i2c_recv_byte(struct saa7134_dev *dev)
>  	if (i2c_is_error(status))
>  		return -EIO;
>  	data = saa_readb(SAA7134_I2C_DATA);
> -	i2c_dbg(2, "i2c data <= 0x%x\n", data);
> +	saa7134_i2c_dbg(2, "i2c data <= 0x%x\n", data);
>  	return data;
>  }
>  
> @@ -237,12 +237,12 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
>  		if (!i2c_reset(dev))
>  			return -EIO;
>  
> -	i2c_dbg(2, "start xfer\n");
> -	i2c_dbg(1, "i2c xfer:");
> +	saa7134_i2c_dbg(2, "start xfer\n");
> +	saa7134_i2c_dbg(1, "i2c xfer:");
>  	for (i = 0; i < num; i++) {
>  		if (!(msgs[i].flags & I2C_M_NOSTART) || 0 == i) {
>  			/* send address */
> -			i2c_dbg(2, "send address\n");
> +			saa7134_i2c_dbg(2, "send address\n");
>  			addr  = msgs[i].addr << 1;
>  			if (msgs[i].flags & I2C_M_RD)
>  				addr |= 1;
> @@ -265,7 +265,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
>  		}
>  		if (msgs[i].flags & I2C_M_RD) {
>  			/* read bytes */
> -			i2c_dbg(2, "read bytes\n");
> +			saa7134_i2c_dbg(2, "read bytes\n");
>  			for (byte = 0; byte < msgs[i].len; byte++) {
>  				i2c_cont(1, " =");
>  				rc = i2c_recv_byte(dev);
> @@ -286,7 +286,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
>  			}
>  		} else {
>  			/* write bytes */
> -			i2c_dbg(2, "write bytes\n");
> +			saa7134_i2c_dbg(2, "write bytes\n");
>  			for (byte = 0; byte < msgs[i].len; byte++) {
>  				data = msgs[i].buf[byte];
>  				i2c_cont(1, " %02x", data);
> @@ -296,7 +296,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
>  			}
>  		}
>  	}
> -	i2c_dbg(2, "xfer done\n");
> +	saa7134_i2c_dbg(2, "xfer done\n");
>  	i2c_cont(1, " >");
>  	i2c_set_attr(dev,STOP);
>  	rc = -EIO;
> 


