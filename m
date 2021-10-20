Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC85434C07
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 15:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhJTN2E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 09:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbhJTN2D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 09:28:03 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA38BC06161C;
        Wed, 20 Oct 2021 06:25:49 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id q2-20020a17090a2e0200b001a0fd4efd49so3807242pjd.1;
        Wed, 20 Oct 2021 06:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KD04hsmi0lgerCpXrek0NWCbVNI3Lu/Nr105uWRTo8c=;
        b=JXX65j3hX2NvMlynDH+nRMiKJKnN5UveBhRRhING9zBMpxapQoY7K6lmkEsfwoXcNE
         +1wr5fwA2lmJPifFvCPcxsWfmUqdIp41SkQn/KQzajtgqpm4++tkOjjyv8VCgnWd8xqk
         mVBv6xtmXQCdigbe32XYl/NPu30bCMIAOuewuQntcuhLQvJHb8l3F+WoLWF4woZGpN2o
         kK3+B4EdBIr8tb9tj6k1yPO/DC3fsBU62T6Z0KTsODb+oGjfLl+P5ouwsUuCAWfTYHUj
         KHpzg3DrrdGFNlVZ8m0EDYQhumuN49+1D7drhPy2NcIbmVmDX4J6rtBhyTwb/b3601s+
         BBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KD04hsmi0lgerCpXrek0NWCbVNI3Lu/Nr105uWRTo8c=;
        b=Jo4EaH4RWqszXiTjH05ZuBy2vOLj8G93CWB4lVX4KKeHm+naje5bVnuF5NHP62nyuZ
         HQef2YrP+aDZ37aotLP20Ble5eJGu3q4CGcJDCPcsq3q1MSjh9ECq+DwF8S56fLTkDwL
         aV/qQNoQgi5GhnkxE+BSJLnaveBKn5F79DakDRFwNIkGg8CW1wKrAQE5MsgH7zLdPAg1
         7B0mhvOUQ4NA0XCIMacs13LcM+BC6EqpxCn4et1Cz1ui2mLe1it+DQYdHzMblplBRIhv
         FTzgjqZZVT9dzCBvfeCEdOusnDvUkqkz775yrSkx33Iwl4TwNku5PzHZ2gKY8xtHho2d
         nrcg==
X-Gm-Message-State: AOAM533XluDNE/vdMDR+UmxPCizlLQlfvT5qgejIpHhDMKTfFbfUzbP0
        pJMNSazes9CLoXJo28Zh4Ag=
X-Google-Smtp-Source: ABdhPJzEi+qF735DLvHgQoE5spz6cr2+SraesD/tRcTWc4xIQmSNH+/QZzgW1zjdcZjiyfzfw4Npew==
X-Received: by 2002:a17:90b:4ad2:: with SMTP id mh18mr45250pjb.18.1634736349097;
        Wed, 20 Oct 2021 06:25:49 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id v9sm2556719pjc.55.2021.10.20.06.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 06:25:48 -0700 (PDT)
Message-ID: <721eda4c6b65a0c0da4b85e1b24bada769890816.camel@gmail.com>
Subject: Re: [PATCH 02/17] media: atomisp: pci: fix punit_ddr_dvfs_enable()
 argument for mrfld_power up case
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
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
Date:   Wed, 20 Oct 2021 22:25:43 +0900
In-Reply-To: <YW1Vj5jGybs8gXWr@smile.fi.intel.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
         <20211017161958.44351-3-kitakar@gmail.com>
         <YW1Vj5jGybs8gXWr@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2021-10-18 at 14:07 +0300, Andy Shevchenko wrote:
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
> 
> P-Unit

Thanks, I'll fix this next time I send.

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
> >  	if (IS_BYT && enable)
> >  		msleep(10);
> >  
> > @@ -727,7 +727,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
> >  	iosf_mbi_modify(BT_MBI_UNIT_PMC, MBI_REG_READ, MRFLD_ISPSSPM0,
> >  			val, MRFLD_ISPSSPM0_ISPSSC_MASK);
> >  
> > -	/*WA:Enable DVFS*/
> > +	/* WA:Enable DVFS */
> >  	if (IS_CHT && !enable)
> >  		punit_ddr_dvfs_enable(true);
> >  
> > -- 
> > 2.33.1
> > 
> > 
> 

