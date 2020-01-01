Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2623912DFBD
	for <lists+linux-media@lfdr.de>; Wed,  1 Jan 2020 18:28:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbgAAR2p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jan 2020 12:28:45 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43550 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727215AbgAAR2p (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jan 2020 12:28:45 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16497516;
        Wed,  1 Jan 2020 18:28:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1577899723;
        bh=u6UQvtxASWHHS98zayG3UpaqfxUzm1Mm80eyeU/xmRk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hzDwoFMZhgsXNgAR07SPfUuT4q0jzmFBXqitvXOiqDS1u/VpFrzAf917qU5kYcMLJ
         fXcCcwGQCBWZGU8ns7S2S/tkoh5xriPqRw4kiTm5i/DY6lokm+KRE35otQcIlTOB//
         7QqGPiD9npPfZYgxhuUMSUxa8Dj2jf5pS8pmPA1E=
Date:   Wed, 1 Jan 2020 19:28:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jun Chen <ptchentw@gmail.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jun Chen <jun.chen@vatics.com>
Subject: Re: [PATCH] media: uvcvideo: Fix annotation for
 uvc_video_clock_update()
Message-ID: <20200101172833.GG6226@pendragon.ideasonboard.com>
References: <1577241257-9203-1-git-send-email-ptchentw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1577241257-9203-1-git-send-email-ptchentw@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Jun,

Thank you for the patch.

On Wed, Dec 25, 2019 at 10:34:17AM +0800, Jun Chen wrote:
> From: Jun Chen <jun.chen@vatics.com>
> 
> The formula (2) is to convert from SOF to host clock,
> it should be fix as
> "TS = ((TS2 - TS1) * SOF + TS1 * SOF2 - TS2 * SOF1) / (SOF2 - SOF1)"
> 
> Signed-off-by: Jun Chen <jun.chen@vatics.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree.

> ---
>  drivers/media/usb/uvc/uvc_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 8fa77a8..a3150da 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -622,7 +622,7 @@ static u16 uvc_video_clock_host_sof(const struct uvc_clock_sample *sample)
>   * to avoid losing precision in the division. Similarly, the host timestamp is
>   * computed with
>   *
> - * TS = ((TS2 - TS1) * PTS + TS1 * SOF2 - TS2 * SOF1) / (SOF2 - SOF1)	     (2)
> + * TS = ((TS2 - TS1) * SOF + TS1 * SOF2 - TS2 * SOF1) / (SOF2 - SOF1)	     (2)
>   *
>   * SOF values are coded on 11 bits by USB. We extend their precision with 16
>   * decimal bits, leading to a 11.16 coding.

-- 
Regards,

Laurent Pinchart
