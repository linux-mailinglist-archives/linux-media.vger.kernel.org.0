Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A131C792D25
	for <lists+linux-media@lfdr.de>; Tue,  5 Sep 2023 20:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238294AbjIESL3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Sep 2023 14:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239315AbjIESHm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Sep 2023 14:07:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C249E1E8F7
        for <linux-media@vger.kernel.org>; Tue,  5 Sep 2023 10:23:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 557D7D8B;
        Tue,  5 Sep 2023 18:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693932341;
        bh=bChNDkKa4a+ObEinooP2i2uBJXCAvSjfDakubWHx6gA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LjWsG/D3DLDlHFx4rdXHzRNH9v7Q5qBXH472DgUhA/e8a6V2aDVza37EywDiDAfCH
         bcffCcTn58kFAPj+atnuu0sL4dMDX2TxMGJBuKqpAc/SyIc4T3eQyzXr9XLv3nETkd
         cBTUwByi1mql1pBzPOqwsegG5zoOc1O6Aj8Jd2kI=
Date:   Tue, 5 Sep 2023 19:47:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 07/10] media: uapi: Add generic 8-bit metadata format
 definitions
Message-ID: <20230905164720.GC7971@pendragon.ideasonboard.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-8-sakari.ailus@linux.intel.com>
 <9d3f512c-69c6-3789-83af-d151acd58ebe@xs4all.nl>
 <decr6lkgqk3fuxsyq4v3q46idmsfp6mlwfm6zm4fwcnlzcr5tw@ryikjpaazhzp>
 <ZNX7S7zh0RG2vQOA@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZNX7S7zh0RG2vQOA@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, Aug 11, 2023 at 09:11:39AM +0000, Sakari Ailus wrote:
> On Fri, Aug 11, 2023 at 08:31:16AM +0200, Jacopo Mondi wrote:
> > > > +V4L2_META_FMT_GENERIC_CSI2_10
> > > > +-----------------------------
> > > > +
> > > > +V4L2_META_FMT_GENERIC_CSI2_10 contains packed 8-bit generic metadata, 10 bits
> > > > +for each 8 bits of data. Every four bytes of metadata is followed by a single
> > > > +byte of padding. The way the data is stored follows the CSI-2 specification.
> > > > +
> > > > +This format is also used on CSI-2 on 20 bits per sample format that packs two
> > > > +bytes of metadata into one sample.
> > > > +
> > > > +This format is little endian.
> > > > +
> > > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
> > > > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > >
> > > I think you should document whether the padding is always 0 or can be any value.
> > > Perhaps 'X' is a better 'name' for the padding byte in the latter case.
> > 
> > Did I get this right that this format is supposed to work as the RAW10
> > CSI-2 packed image format, where 4 bytes contain the higher 8 bits of
> > the 10 bits sample and the 5th byte every 4 contains the lower 2 bits of
> > the previous 4 sample ?
> > 
> > If that's the case, is 'padding' the correct term here ?
> 
> What else would you call it? It'll be zeros that exist just due to the bit
> depth used and as such not interesting at all.

It's actually not 0, CCS requires the padding bytes to be 0x55.

I wonder if the conformance test suite tests the contents of the padding
bytes.

-- 
Regards,

Laurent Pinchart
