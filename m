Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A4A44983A
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 16:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239155AbhKHP2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 10:28:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235860AbhKHP2l (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 10:28:41 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 946FDC061570;
        Mon,  8 Nov 2021 07:25:57 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id r80so5132196pgr.9;
        Mon, 08 Nov 2021 07:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=vPyJr+4qmWXSKsoVulut/GUWobZxrCQk03WwnLZG85Q=;
        b=TCem6/Qje9Aic+a5CzQoHwLA5+wgX8Yl6Rv8spN0zZXx6nxquLe8/6JlghITAaUV85
         lULdtQhrq/9PGxZm8Mn+ocVv6PWConrf+Tsrr6NmKX+G715Ak1/ElkaAyNYgRs8/g61m
         2VbOnFjydzm8AqngcKjWCsEc4zipRNoQ9rNzlckVnabZXmFe8aQWJOxs9bqkacNft/cb
         Js4JEIpejkxXUfCiQsHpa2AXFrv4ek1e1vLhfMW2H6INrURc+g2+W6xW7e30YgXg7gzy
         4nkXNyWWmXOoubygMz5/8XkqklSkK5W1sEauiGiE6QzcSwz/Z4LP44PD1oH6zSp1ets0
         lPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vPyJr+4qmWXSKsoVulut/GUWobZxrCQk03WwnLZG85Q=;
        b=1NqCq/xX437CD30Hd9tejB8a/Via0Ko9qxmcYBcWvoKaALPASKCsGKyTHdi6TxgpCf
         UQpZTK0XZaSgFFnevFi2E/8aFoftaARjzwdieM4KdqO5+s/M43CrS5kGeIJRAtXY8Z/8
         Ss3TjdUxIxcPvq/3tGPYiQuFwvkKtou2pZivkTI9am0ndW2yuF9E0o++SZxmE01fV4Fl
         dniKFs8X+4pwzbEhq73dXq53W2hXckDLm/30MJbL+4wOqdVQST/uAQ25lzWYjr9VBoFg
         Zz0cYrmuPHVrE/lUssK3uhluJjGG8RL8HsXKWDAkvf7vv3RCYMjlTviL8D0sPHI88u4U
         QXOA==
X-Gm-Message-State: AOAM5339+rRODdU0t7/gjv95MhJsfo+pKJtoGoozmCLyemjMasZ2Avdc
        q4J4hVe+6IG+JSrLpEIF0rk=
X-Google-Smtp-Source: ABdhPJzWSFewdvnFvrYlEolrd4fh2DtHFo6fRGA+sJCKTWOJ51qsmIfpwb5heta9Xboq/m704F/euA==
X-Received: by 2002:aa7:9e9c:0:b0:49f:c7cf:ff5 with SMTP id p28-20020aa79e9c000000b0049fc7cf0ff5mr277917pfq.62.1636385157071;
        Mon, 08 Nov 2021 07:25:57 -0800 (PST)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id j6sm12763106pgq.0.2021.11.08.07.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 07:25:56 -0800 (PST)
Message-ID: <efaf74b587e5e31403895cd5af88852402fe92ec.camel@gmail.com>
Subject: Re: [PATCH 05/17] media: atomisp: pci: fix inverted error check for
 ia_css_mipi_is_source_port_valid()
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Deepak R Varma <drv@mailo.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Date:   Tue, 09 Nov 2021 00:25:52 +0900
In-Reply-To: <20211108151455.GI2001@kadam>
References: <20211017161958.44351-1-kitakar@gmail.com>
         <20211017161958.44351-6-kitakar@gmail.com> <20211102113332.GC2794@kadam>
         <ed17420d96bd302479b528f7ae8694ff9cd2e72a.camel@gmail.com>
         <20211108151455.GI2001@kadam>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

<removed Alan from Cc as the mail address not reachable>

On Mon, 2021-11-08 at 18:14 +0300, Dan Carpenter wrote:
> On Tue, Nov 09, 2021 at 12:00:29AM +0900, Tsuchiya Yuto wrote:
> > On Tue, 2021-11-02 at 14:33 +0300, Dan Carpenter wrote:
> > > On Mon, Oct 18, 2021 at 01:19:45AM +0900, Tsuchiya Yuto wrote:
> > > > The function ia_css_mipi_is_source_port_valid() returns true if the port
> > > > is valid. So, we can't use the existing err variable as is.
> > > > 
> > > > To fix this issue while reusing that variable, invert the return value
> > > > when assigning it to the variable.
> > > > 
> > > > Fixes: 3c0538fbad9f ("media: atomisp: get rid of most checks for ISP2401 version")
> > > > Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
> > > > ---
> > > >  .../staging/media/atomisp/pci/sh_css_mipi.c   | 24 ++++++++++++-------
> > > >  1 file changed, 15 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > > > index 65fc93c5d56b..c1f2f6151c5f 100644
> > > > --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > > > +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > > > @@ -423,10 +423,12 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
> > > >  		return 0; /* AM TODO: Check  */
> > > >  	}
> > > >  
> > > > -	if (!IS_ISP2401)
> > > > +	if (!IS_ISP2401) {
> > > >  		port = (unsigned int)pipe->stream->config.source.port.port;
> > > > -	else
> > > > -		err = ia_css_mipi_is_source_port_valid(pipe, &port);
> > > > +	} else {
> > > > +		/* Returns true if port is valid. So, invert it */
> > > > +		err = !ia_css_mipi_is_source_port_valid(pipe, &port);
> > > 
> > > Don't invert it...  This isn't supposed to return 1 on failure it's
> > > supposed to return negative error codes.
> > 
> > You mean I should instead modify the return value of
> > ia_css_mipi_is_source_port_valid() ?
> > 
> 
> No.  ia_css_mipi_is_source_port_valid() is fine.  It has a boolean name
> so returning bool is fine.  What I'm saying is that allocate_mipi_frames()
> should do:
> 
> 	if (!ia_css_mipi_is_source_port_valid(pipe, &port))
> 		err = -EINVAL;
> 
> Otherwise it returns negative error codes and 1 on failure.

Ah, I see! Thank you. I feel I'm a stupid... I'll do so in v2.

Regards,
Tsuchiya Yuto

