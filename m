Return-Path: <linux-media+bounces-14411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6137791D081
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 10:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC0BDB21128
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 08:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8713912C475;
	Sun, 30 Jun 2024 08:24:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D7D127E37
	for <linux-media@vger.kernel.org>; Sun, 30 Jun 2024 08:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719735857; cv=none; b=naB8O0/ED8NhlQFiyfCXDytyNvAPewHvXudDT92YMGGaKdttz/1CN4BSE1vF38ivL8Xm/MYwFXRzUYAvMJcpHDgN0MZmzyJ2fQwShYtMT7B5Msc9GptixZGdoRHOeViwILzS85akblqCLzZdf2p8oGrelCP+yV1+v0rmX8eflH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719735857; c=relaxed/simple;
	bh=xmjPDbSJpyC8wb7mfADZWGXOMrRmKI145PVDf5IZ1/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=C560kwzZVzPmgiJBzdm/aChE8eR4F0Z77QwnOeTrjEuaEg6apb0BUrGvaSNEwMSPjDeJp35DRQ/tI1c+Oq4OlTHNu1oALcEeAlPrHCtsAmlVdibNFUEMRYdNP1UfS5srU4G/HIZvlrCSW+zqIj7P4qEukEgM3G88yX8u/l2gDho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3196CC2BD10;
	Sun, 30 Jun 2024 08:24:16 +0000 (UTC)
Message-ID: <7eb4a07b-950b-4ded-ad0c-43da19c5caf4@xs4all.nl>
Date: Sun, 30 Jun 2024 10:24:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] v4l-utils: fix formats under ppc/mips64
To: Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20240610212316.136612-1-rosenp@gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240610212316.136612-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Rosen,

On 10/06/2024 23:23, Rosen Penev wrote:
> By default, these platforms use long instead of long long for __u64.
> __SANE_USERSPACE_TYPES__ fixes -Wformat warnings.

I think this needs a more extensive commit message.

See e.g. https://lists.openembedded.org/g/openembedded-core/message/46881
(found after googling for __SANE_USERSPACE_TYPES__).

> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  contrib/xc3028-firmware/firmware-tool.c | 2 ++
>  include/linux/compiler.h                | 1 +
>  utils/cec-compliance/cec-compliance.h   | 2 ++
>  utils/cec-ctl/cec-ctl.cpp               | 2 ++
>  utils/cec-ctl/cec-ctl.h                 | 2 ++
>  utils/cec-ctl/cec-pin.cpp               | 2 ++
>  utils/cec-follower/cec-processing.cpp   | 2 ++
>  utils/common/v4l2-info.h                | 2 ++
>  utils/cx18-ctl/cx18-ctl.c               | 2 ++
>  utils/ivtv-ctl/ivtv-ctl.c               | 2 ++
>  utils/keytable/keytable.c               | 2 ++
>  utils/media-ctl/media-ctl.c             | 2 ++
>  utils/v4l2-compliance/v4l2-compliance.h | 2 ++
>  utils/v4l2-ctl/v4l2-ctl-common.cpp      | 2 ++
>  utils/v4l2-ctl/v4l2-ctl-streaming.cpp   | 2 ++
>  utils/v4l2-ctl/v4l2-ctl.cpp             | 2 ++
>  utils/v4l2-ctl/v4l2-ctl.h               | 2 ++
>  utils/v4l2-dbg/v4l2-dbg.cpp             | 2 ++
>  18 files changed, 35 insertions(+)
> 
> diff --git a/contrib/xc3028-firmware/firmware-tool.c b/contrib/xc3028-firmware/firmware-tool.c
> index 5dd205e0..6bcb3237 100644
> --- a/contrib/xc3028-firmware/firmware-tool.c
> +++ b/contrib/xc3028-firmware/firmware-tool.c
> @@ -29,6 +29,8 @@
>  #include <string.h>
>  #include <unistd.h>
>  
> +#include "linux/compiler.h"
> +
>  #include <asm/byteorder.h>
>  #include <asm/types.h>
>  
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index 379629be..5a6326f8 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -1,6 +1,7 @@
>  #ifndef __linux_compiler_h
>  #define __linux_compiler_h
>  
> +#define __SANE_USERSPACE_TYPES__

This needs a comment as well.

Regards,

	Hans

>  #define __user
>  
>  #endif
> diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
> index aae72842..d5bd1d0a 100644
> --- a/utils/cec-compliance/cec-compliance.h
> +++ b/utils/cec-compliance/cec-compliance.h
> @@ -8,6 +8,8 @@
>  #ifndef _CEC_COMPLIANCE_H_
>  #define _CEC_COMPLIANCE_H_
>  
> +#include "linux/compiler.h"
> +
>  #include <linux/cec-funcs.h>
>  #include "cec-htng-funcs.h"
>  
> diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
> index 8848a49d..69aeb8cd 100644
> --- a/utils/cec-ctl/cec-ctl.cpp
> +++ b/utils/cec-ctl/cec-ctl.cpp
> @@ -20,6 +20,8 @@
>  #include <sys/time.h>
>  #include <unistd.h>
>  
> +#include "linux/compiler.h"
> +
>  #include <linux/cec-funcs.h>
>  #include "cec-htng-funcs.h"
>  #include "cec-log.h"
> diff --git a/utils/cec-ctl/cec-ctl.h b/utils/cec-ctl/cec-ctl.h
> index 2c82bedc..e0692c31 100644
> --- a/utils/cec-ctl/cec-ctl.h
> +++ b/utils/cec-ctl/cec-ctl.h
> @@ -6,6 +6,8 @@
>  #ifndef _CEC_CTL_H_
>  #define _CEC_CTL_H_
>  
> +#include "linux/compiler.h"
> +
>  #include <cec-info.h>
>  
>  // cec-ctl.cpp
> diff --git a/utils/cec-ctl/cec-pin.cpp b/utils/cec-ctl/cec-pin.cpp
> index f3500555..0cdc19f7 100644
> --- a/utils/cec-ctl/cec-pin.cpp
> +++ b/utils/cec-ctl/cec-pin.cpp
> @@ -3,6 +3,8 @@
>   * Copyright 2017 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> +#include "linux/compiler.h"
> +
>  #include <string>
>  
>  #include <linux/cec.h>
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index 14ee211b..3b5c3ce5 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -3,6 +3,8 @@
>   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> +#include "linux/compiler.h"
> +
>  #include <cerrno>
>  #include <ctime>
>  #include <string>
> diff --git a/utils/common/v4l2-info.h b/utils/common/v4l2-info.h
> index ac227971..eeb7bc6b 100644
> --- a/utils/common/v4l2-info.h
> +++ b/utils/common/v4l2-info.h
> @@ -8,6 +8,8 @@
>  
>  #include <string>
>  
> +#include "linux/compiler.h"
> +
>  #include <linux/videodev2.h>
>  #include <linux/v4l2-subdev.h>
>  
> diff --git a/utils/cx18-ctl/cx18-ctl.c b/utils/cx18-ctl/cx18-ctl.c
> index 8586f72d..7c13b1a3 100644
> --- a/utils/cx18-ctl/cx18-ctl.c
> +++ b/utils/cx18-ctl/cx18-ctl.c
> @@ -34,6 +34,8 @@
>  #include <sys/time.h>
>  #include <math.h>
>  
> +#include "linux/compiler.h"
> +
>  #include <linux/videodev2.h>
>  #include <v4l-getsubopt.h>
>  
> diff --git a/utils/ivtv-ctl/ivtv-ctl.c b/utils/ivtv-ctl/ivtv-ctl.c
> index b42b3489..bf36f40b 100644
> --- a/utils/ivtv-ctl/ivtv-ctl.c
> +++ b/utils/ivtv-ctl/ivtv-ctl.c
> @@ -34,6 +34,8 @@
>  #include <sys/time.h>
>  #include <math.h>
>  
> +#include "linux/compiler.h"
> +
>  #include <linux/videodev2.h>
>  #include <v4l-getsubopt.h>
>  
> diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
> index b6474d5c..a726921a 100644
> --- a/utils/keytable/keytable.c
> +++ b/utils/keytable/keytable.c
> @@ -12,6 +12,8 @@
>     GNU General Public License for more details.
>   */
>  
> +#include "linux/compiler.h"
> +
>  #include <ctype.h>
>  #include <errno.h>
>  #include <fcntl.h>
> diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
> index 1a9e393a..b180185f 100644
> --- a/utils/media-ctl/media-ctl.c
> +++ b/utils/media-ctl/media-ctl.c
> @@ -34,6 +34,8 @@
>  #include <string.h>
>  #include <unistd.h>
>  
> +#include "linux/compiler.h"
> +
>  #include <linux/media.h>
>  #include <linux/types.h>
>  #include <linux/v4l2-mediabus.h>
> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
> index 3517bd07..2c2b2158 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.h
> +++ b/utils/v4l2-compliance/v4l2-compliance.h
> @@ -26,6 +26,8 @@
>  #include <string>
>  #include <cstdint>
>  
> +#include "linux/compiler.h"
> +
>  #include <linux/videodev2.h>
>  #include <linux/v4l2-subdev.h>
>  #include <linux/media.h>
> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> index 1f9cd0fb..ea120eb8 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> @@ -9,6 +9,8 @@
>  #include <sys/stat.h>
>  #include <sys/sysmacros.h>
>  
> +#include "linux/compiler.h"
> +
>  #include <linux/media.h>
>  
>  #include "v4l2-ctl.h"
> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> index 13bc057d..7af62ec8 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> @@ -3,6 +3,8 @@
>  #include <netdb.h>
>  #include <sys/types.h>
>  
> +#include "linux/compiler.h"
> +
>  #include <linux/media.h>
>  
>  #include "compiler.h"
> diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
> index a64fa514..d8a6c617 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl.cpp
> @@ -27,6 +27,8 @@
>  #include <getopt.h>
>  #include <sys/epoll.h>
>  
> +#include "linux/compiler.h"
> +
>  #include <linux/media.h>
>  
>  #include "v4l2-ctl.h"
> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> index a1911e80..fd1bd24a 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.h
> +++ b/utils/v4l2-ctl/v4l2-ctl.h
> @@ -1,6 +1,8 @@
>  #ifndef _V4L2_CTL_H
>  #define _V4L2_CTL_H
>  
> +#include "linux/compiler.h"
> +
>  #include <cstdint>
>  #include <linux/videodev2.h>
>  #include <linux/v4l2-subdev.h>
> diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
> index bd08b4cf..1b0d278a 100644
> --- a/utils/v4l2-dbg/v4l2-dbg.cpp
> +++ b/utils/v4l2-dbg/v4l2-dbg.cpp
> @@ -31,6 +31,8 @@
>  #include <sys/klog.h>
>  #endif
>  
> +#include "linux/compiler.h"
> +
>  #include <linux/videodev2.h>
>  #include <v4l-getsubopt.h>
>  


