Return-Path: <linux-media+bounces-37046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E39CAAFBD03
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 23:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B1B84A6E24
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 21:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C7E27FD51;
	Mon,  7 Jul 2025 21:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCS4dlVm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3886E27E04F;
	Mon,  7 Jul 2025 21:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751922040; cv=none; b=T4LrJQJuLF75DF984Z7gFGxkLeeOdxpnqPYG5gW9LR+aLvnAjOpscSJmJj9nqAhUDwk58PQZwrQLk9aEbrdhmew5s49aDAtkMvvbKZbKa8Q4KeFJ5UIqiiPhqEXpvD8f21XpH7xnFmUkvBrMuppmSOeanh421wEXa7vACLmUrTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751922040; c=relaxed/simple;
	bh=ly/B021ynYzPCz1B63mrRbLIIKOdCMkQUxYcm0H81YE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bu5v1HR72U8avCRHuHd7gudPkT9nXLRJQdJ+TUHcXxDEFQKpXPxsxdpnzuddeAb96ip8SCq21+touL4jXfMtZ0uqLqUPIWqsMTeYFDY94+RLZXtSl1bhsuctbKG3okCQBdTeWnEnsZEnmQ2XejUAXEchQPQNrdX7OtnOGHQHXQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCS4dlVm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01C2C4CEE3;
	Mon,  7 Jul 2025 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751922039;
	bh=ly/B021ynYzPCz1B63mrRbLIIKOdCMkQUxYcm0H81YE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bCS4dlVmb6G0eHO6gwM5KgLApXv+p1pvwi3tE8cLIzARq+1MaJZueScgTDRlYcKox
	 zyKGQU6239B8KB7wr9wlfoAYbfzN8jxl7L5jHmwjk0XLIK7zko5+LLcPe0TG6NerME
	 Bd+xw0KWwETD68YqKtNwnGITXWdoIX1y5ga7EZzVIZyUXi7MjodUcsAta15Kyafu6l
	 luTscLqYgBJ3WwZAJPwvzfptMsgc4yQAen2oFlqn94BJVGX5DZKnxdJ68vb/YRJTly
	 MqEzv/wggfp3NTFcU8QyTY3KY6rj8Vr4n6TLdaE1WHORP93dyDAZD7sxiUhzTth/HT
	 tPA7H9IOGYPjQ==
Message-ID: <54f9d2ee-5c04-4756-8695-54a9176ddac6@kernel.org>
Date: Mon, 7 Jul 2025 23:00:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5 + other meta fixes
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, stable@vger.kernel.org
References: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 7-Jul-25 8:34 PM, Ricardo Ribalda wrote:
> This series introduces a new metadata format for UVC cameras and adds a
> couple of improvements to the UVC metadata handling.
> 
> The new metadata format can be enabled in runtime with quirks.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v8:
> - Dynamically fill dev->meta_formats instead of be const.
> - Link to v7: https://lore.kernel.org/r/20250617-uvc-meta-v7-0-9c50623e2286@chromium.org

Thank you for the new version. I've merged this series
and pushed this to uvc/for-next now.

Regards,

Hans




> Changes in v7:
> - Add patch: Introduce dev->meta_formats
> - Link to v6: https://lore.kernel.org/r/20250604-uvc-meta-v6-0-7141d48c322c@chromium.org
> 
> Changes in v6 (Thanks Laurent):
> - Fix typo in metafmt-uvc.rst
> - Improve metafmt-uvc-msxu-1-5.rst
> - uvc_meta_v4l2_try_format() block MSXU format unless the quirk is
>   active
> - Refactor uvc_enable_msxu
> - Document uvc_meta_detect_msxu
> - Rebase series
> - Add R-b
> - Link to v5: https://lore.kernel.org/r/20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org
> 
> Changes in v5:
> - Fix codestyle and kerneldoc warnings reported by media-ci
> - Link to v4: https://lore.kernel.org/r/20250403-uvc-meta-v4-0-877aa6475975@chromium.org
> 
> Changes in v4:
> - Rename format to V4L2_META_FMT_UVC_MSXU_1_5 (Thanks Mauro)
> - Flag the new format with a quirk.
> - Autodetect MSXU devices.
> - Link to v3: https://lore.kernel.org/linux-media/20250313-uvc-metadata-v3-0-c467af869c60@chromium.org/
> 
> Changes in v3:
> - Fix doc syntax errors.
> - Link to v2: https://lore.kernel.org/r/20250306-uvc-metadata-v2-0-7e939857cad5@chromium.org
> 
> Changes in v2:
> - Add metadata invalid fix
> - Move doc note to a separate patch
> - Introduce V4L2_META_FMT_UVC_CUSTOM (thanks HdG!).
> - Link to v1: https://lore.kernel.org/r/20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org
> 
> ---
> Ricardo Ribalda (5):
>       media: uvcvideo: Do not mark valid metadata as invalid
>       media: Documentation: Add note about UVCH length field
>       media: uvcvideo: Introduce dev->meta_formats
>       media: uvcvideo: Introduce V4L2_META_FMT_UVC_MSXU_1_5
>       media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
> 
>  .../userspace-api/media/v4l/meta-formats.rst       |   1 +
>  .../media/v4l/metafmt-uvc-msxu-1-5.rst             |  23 +++++
>  .../userspace-api/media/v4l/metafmt-uvc.rst        |   4 +-
>  MAINTAINERS                                        |   1 +
>  drivers/media/usb/uvc/uvc_driver.c                 |   7 ++
>  drivers/media/usb/uvc/uvc_metadata.c               | 115 +++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_video.c                  |  12 +--
>  drivers/media/usb/uvc/uvcvideo.h                   |   7 ++
>  drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
>  include/linux/usb/uvc.h                            |   3 +
>  include/uapi/linux/videodev2.h                     |   1 +
>  11 files changed, 161 insertions(+), 14 deletions(-)
> ---
> base-commit: a8598c7de1bcd94461ca54c972efa9b4ea501fb9
> change-id: 20250403-uvc-meta-e556773d12ae
> 
> Best regards,


