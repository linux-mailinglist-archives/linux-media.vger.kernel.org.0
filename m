Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B677128229F
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 10:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbgJCIq6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 04:46:58 -0400
Received: from gofer.mess.org ([88.97.38.141]:41167 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725763AbgJCIq6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 3 Oct 2020 04:46:58 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 62F49C63EB; Sat,  3 Oct 2020 09:46:56 +0100 (BST)
Date:   Sat, 3 Oct 2020 09:46:56 +0100
From:   Sean Young <sean@mess.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Joakim Zhang <qiangqing.zhang@nxp.com>, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH V3 1/2] bindings: media: gpio-ir-receiver: add
 linux,autosuspend-period property
Message-ID: <20201003084656.GA29917@gofer.mess.org>
References: <20200922190807.6830-1-qiangqing.zhang@nxp.com>
 <20200922190807.6830-2-qiangqing.zhang@nxp.com>
 <20200929155201.GA665464@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929155201.GA665464@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 29, 2020 at 10:52:01AM -0500, Rob Herring wrote:
> On Wed, Sep 23, 2020 at 03:08:06AM +0800, Joakim Zhang wrote:
> > Add linux,autosuspend-period property for gpio ir receiver. Some cpuidle
> > systems wake from idle may take a bit long time, for such case, need
> > disable cpuidle temporarily.
> > 
> > Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
> > ---
> > ChangeLogs:
> > V1->V2:
> > 	* New add.
> > V2->V3:
> > 	* linux,autosuspend-period = 125; -> linux,autosuspend-period = <125>;
> > ---
> >  Documentation/devicetree/bindings/media/gpio-ir-receiver.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt b/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
> > index 58261fb7b408..e1447c9b0e26 100644
> > --- a/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
> > +++ b/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
> > @@ -7,6 +7,8 @@ Required properties:
> >  Optional properties:
> >  	- linux,rc-map-name: see rc.txt file in the same
> >  	  directory.
> > +        - linux,autosuspend-period: autosuspend delay time,
> > +          the unit is milisecond.
> 
> What makes this linux specific?

Good point. "linux,autosuspend-period" does not say what is being
suspended either. How about "cpuidle-suspend-period" instead?


Sean
