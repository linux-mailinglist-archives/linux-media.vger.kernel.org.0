Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3598926F80E
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 10:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgIRIX6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 04:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgIRIXz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 04:23:55 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C529C06174A;
        Fri, 18 Sep 2020 01:23:55 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 9A728C6366; Fri, 18 Sep 2020 09:23:52 +0100 (BST)
Date:   Fri, 18 Sep 2020 09:23:52 +0100
From:   Sean Young <sean@mess.org>
To:     Joakim Zhang <qiangqing.zhang@nxp.com>
Cc:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle
 system
Message-ID: <20200918082352.GA32346@gofer.mess.org>
References: <20200915150202.24165-1-qiangqing.zhang@nxp.com>
 <20200915093342.GA24139@gofer.mess.org>
 <DB8PR04MB6795CB9F519D2BD277654B29E63E0@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <20200917204336.GA21441@gofer.mess.org>
 <DB8PR04MB6795D5228426C7D93AF08081E63F0@DB8PR04MB6795.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB8PR04MB6795D5228426C7D93AF08081E63F0@DB8PR04MB6795.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joakim,

On Fri, Sep 18, 2020 at 01:42:15AM +0000, Joakim Zhang wrote:
> > -----Original Message-----
> > From: Sean Young <sean@mess.org>
> > Sent: 2020年9月18日 4:44
> > To: Joakim Zhang <qiangqing.zhang@nxp.com>
> > Cc: mchehab@kernel.org; linux-media@vger.kernel.org;
> > linux-kernel@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > Subject: Re: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle
> > system

-snip-

> > > Autosuspend delay should be fixed value, should be set to gpio device timeout
> > value, which is 125ms.
> > 
> > So the idea was that cpuidle is only enabled while IR frames are being received,
> > that's why I suggested it.
> 
> May be a typo, "cpuidle is only DISABLED while IR frames are being receive,", this is not I want to implement, experiments have also shown poor results.

Sorry, yes I got this wrong. You are right.

> > If you set the autosuspend delay to 125ms, then the cpuidle will not be enabled
> > between IR frames. Maybe this is what you want, but it does mean cpuidle is
> > totally suspended while anyone is pressing buttons on a remote.
> 
> Yes, this is what I want, cpuidle is totally disabled while pressing buttons, disable cpuidle at the first frame then keep disabled until there is no activity for a while.
> So that we only can not decode the first frame, such as, if transmitting 4 frames once, we can correctly decode 3 times.
> 
> I also try your suggestion, set autosuspend delay time to protocol's timeout value, but the result is terrible. If transmitting 4 frames once, we can't correctly decode 3 times,
> even can't decode it sometime. The sequence is, cpu in idle state when the first frame coming, then disable cpu idle until protocols' timeout, cpu in idle state again, the first frame can't be decoded.
> The second frame coming, it will repeat the behavior of the first frame, may cause the second frame can't be decode......
> 
> Can you take account of I have done in the first version, autosuspend delay time is set to 125ms?

Yes, in retrospect you are right. Trying to shorten the cpuidle suspended
period will not work. I am sorry about this.

How about setting the autosuspend period in devicetree, and 0 will turn
this feature off completely?

Thanks,

Sean
