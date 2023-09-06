Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19221793D80
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 15:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238095AbjIFNPE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 09:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237727AbjIFNPE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 09:15:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83748E7B
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 06:14:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EECE5DA8;
        Wed,  6 Sep 2023 15:13:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694006010;
        bh=T6KLPCFzBcPQrDgXo8rfqalUrUMmXF5Fb7lWmiX55kI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=muO56Yi2W26Jn0hAFdNvMV6jGrGCPKYp3FYM7xCFa8GBmfgJvcx4IwaLf4rK51NCU
         s7Vth4CqcaLbqJNu+UcSyZeadmv5ZpVO4v3gB3RuC5yJ1s/cFm/Hq4uZNZxmWdepSg
         mxD95cnrdHHKXKfECLb0m3JRMI6wU65UrnABDLKM=
Date:   Wed, 6 Sep 2023 16:15:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 09/10] media: Add media bus codes for MIPI CCS
 embedded data
Message-ID: <20230906131510.GK17308@pendragon.ideasonboard.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-10-sakari.ailus@linux.intel.com>
 <20230905172535.GI7971@pendragon.ideasonboard.com>
 <ZPh4ln9GkyQDmbfp@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZPh4ln9GkyQDmbfp@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 06, 2023 at 01:03:18PM +0000, Sakari Ailus wrote:
> On Tue, Sep 05, 2023 at 08:25:35PM +0300, Laurent Pinchart wrote:
> > On Tue, Aug 08, 2023 at 10:55:37AM +0300, Sakari Ailus wrote:
> > > Add new MIPI CCS embedded data media bus formats.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../media/v4l/subdev-formats.rst              | 32 +++++++++++++++++++
> > >  include/uapi/linux/media-bus-format.h         | 10 +++++-
> > >  2 files changed, 41 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > index c615da08502d..5d5407738af9 100644
> > > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > @@ -8491,3 +8491,35 @@ and finally the bit number in subscript. "p" indicates a padding bit.
> > >        - p
> > >        - p
> > >        - p
> > > +
> > > +MIPI CCS Embedded Data Formats
> > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > +
> > > +`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines an
> > 
> > s/an$/a/
> 
> Yes. I think I had "embedded" there in the past...
> 
> > > +metadata format for sensor embedded data, which is used to store the register
> > > +configuration used for capturing a given frame. The format is defined in the CCS
> > > +specification.
> > 
> > Strictly speaking, the MIPI CCS embedded data format specifies not just
> > the data packing (insertion of padding bytes) and the data encoding (the
> > data format byte and the tag codes), but also the register addresses and
> > values that are reported in the embedded data. Do you envision the media
> > bus formats defined here as being applicable to sensors that use the
> > same packing and encoding as CCS, but different registers, or only to
> > fully compliant CCS sensors ?
> 
> There are sensors that aren't fully compatible with CCS (including those
> compatible with SMIA and SMIA++) but I wouldn't expect the format to be
> used by devices that are entirely incompatible with CCS.

So if a sensor uses the same packing and encoding as CCS, but a
different register set, you would require other media bus codes ? If so,
how would you require those media bus codes to be documented ? The
packing and encoding could be documented as being identical to CCS, but
what about the data itself ? Would you require the datasheet to be
public ? Or the entire register set being documented in the V4L2 spec ?

-- 
Regards,

Laurent Pinchart
