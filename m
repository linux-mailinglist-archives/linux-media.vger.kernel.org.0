Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6047411CA
	for <lists+linux-media@lfdr.de>; Wed, 28 Jun 2023 14:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbjF1MzP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 08:55:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38040 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbjF1MxE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 08:53:04 -0400
Received: from [192.168.144.60] (90-182-211-1.rcp.o2.cz [90.182.211.1])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D41016C8;
        Wed, 28 Jun 2023 14:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687956743;
        bh=MdGMOK65aWlevzoUjFlSgzxLaB/B82cvbOvq4tP00VE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=hYF2dA6ON2lWdFssmZFD17gb/b/Cdp8ZVpRlv6zNDp4xtwmzCmOHB4Y8RRkeTtBjz
         QtjRzlAMkE2WubOi2OjqtU+1ppX5wXn5e5X6b11BKF4hlfAaj8FfTsFGIuEWpvEsRj
         xN3sxOTVfZ+AcrAbC9shynVZ+WBLSu3mZyN2ZL18=
Message-ID: <615910df-2db4-453c-249b-8d4a33bc0ca3@ideasonboard.com>
Date:   Wed, 28 Jun 2023 14:53:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 09/12] media: ipu3-cio2: Move cio2_bridge_init() code into
 a new shared intel-cio2-bridge.ko
To:     Andy Shevchenko <andy@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, Hao Yao <hao.yao@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
References: <20230627175643.114778-1-hdegoede@redhat.com>
 <20230627175643.114778-10-hdegoede@redhat.com>
 <ZJtMysrWwpKb7woL@smile.fi.intel.com>
Content-Language: en-US
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <ZJtMysrWwpKb7woL@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all

On 27/06/2023 22:55, Andy Shevchenko wrote:
> On Tue, Jun 27, 2023 at 07:56:39PM +0200, Hans de Goede wrote:
>> Move all the code implementing cio2_bridge_init() into a new shared
>> intel-cio2-bridge.ko, so that it can be reused by the atomisp driver
>> (and maybe also by the future IPU6 CSI2 driver).
>>
>> Note this just moves a bunch of stuff around prefixes some symbols /
>> defines with intel_ / INTEL_ no functional changes.
> ...
>
>> +EXPORT_SYMBOL(intel_cio2_bridge_init);
> Why not GPL?
> Perhaps namespace?
>
> ...
>
> Seems to me that name CIO2 in AtomISP case sounds a bit weird.
> Maybe ipu/isp should be used instead?
I agree here, since it's a specific device. But there's already some picked patches to turn the 
cio2-bridge into the ipu-bridge, so probably this needs to rebase on top of that work.
