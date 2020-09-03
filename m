Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12E7525C352
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 16:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729261AbgICOtL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 10:49:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:59572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729269AbgICOUj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Sep 2020 10:20:39 -0400
Received: from coco.lan (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 29E332071B;
        Thu,  3 Sep 2020 14:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599142838;
        bh=rfMf4IwbzJ0EV6DuPTyVvKduLxxQV4NKdAICOBP729Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pZ99Jn4Wo03Ms1/V4DtR16hxZ5rzUBNy1h61lUX5MrUYXQwB3rjUyBvg9uH/vn/lu
         4ibfdM0ZxbWjjZMIW57QNdr9RZBTfxUtuQ/ej4DsRgCe1KNS8ZhQcwkTZ4Wesq//j8
         UVB6CMkoYnZTC8NIlPOjzHZC8Lbqpnc2AuETFYjA=
Date:   Thu, 3 Sep 2020 16:20:35 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v5.10] DVB & RC fixes (v2)
Message-ID: <20200903162035.2642cda7@coco.lan>
In-Reply-To: <20200830122609.GA22247@gofer.mess.org>
References: <20200830122609.GA22247@gofer.mess.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 30 Aug 2020 13:26:10 +0100
Sean Young <sean@mess.org> escreveu:

> Hi Mauro,
> 
> I've tested most of my IR hardware to make sure this patch set does not
> regress.
> 
> Thanks,
> Sean
> 
> The following changes since commit 07d999f0d9463ea0d1f76e0f8921ea363d805767:
> 
>   media: open.rst: document mc-centric and video-node-centric (2020-08-29 10:41:03 +0200)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/syoung/media_tree.git tags/v5.10b
> 
> for you to fetch changes up to ee96e0b01023305386e8e6912c5ef47febce069f:
> 
>   media: rc: rename ir_lirc_* functions to lirc_* (2020-08-30 12:30:32 +0100)
> 
> ----------------------------------------------------------------
> v5.10b
> 
> ----------------------------------------------------------------
> Alex Bee (1):
>       media: dvb_usb_pctv452e: use ISL6423 voltage regulator per default
> 
> Jason Yan (1):
>       media: mxl5xx: remove unused including <linux/version.h>
> 
> Sean Young (3):
>       media: rc: rename lirc char dev region to "lirc"
>       media: rc: harmonize infrared durations to microseconds
>       media: rc: rename ir_lirc_* functions to lirc_*

Patches merged, thanks!

> Tom Rix (1):
>       media: dvb-frontends/cxd2099: report errors

I'm not sure if this patch is ok. So, I opted to not merge
this one for now.

Thanks,
Mauro
