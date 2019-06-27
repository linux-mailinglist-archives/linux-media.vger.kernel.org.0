Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D88A57E6A
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 10:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfF0InW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 04:43:22 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40467 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbfF0InW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 04:43:22 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hgPzy-0002Of-TJ; Thu, 27 Jun 2019 10:43:18 +0200
Message-ID: <1561624997.4216.11.camel@pengutronix.de>
Subject: Re: [PATCH] media: imx: mipi csi-2: Don't fail if initial state
 times-out
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date:   Thu, 27 Jun 2019 10:43:17 +0200
In-Reply-To: <ba0f4a0f-cb61-6c5b-1db9-21536ae38c6f@gmail.com>
References: <20190625203945.28081-1-ezequiel@collabora.com>
         <1561535121.4870.1.camel@pengutronix.de>
         <CAOMZO5Be-5Em0DR5nCBfzsW4mKMz6ThF+kSukcG6WuFF-0vwaQ@mail.gmail.com>
         <3797cdd2-f6c8-f23d-788c-b8efc3e75b21@gmail.com>
         <CAOMZO5AGZcsrzogzxRo9UNauYgWZLdiVE8vJ3-FxU2X4K8Jwxg@mail.gmail.com>
         <ba0f4a0f-cb61-6c5b-1db9-21536ae38c6f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-06-26 at 16:29 -0700, Steve Longerbeam wrote:
> Hi Fabio,
> 
> On 6/26/19 4:22 PM, Fabio Estevam wrote:
> > Hi Steve,
> > 
> > On Wed, Jun 26, 2019 at 6:19 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
> > 
> > > Did you only get the LP-11 timeout warning message with this patch on
> > > the OV5645, or both the LP-11 timeout and clock lane timeout warnings?
> > 
> > With this patch applied I get only the LP-11 timeout warnings, not
> > clock lane timeouts.
> 
> Ok thanks for the confirmation that the imx6 CSI-2 receiver is able to 
> successfully move to stream on without seeing the LP-11 state in this 
> case.

Are there any visual artifacts in the first frame(s) in this case?

> So in my opinion the next version of this patch should make LP-11 
> timeout a warning only, but keep the error return on clock lane timeouts.

I agree.

regards
Philipp
