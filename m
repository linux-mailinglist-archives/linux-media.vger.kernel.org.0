Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E42D1C6D9E
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 11:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729278AbgEFJvM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 05:51:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:53250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729272AbgEFJvL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 05:51:11 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 48DFF20714;
        Wed,  6 May 2020 09:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588758671;
        bh=eFSAdEyNLaZ5Qf7bi+0cJ2c4tWl25iLiNx8S35xmpKU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hAIwJpbu7bRiEq8IU40nZgRTF5/zqV+vxd97m+XNzpPX9KyNUOoF6z7XT1uop1zGP
         5Jezr82DnT5rlQ2xQEDzcplZ822LgOxuZxn2cwwEK7bpz6ypORxgO/Jy/oC+owmKXA
         4ySj1qxWkAw7jNd1k4rj2/LqnYRPjvTw/PiGohwk=
Date:   Wed, 6 May 2020 11:51:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v8.1 3/6] media: v4l2: Extend VIDIOC_ENUM_FMT to support
 MC-centric devices
Message-ID: <20200506115106.745e03aa@coco.lan>
In-Reply-To: <20200429200808.GK9190@paasikivi.fi.intel.com>
References: <20200421135743.1381930-4-niklas.soderlund+renesas@ragnatech.se>
        <20200424134331.22271-1-laurent.pinchart@ideasonboard.com>
        <20200429182739.274ce451@coco.lan>
        <20200429163849.GK5956@pendragon.ideasonboard.com>
        <20200429200140.22a4db22@coco.lan>
        <20200429185033.GN5956@pendragon.ideasonboard.com>
        <20200429200808.GK9190@paasikivi.fi.intel.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 29 Apr 2020 23:08:08 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> > I could settle for
> > 
> >    These devices don't advertise the ``V4L2_CAP_IO_MC`` :ref:`capability
> >    <device-capabilities>`. Applications shall initialize the ``mbus_code`` field
> >    to zero and drivers shall ignore the value of the field.
> > 
> > and similarly below. It bothers me though, as "bridge" isn't formally
> > defined anywhere in the userspace API documentation. It's more formal to
> > explain the behaviour of individual ioctls based solely on the
> > V4L2_CAP_IO_MC flag, and gather all the explanation of what
> > bridge-centric vs. MC-centric means in a single place, an introductory  
> 
> How about "video node centric"? 

Works for me.

Thanks,
Mauro
