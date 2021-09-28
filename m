Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC6CC41AC3E
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 11:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239973AbhI1JvR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 05:51:17 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:35569 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240001AbhI1JvR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 05:51:17 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 69926FF807;
        Tue, 28 Sep 2021 09:49:36 +0000 (UTC)
Date:   Tue, 28 Sep 2021 11:50:23 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Borut Lampe <nude.bird@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: OV5640 720p@60fps
Message-ID: <20210928095023.ezrmeivie3yr7su5@uno.localdomain>
References: <CAHfbzRsFzunBDNPbQt=HUx+cBSHdBzzrJ-s4bjj+bEoB2sNvqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHfbzRsFzunBDNPbQt=HUx+cBSHdBzzrJ-s4bjj+bEoB2sNvqw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Borut,
   which kind of setup are you working with, parallel or CSI-2 ?

On Thu, Sep 23, 2021 at 12:37:01PM +0200, Borut Lampe wrote:
> Hi,
>
> I noticed that for now only VGA resolution supports 60fps even though
> the documentation says that 60fps is possible also for 1280x720.
> Is there a reason this hasn't been implemented yet (e.g hardware
> restraints)? Are there any plans to implement this? Can anyone give me
> some pointers on what would have to be changed in the ov5640 driver to
> achieve this (starting point would be linaro kernel qcomlt-4.14)?
>
> Kind regards,
> Borut
