Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF930361C4F
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 11:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241379AbhDPIst (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 04:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241157AbhDPIsQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 04:48:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 450FCC061574
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 01:47:50 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 692F45A5;
        Fri, 16 Apr 2021 10:47:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618562867;
        bh=g18ZgWGK92lj8vwnXFVIos34/2Fmk6wjEVn2VMUVvOo=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=dBjxi6lEmGxycfr+u8NkcE4B2TAz+NlCeQj0Mhk1RYNhV8PTHUjM211MHMAD2zqMz
         UXXpbKTLnlm2Ff51BbOWuAYvX87O9BxS4OHEgGFq/vHMbsemkcTA9n1Bm8Zwc7u5sq
         oGGLxvj3Ojtz9a83W38WRADg2I/DtA91SuGQfwKs=
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <YHlND8NhEs+lkDZB@oden.dyn.berto.se>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v5 00/24] v4l: subdev internal routing
Message-ID: <2ed56266-2613-c1d2-bde0-989769264050@ideasonboard.com>
Date:   Fri, 16 Apr 2021 11:47:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHlND8NhEs+lkDZB@oden.dyn.berto.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 16/04/2021 11:38, Niklas Söderlund wrote:
> Hi Tomi,
> 
> I'm very happy to see this being worked on again!
> 
> Is there code somewhere that demonstrates the v5 API in use? I still
> have old branches of this series and it would be nice to see how the API
> have evolved for drivers.
> 
> Likewise are there some user-space code around that can be used to test
> the API? For v2 and v3 I had some hack patches [1], do they still work?
> More likely they have gone stale by now :-)
> 
> 1. git://git.ragnatech.se/v4l-utils routing

Yes for both. I didn't share those as they're not in a presentable state =).

But, with the disclaimer that your eyes may bleed when reading the code:

git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git 
multistream/work

git://github.com/tomba/kmsxx.git multistream

On the kernel side, the CAL driver is in relatively good shape. UB960 
driver is somewhat messy but not totally horrible. OV10635 is horrible, 
as it's used to fake metadata stream even if the sensor doesn't really 
have such a thing.

For testing I have used kms++ with python bindings. My test script is 
py/tests/cam.py

The uAPI has changed as there's now the 'which' field. But I think 
that's the only clear change, although the behavior could be slightly 
different wrt. setting formats.

  Tomi
