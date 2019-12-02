Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84EE110EEEE
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2019 19:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbfLBSJo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Dec 2019 13:09:44 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34797 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727670AbfLBSJo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Dec 2019 13:09:44 -0500
Received: by mail-pf1-f196.google.com with SMTP id n13so50694pff.1;
        Mon, 02 Dec 2019 10:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XdpWQGEzUI2/PkttfxgQ1A4qQFakcT1AyA73sEMtRd4=;
        b=YEep5tx6rMSMWnGsf6pry4LnN046XAHKKJ3zGpOSbn2h1BfCQ9BfCBXQH2ZvkH1hE1
         PrJr0sCP3pBTJZBZnrx/NzkxGZ+fdxsiebj6HocwRnyLjiFlH6vlAA8W5y5hixW8ug87
         TmDr7zrVY+4YT141OXSUnuS7nQVYYEJIQwhb3IbGt9tNjC8LJ1Tf8g7pSrDv+ubqimkF
         dklkBcRMJrsb+8IoALEPbuGsTRgWq+elDi4fLtAIvcUuqZrBnyGEhYwS1unCOtPBM3rb
         tUOyypioD97mH6GX/dL9mW+S+gmVcO1unOQqu897jmykM/I9gkI+wp6TRZb8ur2k8WS+
         gEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XdpWQGEzUI2/PkttfxgQ1A4qQFakcT1AyA73sEMtRd4=;
        b=h6RkBaB+D+uOXOMq8V+4LCrqMdBs4oOuUw+mco3Ld3/L01+NDFzw87dFmgl422BRBy
         gMgCEht3LoAMOh4ucusE0f/dfnuwiw8fNADEZ69ICRQoKCwFiiTXFWnpx9TdLhV+gazO
         c3DhObrXyGq8hQuQp01aOwd3sTffsCdxLdBtCUlFI9oXPFZLGP0OryUMwAZ9XSIGQvpG
         cSXpA6+TRXPjRfzCjuaT6XcVhRNTj9JapTyRk3RYKEsraQ+DrX5l0duJZXaCO34pIN/m
         VMhrlDAxeCe9snz+qRfRVBwIH8kRSJhd1/f3Hu+zTIQyNOzy9PEfib+RaZpQn2uUItQf
         H4/Q==
X-Gm-Message-State: APjAAAVlXZlpJvRGL3J0eq+/yXa0XOzjKLMMsg+gi0POM8pszlF8Pnxn
        zDIrcq50aVxRjALVVAHVUXs=
X-Google-Smtp-Source: APXvYqwdK/O7JfUMStXj1VFEvDB1SbQJZ75ay/dlBjAnJoISxEZ6444HJ0hzcXzpjemueFul0UgU3A==
X-Received: by 2002:a63:c250:: with SMTP id l16mr383980pgg.38.1575310182997;
        Mon, 02 Dec 2019 10:09:42 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id k10sm39005pjp.12.2019.12.02.10.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 10:09:41 -0800 (PST)
Date:   Mon, 2 Dec 2019 10:09:39 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-input@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nick Dyer <nick@shmanahar.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Christopher Heiny <cheiny@synaptics.com>,
        Vandana BN <bnvandana@gmail.com>
Subject: Re: [PATCHv2 5/5] input/rmi4/rmi_smbus.c: don't increment rmiaddr
Message-ID: <20191202180939.GE50317@dtor-ws>
References: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
 <20191119105118.54285-6-hverkuil-cisco@xs4all.nl>
 <8dd22e21-4933-8e9c-a696-d281872c8de7@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dd22e21-4933-8e9c-a696-d281872c8de7@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 23, 2019 at 05:27:41PM +0100, Hans Verkuil wrote:
> This increment of rmi_smbus in rmi_smb_read/write_block() causes
> garbage to be read/written.
> 
> The first read of SMB_MAX_COUNT bytes is fine, but after that
> it is nonsense. Trial-and-error showed that by dropping the
> increment of rmiaddr everything is fine and the F54 function
> properly works.
> 
> I tried a hack with rmi_smb_write_block() as well (writing to the
> same F54 touchpad data area, then reading it back), and that
> suggests that there too the rmiaddr increment has to be dropped.
> It makes sense that if it has to be dropped for read, then it has
> to be dropped for write as well.
> 
> It looks like the initial work with F54 was done using i2c, not smbus,
> and it seems nobody ever tested F54 with smbus. The other functions
> all read/write less than SMB_MAX_COUNT as far as I can tell, so this
> issue was never noticed with non-F54 functions.
> 
> With this change I can read out the touchpad data correctly on my
> Lenovo X1 Carbon 6th Gen laptop.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Applied, thank you.

> ---
>  drivers/input/rmi4/rmi_smbus.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbus.c
> index 2407ea43de59..b313c579914f 100644
> --- a/drivers/input/rmi4/rmi_smbus.c
> +++ b/drivers/input/rmi4/rmi_smbus.c
> @@ -163,7 +163,6 @@ static int rmi_smb_write_block(struct rmi_transport_dev *xport, u16 rmiaddr,
>  		/* prepare to write next block of bytes */
>  		cur_len -= SMB_MAX_COUNT;
>  		databuff += SMB_MAX_COUNT;
> -		rmiaddr += SMB_MAX_COUNT;
>  	}
>  exit:
>  	mutex_unlock(&rmi_smb->page_mutex);
> @@ -215,7 +214,6 @@ static int rmi_smb_read_block(struct rmi_transport_dev *xport, u16 rmiaddr,
>  		/* prepare to read next block of bytes */
>  		cur_len -= SMB_MAX_COUNT;
>  		databuff += SMB_MAX_COUNT;
> -		rmiaddr += SMB_MAX_COUNT;
>  	}
> 
>  	retval = 0;
> -- 
> 2.24.0
> 
> 

-- 
Dmitry
