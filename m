Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6796A5110FF
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 08:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358019AbiD0GTJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 02:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiD0GTI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 02:19:08 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E5B4617C
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 23:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651040158; x=1682576158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+T7rlT0aP3C0obEOkPBkVBXeovKDYZK1WCmef0OymtQ=;
  b=lXz/+V9GTID+XT6mI0jSbWtBCORdAFZ0yvrPmc/7SIBip/knfOvqelyG
   cQHsMzcTM8ZeD0CjBFbfgfGhAQFcn81PLMzPyxi5tFUYmVzjCKwzIGLmg
   kbiPN+HB5jwvTmMO6PN7GezWO38o9LRZ2gfR9chjd8ulybwa4Vsm04Ei4
   QbhyA/E8qppZhTW7id2y7VQ+I7GNLgz1eGi5vvY/wrBXIoIy0EqwDIWk6
   +9urXB2WM3LFicgI0hSPidvk+VDdhhFGxsS1Me3SG5YCSuc2UckchyAki
   i3JKfYiGcXq+bJYFQGy+jRTGNTKP91GnK9XXDDP490Nkc3D91ysy89uuL
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="263418508"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="263418508"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 23:15:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="680015451"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 23:15:53 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id C055B2017F;
        Wed, 27 Apr 2022 09:15:50 +0300 (EEST)
Date:   Wed, 27 Apr 2022 09:15:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: dw9714: Return zero in remove callback
Message-ID: <YmjfluX8olzjWI1S@paasikivi.fi.intel.com>
References: <20220331133132.296971-1-u.kleine-koenig@pengutronix.de>
 <20220425191345.utl5jz5ajbzeqost@pengutronix.de>
 <Ymeq5Q4kVu1yoKFq@paasikivi.fi.intel.com>
 <20220426090255.nhguw7nd4asxrhab@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426090255.nhguw7nd4asxrhab@pengutronix.de>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 26, 2022 at 11:02:55AM +0200, Uwe Kleine-König wrote:
> On Tue, Apr 26, 2022 at 11:18:45AM +0300, Sakari Ailus wrote:
> > Hi Uwe,
> > 
> > On Mon, Apr 25, 2022 at 09:13:45PM +0200, Uwe Kleine-König wrote:
> > > Hello,
> > > 
> > > On Thu, Mar 31, 2022 at 03:31:32PM +0200, Uwe Kleine-König wrote:
> > > > The only effect of returning an error code in an i2c remove callback is
> > > > that the i2c core emits a generic warning and still removes the device.
> > > > 
> > > > So even if disabling the regulator fails it's sensible to further cleanup
> > > > and then return zero to only emit a single error message.
> > > > 
> > > > This patch is a preparation for making i2c remove callbacks return void.
> > > > 
> > > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > ---
> > > >  drivers/media/i2c/dw9714.c | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
> > > > index cd7008ad8f2f..982ed8afebf5 100644
> > > > --- a/drivers/media/i2c/dw9714.c
> > > > +++ b/drivers/media/i2c/dw9714.c
> > > > @@ -201,7 +201,6 @@ static int dw9714_remove(struct i2c_client *client)
> > > >  		if (ret) {
> > > >  			dev_err(&client->dev,
> > > >  				"Failed to disable vcc: %d\n", ret);
> > > > -			return ret;
> > > >  		}
> > > >  	}
> > > >  	pm_runtime_set_suspended(&client->dev);
> > > 
> > > Who cares for this driver and so for this patch?
> > 
> > I do.
> > 
> > The patch is in the media stage tree now (you should have received an
> > e-mail about it) from where it eventually gets to the media tree.
> 
> Ah I did. I wasn't aware of it, because the mail doesn't have the
> in-reply-to header set such that my MUA doesn't sort it to the patch
> mail.

The mail is not sent to the LMML, but the submitter (as others whose
addresses can be found in git tags) and another list. This would still
allow to connect the two. This is up to Mauro's scripts.

> 
> I saw this mail now. Let me note that it's intransparent for me how your
> Sob line was added to the patch. The mail says the patch was queued,
> does that mean it's about to be applied and will appear in next soon? Or
> is it only queued to be looked at? (I assume the former.)

The media submaintainer trees --- such as mine --- are not pulled to the
media tree. Instead Mauro picks the patches to the media tree individually.

My tree is here:

<URL:https://git.linuxtv.org/sailus/media_tree.git/>

-- 
Sakari Ailus
