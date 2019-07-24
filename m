Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C72C67239B
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 03:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbfGXBXx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 21:23:53 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39232 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727398AbfGXBXx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 21:23:53 -0400
Received: by mail-ed1-f65.google.com with SMTP id m10so45599588edv.6;
        Tue, 23 Jul 2019 18:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zuqsC8D078GkOiUiVJHaHgojUFKFIMsPVDPGEDjw6Gc=;
        b=UotzW2Kd9m6siO8z3lHzaihgWCtUhzH7aiBLbvkRaqJ3vVk+Yga+MFmvICnBqcAkxP
         rZAQ63GXEPIxiJ/UIfS8nFecL/2ESqdkOsHCuNAIhb2xKiPO9ohJ11JfKeD+umIYY8TG
         p+Ruq7NtG/3OsmCsOjTqya3t1fHy/4BtLlW5UjNZmnr58kSM7TAStpsyjJFCodu0abPs
         zHpxNbNeHCUw5TzBkbfzL5dZ6mIUns8v9D40TqUus//8M/QSUbXNFEX/JQicJdPCuHau
         xs21m38+mBh5BfSut8Db4HX1BHbHV6J8rpX/WYuqt4NR6EzzpWTUr97z1+X3T1DWe5OD
         i1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zuqsC8D078GkOiUiVJHaHgojUFKFIMsPVDPGEDjw6Gc=;
        b=K1u5OkhXV9v9HXa50ylTbjwhbo1O5zNAMb3q53AM6WBWYACzMdbr5t6r4fM0kxJh8B
         TGgYRzTtAce0MQbfMZsIAAKUho7GP+q/UlN0TwyyB2LIGaOklFIpkoG0f+YfO7gE70kt
         HAqvjH7XS3ZpbdCQ1DsMsueFPf1G/rYWNE4n7QJbOgpt7g41Wa0B3Mrcc1ircyPnCftz
         nqwPBnDpqUD/XRvToRt/r3OaJ9DCseX8FIziIO2HLWz3xNC2Uv+V/9Y49Sl3Pl8xZcEi
         V+bsv/iRZwXo3nyAe45ma6dOeNSHNSWY/peTyr32ZKKR1jKJ20oqE+CPG6MrQo65CmWZ
         bksw==
X-Gm-Message-State: APjAAAV7bbzBYwGyJZd9QK2G3/xCLlS5vKRZzBgrAPPQ0rZ7VKdVaLm4
        e3hPTKfdeHHALiFvfGZhXNenIXNgtbho30lwAxk=
X-Google-Smtp-Source: APXvYqwqR8mP9GiqwkFNK7mhlswfVp+zJyF0d6cdnRTmdrDcazdouyw5ok7tlT6CL1Pz9TotmJG7hXMlmosmnecHg2Q=
X-Received: by 2002:a05:6402:896:: with SMTP id e22mr64968394edy.202.1563931431457;
 Tue, 23 Jul 2019 18:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190723115014.18537-1-hslester96@gmail.com> <EE45BB6704246A4E914B70E8B61FB42A15C77041@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <EE45BB6704246A4E914B70E8B61FB42A15C77041@SHSMSX104.ccr.corp.intel.com>
From:   Chuhong Yuan <hslester96@gmail.com>
Date:   Wed, 24 Jul 2019 09:23:41 +0800
Message-ID: <CANhBUQ1uODBgoiHk8nrMrtdJ2E-C70PgRJm7zLkWGoQDovKpzg@mail.gmail.com>
Subject: Re: [PATCH] media: pci: Use dev_get_drvdata where possible
To:     "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     "Zhi, Yong" <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Akihiro Tsukada <tskd08@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 23, 2019 at 10:39 PM Cao, Bingbu <bingbu.cao@intel.com> wrote:
>
>
>
> ________________________
> BRs,
> Bingbu Cao
>
>
> -----Original Message-----
> From: Chuhong Yuan <hslester96@gmail.com>
> Sent: Tuesday, July 23, 2019 7:50 PM
> Cc: Zhi, Yong <yong.zhi@intel.com>; Sakari Ailus <sakari.ailus@linux.inte=
l.com>; Cao, Bingbu <bingbu.cao@intel.com>; Mauro Carvalho Chehab <mchehab@=
kernel.org>; Akihiro Tsukada <tskd08@gmail.com>; linux-media@vger.kernel.or=
g; linux-kernel@vger.kernel.org; Chuhong Yuan <hslester96@gmail.com>
> Subject: [PATCH] media: pci: Use dev_get_drvdata where possible
>
> Instead of using to_pci_dev + pci_get_drvdata, use dev_get_drvdata to mak=
e code simpler.
>
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 3 +--
>  drivers/media/pci/pt1/pt1.c              | 6 ++----
>  drivers/media/pci/pt3/pt3.c              | 6 ++----
>  3 files changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci=
/intel/ipu3/ipu3-cio2.c
> index c1d133e17e4b..50a34bcd4d14 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -2000,8 +2000,7 @@ static int __maybe_unused cio2_suspend(struct devic=
e *dev)
>
>  static int __maybe_unused cio2_resume(struct device *dev)  {
> -       struct pci_dev *pci_dev =3D to_pci_dev(dev);
> -       struct cio2_device *cio2 =3D pci_get_drvdata(pci_dev);
> +       struct cio2_device *cio2 =3D dev_get_drvdata(dev);
>
> Thanks for your patch.
> I think using pci_get_drvdata() here mainly make a pair with the pci_set_=
drvdata() in probe.

Thanks for your reply.
I will change pci_set_drvdata() to dev_set_drvdata() in the next
version to keep their consistency.

>
>         int r =3D 0;
>         struct cio2_queue *q =3D cio2->cur_queue;
>
> diff --git a/drivers/media/pci/pt1/pt1.c b/drivers/media/pci/pt1/pt1.c in=
dex e51c80bc4646..72b191cfeb54 100644
> --- a/drivers/media/pci/pt1/pt1.c
> +++ b/drivers/media/pci/pt1/pt1.c
> @@ -1217,8 +1217,7 @@ static void pt1_i2c_init(struct pt1 *pt1)
>
>  static int pt1_suspend(struct device *dev)  {
> -       struct pci_dev *pdev =3D to_pci_dev(dev);
> -       struct pt1 *pt1 =3D pci_get_drvdata(pdev);
> +       struct pt1 *pt1 =3D dev_get_drvdata(dev);
>
>         pt1_init_streams(pt1);
>         pt1_disable_ram(pt1);
> @@ -1230,8 +1229,7 @@ static int pt1_suspend(struct device *dev)
>
>  static int pt1_resume(struct device *dev)  {
> -       struct pci_dev *pdev =3D to_pci_dev(dev);
> -       struct pt1 *pt1 =3D pci_get_drvdata(pdev);
> +       struct pt1 *pt1 =3D dev_get_drvdata(dev);
>         int ret;
>         int i;
>
> diff --git a/drivers/media/pci/pt3/pt3.c b/drivers/media/pci/pt3/pt3.c in=
dex 7a7afae4c84c..c0bc86793355 100644
> --- a/drivers/media/pci/pt3/pt3.c
> +++ b/drivers/media/pci/pt3/pt3.c
> @@ -626,8 +626,7 @@ static void pt3_cleanup_adapter(struct pt3_board *pt3=
, int index)
>
>  static int pt3_suspend(struct device *dev)  {
> -       struct pci_dev *pdev =3D to_pci_dev(dev);
> -       struct pt3_board *pt3 =3D pci_get_drvdata(pdev);
> +       struct pt3_board *pt3 =3D dev_get_drvdata(dev);
>         int i;
>         struct pt3_adapter *adap;
>
> @@ -646,8 +645,7 @@ static int pt3_suspend(struct device *dev)
>
>  static int pt3_resume(struct device *dev)  {
> -       struct pci_dev *pdev =3D to_pci_dev(dev);
> -       struct pt3_board *pt3 =3D pci_get_drvdata(pdev);
> +       struct pt3_board *pt3 =3D dev_get_drvdata(dev);
>         int i, ret;
>         struct pt3_adapter *adap;
>
> --
> 2.20.1
>
