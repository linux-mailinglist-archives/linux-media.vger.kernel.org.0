Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC4936D2FF
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 09:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236453AbhD1HVf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 03:21:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:37128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229478AbhD1HVe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 03:21:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E426600D4;
        Wed, 28 Apr 2021 07:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619594450;
        bh=hj7LHzq35NS14XVvUmoBorUTi57+snt04nyX+mFSnxM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JRnEBUtcIFPUnNIwZD51/4+WmD6FX6YRXkQQ8RVyiUS+NIg2OHbUp1RRJ5nszgfB9
         XImoUbge/fhE+v+5u3hi8D7kiWDojgsTHZlyCytq2BPG6XgE1IdjFIiRGM/ByhQAqR
         z79MgsmPLRt0eQAy7r9fAYMX6zhWWZV7mZ8+TStWdRNbe/LkGVRYk+89qiJMlCeAs5
         ibSQmKbn+Hi1nTbW013iPP8vBKrxisB//QKYS5i7bisTCjZk8JIVli/GlaM9hHF5NK
         xeGbBB746UfNJayI0oIeQAqpcIgpZqfJEXSVu/mwa3SJ6VAycE6beNoChlJxqS++Cv
         5E2MD4FMXJkCw==
Date:   Wed, 28 Apr 2021 09:20:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 25/79] staging: media: vde: use
 pm_runtime_resume_and_get()
Message-ID: <20210428092043.380c9d4c@coco.lan>
In-Reply-To: <2e8bdea5-b2a7-df95-9d93-7c1f2df6158d@gmail.com>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
        <d7fb2d00224d37ba1c6c6e9b73609af95c886844.1619519080.git.mchehab+huawei@kernel.org>
        <2e8bdea5-b2a7-df95-9d93-7c1f2df6158d@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 27 Apr 2021 14:47:01 +0300
Dmitry Osipenko <digetx@gmail.com> escreveu:

> 27.04.2021 13:26, Mauro Carvalho Chehab =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > @@ -1088,8 +1090,9 @@ static int tegra_vde_remove(struct platform_devic=
e *pdev)
> >  {
> >  	struct tegra_vde *vde =3D platform_get_drvdata(pdev);
> >  	struct device *dev =3D &pdev->dev;
> > +	int ret;
> > =20
> > -	pm_runtime_get_sync(dev);
> > +	ret =3D pm_runtime_resume_and_get(dev); =20
>=20
> Should be cleaner to return error directly here, IMO.

I double-checked how drivers/base/platform.c deals with non-zero
returns at the .remove method:

	static int platform_remove(struct device *_dev)
	{
	        struct platform_driver *drv =3D to_platform_driver(_dev->driver);
	        struct platform_device *dev =3D to_platform_device(_dev);
=09
	        if (drv->remove) {
	                int ret =3D drv->remove(dev);
=09
	                if (ret)
	                        dev_warn(_dev, "remove callback returned a non-zer=
o value. This will be ignored.\n");
	        }
	        dev_pm_domain_detach(_dev, true);
=09
	        return 0;
	}

Basically, it will print a message but will ignore whatever happens
afterwards.

So, if the driver is changed to return an error there, it will leak
resources.

Thanks,
Mauro
