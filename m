Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD34B26C728
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 20:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgIPSUN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 14:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727907AbgIPSUG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 14:20:06 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7481EC061756;
        Wed, 16 Sep 2020 11:20:00 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id CDB6DC63F3; Wed, 16 Sep 2020 19:19:54 +0100 (BST)
Date:   Wed, 16 Sep 2020 19:19:54 +0100
From:   Sean Young <sean@mess.org>
To:     Joakim Zhang <qiangqing.zhang@nxp.com>
Cc:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Andy Duan <fugang.duan@nxp.com>
Subject: Re: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle
 system
Message-ID: <20200916181954.GA27005@gofer.mess.org>
References: <20200915150202.24165-1-qiangqing.zhang@nxp.com>
 <20200915093342.GA24139@gofer.mess.org>
 <DB8PR04MB67951DE19DD876721093AED4E6200@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <20200915201947.GA4019@gofer.mess.org>
 <DB8PR04MB679586E9818080C0ED804848E6210@DB8PR04MB6795.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB8PR04MB679586E9818080C0ED804848E6210@DB8PR04MB6795.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joakim,

On Wed, Sep 16, 2020 at 10:22:11AM +0000, Joakim Zhang wrote:
> 
> Hi Sean,
> 
> Thanks for your hint, I will send a V2 soon according to your suggestions.
> 
> We also have a concern, since you are a IR expert, may you can give us answers. With this patch, the first frame once press could not been decoded.
> AFAIK, IR protocols have not specify how may frames transmitting once press, is there ang criterion to decide this?
> 
> Is it possible that single frame transmitting once pressing? Per my understanding, it will transmit more than one frame.

So remotes send IR signals while a button is being pressed down. For the
remotes I've seen, when pressing a button a short amount of time will repeat
the IR message at least three times. This is a few times when I've tried
this, but by no means exhaustive of all remotes or protocols.

I think the question you are trying to answer is, if we miss the first
message, will we at least have another chance if the message is repeated?

So I think the message will be repeated, but the repeat message is not
enough for the nec protocol. The nec repeat is a shorter message which
does not carry any information apart from "last key still pressed":

https://www.sbprojects.net/knowledge/ir/nec.php

Thanks,

Sean
