Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50AF350BDA5
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 18:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359667AbiDVQ44 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Apr 2022 12:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352608AbiDVQ4z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Apr 2022 12:56:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 792D65FF21
        for <linux-media@vger.kernel.org>; Fri, 22 Apr 2022 09:54:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FA222F7;
        Fri, 22 Apr 2022 18:53:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650646439;
        bh=0FcSijTsjj+cAuo1hmRA74AMfsMS728IukiaCybwuj8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e2o+NmgkehiBnfuHiABbDz1Lw3IpmEWazq/BMb2rcQHUwHz5DlTc9kMNxSJ7SCztt
         jYk2IwFq9n6cfwnLvirGZtrmfk/0lENokvJhfxr/mYqnACmAVbPxS6e3EpqNtPCuV3
         O5gk1MiP5yu9NgQ3P9bAJpLIKqndw9k+k+v1UL50=
Date:   Fri, 22 Apr 2022 19:53:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 4/6] media: ti: cal: use CSI-2 frame number for seq number
Message-ID: <YmLdpwLfxpcXzVC6@pendragon.ideasonboard.com>
References: <20220421143449.552312-1-tomi.valkeinen@ideasonboard.com>
 <20220421143449.552312-5-tomi.valkeinen@ideasonboard.com>
 <YmHuQ6bmBgDgt5ke@pendragon.ideasonboard.com>
 <7a43e054-5e9d-2858-929b-874b7c6a0c86@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7a43e054-5e9d-2858-929b-874b7c6a0c86@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Fri, Apr 22, 2022 at 09:41:51AM +0300, Tomi Valkeinen wrote:
> On 22/04/2022 02:52, Laurent Pinchart wrote:
> > On Thu, Apr 21, 2022 at 05:34:47PM +0300, Tomi Valkeinen wrote:
> >> The userspace needs a way to match received metadata buffers to pixel
> >> data buffers. The obvious way to do this is to use the CSI-2 frame
> >> number, as both the metadata and the pixel data have the same frame
> >> number as they come from the same frame.
> >>
> >> However, we don't have means to convey the frame number to userspace. We
> >> do have the 'sequence' field, which with a few tricks can be used for
> >> this purpose.
> >>
> >> To achieve this, track the frame number for each virtual channel and
> >> increase the sequence for each virtual channel by frame-number -
> >> previous-frame-number, also taking into account the eventual wrap of the
> >> CSI-2 frame number.
> >>
> >> This way we get a monotonically increasing sequence number which is
> >> common to all streams using the same virtual channel.
> > 
> > I'd agree in principle, if it wasn't for the fact that sensors are not
> > required to produce a frame number :-S
> 
> In that case the CAL hardware will increment the register every frame. 
>  From CAL doc:
> 
> Frame number.
> Matches the frame number sent by the camera when the
> camera transmits it.
> Otherwise, incremented by one on every FS short packet
> for this context.

Is that only when the FS packet contains a frame number equal to 0 ? How
about the extreme case where the frame number counts up to 2 and resets
to 1, effectively toggling between 1 and 2 ? Does your patch support
this correctly ?

> Reset when the context is enabled.
> 
> I'll add a note about that to the desc.

-- 
Regards,

Laurent Pinchart
