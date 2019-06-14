Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7766E4604A
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 16:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbfFNOOB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 10:14:01 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59057 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727698AbfFNOOB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 10:14:01 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hbmxs-0002Fd-7q; Fri, 14 Jun 2019 16:14:00 +0200
Message-ID: <1560521637.18257.5.camel@pengutronix.de>
Subject: Re: [PATCH v8] media: imx: add mem2mem device
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tim Harvey <tharvey@gateworks.com>, kernel@pengutronix.de
Date:   Fri, 14 Jun 2019 16:13:57 +0200
In-Reply-To: <9ca64889-046f-324c-9a5a-94ea0082f21e@gmail.com>
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
         <9ca64889-046f-324c-9a5a-94ea0082f21e@gmail.com>
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

Hi Steve,

On Tue, 2019-06-11 at 18:08 -0700, Steve Longerbeam wrote:
> Hi Philipp,
> 
> Version 9 will also need to fix merge conflicts due to the recent module 
> re-org and the switch to sync registration for the IPU internal subdevs.
> 
> I've done that work already, feel free to cherry-pick it from my github 
> fork if you agree with the merge fixes:
> 
> git@github.com:slongerbeam/mediatree.git, branch imx/mem2mem.v8.
> 
> Btw, some bugs have been found and fixed in ipu-image-convert.c. I will 
> be posting a patch-set shortly. You can review branch imx/bgthree-2136 
> in my fork for the changes.

Thank you, I'll resend the mem2mem next week. I had rebased already, but
I haven't tested unbinding/rebinding yet, as imx-media exploded on me
even without the mem2mem patch when I try tried.

regards
Philipp
