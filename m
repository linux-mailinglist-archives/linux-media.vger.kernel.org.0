Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 481212F7C91
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 14:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732577AbhAON0t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 08:26:49 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:40478 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730617AbhAON0t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 08:26:49 -0500
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id BD7343B26DE;
        Fri, 15 Jan 2021 13:19:38 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1990160008;
        Fri, 15 Jan 2021 13:18:56 +0000 (UTC)
Date:   Fri, 15 Jan 2021 14:19:15 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        mchehab@kernel.org, hans.verkuil@cisco.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org
Subject: Re: [PATCH 2/3] media: videodev2.h: clarify
 v4l2_pix_format_mplane.sizeimage docs when to set to zero
Message-ID: <20210115131915.ad2io2lt7efi5hwu@uno.localdomain>
References: <20210114180149.1755892-1-helen.koike@collabora.com>
 <20210114180149.1755892-3-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210114180149.1755892-3-helen.koike@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen

On Thu, Jan 14, 2021 at 03:01:48PM -0300, Helen Koike wrote:
> sizeimage field should be set to zero for unused planes, even when
> v4l2_pix_format_mplane.num_planes is smaller then the index of planes.
>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>
> ---
>
> I caught this with v4l2-compliance, which throws an error if we dirty
> planes, even if invalid, so I would like to make it clear in the docs.
> ---
>  include/uapi/linux/videodev2.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 79dbde3bcf8d..d9b7c9177605 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -2227,6 +2227,7 @@ struct v4l2_mpeg_vbi_fmt_ivtv {
>   * struct v4l2_plane_pix_format - additional, per-plane format definition
>   * @sizeimage:		maximum size in bytes required for data, for which
>   *			this plane will be used
> + *			Drivers should be set it zero for unused planes.

s/should be/should/ ?

And possibly a full stop at the end of the previous sentence

Thanks
  j

>   * @bytesperline:	distance in bytes between the leftmost pixels in two
>   *			adjacent lines
>   */
> --
> 2.29.2
>
