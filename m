Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B582CED69
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 12:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728214AbgLDLrU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 06:47:20 -0500
Received: from mga11.intel.com ([192.55.52.93]:58576 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727100AbgLDLrS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Dec 2020 06:47:18 -0500
IronPort-SDR: 6O3PvRfDTG3ErnCOeapQceG0wI9dCTLys2MAn4LnuSnfP83fBmtQgj0EbmaKk6ltubhl4j2thT
 obkKr8zWry1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="169857506"
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; 
   d="scan'208";a="169857506"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2020 03:45:37 -0800
IronPort-SDR: slZITTdZZgS3TJf6ncwEHOUcWPDqpSd03g7ZcabsatqOfCMNKSDL+aDwvNNYba732ekCMsLipC
 j1fMqV9PYD6g==
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; 
   d="scan'208";a="482361261"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2020 03:45:34 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 5DF3720676; Fri,  4 Dec 2020 13:45:32 +0200 (EET)
Date:   Fri, 4 Dec 2020 13:45:32 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Colin Ian King <colin.king@canonical.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: media: i2c: add OV02A10 image sensor driver
Message-ID: <20201204114532.GT852@paasikivi.fi.intel.com>
References: <9af089ea-2532-68ac-5d22-97a669ccec91@canonical.com>
 <CAHp75Ve7Sdf=Zy5N1LN_w22=YwPgWWR-FZtrQcAkOF=ViT2Kbw@mail.gmail.com>
 <8eb453c7-a221-e741-5fe5-655e59075f34@canonical.com>
 <CAHp75VffBjhvuZ1Uy5Eo5qSiZ4w-+dhH5cR_XgmqGvxtrMd3uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VffBjhvuZ1Uy5Eo5qSiZ4w-+dhH5cR_XgmqGvxtrMd3uQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 03, 2020 at 08:30:03PM +0200, Andy Shevchenko wrote:
> On Thu, Dec 3, 2020 at 8:24 PM Colin Ian King <colin.king@canonical.com> wrote:
> > On 03/12/2020 18:10, Andy Shevchenko wrote:
> > > On Thu, Dec 3, 2020 at 8:03 PM Colin Ian King <colin.king@canonical.com> wrote:
> > >
> > >> Static analysis on linux-next with Coverity has detected an issue with
> > >> the following commit:
> > >
> > > If you want to fix it properly, see my comments below...
> > >
> > >> 529 static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
> > >> 530 {
> > >> 531        struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > >> 532        struct i2c_client *client =
> > >> v4l2_get_subdevdata(&ov02a10->subdev);
> > >>
> > >>    1. var_decl: Declaring variable ret without initializer.
> > >>
> > >> 533        int ret;
> > >> 534
> > >> 535        mutex_lock(&ov02a10->mutex);
> > >> 536
> > >>
> > >>    2. Condition ov02a10->streaming == on, taking true branch.
> > >>
> > >> 537        if (ov02a10->streaming == on)
> > >>
> > >>    3. Jumping to label unlock_and_return.
> > >>
> > >> 538                goto unlock_and_return;
> > >> 539
> > >> 540        if (on) {
> > >> 541                ret = pm_runtime_get_sync(&client->dev);
> > >> 542                if (ret < 0) {
> > >
> > >> 543                        pm_runtime_put_noidle(&client->dev);
> > >> 544                        goto unlock_and_return;
> > >
> > > Instead of two above:
> > >                        goto err_rpm_put;
> > >
> > >> 545                }
> > >> 546
> > >> 547                ret = __ov02a10_start_stream(ov02a10);
> > >> 548                if (ret) {
> > >> 549                        __ov02a10_stop_stream(ov02a10);
> > >> 550                        ov02a10->streaming = !on;
> > >> 551                        goto err_rpm_put;
> > >> 552                }
> > >> 553        } else {
> > >> 554                __ov02a10_stop_stream(ov02a10);
> > >> 555                pm_runtime_put(&client->dev);
> > >> 556        }
> > >> 557
> > >> 558        ov02a10->streaming = on;
> > >
> > > (1)
> > >
> > >> 559        mutex_unlock(&ov02a10->mutex);
> > >> 560
> > >> 561        return 0;
> > >> 562
> > >> 563 err_rpm_put:
> > >> 564        pm_runtime_put(&client->dev);
> > >
> > >> 565 unlock_and_return:
> > >
> > > Should be moved to (1).
> > >
> > >> 566        mutex_unlock(&ov02a10->mutex);
> > >> 567
> > >>
> > >> Uninitialized scalar variable (UNINIT)
> > >>     4. uninit_use: Using uninitialized value ret.
> > >>
> > >> 568        return ret;
> > >> 569 }
> > >>
> > >> Variable ret has not been initialized, so the error return value is a
> > >> garbage value. It should be initialized with some appropriate negative
> > >> error code, or ret could be removed and the return should return a
> > >> literal value of a error code.
> > >>
> > >> I was unsure what value is appropriate to fix this, so instead I'm
> > >> reporting this issue.
> > >
> > Not sure I fully understand how that fixes it.
> 
> If you are not sure and have no means to test, then don't bother. This
> is not the priority driver anyway.

Arnd sent a patch to address this:

<URL:https://patchwork.linuxtv.org/project/linux-media/patch/20201204082037.1658297-1-arnd@kernel.org/>

-- 
Sakari Ailus
