Return-Path: <linux-media+bounces-1090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F437F9EBB
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 12:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21423B20FE1
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 11:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A291A702;
	Mon, 27 Nov 2023 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id EC2F4186
	for <linux-media@vger.kernel.org>; Mon, 27 Nov 2023 03:36:55 -0800 (PST)
Received: from [192.168.4.14] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id B0E1C51407;
	Mon, 27 Nov 2023 12:36:53 +0100 (CET)
Message-ID: <22c04a23-63b9-4e62-8094-ab194c1796ea@gpxsee.org>
Date: Mon, 27 Nov 2023 12:36:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT FIXES FOR v6.7] Two mgb4 fixes and one v4l2-subdev.h fix
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: =?UTF-8?Q?Martin_T=C5=AFma?= <martin.tuma@digiteqautomotive.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <e8f53c2c-aaa6-4878-befe-230b91933297@xs4all.nl>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <e8f53c2c-aaa6-4878-befe-230b91933297@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,
It has been a while since those patches have been accepted by Hans but I 
still do not see them in media_tree.git or media_stage.git. Is there 
some problem with the patches that I didn't notice or is it just they 
haven't yet been processed? Thanks for any info.

M.

On 16. 11. 23 9:42, Hans Verkuil wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>    Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>    git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.7a
> 
> for you to fetch changes up to 823d64edba8784e7c490a05a48eea0f01fa628f6:
> 
>    media: pci: mgb4: add COMMON_CLK dependency (2023-11-16 09:37:01 +0100)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>        media: pci: mgb4: add COMMON_CLK dependency
> 
> Dan Carpenter (1):
>        media: v4l2-subdev: Fix a 64bit bug
> 
> Martin Tůma (1):
>        media: mgb4: Added support for T200 card variant
> 
>   drivers/media/pci/mgb4/Kconfig     |  1 +
>   drivers/media/pci/mgb4/mgb4_core.c | 20 +++++++++++++++-----
>   include/uapi/linux/v4l2-subdev.h   |  2 +-
>   3 files changed, 17 insertions(+), 6 deletions(-)
> 


