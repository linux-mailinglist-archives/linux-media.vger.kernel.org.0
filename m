Return-Path: <linux-media+bounces-3188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D045F822B0F
	for <lists+linux-media@lfdr.de>; Wed,  3 Jan 2024 11:12:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AD3DB22C5A
	for <lists+linux-media@lfdr.de>; Wed,  3 Jan 2024 10:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1769F18AF6;
	Wed,  3 Jan 2024 10:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lvPu8raB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634C618653
	for <linux-media@vger.kernel.org>; Wed,  3 Jan 2024 10:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dbe78430946so1818023276.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jan 2024 02:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704276717; x=1704881517; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PtpNPR2Ppv9oShH1PIo9qMmaypsTJ3RN+rG3DHT7G5I=;
        b=lvPu8raB9OXaH9Rq2HLA+rH++8rvLT6marCexYl1nQfm3mgVlb9GxPHOC4u59vajdf
         jwdCPCiu5XJlAoKE7vUcOw1MfjTlEAE0B3TYq8DP7aePJovek9QucTpmas1o49IjTLie
         1G0R51E9yfGwuQvO74eg3o8usKAhPE4VuP9zj2Iqsy1cF+hWuBsSgc5sn4KdKwaAdCTm
         +rurQjaoNhnN2t0NlfvE/7wjIclFRsHRVZI+HPlag+VA/NCHUjz194j4W6kH1ZSdnWUt
         MkhbgzvLzo4R2ZHaUVByd/Ee4VhJFyFYetW7r3m3ks04y6Tbig8Y7THrssophOd9QdoG
         nyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704276717; x=1704881517;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtpNPR2Ppv9oShH1PIo9qMmaypsTJ3RN+rG3DHT7G5I=;
        b=OB9avYFroTvK0dddYw5eMWQNprq1O5Cp1BNbE4uPeeYX+5zH+xGnXQugOtkdGAC5eK
         aD37V+eSSAjTRjMoJLhs3s7sjktPWRcCWOTUn0Bd7lvMQDZ3lEZmJc6jQ9QZKn/Hw+/z
         vUiQldFpoEj/0aYkb2PGVdlc+5v0njBvA+Cq9wZGvSXmnELJES3L+ilG9dPt0g6dqS9n
         EFmAGuOX+t7/Kok6XgqMtL5ViToPWy9tUMjcZBzoM3smlbVm6qIA92s7R8c/4yE/h7AZ
         Lk1cWPOuMifK0wGosBMkBB7g/ydyfKivddvOv/d28hvxlvNoBnUtgeCf94UauaWAaYQ5
         Ls6Q==
X-Gm-Message-State: AOJu0YxIicqo/xPALrYdNU8ayxZmdnkxDPyCDC4BCD2Yrc3FEs1L8sP6
	Cy/zc1ccicN9MeBcxfEx8nwdm/u/V8/KEsJegHfvp8NxukGntQ==
X-Google-Smtp-Source: AGHT+IF2XO36CiELCMwjscZCQ6v87hxA4fvw2qOPmqzgOjU5sNMJ0Lpcxm/J0S19SL0ftsJUFsetKsKZoTzl5VNNJmw=
X-Received: by 2002:a25:ab44:0:b0:dbc:ad34:43a1 with SMTP id
 u62-20020a25ab44000000b00dbcad3443a1mr8805456ybi.112.1704276717219; Wed, 03
 Jan 2024 02:11:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231228114157.104822-1-ulf.hansson@linaro.org>
 <20231228114157.104822-4-ulf.hansson@linaro.org> <ZZRY4rMjjkIsG3Ef@p14s>
In-Reply-To: <ZZRY4rMjjkIsG3Ef@p14s>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 3 Jan 2024 11:11:19 +0100
Message-ID: <CAPDyKFqgw_my76dicP9wuQAmF=kF=v5wGwxEF05wTQHdSvfuCA@mail.gmail.com>
Subject: Re: [PATCH 3/5] remoteproc: imx_rproc: Convert to dev_pm_domain_attach|detach_list()
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, 
	Sudeep Holla <sudeep.holla@arm.com>, Kevin Hilman <khilman@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Nikunj Kela <nkela@quicinc.com>, Prasad Sodagudi <psodagud@quicinc.com>, 
	Stephan Gerhold <stephan@gerhold.net>, Ben Horgan <Ben.Horgan@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jan 2024 at 19:41, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>
> Hi Ulf,
>
> I'm in agreement with the modifications done to imx_rproc.c and imx_dsp_rproc.c.
> There is one thing I am ambivalent on, please see below.
>
> On Thu, Dec 28, 2023 at 12:41:55PM +0100, Ulf Hansson wrote:
> > Let's avoid the boilerplate code to manage the multiple PM domain case, by
> > converting into using dev_pm_domain_attach|detach_list().
> >
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Cc: Bjorn Andersson <andersson@kernel.org>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: <linux-remoteproc@vger.kernel.org>
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 73 +++++-----------------------------
> >  1 file changed, 9 insertions(+), 64 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index 8bb293b9f327..3161f14442bc 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -92,7 +92,6 @@ struct imx_rproc_mem {
> >
> >  static int imx_rproc_xtr_mbox_init(struct rproc *rproc);
> >  static void imx_rproc_free_mbox(struct rproc *rproc);
> > -static int imx_rproc_detach_pd(struct rproc *rproc);
> >
> >  struct imx_rproc {
> >       struct device                   *dev;
> > @@ -113,10 +112,8 @@ struct imx_rproc {
> >       u32                             rproc_pt;       /* partition id */
> >       u32                             rsrc_id;        /* resource id */
> >       u32                             entry;          /* cpu start address */
> > -     int                             num_pd;
> >       u32                             core_index;
> > -     struct device                   **pd_dev;
> > -     struct device_link              **pd_dev_link;
> > +     struct dev_pm_domain_list       *pd_list;
> >  };
> >
> >  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> > @@ -853,7 +850,7 @@ static void imx_rproc_put_scu(struct rproc *rproc)
> >               return;
> >
> >       if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
> > -             imx_rproc_detach_pd(rproc);
> > +             dev_pm_domain_detach_list(priv->pd_list);
> >               return;
> >       }
> >
> > @@ -880,72 +877,20 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> >  {
> >       struct device *dev = priv->dev;
> > -     int ret, i;
> > -
> > -     /*
> > -      * If there is only one power-domain entry, the platform driver framework
> > -      * will handle it, no need handle it in this driver.
> > -      */
> > -     priv->num_pd = of_count_phandle_with_args(dev->of_node, "power-domains",
> > -                                               "#power-domain-cells");
> > -     if (priv->num_pd <= 1)
> > -             return 0;
>
> In function dev_pm_domain_attach_list(), this condition is "<= 0" rather than
> "<= 1".  As such the association between the device and power domain will be
> done twice when there is a single power domain, i.e once by the core and once in
> dev_pm_domain_attach_list().
>
> I am assuming the runtime PM subsystem is smart enough to deal with this kind of
> situation but would like a confirmation.

Thanks for reviewing!

To cover the the single PM domain case, imx_rproc_attach_pd() is
returning 0 when dev->pm_domain has been assigned. Moreover,
dev_pm_domain_attach_list() doesn't allow attaching in the single PM
domain case, as it returns -EEXIST if "dev->pm_domain" is already
assigned.

Did that make sense to you?

[...]

Kind regards
Uffe

