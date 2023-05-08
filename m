Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE7D6FA234
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 10:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbjEHI0g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 04:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233354AbjEHI0d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 04:26:33 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0141940E
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 01:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683534375; x=1715070375;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y4/cjCmyrd9JtPLIGo8Kk8uqshPPc4ufwdQmBb+QMCc=;
  b=cZNrP3PQHqE5TA4GkBRWi6ORjQW0b+rxj4JKH6ORk8C/vmsWlX5ls/xB
   wrOtC9QhvDXURLdD+qtP+1+kL2p83O8UXj6KhHCHINz/czWmGO8v3EFoH
   BPxk9+zx2GBtUlyo9XzwGc8/TDaPak7bhxEAyxapJPwJ8Yt/NjDz7prEo
   0dthHeJ679YJi93ygMJi6Pr/+Jkej25p9HCqiGeWN0QUGfsLCPInZHr1r
   IjcePhnHwk4TwowCvw/ZAeQYab7nPcAIMg631RE3KqlRs8dfhSNRh+FSu
   AyMKuaNWCwBI+Bmc/QP/uRFAcof1G1TrFSAyDE4MSgdzOTvK2aggEdMgH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="329208743"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="329208743"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 01:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="842610233"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="842610233"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 01:26:14 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 28E691203DA;
        Mon,  8 May 2023 11:26:12 +0300 (EEST)
Date:   Mon, 8 May 2023 11:26:12 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     linux-media@vger.kernel.org, bingbu.cao@intel.com
Subject: Re: [PATCH v2 1/1] media: pci: ipu3-cio2: Obtain remote pad from
 endpoint
Message-ID: <ZFiyJCV6jXcStj/J@kekkonen.localdomain>
References: <20230508064123.979451-1-sakari.ailus@linux.intel.com>
 <d28f7837-7a57-6cdf-b787-eada45c2d694@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d28f7837-7a57-6cdf-b787-eada45c2d694@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Mon, May 08, 2023 at 03:55:16PM +0800, Bingbu Cao wrote:
> 
> Sakari,
> 
> Thanks for your patch.
> 
> On 5/8/23 2:41 PM, Sakari Ailus wrote:
> > Use the endpoint fwnode to find out the remote pad, instead of using the
> > first source pad found. Also improve error messages.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > since v1:
> > 
> > - Drop pad variable.
> > 
> > - Wrap long lines.
> > 
> >  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 31 +++++++++----------
> >  1 file changed, 15 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> > index 3c84cb1216320..c5d00c929bfac 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> > @@ -1373,6 +1373,7 @@ static const struct v4l2_subdev_ops cio2_subdev_ops = {
> >  struct sensor_async_subdev {
> >  	struct v4l2_async_subdev asd;
> >  	struct csi2_bus_info csi2;
> > +	struct fwnode_endpoint endpoint;
> >  };
> >  
> >  #define to_sensor_asd(asd)	container_of(asd, struct sensor_async_subdev, asd)
> > @@ -1417,31 +1418,28 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
> >  	struct sensor_async_subdev *s_asd;
> >  	struct v4l2_async_subdev *asd;
> >  	struct cio2_queue *q;
> > -	unsigned int pad;
> >  	int ret;
> >  
> >  	list_for_each_entry(asd, &cio2->notifier.asd_list, asd_list) {
> >  		s_asd = to_sensor_asd(asd);
> >  		q = &cio2->queue[s_asd->csi2.port];
> >  
> > -		for (pad = 0; pad < q->sensor->entity.num_pads; pad++)
> > -			if (q->sensor->entity.pads[pad].flags &
> > -						MEDIA_PAD_FL_SOURCE)
> > -				break;
> > -
> > -		if (pad == q->sensor->entity.num_pads) {
> > -			dev_err(dev, "failed to find src pad for %s\n",
> > -				q->sensor->name);
> > -			return -ENXIO;
> > +		ret = media_entity_get_fwnode_pad(&q->sensor->entity,
> > +						  s_asd->endpoint.local_fwnode,
> > +						  MEDIA_PAD_FL_SOURCE);
> > +		if (ret < 0) {
> > +			dev_err(dev, "no endpoint for %pfw (%d)\n",
> > +				s_asd->endpoint.local_fwnode, ret);
> > +			return ret;
> >  		}
> >  
> > -		ret = media_create_pad_link(
> > -				&q->sensor->entity, pad,
> > -				&q->subdev.entity, CIO2_PAD_SINK,
> > -				0);
> > +		ret = media_create_pad_link(&q->sensor->entity, ret,
> > +					    &q->subdev.entity, CIO2_PAD_SINK,
> > +					    0);
> 
> Is there some cases that sensor has multiple source pads?

Then you'll have multiple connections between different ports --- and
multiple links as well.

-- 
Sakari Ailus
