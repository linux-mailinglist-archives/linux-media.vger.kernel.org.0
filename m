Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB657C46C4
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 02:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344412AbjJKAgJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 20:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344336AbjJKAgI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 20:36:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5970398
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 17:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696984565; x=1728520565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OBhZ0zyf/oA8BBSbgX4OsE/5+rDeuHxP2t0o65ILJJw=;
  b=lf986PkP3npkZvuVB5wbpCE6WZAZy+BceqnsfKd9wPkp0ZL1wlNHoMGn
   7sc8WVLlVUfiKxmlURC/wO4lRPuP4RZBUOTsxM2b1M3AhFrmEASr24Vev
   us8wdtj3ZAres2sCbOhiMyLlqxRtUr0Q6KvMmcS6+2lfY3KPQ6LXCS6v4
   asKXvqoDIWS+iGRAqaek4YQ2PxP53Agb2V25syIEZZ3KamS36NIr7lZ8P
   PmtvGFkc/I6KckW84NkTqozyrAE9mqR0mX8oY8hOKfh5lhtP2zxqPKdbd
   XSiHKnrk4iq5KprHNqZ8CdN9OcL2BVemPkHLHePSTOL4uEyseyXGgNr0A
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="448749089"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="448749089"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 17:36:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="869935943"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="869935943"
Received: from mdemtias-mobl.amr.corp.intel.com (HELO desk) ([10.209.103.243])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 17:36:04 -0700
Date:   Tue, 10 Oct 2023 17:35:49 -0700
From:   Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To:     Martin =?utf-8?B?VMWvbWE=?= <tumic@gpxsee.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Martin Tuma <martin.tuma@digiteqautomotive.com>
Subject: Re: [PATCH 9/9] media: pci: mgb4: fix potential spectre vulnerability
Message-ID: <20231011003549.y7nniiz26z2fcbhd@desk>
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
 <c83b7fffe1e087568f64aba786797d258279948e.1696586632.git.hverkuil-cisco@xs4all.nl>
 <d8726389-4354-499f-9114-eeff27231c7e@gpxsee.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8726389-4354-499f-9114-eeff27231c7e@gpxsee.org>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 10, 2023 at 12:31:07PM +0200, Martin Tůma wrote:
> On 06. 10. 23 12:08, Hans Verkuil wrote:
> > Fix smatch warnings:
> > 
> > drivers/media/pci/mgb4/mgb4_sysfs_out.c:118 video_source_store() warn: potential spectre issue 'mgbdev->vin' [r] (local cap)
> > drivers/media/pci/mgb4/mgb4_sysfs_out.c:122 video_source_store() warn: possible spectre second half.  'loopin_new'
> > 
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > CC: Martin Tuma <martin.tuma@digiteqautomotive.com>
> > ---
> >   drivers/media/pci/mgb4/mgb4_sysfs_out.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/pci/mgb4/mgb4_sysfs_out.c b/drivers/media/pci/mgb4/mgb4_sysfs_out.c
> > index 23a9aabf3915..9f6e81c57726 100644
> > --- a/drivers/media/pci/mgb4/mgb4_sysfs_out.c
> > +++ b/drivers/media/pci/mgb4/mgb4_sysfs_out.c
> > @@ -8,6 +8,7 @@
> >    */
> >   #include <linux/device.h>
> > +#include <linux/nospec.h>
> >   #include "mgb4_core.h"
> >   #include "mgb4_i2c.h"
> >   #include "mgb4_vout.h"
> > @@ -114,8 +115,10 @@ static ssize_t video_source_store(struct device *dev,
> >   	if (((config & 0xc) >> 2) < MGB4_VIN_DEVICES)
> >   		loopin_old = mgbdev->vin[(config & 0xc) >> 2];
> > -	if (val < MGB4_VIN_DEVICES)
> > +	if (val < MGB4_VIN_DEVICES) {
> > +		val = array_index_nospec(val, MGB4_VIN_DEVICES);
> >   		loopin_new = mgbdev->vin[val];
> > +	}
> >   	if (loopin_old && loopin_cnt(loopin_old) == 1)
> >   		mgb4_mask_reg(&mgbdev->video, loopin_old->config->regs.config,
> >   			      0x2, 0x0);
> 
> Hi,
> I had investigated the warning when it appeared here on the mailing list,
> but IMHO it is a false-positive, so I didn't react to it. MGB4_VIN_DEVICES
> in the condition is not a check for array bounds but a check whether the
> input source (val) is one of the inputs. Valid "val" values are <0,3> and
> only if the value is <0,1> it is used as an array index for the input
> devices (vin) array.

I think when there are 2 branch mispredicts this is a valid problem.
Below both branches can be trained with a val < 2. Then for a val > 3,
both branches can mispredict:

video_source_store(buf)
{
...
	ret = kstrtoul(buf, 10, &val);
	if (ret)
		return ret;
	if (val > 3)		     <------------- predicted as not taken
		return -EINVAL;
	...

	if (val < MGB4_VIN_DEVICES)  <------------- predicted as taken
 		loopin_new = mgbdev->vin[val];

The fix LGTM, although it can also possibly be fixed by masking the
index after the first mispredicted branch, like:

	ret = kstrtoul(buf, 10, &val);
	if (ret)
		return ret;

+	val = array_index_nospec(val, 4);

provided, mgbdev->vin[2] and mgbdev->vin[3] can't load a secret.
