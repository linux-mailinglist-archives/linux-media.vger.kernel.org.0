Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCC277066AE
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 13:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbjEQL37 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 17 May 2023 07:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbjEQL36 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 07:29:58 -0400
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F10D130F6
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 04:29:55 -0700 (PDT)
Received: from [10.0.0.124] ([31.10.206.125]) by mrelay.perfora.net
 (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MGknn-1pv4Gk3wxN-00Dal9;
 Wed, 17 May 2023 13:24:08 +0200
Message-ID: <7b015114450646f6ead6bdfbe9301e3bbf596d05.camel@ziswiler.com>
Subject: Re: [PATCH v2 00/31] Separate links and async sub-devices
From:   Marcel Ziswiler <marcel@ziswiler.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Date:   Wed, 17 May 2023 13:24:01 +0200
In-Reply-To: <2234496be65fd2a5aeccac278f6c37ddf104514e.camel@pengutronix.de>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
         <2234496be65fd2a5aeccac278f6c37ddf104514e.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.1 (by Flathub.org) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:qS3xEpDyCqzMHJo0tBG4yt62uV84WDyLWiHRhLMPnN7yXjFX591
 encqLJCErI6C72pwGuRhOXmp0DCNEz1SIZVNBqccXtvGL731G1FbHZyEETpWw2cyflQe8hX
 mGg5oLshVJLLvvuN6Ob4KskGEnX2aMkbAl9YMQLahIMJVB2B7cvQzPFPCFTqTsKnVdV2Ixa
 jie9E2FYdoC5QvjgnfVbA==
UI-OutboundReport: notjunk:1;M01:P0:HvfRuw1dPi0=;tK34FG1LsHqg1YZm67Uu+XUQsuL
 PBL1ln1AKqFNo9BtZ4KZ9V2f7Drx0SVnD5AtcFvXM0ZTV8OT4/jS4uEISnMNQlGAvJgf4LboL
 Z3sGo4euzuc4VuNv2AAsiZuDqL5sRHtYeEf0/I7npCRSlMcAk8KFiQ1gV9/B+bUDoVICSb+Rg
 g5YQZlIxl84cMHaYhuJYnM7ruh6kAF/Cd0t6N1q+FG9VIGnyFud8THSkmwVdM/6qsdavDr8O2
 DnuvlQ01Jeh55It7w983ih3jx2Uq2HpqC21gMMRBRmtGfqDVZQMd07T/1eviaZGjn4+9cfdhz
 xbc8lRR1bCBIXouduUuQ5+j7D84TqRcsVZiu6chECXOfwBm7h1mVjV6t1vkHAIEZABeYElEIJ
 X6n8Z9FQ5MRaYCoDN7Xa4+BIEDBjlVaerCjlILM7VxuJJ7aU8lGnzQHSCrKyalKHXJBoaoF+Q
 03D6zNR57uThkjfgx+mOblc8cQHTs3XW3m0zJE0DV9wzHZlO32+Z/NuQWKtUGQ6kJa3gIreDS
 wkt571tgtDal7+uq6T1cDhwO2zsFbWHiqs4aR2DfEybMYFJOJdOxKOHVLQzzCdWWEIQpWHH8c
 mDtcaBUU/qjGKvsyGWH0epH89vi7l+eUlC87aCyvJrYrBHFIgn81smD76Q3vOnD7oSipBcQ5D
 sUKFQfhLTUvi1widAXKyHF3L29CtcZnPRAjvA0RNZQ==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp

On Wed, 2023-05-17 at 11:43 +0200, Philipp Zabel wrote:
> Hi Sakari,
> 
> On Di, 2023-05-16 at 12:54 +0300, Sakari Ailus wrote:
> > Hi all,
> > 
> > This set adds support for multiple downstream links in an async
> > sub-device, by separating the sub-device registration from the link
> > creation.
> 
> thank you, capture works again on i.MX6QP (tested with TC358764).

You probably meant TC358743 being HDMI/CSI as TC358764 is DSI/LVDS, right?

> Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp

Thanks!

> regards
> Philipp

Cheers

Marcel
