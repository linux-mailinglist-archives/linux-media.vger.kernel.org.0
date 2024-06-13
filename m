Return-Path: <linux-media+bounces-13174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B058F9068C0
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 11:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB197B23FC9
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 09:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C4A13F438;
	Thu, 13 Jun 2024 09:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="2tZRMBmt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD1013F452
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 09:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718271005; cv=none; b=M2pDl8nuooHCCYgSxqcgViO+Tw/DhICp1B1mGCW+vUnOoW2S6NOa3zQOS1o5BBvNlEZsQesXokox7/WnYoLVKXq57yXwthOZI0xJ/+rKuEBEd09YXQnrYEJfetU0PbuA6C/Gnlb9dRiQi5dgRGyh5aW2opxmE9SuZo2w4bvy2Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718271005; c=relaxed/simple;
	bh=r70M0JfsYwTJ3NX7KJwbL08Y8oQ3NMtqgodl6EYlEYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DHTjas39E5UDD51q1K7TK3gMM/NFu9sZgNp1Vls7Z0yZ20xytvfhLAVqlCv4TucNgcDHBhvO+dCuXdH09gdw5AZakHghCofa6mGvul3Kwu/mKeR9Ec/VoVG4EEEWSUC7sJjR54Uok2dQWRxpmgMle+are9zNeywfwts97aLrBV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=2tZRMBmt; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6b06bedc5d1so4989226d6.0
        for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 02:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1718271003; x=1718875803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5M3ELKqqsvIZfzOpsu+gAgFZkgR2tBXp2Hwr3Ne0u3I=;
        b=2tZRMBmtyS/sMy5DahrXVexnJrsSbZEaGBuaf9no5PLZAopW+CqaM0ALoKiBcMjZTg
         mUMoNEVtzLgPMxaBmIDgRjWP9KXjGl6VkYmWLZ+BTVU7hA7UM9bg3XOUOjBiYwsxsmO9
         MC5EUxnKpm0HsjjPVjWMNWNKGT39728nCD2alMRk3ekiwkqob50tAnkCqMZ1pmPcuoPT
         fTvfVHgDPAmJ6sr3bxIgXimxEQJ9b+2PamYE/1jYFiBXUMRoVTXy4lIATq6jg/kjlf94
         F7zKXG86xTVACfXiw6DEQt3N7UO3gWmQRynyToXawQfkvnmNJcDelB9LidyAj6BGlTEo
         aX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718271003; x=1718875803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5M3ELKqqsvIZfzOpsu+gAgFZkgR2tBXp2Hwr3Ne0u3I=;
        b=gcrrQV/zz+WFE4Y1nd+0Y3bcdhiiJF+Q8IWO3gAIBRWYhBeb2znAutUsMYcgvB8yfI
         4fS9A+RmDaLzt3IuBwLixp0iONiokR+4QU9ScvI3sTjghBG7+xHEFzxVV91roQ81gPb1
         Nur/wz3di/y47+/sqCMl+UD3cAbxdzFpO5RJb0L9ar5UY9wnm2FA8vuUIyyE7tr4YD71
         sMHQmPHK85a1BnMASVvl+rImijtNhJRRPddoh+GeUEUlO398Qb5L+z9rR0Ra/23YkMpA
         pczw4TywOfFKO1m5dqy/+sEcEu+VkN/nKR7qONupHwI6tC58DTiTA2kycDqP6UBQsbOU
         vChg==
X-Forwarded-Encrypted: i=1; AJvYcCVYTx+SXzEe/v6cPNhwthy2jYDiKMe0mwqiMG8QXg9MrGTXVwSxp3Jyz5Kd4DNIC/59mfQynpMvfEadBrXwFORw8yXhBOViMlHBJio=
X-Gm-Message-State: AOJu0YwF1oM6e2T9sDWPwxgHxbc7qYm7lGPVaLlHgmFbUfy+xp4B6RVy
	tyHRMYDhbfoQUbbE7XvEw/Yz3RrRsbvQ5sEHdu+vlFr9JytDeGRVvxwxm/cTbnU=
X-Google-Smtp-Source: AGHT+IGmSpq9YMGFtxsPUpIW0o7k9pJEniFC6iQvWdkCgTN8WIHucjZE3FLxQmGuHABAtJNFPBU+Rw==
X-Received: by 2002:a05:6214:4487:b0:6b0:90b4:1ca9 with SMTP id 6a1803df08f44-6b191778e7cmr46679026d6.6.1718271002972;
        Thu, 13 Jun 2024 02:30:02 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5c20f53sm4888386d6.52.2024.06.13.02.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 02:30:02 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-797f222c9f9so51098585a.3;
        Thu, 13 Jun 2024 02:30:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1BEnmaqWdxtnW46RtJ0Bb1nQK7kjbEkpYcYIPO+RMClQ9l+TeHajoxXyPJDGtFg15lcsxx4yyEvNx8+oRI5wc6k3/fv+iIRG81YDN0Q6CwJ4D6v5f4DrhXpm2Xce54O2SmKUR3dzZBZdBEKOvQQT22Ax8CCV9VNC2Hn94lmmd14vLL7K1
X-Received: by 2002:a05:6902:2207:b0:dfe:6002:683 with SMTP id
 3f1490d57ef6-dfe67063c46mr4743823276.32.1718270658168; Thu, 13 Jun 2024
 02:24:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-2-060e48eea250@tomeuvizoso.net> <ffviz6ak6qsn2reg5y35aerzy7wxfx6fzix6xjyminbhfcguus@clszdjakdcjd>
In-Reply-To: <ffviz6ak6qsn2reg5y35aerzy7wxfx6fzix6xjyminbhfcguus@clszdjakdcjd>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 13 Jun 2024 11:24:06 +0200
X-Gmail-Original-Message-ID: <CAAObsKCx+r5UuESnrPem1Rb1-BF4i8FVwu6uozWhABOWoq+M4Q@mail.gmail.com>
Message-ID: <CAAObsKCx+r5UuESnrPem1Rb1-BF4i8FVwu6uozWhABOWoq+M4Q@mail.gmail.com>
Subject: Re: [PATCH 2/9] iommu/rockchip: Attach multiple power domains
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Oded Gabbay <ogabbay@kernel.org>, Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 2:05=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Wed, Jun 12, 2024 at 03:52:55PM GMT, Tomeu Vizoso wrote:
> > IOMMUs with multiple base addresses can also have multiple power
> > domains.
> >
> > The base framework only takes care of a single power domain, as some
> > devices will need for these power domains to be powered on in a specifi=
c
> > order.
> >
> > Use a helper function to stablish links in the order in which they are
> > in the DT.
> >
> > This is needed by the IOMMU used by the NPU in the RK3588.
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
>
> To me it looks like this is multiple IOMMUs, which should each get
> their own node. I don't see a good reason for merging these
> together.

I have made quite a few attempts at splitting the IOMMUs and also the
cores, but I wasn't able to get things working stably. The TRM is
really scant about how the 4 IOMMU instances relate to each other, and
what the fourth one is for.

Given that the vendor driver treats them as a single IOMMU with four
instances and we don't have any information on them, I resigned myself
to just have them as a single device.

I would love to be proved wrong though and find a way fo getting
things stably as different devices so they can be powered on and off
as needed. We could save quite some code as well.

> I will still review this assuming there is one. That would require
> to first of all update the DT binding:
>
> Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
>
> 1. It does not allow using "power-domain-names" property
> 2. It limits the number of allowed power-domains to 1
> 3. It limits the number of allowed base addresses to 2
>
> Looking at the DT patch you also add more interrupts and clocks,
> which are also limited by the binding. You should see a bunch of
> warnings when you check the DTBS via 'make dtbs_check'

Oops, yeah, I was limiting dtbs_check with DT_SCHEMA_FILES, now I see
the errors.

> >  drivers/iommu/rockchip-iommu.c | 36 ++++++++++++++++++++++++++++++++++=
++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-io=
mmu.c
> > index f5629515bd78..673b0ebb6262 100644
> > --- a/drivers/iommu/rockchip-iommu.c
> > +++ b/drivers/iommu/rockchip-iommu.c
> > @@ -6,6 +6,8 @@
> >   *                   Daniel Kurtz <djkurtz@chromium.org>
> >   */
> >
> > +#include "linux/err.h"
> > +#include "linux/pm_domain.h"
> >  #include <linux/clk.h>
> >  #include <linux/compiler.h>
> >  #include <linux/delay.h>
> > @@ -115,6 +117,7 @@ struct rk_iommu {
> >       struct iommu_device iommu;
> >       struct list_head node; /* entry in rk_iommu_domain.iommus */
> >       struct iommu_domain *domain; /* domain to which iommu is attached=
 */
> > +     struct dev_pm_domain_list *pmdomains;
> >  };
> >
> >  struct rk_iommudata {
> > @@ -1186,6 +1189,7 @@ static int rk_iommu_probe(struct platform_device =
*pdev)
> >       struct resource *res;
> >       const struct rk_iommu_ops *ops;
> >       int num_res =3D pdev->num_resources;
> > +     int pm_domain_count;
> >       int err, i;
> >
> >       iommu =3D devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
> > @@ -1271,6 +1275,35 @@ static int rk_iommu_probe(struct platform_device=
 *pdev)
> >       if (!dma_dev)
> >               dma_dev =3D &pdev->dev;
> >
> > +     pm_domain_count =3D of_property_count_strings(iommu->dev->of_node=
, "power-domain-names");
>
> pm_domain_count =3D device_property_string_array_count(iommu->dev, "power=
-domain-names");
>
> When possible using device_property_ is prefered, since it allows
> reusing code for systems not using DT.
>
> > +     if (pm_domain_count > 0) {
> > +             const char **pm_domains =3D kvmalloc_array(pm_domain_coun=
t, sizeof(*pm_domains), GFP_KERNEL);
> > +             struct dev_pm_domain_attach_data pm_domain_data =3D {
> > +                     .pd_names =3D pm_domains,
> > +                     .num_pd_names =3D pm_domain_count,
> > +                     .pd_flags =3D PD_FLAG_DEV_LINK_ON,
> > +             };
> > +             int i;
> > +
> > +             if (!pm_domain_data.pd_names) {
> > +                     err =3D -ENOMEM;
> > +                     goto err_remove_sysfs;
> > +             }
> > +
> > +             for (i =3D 0; i < pm_domain_count; i++) {
> > +                     err =3D of_property_read_string_index(iommu->dev-=
>of_node, "power-domain-names", i, &pm_domains[i]);
> > +                     if (err) {
> > +                             kfree(pm_domains);
> > +                             goto err_remove_sysfs;
> > +                     }
> > +             }
>
> There is a helper to read a string array:
>
> err =3D device_property_read_string_array(iommu->dev, "power-domain-names=
", pm_domains, pm_domain_count);


Thanks for the review,

Tomeu

> -- Sebastian
>
> > +
> > +             err =3D dev_pm_domain_attach_list(iommu->dev, &pm_domain_=
data, &iommu->pmdomains);
> > +             kfree(pm_domains);
> > +             if (err < 0)
> > +                     goto err_remove_sysfs;
> > +     }
> > +
> >       pm_runtime_enable(dev);
> >
> >       for (i =3D 0; i < iommu->num_irq; i++) {
> > @@ -1292,6 +1325,7 @@ static int rk_iommu_probe(struct platform_device =
*pdev)
> >       return 0;
> >  err_pm_disable:
> >       pm_runtime_disable(dev);
> > +     dev_pm_domain_detach_list(iommu->pmdomains);
> >  err_remove_sysfs:
> >       iommu_device_sysfs_remove(&iommu->iommu);
> >  err_unprepare_clocks:
> > @@ -1310,6 +1344,8 @@ static void rk_iommu_shutdown(struct platform_dev=
ice *pdev)
> >               devm_free_irq(iommu->dev, irq, iommu);
> >       }
> >
> > +     dev_pm_domain_detach_list(iommu->pmdomains);
> > +
> >       pm_runtime_force_suspend(&pdev->dev);
> >  }
> >
> >
> > --
> > 2.45.2
> >
> >

