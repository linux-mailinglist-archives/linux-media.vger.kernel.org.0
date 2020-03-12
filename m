Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2F118354D
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 16:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgCLPpg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 11:45:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:52870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727729AbgCLPpf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 11:45:35 -0400
Received: from coco.lan (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 553672067C;
        Thu, 12 Mar 2020 15:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584027935;
        bh=OUpt6j7Pzh/svOdSmDhS9hkfvYHoOfsbbS3pYuOL7p0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=k79YPItDcJV5gYVHF7rLcIQpCgeW3Em0KKcTnHDl5C6mLP6642ob/8QRl0m6qurMy
         DawIg0VflX/ffwMTKXPMN/mCOwnWRDPe1s7czTanp/MNCBd4Owts7JSRQJS0P4iTGW
         Rw2k249Wwg08ChF2wMYdBHgD//gn210L2fEgghMs=
Date:   Thu, 12 Mar 2020 16:45:30 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [GIT PULL FOR v5.7] TVP5150 Features and Fixes
Message-ID: <20200312164530.101bd31c@coco.lan>
In-Reply-To: <76233d4e-2085-1a1a-86ad-0799292b419f@xs4all.nl>
References: <76233d4e-2085-1a1a-86ad-0799292b419f@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 12 Mar 2020 12:29:07 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> This finally landed!

Congrats!

This was waiting for a really long time to be matured. So, I went ahead and
reviewed/applied the patches today.

PS.: I'm currently unable to test it with my tvp5150 devices.

One minor issue: the DT bindings are still using the .txt format. 

Marco,

Could you please send us a followup patch converting it to the new
yaml format?

Thanks,
Mauro

> 
> Regards,
> 
> 	Hans
> 
> The following changes since commit eceeea5481d4eeb6073e8ccb2f229bb0dd14a44d:
> 
>   media: lmedm04: remove redundant assignment to variable gate (2020-03-12 09:47:33 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7g
> 
> for you to fetch changes up to 16ea6c19e137314b760241625437bafb97fb31e4:
> 
>   media: tvp5150: make debug output more readable (2020-03-12 11:55:00 +0100)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Javier Martinez Canillas (1):
>       partial revert of "[media] tvp5150: add HW input connectors support"
> 
> Marco Felsch (19):
>       dt-bindings: connector: analog: add sdtv standards property
>       dt-bindings: display: add sdtv-standards defines
>       media: v4l: link dt-bindings and uapi
>       media: v4l2-fwnode: fix v4l2_fwnode_parse_link handling
>       media: v4l2-fwnode: simplify v4l2_fwnode_parse_link
>       media: v4l2-fwnode: add endpoint id field to v4l2_fwnode_link
>       media: v4l2-fwnode: add v4l2_fwnode_connector
>       media: v4l2-fwnode: add initial connector parsing support
>       media: tvp5150: add input source selection of_graph support
>       media: dt-bindings: tvp5150: Add input port connectors DT bindings
>       media: tvp5150: fix set_selection rectangle handling
>       media: tvp5150: add FORMAT_TRY support for get/set selection handlers
>       media: tvp5150: move irq en-/disable into runtime-pm ops
>       media: tvp5150: add v4l2-event support
>       media: tvp5150: add subdev open/close callbacks
>       media: dt-bindings: tvp5150: cleanup bindings stlye
>       media: dt-bindings: tvp5150: add optional sdtv standards documentation
>       media: tvp5150: add support to limit sdtv standards
>       media: tvp5150: make debug output more readable
> 
> Michael Tretter (1):
>       media: tvp5150: initialize subdev before parsing device tree
> 
>  Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt |   6 +
>  Documentation/devicetree/bindings/media/i2c/tvp5150.txt                     | 146 ++++++++--
>  drivers/media/i2c/tvp5150.c                                                 | 802 +++++++++++++++++++++++++++++++++++++++++------------
>  drivers/media/v4l2-core/v4l2-fwnode.c                                       | 192 +++++++++++--
>  include/dt-bindings/display/sdtv-standards.h                                |  76 +++++
>  include/dt-bindings/media/tvp5150.h                                         |   2 -
>  include/media/v4l2-fwnode.h                                                 | 143 ++++++++++
>  include/uapi/linux/videodev2.h                                              |   4 +
>  8 files changed, 1156 insertions(+), 215 deletions(-)
>  create mode 100644 include/dt-bindings/display/sdtv-standards.h



Thanks,
Mauro
