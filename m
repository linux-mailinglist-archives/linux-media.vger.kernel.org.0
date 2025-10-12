Return-Path: <linux-media+bounces-44204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8F1BCFFAA
	for <lists+linux-media@lfdr.de>; Sun, 12 Oct 2025 08:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C65CA4E1811
	for <lists+linux-media@lfdr.de>; Sun, 12 Oct 2025 06:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16472153D4;
	Sun, 12 Oct 2025 06:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="jUsOG/I+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9E11FBEA8
	for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 06:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760249324; cv=none; b=u5Rdm9Z+5EaGOkZRK0c2A6dG2+eFY/dV7qL8ohQV1vkC0BDszf/d0w9duC+ThgFIYqdGfYfJGq4KAOhuOC7XQYpmHBNQQWPSrQe7/WJP1YFA5BRJuOA/GVsvJc+fRgW82U0SOsFwdk1LAwxDgKW8uOMF8E6/TqAV87YMipUblAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760249324; c=relaxed/simple;
	bh=h09Zml4zY0LyRZrAd0HGgZ/qvE6dlMqgAPDyiTqBdZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agRRhdpFfIWidFM9VCFLJPgMKAlE4IfpJa3XpsWPxlVLGWJnLeyLXYmXc/FTEA3ISvJ4Rhlta0PvETBZW94WNIjwmScXh2QPETZxROndOGxqJ/y4WfryDeJ1eWz+SKljonGjkFvu035AElw6XrvUbyjjglU/1+Z5RrGheeg/zvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=jUsOG/I+; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-273a0aeed57so52199025ad.1
        for <linux-media@vger.kernel.org>; Sat, 11 Oct 2025 23:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1760249321; x=1760854121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GaG3CIPvScrkRcCVnxVI9r9n+cKmILGcLdj9ri4mORs=;
        b=jUsOG/I+FHveWUTWTXwRsHVwbOF9Y7/t98ym7g8b8BHaXPn3QdlsVv/vzvoFz/fdP/
         tcraaNO4OSgXsp6W4EqCt9fyOpB9FcWgwzClGMPwhE4YOJC0qn3A3ccw6taZS9ewukPk
         +FV2i3P9j3R1ECbeRwVYsei7iNDAppgRmPnWZ0v0MR3qyO0pQDYCTE6Ek6ZEhIxOlyGq
         tPdh+b4SHlNlKgr/ow34gVdESiR+8saqCpWqxsvHzqCWzVpykvghR+48nQG+FzVTd8DS
         o703oxwRc1gOBHtZkEhwOM7vxYmPynPLB4FY5nSI+h2WYfOw8GiFlUVGyBQQrGZzdWfs
         6HYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760249321; x=1760854121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaG3CIPvScrkRcCVnxVI9r9n+cKmILGcLdj9ri4mORs=;
        b=Ewzb3n3gHk88sKkrfwrRJf7iVBu1uUPDeBxvaxBC28tPINJ9dSx4BtYhjfeMFEL19R
         iSdVzn0VCJHsXpV7pQMuNy70HPtx6K61hXFLiBrkcVaoEDULyp1ysOGH6Hb2KoGPuY/B
         xcM0Z5UDcvNiZcTYWcx5ey/FWskwelgXsqApKaBGtcshksJKETAfCgEf0y43TEGcb4cU
         CF5SLWXhpwz5oeWgk/7H+j2f6OY5FlGc6KFEamuUGawz6vam5qIBhnycEmv6OAfprPPV
         uCPb8nGMhMGgIXIw+t+2vThf1qSq8Scp2NW87EUx0x+B9nhthbetjepm+QeqYJKaZdDi
         Ms8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcb5yY9yXFUcA43IAlRd/OXQtEnExS7Vr+0dy4wO+AKp4ddPrMJCkD1Va64dnbT99phaXZ+JWGVsia4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHpf5KKyfRjgZ1Y0P+cTkQgdIhD2yDiGrfzb+2IZqJ0wqBfe3E
	1I78s8/xodGjEPE8HslMA+JudzPNLyoLjsNmZNveGmv13vHJ8kNLkRtnpm6pVsYfouhr
X-Gm-Gg: ASbGncs+70bNOKPtZLESLf+J3Qzf7mlqQYhJyEncsv6QZi5LGuNAsmy4d3rZ3pPBFLu
	tiw1wW8LeCwA2rbEarXtikrG8WunOi3QW1fLgICc/a95c4RXyt6y2pJvpXdMUzfndTGGKRrVedF
	fzxm0R32gp1NeX3T70Rn1RHYAsr9FaGX9dcr+w0T9HgbXvyXbTRQxn3cB4yJVKIXTesOMnCZNTt
	sXsKqccEshw11/T9lSmmrOqdUwO+ktZoLFfAmdTHSSHwxkiY9c/7ZeY2P3iu/78sDCLEZllKSJr
	cvkm3X799agnVKI/AEDRR8V5FQtDuoVhtCX79r2BqPHK2qcOEDojF5yzYrU8XrBKkXoVFtEdWyj
	NmW/7Sx9TuqF7qcFKqan4X9WQQ0edrnX/4xx7ExwoVUgbS78Z8EpB0nY=
X-Google-Smtp-Source: AGHT+IGhKEjO4N8N1w5O5HATeeVcKIyS6/qcZDUuJjfl146ApoB62Mq25IN+pyjyIOFOpn69zqXUVw==
X-Received: by 2002:a17:903:2ac5:b0:269:4752:e21f with SMTP id d9443c01a7336-28ec9caf23cmr223929385ad.22.1760249320716;
        Sat, 11 Oct 2025 23:08:40 -0700 (PDT)
Received: from sultan-box ([142.147.89.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626d15bfsm7682777a91.19.2025.10.11.23.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 23:08:40 -0700 (PDT)
Date: Sat, 11 Oct 2025 23:08:36 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, mario.limonciello@amd.com,
	richard.gong@amd.com, anson.tsao@amd.com,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Re: [PATCH v4 5/7] media: platform: amd: isp4 video node and buffers
 handling added
Message-ID: <aOtF5C2p0KGTQSji@sultan-box>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-6-Bin.Du@amd.com>
 <aNzP2LH0OwUkMtGb@sultan-box>
 <c28eb905-b578-4512-aa9c-37281d3a0ee4@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c28eb905-b578-4512-aa9c-37281d3a0ee4@amd.com>

On Sat, Oct 11, 2025 at 05:30:43PM +0800, Du, Bin wrote:
> On 10/1/2025 2:53 PM, Sultan Alsawaf wrote:
> > On Thu, Sep 11, 2025 at 06:08:45PM +0800, Bin Du wrote:
> > > +
> > > +/* Sizes must be in increasing order */
> > > +static const struct v4l2_frmsize_discrete isp4vid_frmsize[] = {
> > > +	{640, 360},
> > > +	{640, 480},
> > > +	{1280, 720},
> > > +	{1280, 960},
> > > +	{1920, 1080},
> > > +	{1920, 1440},
> > > +	{2560, 1440},
> > > +	{2880, 1620},
> > > +	{2880, 1624},
> > > +	{2888, 1808},
> > > +};
> > > +
> > > +static const u32 isp4vid_formats[] = {
> > > +	V4L2_PIX_FMT_NV12,
> > > +	V4L2_PIX_FMT_YUYV
> > > +};
> > > +
> > > +/* timeperframe list */
> > > +static const struct v4l2_fract isp4vid_tpfs[] = {
> > > +	{.numerator = 1, .denominator = ISP4VID_MAX_PREVIEW_FPS}
> > 
> > Add a space after { and a space before }.
> > 
> > Also, it is more common to see v4l2_fract initialized without specifying the
> > struct member names.
> > 
> > To summarize, change to `{ 1, ISP4VID_MAX_PREVIEW_FPS }`
> > 
> 
> Will follow your advice. Seems no explicit description about this in "Linux
> kernel coding style" and both spacing options after { are common in the
> current kernel code.

True, it's not explicitly stated in "Linux kernel coding style", but it _is_
specified in the .clang-format [1][2] via `Cpp11BracedListStyle: false`. And in
my experience, it's much more common to see spaces padded inside braced lists.

> > > +};
> > > +
> > > +static void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
> > > +				      const struct isp4if_img_buf_info *img_buf,
> > > +				      bool done_suc)
> > > +{
> > > +	struct isp4vid_capture_buffer *isp4vid_buf;
> > 
> > Rename isp4vid_buf to isp_buf like in isp4vid_qops_start_streaming().
> > 
> 
> Seems isp4vid_buf appears to be more descriptive, plan to rename isp_buf in
> isp4vid_qops_start_streaming to isp4vid_buf, what do you think?

Either way is fine so long as it is consistent. It's just my own personal
preference to use shorter variable names, especially for pointers, which is why
I suggested isp_buf. :)

> > > +
> > > +	buf->dev = dev;
> > > +	buf->dbuf = dbuf;
> > > +	buf->size = size;
> > > +
> > > +	dev_dbg(dev, "attach dmabuf of isp user bo 0x%llx size %ld",
> > > +		dbg_buf->gpu_addr, dbg_buf->size);
> > > +
> > > +	return buf;
> > > +}
> > > +
> > > +static void isp4vid_vb2_unmap_dmabuf(void *mem_priv)
> > > +{
> > > +	struct isp4vid_vb2_buf *buf = mem_priv;
> > > +	struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
> > > +
> > > +	dev_dbg(buf->dev, "unmap dmabuf of isp user bo 0x%llx size %ld",
> > > +		buf->gpu_addr, buf->size);
> > > +
> > > +	dma_buf_vunmap_unlocked(buf->dbuf, &map);
> > > +	buf->vaddr = NULL;
> > > +}
> > > +
> > > +static int isp4vid_vb2_map_dmabuf(void *mem_priv)
> > > +{
> > > +	struct isp4vid_vb2_buf *mmap_buf = NULL;
> > 
> > Remove unnecessary initialization of `mmap_buf`, and combine it onto one line
> > with `buf`:
> > 
> 
> Sure, will remove unnecessary initialization of `mmap_buf, but i'd rather
> not combine because it is mentioned in "Linux kernel coding style" that "to
> this end, use just one data declaration per line (no commas for multiple
> data declarations). This leaves you room for a small comment on each item,
> explaining its use.", what do you think?

Huh, that quote is odd, as it's quite common in the kernel to declare multiple
local variables of the same type on one line. In fact, Linus has done this
himself [3][4].

I think it's better to put `mmap_buf` on the same line because the type name is
quite long, so declaring `buf` and `mmap_buf` on the same line makes it easier
to see that they are exactly the same type.

Also, creating a new line for every local variable declaration would really
bloat a lot of code around the kernel and hurt readability. That quote from
"Linux kernel coding style" was added almost *20 years* ago (commit b3fc9941fbc6
"[PATCH] CodingStyle updates"), so maybe it is just obsolete.

> > > +	if (ret) {
> > > +		dev_err(v4l2_dev->dev, "fail to fill buffer size: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = isp4vid_set_fmt_2_isp(isp_sdev, &isp_vdev->format);
> > > +	if (ret) {
> > > +		dev_err(v4l2_dev->dev, "fail init format :%d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	/* Initialize the video_device struct */
> > > +	isp_vdev->vdev.entity.name = vdev_name;
> > > +	isp_vdev->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
> > > +	isp_vdev->vdev_pad.flags = MEDIA_PAD_FL_SINK;
> > > +	ret = media_entity_pads_init(&isp_vdev->vdev.entity, 1,
> > > +				     &isp_vdev->vdev_pad);
> > > +
> > > +	if (ret) {
> > > +		dev_err(v4l2_dev->dev, "init media entity pad fail:%d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE |
> > > +			    V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
> > > +	vdev->entity.ops = &isp4vid_vdev_ent_ops;
> > > +	vdev->release = video_device_release_empty;
> > > +	vdev->fops = &isp4vid_vdev_fops;
> > > +	vdev->ioctl_ops = &isp4vid_vdev_ioctl_ops;
> > > +	vdev->lock = NULL;
> > > +	vdev->queue = q;
> > > +	vdev->v4l2_dev = v4l2_dev;
> > > +	vdev->vfl_dir = VFL_DIR_RX;
> > > +	strscpy(vdev->name, vdev_name, sizeof(vdev->name));
> > > +	video_set_drvdata(vdev, isp_vdev);
> > > +
> > > +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> > > +	if (ret)
> > > +		dev_err(v4l2_dev->dev, "register video device fail:%d\n", ret);
> > 
> > No error handling?
> > 
> 
> Not necessary here because the caller isp4sd_init() will handle this.

This doesn't seem to be the case; in fact, isp4sd_init() doesn't seem to handle
any of the error cleanup for isp4vid_dev_init().

I started looking deeper at it and saw that vb2_queue_release() is never called
to clean up after vb2_queue_init(). See my next comment below about changing
video_unregister_device() to vb2_video_unregister_device(), which calls
vb2_queue_release().

And isp4sd_init() calls media_entity_cleanup() for the subdev, not the vdev.
So you need to add `media_entity_cleanup(&isp_vdev->vdev.entity)`.

To summarize, make the following changes to isp4vid_dev_init():

1. On error starting from isp4vid_fill_buffer_size(), call vb2_queue_release()
   to do cleanup for vb2_queue_init().

2. When video_register_device() fails, do cleanup for media_entity_pads_init()
   by adding `media_entity_cleanup(&isp_vdev->vdev.entity)`.

> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +void isp4vid_dev_deinit(struct isp4vid_dev *isp_vdev)
> > > +{
> > > +	video_unregister_device(&isp_vdev->vdev);
> > > +}

I just noticed: isp4vid_dev_deinit() should call vb2_video_unregister_device()
instead of video_unregister_device().

See the comment in include/media/videobuf2-v4l2.h [5]:

 * If the driver uses vb2_fop_release()/_vb2_fop_release(), then it should use
 * vb2_video_unregister_device() instead of video_unregister_device().

Since vb2_fop_release() is used, vb2_video_unregister_device() should be used.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/.clang-format?h=v6.17#n61
[2] https://clang.llvm.org/docs/ClangFormatStyleOptions.html#cpp11bracedliststyle
[3] https://github.com/torvalds/linux/commit/fe673d3f5bf1fc50cdc4b754831db91a2ec10126#diff-b7746cf0f2ab471c30d08fe3391b7d3ba45adbe7616e4fae0504b29f40b49dd5L1747-R1747
[4] https://github.com/torvalds/linux/commit/d7fe75cbc23c7d225eee2ef04def239b6603dce7#diff-b8c8d3c5770869f743e155faac7cccc97082918c3e092ffdf592efa796725c79L2019-R2019
[5] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/media/videobuf2-v4l2.h?h=v6.17#n360

Sultan

