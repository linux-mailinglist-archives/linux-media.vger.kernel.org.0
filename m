Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F29FA26D9A3
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 12:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgIQKxB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 06:53:01 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:55371 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726733AbgIQKwl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 06:52:41 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IrWhkLvj9PTBMIrWiklf2v; Thu, 17 Sep 2020 12:52:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600339953; bh=qw/vl8krotYox32Fj8B8RS0ag7zOqtWX5XzkNcOM5Ts=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fsmOp7J6jOEoj1Fp3zlv+mGux7q1InNZm8Fsv5DWoQaEG2DsppxlknguCJ5q5g1+D
         7JUwj8vUULsdLic34JqqtzaZukMA+j8jlyB6UMPJfuj/ag6b0+gHS4z24Pg8omZgjH
         MCM4YOAstcDe8DmCSbYRLfPPTc26tEG2Ew6vFgWFrYW/n2hkp+av5mk+QCGEvou0Bw
         fHSc1/NCCAFXgTTR3e2fiSg5YVCp2rbqXnqlUznGfIxbSHYwaeo6cIzB2NeMSAVDp9
         GWF5ti5jrX0I9WWqADLKfjj5lZmr9Mpmah8+w07vxbmDCONEiext4L7h+/pfEQ8eGQ
         ajh7a7Q/1jR/g==
Subject: Re: [PATCH v2 0/2] media: admin-guide: add documentation for rkisp1
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200818102703.30471-1-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f696e967-ce1f-e7c1-a74b-ff944332bd67@xs4all.nl>
Date:   Thu, 17 Sep 2020 12:52:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818102703.30471-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCD1jy65PS+kTyhgcDApxcAWIaqzTC3CujAyf+wkJsmV1Dkr1xXrWXZlc/hzJ9mJbxT4mmYcy62qWLrozHjply7yAEuyYn9AXHw3+YvuCq0bjFzA8X7C
 kk22Gfdsw/io3AIvKqLEPpr+hfsmERteyi+aSKdlLFi/+3rMGXFv88N0uT/SWvNKQqpE70kI1kiYgpW6VW4cWqxYTLHMxfW3WejcdAEZOiXMRbMGZmGhWQbX
 ckc+mhUeGfYCKFdAWm7/TJ1ZIlMYqlmSFJWl7aLvnOxfOAk//7qHP86JCDooyAZIuVrLDu4OlaiWCDwSpEiGqCC+FGVz76hH5OMg74qS0Kt1UdGdAsHAW0tH
 dzoaqLPgpZcEpI8mjja2hCIOH2Dn9Ad9WPTIffh8mxow17aCFc1/qxqj3TKj8iBKkp113Z3psxaZNx/sWkpOfrTflJpFqFGE1xYYwAKh2T6SkuzitJvduuZ9
 q8d+n4VZBZpZyLv8KxS4kwxrOhrChzu87FpSeaLDVLYVakOLlhpkLvMRbZsBjjPb3Nq/hJmjvGi3Xqa/6BpAykStbJT4OcXKPmqz4GADPfxLRL2ve7iM9XLk
 qhfHN/FhML7NSD25i15tdRlZHVXqU5/DCmoQw/Vy47n02OI8GHoOy7KHuJi2u3YM8cY=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/08/2020 12:27, Dafna Hirschfeld wrote:
> Two patches that document the rkisp1 driver in the Documentation
> directory.
> 
> patch 1 adds documentation to the specific metadata formats
> used by the driver.
> 
> patch 2 adds a documentation of the driver.
> 
> The documentation assumes that the patchsets:
> 
> "v4l2: add support for colorspace conversion API (CSC) for video capture and subdevices"
> https://patchwork.kernel.org/project/linux-media/list/?series=334393
> 
> "media: staging: rkisp1: add support to V4L2_CAP_IO_MC"
> https://patchwork.kernel.org/cover/11680993/

The MAINTAINERS file needs to be updated for these new doc files. Just post a new patch for
this, no need for a v3.

Regards,

	Hans

> 
> were accepted and it documents the features that those patchsets add.
> 
> changes from v1:
> ----------------
> - limit lines within 80 chars
> - rephrasing and fixing issues due to comments
> 
> Dafna Hirschfeld (2):
>   media: pixfmt-meta-rkisp1.rst: add description of rkisp1 metadata
>     formats in pixfmt-meta-rkisp1.rst
>   media: admin-guide: add documentation file rkisp1.rst
> 
>  Documentation/admin-guide/media/rkisp1.dot    |  18 ++
>  Documentation/admin-guide/media/rkisp1.rst    | 181 ++++++++++++++++++
>  .../admin-guide/media/v4l-drivers.rst         |   1 +
>  .../userspace-api/media/v4l/meta-formats.rst  |   1 +
>  .../media/v4l/pixfmt-meta-rkisp1.rst          |  49 +++++
>  .../uapi/v4l/pixfmt-meta-rkisp1-params.rst    |  23 ---
>  .../uapi/v4l/pixfmt-meta-rkisp1-stat.rst      |  22 ---
>  7 files changed, 250 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/admin-guide/media/rkisp1.dot
>  create mode 100644 Documentation/admin-guide/media/rkisp1.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
>  delete mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
>  delete mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
> 

