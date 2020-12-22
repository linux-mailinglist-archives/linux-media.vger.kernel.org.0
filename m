Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 256882E0E2A
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 19:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbgLVSRd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 13:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727649AbgLVSRd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 13:17:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC856C061793
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 10:16:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92D239E6;
        Tue, 22 Dec 2020 19:16:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608661009;
        bh=ZH0VT/izevTaCgBO/i08IF82vSZTPN8+jenGykXqPII=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U2YvFdpXe050dGQTl8QffSOBWbmkho5pQeNXEmXaz+jSpodrYsG2+fWFZwL/XnJEd
         dQrFrs7Z3/7MOHH9tECKktHwnzRSYlALpYTyW5tO2oAfIerb7RKkd1xOfeeuCvN9g7
         YrCMg2VTCyF07a+iXPpN9uKlhcfMoAiqSkbcvgjY=
Date:   Tue, 22 Dec 2020 20:16:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Martin Kepplinger <martin.kepplinger@puri.sm>,
        "rogerio.silva@nxp.com" <rogerio.silva@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        "kernel@puri.sm" <kernel@puri.sm>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: question: CSI on imx8mq with (any) CSI2 camera / experience with
 mx6s_capture?
Message-ID: <X+I4CYjX99oUqjg2@pendragon.ideasonboard.com>
References: <9e09ca8b-d1bc-eaa9-d296-c4ee98882c06@puri.sm>
 <X9HpL/qlFxmZi9Vt@pendragon.ideasonboard.com>
 <X9IR7dXOkX2XBCtx@pendragon.ideasonboard.com>
 <195b62c5-5238-a75e-3206-c54efc309e94@puri.sm>
 <X9JG/d1le9xZlI4i@pendragon.ideasonboard.com>
 <c13b2f47-7e15-97b6-f523-93afc009ebdf@puri.sm>
 <X+ISOvor/SO55dKw@pendragon.ideasonboard.com>
 <CAOMZO5C5agyexPSeOCJmv7BKAYQVr0NTVLr0yEMPZjrjgfyPLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOMZO5C5agyexPSeOCJmv7BKAYQVr0NTVLr0yEMPZjrjgfyPLg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Tue, Dec 22, 2020 at 02:15:19PM -0300, Fabio Estevam wrote:
> On Tue, Dec 22, 2020 at 12:35 PM Laurent Pinchart wrote:
> 
> > I've recently bought an i.MX8MM EVK, with the OV5647 camera module, and
> > when I try to capture images, with the NXP kernel, I just don't get any.
> > *sigh* I'll have to debug that.
> 
> OV5647? The default camera for the imx8mm-evk board is the OV5640.

Sorry, I meant OV5640, it was a typo.

-- 
Regards,

Laurent Pinchart
