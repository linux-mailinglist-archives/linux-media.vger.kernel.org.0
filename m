Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D9525C379
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 16:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729020AbgICOwQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 10:52:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:55468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729115AbgICONd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Sep 2020 10:13:33 -0400
Received: from coco.lan (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E41F20658;
        Thu,  3 Sep 2020 14:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599142412;
        bh=JYgbbIOnVmePMIhUu47A7uGnn4+Zd9gZZZsHfVycOgE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YJCkDFUJUvutpZBXLk/07WqO2YV/zHF1gkcumsS7eAmPdkyhZE33Hr3pGUxJ1dbkK
         GRX+ovMcsOrFmDtzGTGfFT1nLG93+yUzGQygX43QAO/HxgIorhSeG81GqB64ELtG5N
         NABXpLxp8H8NherI6brOGBGo8kEanICIyESU0w8w=
Date:   Thu, 3 Sep 2020 16:13:28 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     trix@redhat.com
Cc:     jasmin@anw.at, o.endriss@gmx.de, rjkm@metzlerbros.de,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dvb-frontends/cxd2099: report errors
Message-ID: <20200903161328.62378992@coco.lan>
In-Reply-To: <20200722134126.31191-1-trix@redhat.com>
References: <20200722134126.31191-1-trix@redhat.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 22 Jul 2020 06:41:26 -0700
trix@redhat.com escreveu:

> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this error
> 
> drivers/media/dvb-frontends/cxd2099.c:420:2: warning: Undefined
>   or garbage value returned to caller
>         return val;
>         ^~~~~~~~~~
> 
> In read_cam_control, the call to read_io can fail.
> When it fails val is not set.
> 
> The failure status should be returned to the caller,
> not the unset val.
> 
> Similar problem with read_attribute_mem
> 
> Fixes: 0f0b270f905b ("[media] ngene: CXD2099AR Common Interface driver")
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/media/dvb-frontends/cxd2099.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/cxd2099.c b/drivers/media/dvb-frontends/cxd2099.c
> index f88b5355493e..9dfaf18fc4b4 100644
> --- a/drivers/media/dvb-frontends/cxd2099.c
> +++ b/drivers/media/dvb-frontends/cxd2099.c
> @@ -387,12 +387,15 @@ static int read_attribute_mem(struct dvb_ca_en50221 *ca,
>  {
>  	struct cxd *ci = ca->data;
>  	u8 val;
> +	int ret;
>  
>  	mutex_lock(&ci->lock);
>  	set_mode(ci, 1);
> -	read_pccard(ci, address, &val, 1);
> +	ret = read_pccard(ci, address, &val, 1);
> +	if (!ret)
> +		ret = val;
>  	mutex_unlock(&ci->lock);
> -	return val;
> +	return ret;
>  }
>  
>  static int write_attribute_mem(struct dvb_ca_en50221 *ca, int slot,
> @@ -412,12 +415,15 @@ static int read_cam_control(struct dvb_ca_en50221 *ca,
>  {
>  	struct cxd *ci = ca->data;
>  	unsigned int val;
> +	int ret;
>  
>  	mutex_lock(&ci->lock);
>  	set_mode(ci, 0);
> -	read_io(ci, address, &val);
> +	ret = read_io(ci, address, &val);
> +	if (!ret)
> +		ret = val;
>  	mutex_unlock(&ci->lock);
> -	return val;
> +	return ret;
>  }
>  
>  static int write_cam_control(struct dvb_ca_en50221 *ca, int slot,

Hmm... Had you test this one on a real hardware? It is not
uncommon to have some DVB devices that would fail reading
when the firmware is on cold state.

Without testing a patch like that at a real hardware, there's
no way to know if this is intentional or if the original
developer forgot to add a check for the error.

So, at most, it could print some warning message for
non-zero return codes.


Thanks,
Mauro
