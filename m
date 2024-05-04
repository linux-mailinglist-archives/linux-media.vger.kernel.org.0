Return-Path: <linux-media+bounces-10764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD6C8BBB5B
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 14:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 419D3282C20
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 12:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C974F22616;
	Sat,  4 May 2024 12:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLZSvyuT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B074A1C;
	Sat,  4 May 2024 12:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714825875; cv=none; b=XxSEeLK3QtSYjOzFfzntBGc9sARMVFmAbEU1pvYhs2MbcYaVAsA4USZWyn5d3Zqt8ZXI9O0z17DfXx/8XbDe+N8daXcoebgP76WnEYC48L7QyusTWKkH88kFryNEGGTMf6CKNQt1GPNjPVmbnxGvJOms5lQPnYxBtj+iOy2YY2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714825875; c=relaxed/simple;
	bh=j2dj0tqPrKQ7ksNOF6ysQOcNavYL4bmMIbXzrQp5+E4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t/o9ZPkMTlpuXsASm7f2qxo78WY0JjtRR5LTX9L4yAAVJV2QGTXPMcV9QQPolx7rcnvDXhqeO1QGsi9WM3Hnrm02Tbk1tfxrE1yU302LtU37zaFooSPZgt/y4EXR5ye4VU1DLIqI7uim7er/sg+KRZzhzXnkcbpqJ3DoYy1ThU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLZSvyuT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEED4C072AA;
	Sat,  4 May 2024 12:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714825874;
	bh=j2dj0tqPrKQ7ksNOF6ysQOcNavYL4bmMIbXzrQp5+E4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cLZSvyuTS2g3ZZE1MYOdlHcrSvetKU821lU5Ni6ZRhLQ/plVXQ9eL0Ob6tVI2CxFF
	 gnn0vgseE6rdPV4n2RMRDrcDAB8BRvi5qctOoy6AjkGgXW5ydFcdrHEXuvyBR7E44x
	 n/EtC02ou+8juiruI48ASyh7cJhIhYNDHKHfZWq9XgKW/b1CVi/SjseFRkyF9hYfw+
	 jauoMPAH/YQKXVQJqZ8J0giXJjx5xgwdzrQwKpNFCbN81L9u/wS56g0UmCG/XPATTD
	 IoeACA5aKfW37xnvu9nbV5OErArtwFTlQaCrCAeZ3H8WkbeyLaW/6+3IOS4uoKwSkV
	 VLAfUU6rJ1I/A==
Date: Sat, 4 May 2024 13:31:09 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 413/437] media/rc: convert to read/write iterators
Message-ID: <20240504133055.0ca70f7a@sal.lan>
In-Reply-To: <20240411153126.16201-414-axboe@kernel.dk>
References: <20240411153126.16201-1-axboe@kernel.dk>
	<20240411153126.16201-414-axboe@kernel.dk>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 11 Apr 2024 09:19:13 -0600
Jens Axboe <axboe@kernel.dk> escreveu:

> Signed-off-by: Jens Axboe <axboe@kernel.dk>

Please add a patch description to media patches. Also, please
c/c linux-media@vger.kernel.org, as otherwise patchwork.linuxtv.org
won't track it, and such patches will be silently ignored[1].

[1] I only got aware of this series due to https://lwn.net/Articles/972081/

Regards,
Mauro

> ---
>  drivers/media/rc/imon.c     | 26 ++++++++++++--------------
>  drivers/media/rc/lirc_dev.c | 15 ++++++++-------
>  2 files changed, 20 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> index 5719dda6e0f0..cfcf8101164a 100644
> --- a/drivers/media/rc/imon.c
> +++ b/drivers/media/rc/imon.c
> @@ -65,12 +65,10 @@ static int display_open(struct inode *inode, struct file *file);
>  static int display_close(struct inode *inode, struct file *file);
>  
>  /* VFD write operation */
> -static ssize_t vfd_write(struct file *file, const char __user *buf,
> -			 size_t n_bytes, loff_t *pos);
> +static ssize_t vfd_write(struct kiocb *iocb, struct iov_iter *from);
>  
>  /* LCD file_operations override function prototypes */
> -static ssize_t lcd_write(struct file *file, const char __user *buf,
> -			 size_t n_bytes, loff_t *pos);
> +static ssize_t lcd_write(struct kiocb *iocb, struct iov_iter *from);
>  
>  /*** G L O B A L S ***/
>  
> @@ -179,7 +177,7 @@ struct imon_context {
>  static const struct file_operations vfd_fops = {
>  	.owner		= THIS_MODULE,
>  	.open		= display_open,
> -	.write		= vfd_write,
> +	.write_iter	= vfd_write,
>  	.release	= display_close,
>  	.llseek		= noop_llseek,
>  };
> @@ -188,7 +186,7 @@ static const struct file_operations vfd_fops = {
>  static const struct file_operations lcd_fops = {
>  	.owner		= THIS_MODULE,
>  	.open		= display_open,
> -	.write		= lcd_write,
> +	.write_iter	= lcd_write,
>  	.release	= display_close,
>  	.llseek		= noop_llseek,
>  };
> @@ -938,16 +936,16 @@ static const struct attribute_group imon_rf_attr_group = {
>   * than 32 bytes are provided spaces will be appended to
>   * generate a full screen.
>   */
> -static ssize_t vfd_write(struct file *file, const char __user *buf,
> -			 size_t n_bytes, loff_t *pos)
> +static ssize_t vfd_write(struct kiocb *iocb, struct iov_iter *from)
>  {
>  	int i;
>  	int offset;
>  	int seq;
>  	int retval = 0;
> -	struct imon_context *ictx = file->private_data;
> +	struct imon_context *ictx = iocb->ki_filp->private_data;
>  	static const unsigned char vfd_packet6[] = {
>  		0x01, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF };
> +	size_t n_bytes = iov_iter_count(from);
>  
>  	if (ictx->disconnected)
>  		return -ENODEV;
> @@ -967,7 +965,7 @@ static ssize_t vfd_write(struct file *file, const char __user *buf,
>  		goto exit;
>  	}
>  
> -	if (copy_from_user(ictx->tx.data_buf, buf, n_bytes)) {
> +	if (!copy_from_iter_full(ictx->tx.data_buf, n_bytes, from)) {
>  		retval = -EFAULT;
>  		goto exit;
>  	}
> @@ -1023,11 +1021,11 @@ static ssize_t vfd_write(struct file *file, const char __user *buf,
>   * display whatever diacritics you need, and so on), but it's also
>   * a lot more complicated than most LCDs...
>   */
> -static ssize_t lcd_write(struct file *file, const char __user *buf,
> -			 size_t n_bytes, loff_t *pos)
> +static ssize_t lcd_write(struct kiocb *iocb, struct iov_iter *from)
>  {
>  	int retval = 0;
> -	struct imon_context *ictx = file->private_data;
> +	struct imon_context *ictx = iocb->ki_filp->private_data;
> +	size_t n_bytes = iov_iter_count(from);
>  
>  	if (ictx->disconnected)
>  		return -ENODEV;
> @@ -1047,7 +1045,7 @@ static ssize_t lcd_write(struct file *file, const char __user *buf,
>  		goto exit;
>  	}
>  
> -	if (copy_from_user(ictx->usb_tx_buf, buf, 8)) {
> +	if (!copy_from_iter_full(ictx->usb_tx_buf, 8, from)) {
>  		retval = -EFAULT;
>  		goto exit;
>  	}
> diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
> index caad59f76793..e88ba11192ea 100644
> --- a/drivers/media/rc/lirc_dev.c
> +++ b/drivers/media/rc/lirc_dev.c
> @@ -211,10 +211,10 @@ static int lirc_close(struct inode *inode, struct file *file)
>  	return 0;
>  }
>  
> -static ssize_t lirc_transmit(struct file *file, const char __user *buf,
> -			     size_t n, loff_t *ppos)
> +static ssize_t lirc_transmit(struct kiocb *iocb, struct iov_iter *from)
>  {
> -	struct lirc_fh *fh = file->private_data;
> +	struct lirc_fh *fh = iocb->ki_filp->private_data;
> +	size_t n = iov_iter_count(from);
>  	struct rc_dev *dev = fh->rc;
>  	unsigned int *txbuf;
>  	struct ir_raw_event *raw = NULL;
> @@ -247,7 +247,7 @@ static ssize_t lirc_transmit(struct file *file, const char __user *buf,
>  			goto out_unlock;
>  		}
>  
> -		if (copy_from_user(&scan, buf, sizeof(scan))) {
> +		if (!copy_from_iter_full(&scan, sizeof(scan), from)) {
>  			ret = -EFAULT;
>  			goto out_unlock;
>  		}
> @@ -309,7 +309,7 @@ static ssize_t lirc_transmit(struct file *file, const char __user *buf,
>  			goto out_unlock;
>  		}
>  
> -		txbuf = memdup_user(buf, n);
> +		txbuf = iterdup(from, n);
>  		if (IS_ERR(txbuf)) {
>  			ret = PTR_ERR(txbuf);
>  			goto out_unlock;
> @@ -694,13 +694,14 @@ static ssize_t lirc_read(struct file *file, char __user *buffer, size_t length,
>  	else /* LIRC_MODE_SCANCODE */
>  		return lirc_read_scancode(file, buffer, length);
>  }
> +FOPS_READ_ITER_HELPER(lirc_read);
>  
>  static const struct file_operations lirc_fops = {
>  	.owner		= THIS_MODULE,
> -	.write		= lirc_transmit,
> +	.write_iter	= lirc_transmit,
>  	.unlocked_ioctl	= lirc_ioctl,
>  	.compat_ioctl	= compat_ptr_ioctl,
> -	.read		= lirc_read,
> +	.read_iter	= lirc_read_iter,
>  	.poll		= lirc_poll,
>  	.open		= lirc_open,
>  	.release	= lirc_close,

