Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C2F1E1DB2
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 10:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731610AbgEZIzk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 04:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731414AbgEZIzk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 04:55:40 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB98C03E97E;
        Tue, 26 May 2020 01:55:39 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 3E902634C87;
        Tue, 26 May 2020 11:54:50 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jdVMI-0002RU-AE; Tue, 26 May 2020 11:54:50 +0300
Date:   Tue, 26 May 2020 11:54:50 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v9 2/4] media: i2c: Add MAX9286 driver
Message-ID: <20200526085450.GF8214@valkosipuli.retiisi.org.uk>
References: <20200512155105.1068064-1-kieran.bingham+renesas@ideasonboard.com>
 <20200512155105.1068064-3-kieran.bingham+renesas@ideasonboard.com>
 <20200516215103.GA857@valkosipuli.retiisi.org.uk>
 <930009cd-d887-752a-4f1f-567c795101ee@ideasonboard.com>
 <20200520005020.GQ3820@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520005020.GQ3820@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, May 20, 2020 at 03:50:20AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Mon, May 18, 2020 at 12:45:18PM +0100, Kieran Bingham wrote:
> > Hi Sakari,
> > 
> > There are only fairly minor comments here, fix ups will be included in a
> > v10.
> > 
> > Is there anything major blocking integration?
> > 
> > On 16/05/2020 22:51, Sakari Ailus wrote:
> > > On Tue, May 12, 2020 at 04:51:03PM +0100, Kieran Bingham wrote:
> > > 
> > > ...
> > > 
> > >> +static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
> > >> +				  struct v4l2_subdev_pad_config *cfg,
> > >> +				  struct v4l2_subdev_mbus_code_enum *code)
> > >> +{
> > >> +	if (code->pad || code->index > 0)
> > >> +		return -EINVAL;
> > >> +
> > >> +	code->code = MEDIA_BUS_FMT_UYVY8_2X8;
> > > 
> > > Why UYVY8_2X8 and not UYVY8_1X16? In general, the single sample / pixel
> > > variant of the format is generally used on the serial busses. This choice
> > > was made when serial busses were introduced.
> 
> This is a bit of a tricky one. On the camera size, for the RDACM20, the
> O10635 sensor outputs UYVY8_2X8. This if fed to the MAX9271 serializer,
> which doesn't care about the data type. The MAX9271 has a 16-bit input
> bus, with 10 bits reserved for data, 2 bits dynamically configurable
> to carry H/V sync or extra data, and 4 bits dynamically configurable to
> carry GPIOs or extra data. The 16-bit words are then serialized (it's a
> bit more complicated, when using the H/V sync signals they are
> transmitted in a different way, and the MAX9271 also supports a DDR mode
> that makes the "serial link word" carry up to 30 bits). Effectively, the
> two samples of UYVY8_2X8 are serialized in a 16-bit word each.
> 
> Sakari, with this information in mind, what would you recommend ?

As this pad describes a serial bus --- doesn't it? --- it should use the
same formats as other serial busses such as CSI-2. I.e. the 1X16 variant.

-- 
Regards,

Sakari Ailus
