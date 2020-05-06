Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 390AA1C6DAB
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 11:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbgEFJxi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 05:53:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:54818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726935AbgEFJxi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 05:53:38 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C858E20675;
        Wed,  6 May 2020 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588758817;
        bh=yK1gjdZS0Srj87jx8pvuq5JCVjt0QZZVJoOXa11JYqo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NoD574Mg83E9HSqUmpspf5vb4WMnoetKuOYl1OkKNxZHZF3s+N5vFp2wfe2bnsmg3
         S1PR1ctmApdSiZfKmZ+/Xe1dfRAp9idPp7oSayVRMF/WVolVMDTwVUwBLFwbwUpuit
         kwCMDocNK5pa6QHqiMT8sePidVOm8IjKske6YCYg=
Date:   Wed, 6 May 2020 11:53:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v8.1 3/6] media: v4l2: Extend VIDIOC_ENUM_FMT to support
 MC-centric devices
Message-ID: <20200506115332.3e7e9a58@coco.lan>
In-Reply-To: <1bdd6780-5862-88b2-b2ed-d9ce03388f67@xs4all.nl>
References: <20200421135743.1381930-4-niklas.soderlund+renesas@ragnatech.se>
        <20200424134331.22271-1-laurent.pinchart@ideasonboard.com>
        <20200429182739.274ce451@coco.lan>
        <20200429163849.GK5956@pendragon.ideasonboard.com>
        <20200429200140.22a4db22@coco.lan>
        <20200429185033.GN5956@pendragon.ideasonboard.com>
        <20200429200808.GK9190@paasikivi.fi.intel.com>
        <1bdd6780-5862-88b2-b2ed-d9ce03388f67@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 5 May 2020 16:27:25 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> "The enumerated formats may depend on the active input or output of the device."
> 
> with:
> 
> "After switching to another input or output the list of enumerated formats
>  may be different."
>

This change sounds OK to me as well. It should be clear that this applies
to video node centric devices, though.

Thanks,
Mauro
