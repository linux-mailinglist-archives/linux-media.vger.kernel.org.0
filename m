Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3501364D3C
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 23:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240362AbhDSVmq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 17:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbhDSVmp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 17:42:45 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 420A7C06174A
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 14:42:15 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id h11so6464318pfn.0
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 14:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z7kIVSYEdrRLbG/oTtoQrKQxmDG3dmpZPUyg3EMa1CI=;
        b=Sc9mIgdJ5IJ09G9kAqZ9VsN1nsYl+yz3IGYKiVoJZ31Jk4GPBt030CiHSA3T7NfRVD
         V0fzJmr7jDWGooYekukrrrg4QXb9oTMYULfmrYj9uREqw4NITDNEeYQkMdFvW2ENTTju
         I09A75uB7/7mdrhUmFll44K2Bs3tXGMjLNa6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z7kIVSYEdrRLbG/oTtoQrKQxmDG3dmpZPUyg3EMa1CI=;
        b=OHsxdtnrsILfrHb9QTEQ22sDnCbAiVHce36cBNJZRJKRjwEV9AAnBMkF4oc+DufKYk
         By8lq9ZIxKEpSeJthvEMrqXHed9ckktuup0tDdeFt5WxLAUYO4lpHOXAsHK+nPMxMPXL
         u9DKih8ZuX+JtNYD28rDE53V50Hdmm/oPo+Ej2fykoDU+NaKLRAHDU7gyUCOP0775xrM
         twYC+tKJe9czB/qeH27DoCAO+E//G/GIV2xfVysAYEFln0iaqb0jA0oQWGwTvLCEiNe5
         6wRKs72tQahGf/Os9rmaY50ckmvrIPGhWRU1svQcPD5iANjebWRG8f9oyY7/EXIkr3vV
         0bEA==
X-Gm-Message-State: AOAM533ETE2wUZQ4FDY9QbwRoccjZqd3SikDNf9fflrUH8JuabyzvlNN
        g/duY+iVihK3sM2PzPvBYOTe+Q==
X-Google-Smtp-Source: ABdhPJw5yzdDzieag+gqmOa5kavOqzVuM6LBmdKRuUmV+3JzQTh1pmD4bxzemJrOuM5oef2m82t6hQ==
X-Received: by 2002:a65:5581:: with SMTP id j1mr2421475pgs.420.1618868534877;
        Mon, 19 Apr 2021 14:42:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r14sm345587pjz.43.2021.04.19.14.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 14:42:14 -0700 (PDT)
Date:   Mon, 19 Apr 2021 14:42:13 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Luo Likang <luolikang@nsfocus.com>, security@kernel.org,
        linux-distros@vs.openwall.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux1394-devel@lists.sourceforge.net
Subject: Re: [PATCH] media: firewire: firedtv-avc: fix a buffer overflow in
 avc_ca_pmt()
Message-ID: <202104191438.D54A181@keescook>
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

Thanks for the report and the fix!

As a quick note on alternative mitigations, it seems that
CONFIG_UBSAN_BOUNDS would have caught this at runtime too. (i.e.
c->operand[]'s size is known at build time, so out of bounds
indexing should be detected.)

-Kees

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

-- 
Kees Cook
