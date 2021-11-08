Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F196D44988E
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 16:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240985AbhKHPmG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 10:42:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236257AbhKHPmF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 10:42:05 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A102C061570;
        Mon,  8 Nov 2021 07:39:21 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id o14so16070503plg.5;
        Mon, 08 Nov 2021 07:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=K1a2F1vABcXBgFkgj7fRQfJ3tUtX60pTZPQU6QiZPvI=;
        b=SOXuIxdqS9qFdKIbz1YlkcS/7M0PdOeX84DyUFE82X1DvnnIZMEqe9Lim/FaN3+9uI
         oq/zc0BUFue6MDhQ3zRDw6BRtjnrI8oqmSEdn5RPwcOhDHLUlmWAcOkhE1rORJV3HmDJ
         +WkVV2PojzBzsKNLwUVNqn0V0FKohxopoIU1flbnjTG8ADpxRbhd3s4GFMhZ69n0tzUZ
         3uwxmHzt0196hq7PLQL8ljigRWIEZ52bTGMoBhfpgly2t7UsqrgP/t0nqytllxfb2ItG
         v+ZYWEHwgQraSVhCrYu+JaDwkqFpI8le+mpmlysIzCOXc9aXXRRfKj7X/XuggmmVINTR
         i6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=K1a2F1vABcXBgFkgj7fRQfJ3tUtX60pTZPQU6QiZPvI=;
        b=1AHnDponi/gAEbgbVMGNyjJOgZoVzkCUYUDWgg7decZAuTMqZ8SiRyrlu3ZvGbT1/i
         KrCJlA/eQ/+ehhR5bo+FsNplxDDOJ98CYGVdheGim895QLk1NFfTKAsaf+me0NT/IDrO
         DNvhq6SSFD8Bovi5c3rfSYgKMxG8QG5hpK4THDGuhAEo1wN4Wu9DO2oZ0ln/MDRxltRe
         7H9UlAr7ljyPjsxqWfZb1ZniIvQZGyqgCvnm+E53miqo7OO6HHHzU2BYcz1As7XPEVgc
         PRn+L2ZuHI62WMN/dV+VS1tDw5uRH98R1WxOthkUltC8E4UQWp2U18Pev1olsd+GkkeK
         GUfg==
X-Gm-Message-State: AOAM53186+t1r6mLTHkf1BaUHT8B9oERm+ntwvtAwzD+a3DWfKpN+PuN
        yfzcwcm4ea/Nem/dJKOmUrA=
X-Google-Smtp-Source: ABdhPJzGy1jSuPyC8aV59EP9ACmfesbtWaDPQpCoRWWqmxxyR6VMOpewLwYB7KTNaMONv3ULbKWBKA==
X-Received: by 2002:a17:90a:9294:: with SMTP id n20mr348413pjo.69.1636385960715;
        Mon, 08 Nov 2021 07:39:20 -0800 (PST)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id c21sm17734017pfl.15.2021.11.08.07.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 07:39:20 -0800 (PST)
Message-ID: <ff2ac6cb74e98a5e9b0f537ea468322e6379620e.camel@gmail.com>
Subject: Re: [PATCH 06/17] media: atomisp: pci: use IA_CSS_ERROR() for error
 messages in sh_css_mipi.c
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Deepak R Varma <drv@mailo.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Date:   Tue, 09 Nov 2021 00:39:16 +0900
In-Reply-To: <20211102113540.GD2794@kadam>
References: <20211017161958.44351-1-kitakar@gmail.com>
         <20211017161958.44351-7-kitakar@gmail.com> <20211102113540.GD2794@kadam>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

<removed Alan from Cc as the mail address not reachable>

On Tue, 2021-11-02 at 14:35 +0300, Dan Carpenter wrote:
> On Mon, Oct 18, 2021 at 01:19:46AM +0900, Tsuchiya Yuto wrote:
> >  .../staging/media/atomisp/pci/sh_css_mipi.c   | 32 ++++++++-----------
> >  1 file changed, 13 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > index c1f2f6151c5f..de56a1da754d 100644
> > --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > @@ -434,9 +434,8 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
> >  
> >  	if ((!IS_ISP2401 && port >= N_CSI_PORTS) ||
> >  	    (IS_ISP2401 && err)) {
> > -		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> > -				    "allocate_mipi_frames(%p) exit: error: port is not correct (port=%d).\n",
> > -				    pipe, port);
> > +		IA_CSS_ERROR("allocate_mipi_frames(%p) exit: port is not correct (port=%d).",
> > +			     pipe, port);
> 
> Not related to this patch but these printks should be using __func__
> instead of hard coding it.

OK, considering that I'll add a separate space issue fix patch in v2 as
discussed in another mail, I'll also add the separate fix for minor
issue fixes here, including the usage of `__func__` and dropping
the unneeded newline `\n` I'm currently doing while here.

Regards,
Tsuchiya Yuto

