Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA6743DA114
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 12:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235633AbhG2Kcb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 06:32:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:35100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235309AbhG2Kc1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 06:32:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F256601FF;
        Thu, 29 Jul 2021 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627554744;
        bh=evqS+jYgdy4AaHR+PlFUIfPANh3VC9qSJLUKVyCQu2E=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=QtB01bi7tcSTf3qCn/mJiicVJt5X2UEAyOotNQTpfXgGcIwP1UHR9r9GfHd0IDrJh
         bXvzB/vLtOmLnuInGz2KruvBWSWRdRyT8vwbKuKmwy24gihB8GHp3aqeg4qi1F53Gl
         kiIpApj/SIs1sisgDYqhm9AYx0qXIb53qdnWPQ1s=
Date:   Thu, 29 Jul 2021 12:32:21 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Luo Likang <luolikang@nsfocus.com>, security@kernel.org,
        linux-distros@vs.openwall.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux1394-devel@lists.sourceforge.net
Subject: Re: [PATCH] media: firewire: firedtv-avc: fix a buffer overflow in
 avc_ca_pmt()
Message-ID: <YQKDtRtAC5F7W+bg@kroah.com>
References: <000001d73031$d5304480$7f90cd80$@nsfocus.com>
 <YHaulytonFcW+lyZ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHaulytonFcW+lyZ@mwanda>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 14, 2021 at 11:57:59AM +0300, Dan Carpenter wrote:
> The bounds checking in avc_ca_pmt() is not strict enough.  It should
> be checking "read_pos + 4" because it's reading 5 bytes.  If the
> "es_info_length" is non-zero then it reads a 6th byte so there needs to
> be an additional check for that.
> 
> I also added checks for the "write_pos".  I don't think these are
> required because "read_pos" and "write_pos" are tied together so
> checking one ought to be enough.  But they make the code easier to
> understand for me.
> 
> The other problem is that "length" can be invalid.  It comes from
> "data_length" in fdtv_ca_pmt().
> 
> Cc: stable@vger.kernel.org
> Reported-by: Luo Likang <luolikang@nsfocus.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This hardware isn't super common so there is no embargo.  Resending
> through normal lists.
> 
> Oh, another thing is the data_length calculation in fdtv_ca_pmt() seems
> very suspicous.  Reading more than 4 bytes in the loop will lead to
> shift wrapping.
> 
>  drivers/media/firewire/firedtv-avc.c | 14 +++++++++++---
>  drivers/media/firewire/firedtv-ci.c  |  2 ++
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/firewire/firedtv-avc.c b/drivers/media/firewire/firedtv-avc.c
> index 2bf9467b917d..71991f8638e6 100644
> --- a/drivers/media/firewire/firedtv-avc.c
> +++ b/drivers/media/firewire/firedtv-avc.c
> @@ -1165,7 +1165,11 @@ int avc_ca_pmt(struct firedtv *fdtv, char *msg, int length)
>  		read_pos += program_info_length;
>  		write_pos += program_info_length;
>  	}
> -	while (read_pos < length) {
> +	while (read_pos + 4 < length) {
> +		if (write_pos + 4 >= sizeof(c->operand) - 4) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
>  		c->operand[write_pos++] = msg[read_pos++];
>  		c->operand[write_pos++] = msg[read_pos++];
>  		c->operand[write_pos++] = msg[read_pos++];
> @@ -1177,13 +1181,17 @@ int avc_ca_pmt(struct firedtv *fdtv, char *msg, int length)
>  		c->operand[write_pos++] = es_info_length >> 8;
>  		c->operand[write_pos++] = es_info_length & 0xff;
>  		if (es_info_length > 0) {
> +			if (read_pos >= length) {
> +				ret = -EINVAL;
> +				goto out;
> +			}
>  			pmt_cmd_id = msg[read_pos++];
>  			if (pmt_cmd_id != 1 && pmt_cmd_id != 4)
>  				dev_err(fdtv->device, "invalid pmt_cmd_id %d at stream level\n",
>  					pmt_cmd_id);
>  
> -			if (es_info_length > sizeof(c->operand) - 4 -
> -					     write_pos) {
> +			if (es_info_length > sizeof(c->operand) - 4 - write_pos ||
> +			    es_info_length > length - read_pos) {
>  				ret = -EINVAL;
>  				goto out;
>  			}
> diff --git a/drivers/media/firewire/firedtv-ci.c b/drivers/media/firewire/firedtv-ci.c
> index 9363d005e2b6..2d6992ac5dd6 100644
> --- a/drivers/media/firewire/firedtv-ci.c
> +++ b/drivers/media/firewire/firedtv-ci.c
> @@ -134,6 +134,8 @@ static int fdtv_ca_pmt(struct firedtv *fdtv, void *arg)
>  	} else {
>  		data_length = msg->msg[3];
>  	}
> +	if (data_length > sizeof(msg->msg) - 4)
> +		return -EINVAL;
>  
>  	return avc_ca_pmt(fdtv, &msg->msg[data_pos], data_length);
>  }
> -- 
> 2.30.2
> 

This patch seems to have gotten lost.  Any change of it getting applied?

thanks,

greg k-h
