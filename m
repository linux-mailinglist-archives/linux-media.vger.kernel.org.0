Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A452B4374
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 13:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729959AbgKPMRR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 07:17:17 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:53737 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727895AbgKPMRQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 07:17:16 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id edRWkeZad6LFvedRakPeQU; Mon, 16 Nov 2020 13:17:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605529034; bh=5YsjVRUrYFlDqEVpN4ZCTmQPMiFMh7C0h6B5YXQJqi4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LfAq7K6qwMyY2r2wT2j8SUgn446xDkODwTz2ZXGP59zG8NrSqeIjYHRbbO8Cx6ofs
         m3JtIEtb92i9prvpnIKOXBniViGSQL+55gLG6qUPCbH5qnBwIiPV80zz1Ht3qpl/sk
         NsT129uXECc9A+WE0AePCUsbUX2QxpeTknFlyIw2dtiq+xvR5FwvaDtpxbHFgCTUAP
         FMJn5Tq2Q8/6UuwKrShy6fceFbXWrjSG2jcLcGc3wUhbCHYPF1R99nD1l2iKNEGojn
         bIcaqycKBSvhAOa2m7wV6jXMAW3q+/h1yOeBGdDyEf2iXP4qcSHIWf3/qPsfZWGbrW
         iDts1sp7MU5hw==
Subject: Re: [PATCH v2 19/19] media: v4l2: Add 10-, 12- and 16-bpc 4:2:0 and
 4:2:2 semi-planar YUV formats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
 <20201102224102.30292-20-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6f172b50-15d7-fc38-65e3-08b009adcb41@xs4all.nl>
Date:   Mon, 16 Nov 2020 13:17:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201102224102.30292-20-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJfL2zl4580/CbXpaCOjQBMWn/Kx2wmXLFFh4oHXpo8laO3+GEv83+SBSC2R+xEUkWfBtljkuiRWgg2VhoGM1cYWWWRAe8KWu8H+P7AD2X43NOHjQkwB
 3Uw9UWC2RzY187sva2i0HqDH9uMWrpBVdgvU+QwWfDrYrcg7UPULhXDIaM+y3igZjWQjz8uHljDQMgtsaoF32EWTaZYpRKLK/iUqvpNiowCrPwmSJrxzSsOu
 LFhCcuaozR7iErRlDaThMmnivbhVf7M2bi/iVNYOLUjO8uF+y0Pc+WWirSza/2BSUzoUuF2yZ+m9xFcuNb+R5NuSEVc73wajgqmFecd8qdQRMY9BVq/FdfDd
 CpyLexG0hywoA2TFBo2i4vAJFyB4OA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/11/2020 23:41, Laurent Pinchart wrote:
> Add semi-planar YUV formats with 10, 12 and 16 bits per components, in
> both 4:2:0 (NV12) and 4:2:2 (NV16) subsampling, and with both chroma
> orderings. They are used by the Xilinx Video Frame Buffer Read/Write IP
> cores.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../media/v4l/pixfmt-yuv-planar.rst           | 564 +++++++++++++++++-
>  include/uapi/linux/videodev2.h                |  12 +
>  2 files changed, 575 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index 07081ab05419..7f0fe2e4b668 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst

<snip>

>  Fully Planar YUV Formats
>  ========================
>  

I found a mistake in the "Overview of Fully Planar YUV Formats" table:

For formats V4L2_PIX_FMT_YVU420M and V4L2_PIX_FMT_YVU444M it gives "Y, Cb, Cr" as the
planes order, this should be "Y, Cr, Cb". Can you fix that in a new patch?

Regards,

	Hans
