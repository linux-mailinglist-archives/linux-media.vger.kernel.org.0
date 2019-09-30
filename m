Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83A71C1C70
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 09:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbfI3H65 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 03:58:57 -0400
Received: from mga02.intel.com ([134.134.136.20]:54652 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725767AbfI3H65 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 03:58:57 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Sep 2019 00:58:56 -0700
X-IronPort-AV: E=Sophos;i="5.64,565,1559545200"; 
   d="scan'208";a="184757098"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Sep 2019 00:58:53 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 83C6720343; Mon, 30 Sep 2019 10:58:51 +0300 (EEST)
Date:   Mon, 30 Sep 2019 10:58:51 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        andriy.shevchenko@linux.intel.com,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>, shengnan.wang@mediatek.com
Subject: Re: [PATCH] media: i2c: ov5695: Modify the function of async
 register subdev related devices
Message-ID: <20190930075851.GB19037@paasikivi.fi.intel.com>
References: <20190927071824.18675-1-dongchun.zhu@mediatek.com>
 <20190927071824.18675-2-dongchun.zhu@mediatek.com>
 <CAAFQd5B1htFA1R92iQQ93dMQujkSWNqHkx94GG+bdUscRA4gDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5B1htFA1R92iQQ93dMQujkSWNqHkx94GG+bdUscRA4gDQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz, Dongchun,

(Removed randomly cc'd people from distribution.)

On Sat, Sep 28, 2019 at 09:17:11PM +0900, Tomasz Figa wrote:
> On Fri, Sep 27, 2019 at 4:18 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> >
> > This patch adds support for registering a sensor sub-device to the async sub-device framework and parse set up common
> > sensor related devices such as actuator/VCM.
> 
> nit: The description should be wrapped around the 80th column.
> 
> Sakari, do we need to resent or you could just rewrap when applying?

I'll rewrap.

> 
> >
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  drivers/media/i2c/ov5695.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
> > index e65a943..b6ee62c 100644
> > --- a/drivers/media/i2c/ov5695.c
> > +++ b/drivers/media/i2c/ov5695.c
> > @@ -1328,7 +1328,7 @@ static int ov5695_probe(struct i2c_client *client,
> >                 goto err_power_off;
> >  #endif
> >
> > -       ret = v4l2_async_register_subdev(sd);
> > +       ret = v4l2_async_register_subdev_sensor_common(sd);
> >         if (ret) {
> >                 dev_err(dev, "v4l2 async register subdev failed\n");
> >                 goto err_clean_entity;
> > --
> > 2.9.2
> >
> 
> Otherwise:
> 
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Thanks!

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
