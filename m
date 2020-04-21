Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C6F1B2B31
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 17:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgDUPbG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 11:31:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:39362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbgDUPbF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 11:31:05 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 176B3206A2;
        Tue, 21 Apr 2020 15:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587483065;
        bh=B+qhYhs1NI+wK5JRTy+v09+PSidfojdfV0NzDFhRjS8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fWAdMORj8aSbjjUO652AJ50JpGZb1lT8NyKEcXIIFcVOKSpah64+up1BfJVlfcH5G
         MpmBki76WcRDA8RJKhkUTv1hizP5EDdzZSYx6P2fyQLugwWRhnqJN3HGIrNNvGq+Y5
         yiP5uI9CzLDhsaeiqYrQhdiuGm/BI9g2dKHQqVDU=
Date:   Tue, 21 Apr 2020 17:31:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL FOR v5.8] Various fixes/enhancements
Message-ID: <20200421173100.2f1f9471@coco.lan>
In-Reply-To: <6a56ccf7-4c26-b3ad-eb3a-0647944c2f95@xs4all.nl>
References: <6a56ccf7-4c26-b3ad-eb3a-0647944c2f95@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 17 Apr 2020 10:18:44 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> The following changes since commit ceab3ac1e60d70afb4e25147d60817c513f235f7:
> 
>   media: dvb-frontends: DUMMY_FE should depends on DVB_CORE (2020-04-17 09:21:47 +0200)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.8c
> 
> for you to fetch changes up to 0f72df4db95844184f49bbdfeaae013919c12c1b:
> 
>   dt-bindings: media: rockchip-rga: add power-domains property (2020-04-17 10:05:10 +0200)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Dafna Hirschfeld (8):
>       media: staging: rkisp1: remove mbus field from rkisp1_sensor_async
>       media: staging: rkisp1: replace the call to v4l2_async_notifier_parse_fwnode_endpoints_by_port
>       media: staging: rkisp1: cap: cleanup in mainpath config for uv swap format
>       media: staging: rkisp1: cap: fix value written to uv swap register in selfpath
>       media: staging: rkisp1: cap: change the logic for writing to uv swap register
>       media: staging: rkisp1: cap: support uv swap only for semiplanar formats
>       media: staging: rkisp1: cap: support uv swapped planar formats

There were two merge conflicts on rksip1 patches. The first one was
trivial, and I already addressed...

>       media: staging: rkisp1: cap: remove unsupported formats

But this one is not so trivial.

Dafna,

Please rebase this patch on the top of upstream and re-submit.


Thanks,
Mauro
