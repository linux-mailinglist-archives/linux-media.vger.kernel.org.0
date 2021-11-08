Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3A3449752
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 16:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhKHPDW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 10:03:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234731AbhKHPDV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 10:03:21 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C293BC061570;
        Mon,  8 Nov 2021 07:00:36 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id t5-20020a17090a4e4500b001a0a284fcc2so9015409pjl.2;
        Mon, 08 Nov 2021 07:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Vg2mmXTQsiGOcnSfqtuBHGSM9AyDd9EFgvLrpDEekBk=;
        b=UikCN7jQTO38Ta3H8Q3C4g79CHu0Orrj8KbcQRecYHKG2Ri4YtV4pAZIviAv+xhRZE
         YtOV1w2d48IrEdUmFCO3PhkcA2DfMJDuTd0leFxkOlhjTm5upQNYt7kaQaaRcOx27Qt7
         roeaH/LhNHCsx93NQIbtZ1AmIqF/KPU8BeOfLi6HTg5ccsyZLaQOYTeEXNlAputfQYGH
         E07oUpMyeW7knVLALTMjAflL9pSDTTSY/8nsh7m6ODzxYskLU7f53C5eraRcQUj5Bxg/
         38Ag3cw/wk5vkBRQAEz/bPm0VaRVkshwwaX+Y+BTpMSmR9rmlo+FRK9sjyjugy66e/lD
         VWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Vg2mmXTQsiGOcnSfqtuBHGSM9AyDd9EFgvLrpDEekBk=;
        b=rYDZ/DTUqcjpGu9l5z0Y2C71YjMIwxKjlZ6fmro8rzNbRtKNR0EpNyElrG23ysYYF3
         +eXQoqwBIs2vftx7AMFcuIeIW6VE8389KnzE21pQfDl4KYdE3TV3oXHCpbbFoNdB8Ho7
         tA6Ulw4CG8o0LAG0CE9gtn72y1GDskKi9YfLZXVQdOopzog1WspZR+kjQjzjHOtDoA+Q
         D2DPVc+Nxql3cUb38gQLIRHsPhLVqpF2Wee+Oxvu+MtKamjYSCR9tDLDZvDbF4Bpk6FU
         YiCOXkEvqi4VHkIzVe0I3OG8Z3JQ93GmT6ojrmPZMo9tBFtu6M3KlbVRZ/pvO/dhfVzD
         tXRw==
X-Gm-Message-State: AOAM531baT0oTLZDA/ausAGyZsVz1moQ+PjpKvr7xnazfJYMl7eCOdUE
        ExxalF2osyZZ+0YJ/cMjuB8=
X-Google-Smtp-Source: ABdhPJyfAhI/bR8dgj5NV7cUjbv6gjyRG7LxFyQcl4JxzcY1sih5Gje/D7RgbxaiXz2t6IoldIntaA==
X-Received: by 2002:a17:90a:9a8e:: with SMTP id e14mr49652pjp.231.1636383634669;
        Mon, 08 Nov 2021 07:00:34 -0800 (PST)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id y130sm10496539pfg.202.2021.11.08.07.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 07:00:33 -0800 (PST)
Message-ID: <ed17420d96bd302479b528f7ae8694ff9cd2e72a.camel@gmail.com>
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
        Alan <alan@linux.intel.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Deepak R Varma <drv@mailo.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Date:   Tue, 09 Nov 2021 00:00:29 +0900
In-Reply-To: <20211102113332.GC2794@kadam>
References: <20211017161958.44351-1-kitakar@gmail.com>
         <20211017161958.44351-6-kitakar@gmail.com> <20211102113332.GC2794@kadam>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-11-02 at 14:33 +0300, Dan Carpenter wrote:
> On Mon, Oct 18, 2021 at 01:19:45AM +0900, Tsuchiya Yuto wrote:
> > The function ia_css_mipi_is_source_port_valid() returns true if the port
> > is valid. So, we can't use the existing err variable as is.
> > 
> > To fix this issue while reusing that variable, invert the return value
> > when assigning it to the variable.
> > 
> > Fixes: 3c0538fbad9f ("media: atomisp: get rid of most checks for ISP2401 version")
> > Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
> > ---
> >  .../staging/media/atomisp/pci/sh_css_mipi.c   | 24 ++++++++++++-------
> >  1 file changed, 15 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > index 65fc93c5d56b..c1f2f6151c5f 100644
> > --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > @@ -423,10 +423,12 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
> >  		return 0; /* AM TODO: Check  */
> >  	}
> >  
> > -	if (!IS_ISP2401)
> > +	if (!IS_ISP2401) {
> >  		port = (unsigned int)pipe->stream->config.source.port.port;
> > -	else
> > -		err = ia_css_mipi_is_source_port_valid(pipe, &port);
> > +	} else {
> > +		/* Returns true if port is valid. So, invert it */
> > +		err = !ia_css_mipi_is_source_port_valid(pipe, &port);
> 
> Don't invert it...  This isn't supposed to return 1 on failure it's
> supposed to return negative error codes.

You mean I should instead modify the return value of
ia_css_mipi_is_source_port_valid() ?

Yeah, I also thought that the current true/false return value was a little
bit confusing.

In another words, should the function return:

    - negative values (maybe -EINVAL for this case) for invalid case
    - 0 for valid case

instead? and if we go this way, we should also rename the function name
like

    - check_ia_css_mipi_source_port_validity

or something. How does this sound?

Regards,
Tsuchiya Yuto

