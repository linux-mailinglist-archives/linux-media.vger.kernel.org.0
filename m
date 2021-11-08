Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A13D448225
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 15:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240616AbhKHOvi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 09:51:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234639AbhKHOvh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 09:51:37 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A52C061570;
        Mon,  8 Nov 2021 06:48:53 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id b68so5593480pfg.11;
        Mon, 08 Nov 2021 06:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zh9gE0+un/2IOlNp/KF8D2+pFHOEto5n7nDYfrHflbA=;
        b=l72w65JmCGBsZNXFoziWY+4NmLzsbq/bsPLG41PV8EyQ2tXdlxtdv8dmlmdvVek8Vp
         fa+IKbkg3PANZZ2VNf8VJcpLnMKh/cL0xaBQe9CAc7xg1e3R14DBKfZzrrCmi+gs91gH
         TBr3ssk+f0L+7hofKmdN/Amfoxh28+q311Y8zN5Ki6GNuBkQo4Thi1BCe15rOBJRNnef
         t+O6iZr+znV2jW4INnUMn8qa8U2yKsJoyhOQP4qdZqugRkhrX0zgVnInDSr/ZYkxW2Ff
         A5oFxH0vHWWHL0SZKnPTB/xYtNPFGIdqnbfjkkgewv/87igx+97O11o91v9XdLRvuCKY
         XIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zh9gE0+un/2IOlNp/KF8D2+pFHOEto5n7nDYfrHflbA=;
        b=Hjprc/uFS4KSG4t1NQYNa02eBRKG5muWQ6WYbJNKPTaacHhWfBoR19oFjqzjdrPRjb
         3XNUhAkhbgZ/2gI36ykbfxViR3BNBj70KFgNJter+0QRBvV5arn6vVwpI+W1rDfEKI9S
         IkUtFVv9CUpuPGU5CAPnb7oiJAk72V7pusbQjUc4pLExFtIaFb2FlMOFDJPDWEnwp6p7
         eCWjS66qefMN7LJGntjo0RO6zP9yZt6cpiXYs5R3xgwu5ixjepH6Z+OcymlGM98UGUxp
         Xpf+2IVx4gMr6Xaq6Ii6JWwQALh1BBSSUDZaBcSWHV30rE00DEzlfp8kqxp4Mj4BVKKq
         T9vw==
X-Gm-Message-State: AOAM533uj4k1bKhVhYCka1swe074fIliSXXZkAvAIkIO/i4yUUs5OJZZ
        6cTLASP318DCajMjJoNwRJM=
X-Google-Smtp-Source: ABdhPJxOcAmftdMZeo8/vOWSTfgUjA2WhjhYPG1RozCR/KEfEEJTdLR6Y+zxO8RJ4AM6q72xnndK9A==
X-Received: by 2002:a05:6a00:844:b0:49f:dbe4:b911 with SMTP id q4-20020a056a00084400b0049fdbe4b911mr213450pfk.6.1636382932660;
        Mon, 08 Nov 2021 06:48:52 -0800 (PST)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id h3sm16868369pjz.43.2021.11.08.06.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 06:48:52 -0800 (PST)
Message-ID: <d5f00baaf993d28423bd37bf3f44ea43f226b6a6.camel@gmail.com>
Subject: Re: [PATCH 02/17] media: atomisp: pci: fix punit_ddr_dvfs_enable()
 argument for mrfld_power up case
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
        Alan <alan@linux.intel.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date:   Mon, 08 Nov 2021 23:48:42 +0900
In-Reply-To: <20211102112634.GB2794@kadam>
References: <20211017161958.44351-1-kitakar@gmail.com>
         <20211017161958.44351-3-kitakar@gmail.com> <20211102112634.GB2794@kadam>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-11-02 at 14:26 +0300, Dan Carpenter wrote:
> On Mon, Oct 18, 2021 at 01:19:42AM +0900, Tsuchiya Yuto wrote:
> > When comparing with intel-aero atomisp [1], it looks like
> > punit_ddr_dvfs_enable() should take `false` as an argument on mrfld_power
> > up case.
> > 
> > Code from the intel-aero kernel [1]:
> > 
> >         int atomisp_mrfld_power_down(struct atomisp_device *isp)
> >         {
> >         [...]
> >         	/*WA:Enable DVFS*/
> >         	if (IS_CHT)
> >         		punit_ddr_dvfs_enable(true);
> > 
> >         int atomisp_mrfld_power_up(struct atomisp_device *isp)
> >         {
> >         [...]
> >         	/*WA for PUNIT, if DVFS enabled, ISP timeout observed*/
> >         	if (IS_CHT)
> >         		punit_ddr_dvfs_enable(false);
> > 
> > This patch fixes the inverted argument as per the intel-aero code, as
> > well as its comment. While here, fix space issues for comments in
> > atomisp_mrfld_power().
> > 
> > Note that it does not seem to be possible to unify the up/down cases for
> > punit_ddr_dvfs_enable(), i.e., we can't do something like the following:
> > 
> >         if (IS_CHT)
> >         	punit_ddr_dvfs_enable(!enable);
> > 
> > because according to the intel-aero code [1], the DVFS is disabled
> > before "writing 0x0 to ISPSSPM0 bit[1:0]" and the DVFS is enabled after
> > "writing 0x3 to ISPSSPM0 bit[1:0]".
> > 
> > [1] https://github.com/intel-aero/linux-kernel/blob/a1b673258feb915268377275130c5c5df0eafc82/drivers/media/pci/atomisp/atomisp_driver/atomisp_v4l2.c#L431-L514
> > 
> > Fixes: 0f441fd70b1e ("media: atomisp: simplify the power down/up code")
> > Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
> > ---
> >  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > index 0511c454e769..f5362554638e 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > @@ -711,15 +711,15 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
> >  
> >  	dev_dbg(isp->dev, "IUNIT power-%s.\n", enable ? "on" : "off");
> >  
> > -	/*WA:Enable DVFS*/
> > +	/* WA for PUNIT, if DVFS enabled, ISP timeout observed */
> >  	if (IS_CHT && enable)
> > -		punit_ddr_dvfs_enable(true);
> > +		punit_ddr_dvfs_enable(false);
> >  
> >  	/*
> >  	 * FIXME:WA for ECS28A, with this sleep, CTS
> >  	 * android.hardware.camera2.cts.CameraDeviceTest#testCameraDeviceAbort
> >  	 * PASS, no impact on other platforms
> > -	*/
> > +	 */
>         ^^^
> 
> >  	if (IS_BYT && enable)
> >  		msleep(10);
> >  
> > @@ -727,7 +727,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
> >  	iosf_mbi_modify(BT_MBI_UNIT_PMC, MBI_REG_READ, MRFLD_ISPSSPM0,
> >  			val, MRFLD_ISPSSPM0_ISPSSC_MASK);
> >  
> > -	/*WA:Enable DVFS*/
> > +	/* WA:Enable DVFS */
>         ^^^^^^^^^^^^^^^^^^^
> These two white space changes are unrelated.  Please do them in a
> separate patch.

Thank you for the review :-)

I thought these space fixes were too trivial for a separate patch, so
I made the fix while at it. I have no strong reason not to separate the
space fix. I'll do so in v2.

Regards,
Tsuchiya Yuto

