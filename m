Return-Path: <linux-media+bounces-4065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9623A8381CA
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 03:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 471F928DBC7
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 02:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F356B21340;
	Tue, 23 Jan 2024 01:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BhNEWLHh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA53376E6
	for <linux-media@vger.kernel.org>; Tue, 23 Jan 2024 01:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705973274; cv=none; b=SOTT93aDovCfGY+iPuhRhGH0O73a7mmEGTVeZripB0u71ufwaFL2pRVClrJTErkk4/MKUYemkneztt8bMq5QRQiiRH1+lvJ8aUdnORP+uMGchqDY4M4bUS5GTMpkXytdto0KYT3C/HQSCfJdeppAXthoU1ZwxRfwvNIrtfjnbEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705973274; c=relaxed/simple;
	bh=xd8+ffjWqKHB0l8qHLvIP4GiBxkGfh3x3os0vr4pLPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGxLrH+uLVsHm+1bpzTpEXg5ROVzXg5SQKJPIqzLRwTGRXtRtDhG5H28hYYAVaxxeTJ9ydhdvqRqYg/H5GP+I/cxNs38NXs9E5tToNzygNn/OV3IfpMdgQd6xHmWxgIo7h4p2tQFcECnwyD2U312XhipRCmqqb7ovFYMEc57MDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BhNEWLHh; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-290b37bb7deso899510a91.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jan 2024 17:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705973271; x=1706578071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E3bREx2VvtAxUcOb45LlRTMNit+G8LlhZSP4QTXnOMQ=;
        b=BhNEWLHhVBvzlrOgpYJ7ALI0+g4QzCf9o9ITTpunQjpZ2gRNtVpvLvT6FLi0szcVCy
         88huTKHeBweW6nPGEORd77E1zNVpZ4evMuu7F4nqksAFM0ipVBbetkcm6mqOtN5yltSm
         l8Gr5maBycjo/txcet5rRz1xKDTt8LUYDXc01Imj8DaK5XrWg+qWIipji9uQmGOLanWD
         FeSe+Ogk2K9NMKIzGomjYdDaOB+2p2AP3VrHmdaA4RmRXaXOdex6nxZB3facrem3+TAk
         FGT0VfjzTxHq5+H76HmrmBqvoX66xKH4Jpwti+Vyu86oDI2ETCpaQbE+hsU4Se1v7P04
         FYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705973271; x=1706578071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3bREx2VvtAxUcOb45LlRTMNit+G8LlhZSP4QTXnOMQ=;
        b=fiHj5Op6HqisdWr9ddlincOUYppPUQEuQ8dXqJPpzuS9WgBAtonTpZztXO3hp0JPq/
         dnFHKjEWLsLsZx2XS0K7O37rWm9P4mBU70qKiASPG06LeOE9rDD94BmWCiERvS42D+e8
         iqXNvvO9GvsQK9YeUAOM9lWOsFba6eQOi6RatDiG7iockxuuR3cM4ln98UrLWCRXNh0K
         +4RHJH5wEq+s9SgbjY4qvJVew/PDXQ7tH0f8M0kSQKjkAeD2BQRZ27PFXMOIln30Z5Ew
         QWFhYDu91MczSDDw1xeLCdXrhH7nEHpXHL+iL1krl9RQTcy+MWGy90/zikCLaevT2pre
         E0vg==
X-Gm-Message-State: AOJu0YzpOH6r6nv4zYOB5v+WBxlF7/afg3qAQdgWBhKLcQxL4gnpe41y
	7LAjiRZVQ6QXcPr/SLvhQd/pfgC4dEoVtyX4vaMkpg4WDjVkp5dQEWkx9rxUtBA=
X-Google-Smtp-Source: AGHT+IG6pm9bj22UhiTj6Cxqz71zjTlKKL+I94bUy1n5HHp1Y86JfAGyKqD0drTMp6xAzHjCdvhxGA==
X-Received: by 2002:a17:90b:606:b0:28e:2784:9827 with SMTP id gb6-20020a17090b060600b0028e27849827mr2581418pjb.17.1705973271519;
        Mon, 22 Jan 2024 17:27:51 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:b26d:65ee:f38a:4547])
        by smtp.gmail.com with ESMTPSA id rr12-20020a17090b2b4c00b0028d9b5d41edsm10283532pjb.38.2024.01.22.17.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 17:27:51 -0800 (PST)
Date: Mon, 22 Jan 2024 18:27:48 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Kevin Hilman <khilman@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Nikunj Kela <nkela@quicinc.com>,
	Prasad Sodagudi <psodagud@quicinc.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Ben Horgan <Ben.Horgan@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-media@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v2 3/5] remoteproc: imx_rproc: Convert to
 dev_pm_domain_attach|detach_list()
Message-ID: <Za8WFHxVQZ44fJJn@p14s>
References: <20240105160103.183092-1-ulf.hansson@linaro.org>
 <20240105160103.183092-4-ulf.hansson@linaro.org>
 <87801f3e-b7ce-46ba-9856-1321635a11b5@nxp.com>
 <CANLsYkwtNa_-t0f5rhTh5mtF72urKNyqWk0_qfbBwSCQK_6eOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkwtNa_-t0f5rhTh5mtF72urKNyqWk0_qfbBwSCQK_6eOg@mail.gmail.com>

On Mon, Jan 22, 2024 at 01:02:08PM -0700, Mathieu Poirier wrote:
> On Mon, 22 Jan 2024 at 10:51, Iuliana Prodan <iuliana.prodan@nxp.com> wrote:
> >
> > On 1/5/2024 6:01 PM, Ulf Hansson wrote:
> > > Let's avoid the boilerplate code to manage the multiple PM domain case, by
> > > converting into using dev_pm_domain_attach|detach_list().
> > >
> > > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > Cc: Bjorn Andersson <andersson@kernel.org>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: Iuliana Prodan <iuliana.prodan@nxp.com>
> > > Cc: Daniel Baluta <daniel.baluta@nxp.com>
> > > Cc: <linux-remoteproc@vger.kernel.org>
> > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > ---
> > >
> > > Changes in v2:
> > >       - None.
> > >
> > > Iuliana/Daniel I am ccing you to request help with test/review of this change.
> > > Note that, you will need patch 1/5 in the series too, to be able to test this.
> > >
> > > Kind regards
> > > Ulf Hansson
> >
> > Tested-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> > Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> >
> 
> Thanks for the leg-work on this.  I'll pick this up in rc1 later this week.

Looking at the other files in this set, Ulf of perhaps Bjorn should take this
set.

for:

drivers/remoteproc/imx_rproc.c
drivers/remoteproc/imx_dsp_rproc.c

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> > Iulia
> >
> > > ---
> > >   drivers/remoteproc/imx_rproc.c | 73 +++++-----------------------------
> > >   1 file changed, 9 insertions(+), 64 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > index 8bb293b9f327..3161f14442bc 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -92,7 +92,6 @@ struct imx_rproc_mem {
> > >
> > >   static int imx_rproc_xtr_mbox_init(struct rproc *rproc);
> > >   static void imx_rproc_free_mbox(struct rproc *rproc);
> > > -static int imx_rproc_detach_pd(struct rproc *rproc);
> > >
> > >   struct imx_rproc {
> > >       struct device                   *dev;
> > > @@ -113,10 +112,8 @@ struct imx_rproc {
> > >       u32                             rproc_pt;       /* partition id */
> > >       u32                             rsrc_id;        /* resource id */
> > >       u32                             entry;          /* cpu start address */
> > > -     int                             num_pd;
> > >       u32                             core_index;
> > > -     struct device                   **pd_dev;
> > > -     struct device_link              **pd_dev_link;
> > > +     struct dev_pm_domain_list       *pd_list;
> > >   };
> > >
> > >   static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> > > @@ -853,7 +850,7 @@ static void imx_rproc_put_scu(struct rproc *rproc)
> > >               return;
> > >
> > >       if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
> > > -             imx_rproc_detach_pd(rproc);
> > > +             dev_pm_domain_detach_list(priv->pd_list);
> > >               return;
> > >       }
> > >
> > > @@ -880,72 +877,20 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> > >   static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > >   {
> > >       struct device *dev = priv->dev;
> > > -     int ret, i;
> > > -
> > > -     /*
> > > -      * If there is only one power-domain entry, the platform driver framework
> > > -      * will handle it, no need handle it in this driver.
> > > -      */
> > > -     priv->num_pd = of_count_phandle_with_args(dev->of_node, "power-domains",
> > > -                                               "#power-domain-cells");
> > > -     if (priv->num_pd <= 1)
> > > -             return 0;
> > > -
> > > -     priv->pd_dev = devm_kmalloc_array(dev, priv->num_pd, sizeof(*priv->pd_dev), GFP_KERNEL);
> > > -     if (!priv->pd_dev)
> > > -             return -ENOMEM;
> > > -
> > > -     priv->pd_dev_link = devm_kmalloc_array(dev, priv->num_pd, sizeof(*priv->pd_dev_link),
> > > -                                            GFP_KERNEL);
> > > -
> > > -     if (!priv->pd_dev_link)
> > > -             return -ENOMEM;
> > > -
> > > -     for (i = 0; i < priv->num_pd; i++) {
> > > -             priv->pd_dev[i] = dev_pm_domain_attach_by_id(dev, i);
> > > -             if (IS_ERR(priv->pd_dev[i])) {
> > > -                     ret = PTR_ERR(priv->pd_dev[i]);
> > > -                     goto detach_pd;
> > > -             }
> > > -
> > > -             priv->pd_dev_link[i] = device_link_add(dev, priv->pd_dev[i], DL_FLAG_STATELESS |
> > > -                                                    DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
> > > -             if (!priv->pd_dev_link[i]) {
> > > -                     dev_pm_domain_detach(priv->pd_dev[i], false);
> > > -                     ret = -EINVAL;
> > > -                     goto detach_pd;
> > > -             }
> > > -     }
> > > -
> > > -     return 0;
> > > -
> > > -detach_pd:
> > > -     while (--i >= 0) {
> > > -             device_link_del(priv->pd_dev_link[i]);
> > > -             dev_pm_domain_detach(priv->pd_dev[i], false);
> > > -     }
> > > -
> > > -     return ret;
> > > -}
> > > -
> > > -static int imx_rproc_detach_pd(struct rproc *rproc)
> > > -{
> > > -     struct imx_rproc *priv = rproc->priv;
> > > -     int i;
> > > +     int ret;
> > > +     struct dev_pm_domain_attach_data pd_data = {
> > > +             .pd_flags = PD_FLAG_DEV_LINK_ON,
> > > +     };
> > >
> > >       /*
> > >        * If there is only one power-domain entry, the platform driver framework
> > >        * will handle it, no need handle it in this driver.
> > >        */
> > > -     if (priv->num_pd <= 1)
> > > +     if (dev->pm_domain)
> > >               return 0;
> > >
> > > -     for (i = 0; i < priv->num_pd; i++) {
> > > -             device_link_del(priv->pd_dev_link[i]);
> > > -             dev_pm_domain_detach(priv->pd_dev[i], false);
> > > -     }
> > > -
> > > -     return 0;
> > > +     ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > > +     return ret < 0 ? ret : 0;
> > >   }
> > >
> > >   static int imx_rproc_detect_mode(struct imx_rproc *priv)

