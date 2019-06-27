Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4D07582C2
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 14:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfF0MnD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 08:43:03 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45756 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbfF0MnD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 08:43:03 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A4065289A33
Message-ID: <d207f95aca246563531eae744b16f9df514c3544.camel@collabora.com>
Subject: Re: [PATCH] media: imx: mipi csi-2: Don't fail if initial state
 times-out
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date:   Thu, 27 Jun 2019 09:42:52 -0300
In-Reply-To: <1561624997.4216.11.camel@pengutronix.de>
References: <20190625203945.28081-1-ezequiel@collabora.com>
         <1561535121.4870.1.camel@pengutronix.de>
         <CAOMZO5Be-5Em0DR5nCBfzsW4mKMz6ThF+kSukcG6WuFF-0vwaQ@mail.gmail.com>
         <3797cdd2-f6c8-f23d-788c-b8efc3e75b21@gmail.com>
         <CAOMZO5AGZcsrzogzxRo9UNauYgWZLdiVE8vJ3-FxU2X4K8Jwxg@mail.gmail.com>
         <ba0f4a0f-cb61-6c5b-1db9-21536ae38c6f@gmail.com>
         <1561624997.4216.11.camel@pengutronix.de>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-06-27 at 10:43 +0200, Philipp Zabel wrote:
> On Wed, 2019-06-26 at 16:29 -0700, Steve Longerbeam wrote:
> > Hi Fabio,
> > 
> > On 6/26/19 4:22 PM, Fabio Estevam wrote:
> > > Hi Steve,
> > > 
> > > On Wed, Jun 26, 2019 at 6:19 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
> > > 
> > > > Did you only get the LP-11 timeout warning message with this patch on
> > > > the OV5645, or both the LP-11 timeout and clock lane timeout warnings?
> > > 
> > > With this patch applied I get only the LP-11 timeout warnings, not
> > > clock lane timeouts.
> > 
> > Ok thanks for the confirmation that the imx6 CSI-2 receiver is able to 
> > successfully move to stream on without seeing the LP-11 state in this 
> > case.
> 
> Are there any visual artifacts in the first frame(s) in this case?
> 

I'll check.

> > So in my opinion the next version of this patch should make LP-11 
> > timeout a warning only, but keep the error return on clock lane timeouts.
> 
> I agree.
> 

Right. I only saw the LP-11 timeout, and wasn't really sure about the
clock lane timeout. I'll drop that, improve the warning message and submit a v2.

Thanks,
Ezequiel 

