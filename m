Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41191332295
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 11:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhCIKHv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 05:07:51 -0500
Received: from mga17.intel.com ([192.55.52.151]:62066 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229553AbhCIKH2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Mar 2021 05:07:28 -0500
IronPort-SDR: DIM5779/rJxohVveR4hnO2fARHpKCgkakZFQrG9vmBQOe4fy+pSYDhTtiqV1CHNjL6i6W8UNkF
 HjAS6o53DS5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="168112905"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="168112905"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 02:07:28 -0800
IronPort-SDR: MVryUWDNLFgFJHL20aKCXQHixmw/qtKFLhB85CQIac9fyRmcHtSaOozU19KXzZ2hnXuwnr+Huy
 2af2Aich2aDA==
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="437848556"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 02:07:26 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 0F85A20427;
        Tue,  9 Mar 2021 12:07:25 +0200 (EET)
Date:   Tue, 9 Mar 2021 12:07:25 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 3/3] v4l: async: Wrap long lines, remove '(' at the end
 of lines
Message-ID: <20210309100724.GJ3@paasikivi.fi.intel.com>
References: <20210305190218.28505-1-sakari.ailus@linux.intel.com>
 <20210305190218.28505-4-sakari.ailus@linux.intel.com>
 <CAAEAJfCWNPp6g6KYVU45N=-3MQ=2S+FvE8SFh5Y24UN_QMfQpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfCWNPp6g6KYVU45N=-3MQ=2S+FvE8SFh5Y24UN_QMfQpQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Mon, Mar 08, 2021 at 04:46:36PM -0300, Ezequiel Garcia wrote:
> Hi Sakari,
> 
> Thanks for working on this.

Again thanks for the review! :-)

> 
> On Fri, 5 Mar 2021 at 16:03, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Rename V4L2 async notifier functions, replacing "notifier" with "nf" and
> > removing "_subdev" at the end of the function names adding subdevs as you
> > can only add subdevs to a notifier.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../driver-api/media/v4l2-subdev.rst          |  14 +-
> >  drivers/media/i2c/max9286.c                   |  17 +-
> >  drivers/media/i2c/st-mipid02.c                |  22 ++-
> >  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  17 +-
> >  drivers/media/platform/am437x/am437x-vpfe.c   |  19 ++-
> >  drivers/media/platform/atmel/atmel-isc-base.c |   4 +-
> >  drivers/media/platform/atmel/atmel-isi.c      |  17 +-
> >  .../media/platform/atmel/atmel-sama5d2-isc.c  |  15 +-
> >  drivers/media/platform/cadence/cdns-csi2rx.c  |  13 +-
> >  drivers/media/platform/davinci/vpif_capture.c |  21 +--
> >  drivers/media/platform/exynos4-is/media-dev.c |  20 +--
> >  .../media/platform/marvell-ccic/cafe-driver.c |   9 +-
> >  .../media/platform/marvell-ccic/mcam-core.c   |  10 +-
> >  .../media/platform/marvell-ccic/mmp-driver.c  |   6 +-
> >  drivers/media/platform/omap3isp/isp.c         |  21 ++-
> >  drivers/media/platform/pxa_camera.c           |  26 ++-
> >  drivers/media/platform/qcom/camss/camss.c     |  18 +-
> >  drivers/media/platform/rcar-vin/rcar-core.c   |  33 ++--
> >  drivers/media/platform/rcar-vin/rcar-csi2.c   |  19 +--
> >  drivers/media/platform/rcar_drif.c            |  14 +-
> >  drivers/media/platform/renesas-ceu.c          |  29 ++--
> >  .../platform/rockchip/rkisp1/rkisp1-dev.c     |  17 +-
> >  drivers/media/platform/stm32/stm32-dcmi.c     |  18 +-
> >  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  12 +-
> >  .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  19 ++-
> >  drivers/media/platform/ti-vpe/cal.c           |  16 +-
> >  drivers/media/platform/video-mux.c            |  16 +-
> >  drivers/media/platform/xilinx/xilinx-vipp.c   |  17 +-
> >  drivers/media/v4l2-core/v4l2-async.c          | 158 +++++++++---------
> >  drivers/media/v4l2-core/v4l2-fwnode.c         |  34 ++--
> >  drivers/staging/media/imx/imx-media-csi.c     |  17 +-
> >  .../staging/media/imx/imx-media-dev-common.c  |   7 +-
> >  drivers/staging/media/imx/imx-media-dev.c     |   6 +-
> >  drivers/staging/media/imx/imx-media-of.c      |   6 +-
> >  drivers/staging/media/imx/imx6-mipi-csi2.c    |  17 +-
> >  drivers/staging/media/imx/imx7-media-csi.c    |  24 +--
> >  drivers/staging/media/imx/imx7-mipi-csis.c    |  17 +-
> >  drivers/staging/media/tegra-video/vi.c        |  17 +-
> >  include/media/v4l2-async.h                    | 101 ++++++-----
> >  include/media/v4l2-fwnode.h                   |   6 +-
> >  40 files changed, 438 insertions(+), 451 deletions(-)
> >
> [..]
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index e638aa8aecb7..21b3890b96fc 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -24,7 +24,7 @@
> >  #include <media/v4l2-fwnode.h>
> >  #include <media/v4l2-subdev.h>
> >
> > -static int v4l2_async_notifier_call_bound(struct v4l2_async_notifier *n,
> > +static int v4l2_async_nf_call_bound(struct v4l2_async_notifier *n,
> 
> I think in general internal functions such as this one,
> are less critical to make sure they have consistent names.
> 
> They are internal and not an API, so even while it's surely
> important to have good names, it's surely less important
> than in the APIs case.
> 
> So in this sense, this patch is IMHO more complex than needed
> due to this internal function renaming :-)

That's true. The naming change in this patch only affects function names,
but all of the function names consistently.

> 
> >                                           struct v4l2_subdev *subdev,
> >                                           struct v4l2_async_subdev *asd)
> >  {
> > @@ -34,7 +34,7 @@ static int v4l2_async_notifier_call_bound(struct v4l2_async_notifier *n,
> >         return n->ops->bound(n, subdev, asd);
> >  }
> >
> > -static void v4l2_async_notifier_call_unbind(struct v4l2_async_notifier *n,
> > +static void v4l2_async_nf_call_unbind(struct v4l2_async_notifier *n,
> >                                             struct v4l2_subdev *subdev,
> >                                             struct v4l2_async_subdev *asd)
> >  {
> > @@ -44,7 +44,7 @@ static void v4l2_async_notifier_call_unbind(struct v4l2_async_notifier *n,
> >         n->ops->unbind(n, subdev, asd);
> >  }
> >
> > -static int v4l2_async_notifier_call_complete(struct v4l2_async_notifier *n)
> > +static int v4l2_async_nf_call_complete(struct v4l2_async_notifier *n)
> >  {
> >         if (!n->ops || !n->ops->complete)
> >                 return 0;
> > @@ -215,7 +215,7 @@ v4l2_async_find_subdev_notifier(struct v4l2_subdev *sd)
> >
> >  /* Get v4l2_device related to the notifier if one can be found. */
> >  static struct v4l2_device *
> > -v4l2_async_notifier_find_v4l2_dev(struct v4l2_async_notifier *notifier)
> > +v4l2_async_nf_find_v4l2_dev(struct v4l2_async_notifier *notifier)
> >  {
> >         while (notifier->parent)
> >                 notifier = notifier->parent;
> > @@ -227,7 +227,7 @@ v4l2_async_notifier_find_v4l2_dev(struct v4l2_async_notifier *notifier)
> >   * Return true if all child sub-device notifiers are complete, false otherwise.
> >   */
> >  static bool
> > -v4l2_async_notifier_can_complete(struct v4l2_async_notifier *notifier)
> > +v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
> >  {
> >         struct v4l2_subdev *sd;
> >
> > @@ -239,7 +239,7 @@ v4l2_async_notifier_can_complete(struct v4l2_async_notifier *notifier)
> >                         v4l2_async_find_subdev_notifier(sd);
> >
> >                 if (subdev_notifier &&
> > -                   !v4l2_async_notifier_can_complete(subdev_notifier))
> > +                   !v4l2_async_nf_can_complete(subdev_notifier))
> >                         return false;
> >         }
> >
> > @@ -251,7 +251,7 @@ v4l2_async_notifier_can_complete(struct v4l2_async_notifier *notifier)
> >   * sub-devices have been bound; v4l2_device is also available then.
> >   */
> >  static int
> > -v4l2_async_notifier_try_complete(struct v4l2_async_notifier *notifier)
> > +v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> >  {
> >         /* Quick check whether there are still more sub-devices here. */
> >         if (!list_empty(&notifier->waiting))
> > @@ -266,14 +266,14 @@ v4l2_async_notifier_try_complete(struct v4l2_async_notifier *notifier)
> >                 return 0;
> >
> >         /* Is everything ready? */
> > -       if (!v4l2_async_notifier_can_complete(notifier))
> > +       if (!v4l2_async_nf_can_complete(notifier))
> >                 return 0;
> >
> > -       return v4l2_async_notifier_call_complete(notifier);
> > +       return v4l2_async_nf_call_complete(notifier);
> >  }
> >
> >  static int
> > -v4l2_async_notifier_try_all_subdevs(struct v4l2_async_notifier *notifier);
> > +v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
> >
> >  static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
> >                                    struct v4l2_device *v4l2_dev,
> > @@ -287,7 +287,7 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
> >         if (ret < 0)
> >                 return ret;
> >
> > -       ret = v4l2_async_notifier_call_bound(notifier, sd, asd);
> > +       ret = v4l2_async_nf_call_bound(notifier, sd, asd);
> >         if (ret < 0) {
> >                 v4l2_device_unregister_subdev(sd);
> >                 return ret;
> > @@ -315,15 +315,15 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
> >          */
> >         subdev_notifier->parent = notifier;
> >
> > -       return v4l2_async_notifier_try_all_subdevs(subdev_notifier);
> > +       return v4l2_async_nf_try_all_subdevs(subdev_notifier);
> >  }
> >
> >  /* Test all async sub-devices in a notifier for a match. */
> >  static int
> > -v4l2_async_notifier_try_all_subdevs(struct v4l2_async_notifier *notifier)
> > +v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier)
> >  {
> >         struct v4l2_device *v4l2_dev =
> > -               v4l2_async_notifier_find_v4l2_dev(notifier);
> > +               v4l2_async_nf_find_v4l2_dev(notifier);
> >         struct v4l2_subdev *sd;
> >
> >         if (!v4l2_dev)
> > @@ -367,7 +367,7 @@ static void v4l2_async_cleanup(struct v4l2_subdev *sd)
> >
> >  /* Unbind all sub-devices in the notifier tree. */
> >  static void
> > -v4l2_async_notifier_unbind_all_subdevs(struct v4l2_async_notifier *notifier)
> > +v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier)
> >  {
> >         struct v4l2_subdev *sd, *tmp;
> >
> > @@ -376,9 +376,9 @@ v4l2_async_notifier_unbind_all_subdevs(struct v4l2_async_notifier *notifier)
> >                         v4l2_async_find_subdev_notifier(sd);
> >
> >                 if (subdev_notifier)
> > -                       v4l2_async_notifier_unbind_all_subdevs(subdev_notifier);
> > +                       v4l2_async_nf_unbind_all_subdevs(subdev_notifier);
> >
> > -               v4l2_async_notifier_call_unbind(notifier, sd, sd->asd);
> > +               v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
> >                 v4l2_async_cleanup(sd);
> >
> >                 list_move(&sd->async_list, &subdev_list);
> > @@ -389,8 +389,8 @@ v4l2_async_notifier_unbind_all_subdevs(struct v4l2_async_notifier *notifier)
> >
> >  /* See if an async sub-device can be found in a notifier's lists. */
> >  static bool
> > -__v4l2_async_notifier_has_async_subdev(struct v4l2_async_notifier *notifier,
> > -                                      struct v4l2_async_subdev *asd)
> > +__v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
> > +                                struct v4l2_async_subdev *asd)
> >  {
> >         struct v4l2_async_subdev *asd_y;
> >         struct v4l2_subdev *sd;
> > @@ -416,9 +416,8 @@ __v4l2_async_notifier_has_async_subdev(struct v4l2_async_notifier *notifier,
> >   * If @this_index < 0, search the notifier's entire @asd_list.
> >   */
> >  static bool
> > -v4l2_async_notifier_has_async_subdev(struct v4l2_async_notifier *notifier,
> > -                                    struct v4l2_async_subdev *asd,
> > -                                    int this_index)
> > +v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
> > +                              struct v4l2_async_subdev *asd, int this_index)
> >  {
> >         struct v4l2_async_subdev *asd_y;
> >         int j = 0;
> > @@ -435,15 +434,15 @@ v4l2_async_notifier_has_async_subdev(struct v4l2_async_notifier *notifier,
> >
> >         /* Check that an asd does not exist in other notifiers. */
> >         list_for_each_entry(notifier, &notifier_list, list)
> > -               if (__v4l2_async_notifier_has_async_subdev(notifier, asd))
> > +               if (__v4l2_async_nf_has_async_subdev(notifier, asd))
> >                         return true;
> >
> >         return false;
> >  }
> >
> > -static int v4l2_async_notifier_asd_valid(struct v4l2_async_notifier *notifier,
> > -                                        struct v4l2_async_subdev *asd,
> > -                                        int this_index)
> > +static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
> > +                                  struct v4l2_async_subdev *asd,
> > +                                  int this_index)
> >  {
> >         struct device *dev =
> >                 notifier->v4l2_dev ? notifier->v4l2_dev->dev : NULL;
> > @@ -454,7 +453,7 @@ static int v4l2_async_notifier_asd_valid(struct v4l2_async_notifier *notifier,
> >         switch (asd->match_type) {
> >         case V4L2_ASYNC_MATCH_I2C:
> >         case V4L2_ASYNC_MATCH_FWNODE:
> > -               if (v4l2_async_notifier_has_async_subdev(notifier, asd,
> > +               if (v4l2_async_nf_has_async_subdev(notifier, asd,
> >                                                          this_index)) {
> >                         dev_dbg(dev, "subdev descriptor already listed in this or other notifiers\n");
> >                         return -EEXIST;
> > @@ -469,13 +468,13 @@ static int v4l2_async_notifier_asd_valid(struct v4l2_async_notifier *notifier,
> >         return 0;
> >  }
> >
> > -void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier)
> > +void v4l2_async_nf_init(struct v4l2_async_notifier *notifier)
> >  {
> >         INIT_LIST_HEAD(&notifier->asd_list);
> >  }
> > -EXPORT_SYMBOL(v4l2_async_notifier_init);
> > +EXPORT_SYMBOL(v4l2_async_nf_init);
> >
> > -static int __v4l2_async_notifier_register(struct v4l2_async_notifier *notifier)
> > +static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
> >  {
> >         struct v4l2_async_subdev *asd;
> >         int ret, i = 0;
> > @@ -486,18 +485,18 @@ static int __v4l2_async_notifier_register(struct v4l2_async_notifier *notifier)
> >         mutex_lock(&list_lock);
> >
> >         list_for_each_entry(asd, &notifier->asd_list, asd_list) {
> > -               ret = v4l2_async_notifier_asd_valid(notifier, asd, i++);
> > +               ret = v4l2_async_nf_asd_valid(notifier, asd, i++);
> >                 if (ret)
> >                         goto err_unlock;
> >
> >                 list_add_tail(&asd->list, &notifier->waiting);
> >         }
> >
> > -       ret = v4l2_async_notifier_try_all_subdevs(notifier);
> > +       ret = v4l2_async_nf_try_all_subdevs(notifier);
> >         if (ret < 0)
> >                 goto err_unbind;
> >
> > -       ret = v4l2_async_notifier_try_complete(notifier);
> > +       ret = v4l2_async_nf_try_complete(notifier);
> >         if (ret < 0)
> >                 goto err_unbind;
> >
> > @@ -512,7 +511,7 @@ static int __v4l2_async_notifier_register(struct v4l2_async_notifier *notifier)
> >         /*
> >          * On failure, unbind all sub-devices registered through this notifier.
> >          */
> > -       v4l2_async_notifier_unbind_all_subdevs(notifier);
> > +       v4l2_async_nf_unbind_all_subdevs(notifier);
> >
> >  err_unlock:
> >         mutex_unlock(&list_lock);
> > @@ -520,8 +519,8 @@ static int __v4l2_async_notifier_register(struct v4l2_async_notifier *notifier)
> >         return ret;
> >  }
> >
> > -int v4l2_async_notifier_register(struct v4l2_device *v4l2_dev,
> > -                                struct v4l2_async_notifier *notifier)
> > +int v4l2_async_nf_register(struct v4l2_device *v4l2_dev,
> > +                          struct v4l2_async_notifier *notifier)
> >  {
> >         int ret;
> >
> > @@ -530,16 +529,16 @@ int v4l2_async_notifier_register(struct v4l2_device *v4l2_dev,
> >
> >         notifier->v4l2_dev = v4l2_dev;
> >
> > -       ret = __v4l2_async_notifier_register(notifier);
> > +       ret = __v4l2_async_nf_register(notifier);
> >         if (ret)
> >                 notifier->v4l2_dev = NULL;
> >
> >         return ret;
> >  }
> > -EXPORT_SYMBOL(v4l2_async_notifier_register);
> > +EXPORT_SYMBOL(v4l2_async_nf_register);
> >
> > -int v4l2_async_subdev_notifier_register(struct v4l2_subdev *sd,
> > -                                       struct v4l2_async_notifier *notifier)
> > +int v4l2_async_subdev_nf_register(struct v4l2_subdev *sd,
> > +                                 struct v4l2_async_notifier *notifier)
> >  {
> >         int ret;
> >
> > @@ -548,21 +547,21 @@ int v4l2_async_subdev_notifier_register(struct v4l2_subdev *sd,
> >
> >         notifier->sd = sd;
> >
> > -       ret = __v4l2_async_notifier_register(notifier);
> > +       ret = __v4l2_async_nf_register(notifier);
> >         if (ret)
> >                 notifier->sd = NULL;
> >
> >         return ret;
> >  }
> > -EXPORT_SYMBOL(v4l2_async_subdev_notifier_register);
> > +EXPORT_SYMBOL(v4l2_async_subdev_nf_register);
> >
> >  static void
> > -__v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier)
> > +__v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
> >  {
> >         if (!notifier || (!notifier->v4l2_dev && !notifier->sd))
> >                 return;
> >
> > -       v4l2_async_notifier_unbind_all_subdevs(notifier);
> > +       v4l2_async_nf_unbind_all_subdevs(notifier);
> >
> >         notifier->sd = NULL;
> >         notifier->v4l2_dev = NULL;
> > @@ -570,17 +569,17 @@ __v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier)
> >         list_del(&notifier->list);
> >  }
> >
> > -void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier)
> > +void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
> >  {
> >         mutex_lock(&list_lock);
> >
> > -       __v4l2_async_notifier_unregister(notifier);
> > +       __v4l2_async_nf_unregister(notifier);
> >
> >         mutex_unlock(&list_lock);
> >  }
> > -EXPORT_SYMBOL(v4l2_async_notifier_unregister);
> > +EXPORT_SYMBOL(v4l2_async_nf_unregister);
> >
> > -static void __v4l2_async_notifier_cleanup(struct v4l2_async_notifier *notifier)
> > +static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
> >  {
> >         struct v4l2_async_subdev *asd, *tmp;
> >
> > @@ -601,24 +600,24 @@ static void __v4l2_async_notifier_cleanup(struct v4l2_async_notifier *notifier)
> >         }
> >  }
> >
> > -void v4l2_async_notifier_cleanup(struct v4l2_async_notifier *notifier)
> > +void v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
> >  {
> >         mutex_lock(&list_lock);
> >
> > -       __v4l2_async_notifier_cleanup(notifier);
> > +       __v4l2_async_nf_cleanup(notifier);
> >
> >         mutex_unlock(&list_lock);
> >  }
> > -EXPORT_SYMBOL_GPL(v4l2_async_notifier_cleanup);
> > +EXPORT_SYMBOL_GPL(v4l2_async_nf_cleanup);
> >
> > -int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> > -                                  struct v4l2_async_subdev *asd)
> > +int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
> > +                              struct v4l2_async_subdev *asd)
> >  {
> >         int ret;
> >
> >         mutex_lock(&list_lock);
> >
> > -       ret = v4l2_async_notifier_asd_valid(notifier, asd, -1);
> > +       ret = v4l2_async_nf_asd_valid(notifier, asd, -1);
> >         if (ret)
> >                 goto unlock;
> >
> > @@ -628,12 +627,12 @@ int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> >         mutex_unlock(&list_lock);
> >         return ret;
> >  }
> > -EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_subdev);
> > +EXPORT_SYMBOL_GPL(__v4l2_async_nf_add_subdev);
> >
> >  struct v4l2_async_subdev *
> > -__v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> > -                                       struct fwnode_handle *fwnode,
> > -                                       unsigned int asd_struct_size)
> > +__v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
> > +                          struct fwnode_handle *fwnode,
> > +                          unsigned int asd_struct_size)
> >  {
> >         struct v4l2_async_subdev *asd;
> >         int ret;
> > @@ -645,7 +644,7 @@ __v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> >         asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> >         asd->match.fwnode = fwnode_handle_get(fwnode);
> >
> > -       ret = __v4l2_async_notifier_add_subdev(notifier, asd);
> > +       ret = __v4l2_async_nf_add_subdev(notifier, asd);
> >         if (ret) {
> >                 fwnode_handle_put(fwnode);
> >                 kfree(asd);
> > @@ -654,12 +653,12 @@ __v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> >
> >         return asd;
> >  }
> > -EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_fwnode_subdev);
> > +EXPORT_SYMBOL_GPL(__v4l2_async_nf_add_fwnode);
> >
> >  struct v4l2_async_subdev *
> > -__v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
> > -                                              struct fwnode_handle *endpoint,
> > -                                              unsigned int asd_struct_size)
> > +__v4l2_async_nf_add_fwnode_remote(struct v4l2_async_notifier *notif,
> 
> While I'd like to shorten the name of the functions, I feel
> v4l2_async_nf_ reads a bit strange. And, there's now an
> inconsistency:
> 
>   v4l2_async_nf_add_fwnode_remote(struct v4l2_async_notifier *notif
> 
> The prefix is "v4l2_async_nf", but the type is struct v4l2_async_notifier.

The structs are not really a problem, and changing "notifier" to just "nf"
in the struct name would make the name less informative. With function
namess there's more context.

> 
> Do you think we could drop the _subdev only?
> 
>   v4l2_async_notifier_add_fwnode(struct v4l2_async_notifier *n,
>   v4l2_async_notifier_add_fwnode_remote(struct v4l2_async_notifier *n,
> 
> Or maybe if the _remote is too verbose then passing an enum
> parameter for LOCAL or REMOTE. But I personally prefer to just
> keep it simple and avoid another parameter.

As a result of the patch, there's a large number of function calls that are
exactly 80 characters long. If the name is longer than it is now, those
will be again too long.

-- 
Kind regards,

Sakari Ailus
