Return-Path: <linux-media+bounces-13392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A895490A796
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 09:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07D24287684
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 07:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1640A18FDD3;
	Mon, 17 Jun 2024 07:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T64u8SMU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B120218FDB7
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 07:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718610247; cv=none; b=mypHoKlW2LuXnsmVg1D30ta67kdSPHRHo27s23HFTXwGMTE9GldO2uSxNQNT3G3XPE9tjkOiq4yp3qlZaZlL5w9fJKSAwUjpLixO8HFNsKZetD2o+t/fkvx05W8IZmoBm+QoTtKVMIFWrcC3uh0qEBqCa15V4O5v5Ubwm8dDNCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718610247; c=relaxed/simple;
	bh=V3rY4rKMUK34TI7CdYurh+Hgc6+Zb6F+CNO9d7kg5O0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODRVsuSDBEyd5bto1mWVFGSJt9beesz9ybuIVs3Jl/+yHtA7L7rIfed9S6exXSi6MeBwk/3TVBO5xqSwihYQcysL3q9OA4V1CvgYtPYOph4HnzqM9TE1LHN2sT91X1r6UrUfHWri1mE2QEc2ZP2orZHZhhze2Ag96Gu/BDP3vxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T64u8SMU; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57c76497cefso4712289a12.1
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 00:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718610243; x=1719215043; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AeWHvKLJjNPCQjPjuiV8O0fJo5Jguicw8ulzTgeFir0=;
        b=T64u8SMUtvT24Z699xLxMdbEEUq5qkwHPZSSXUpPsXJ3ZiP8CpvyjFvOQNRLasJdNP
         x6nEfNDUtLJ4PbbBFdslZ59UzeSOnLUpC1yy9MuoaGUy1H0+OWQcC6mIPY7tEA1esrsi
         j32W9QggWrPyljT5hmpYdgazIiTtWPXEozQLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718610243; x=1719215043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeWHvKLJjNPCQjPjuiV8O0fJo5Jguicw8ulzTgeFir0=;
        b=ZQndS31BtYN3Ll/EbjVmVEI2k0fHdnWSF78T+zm9pqEGVsD3n0zukV8P6n2f5q67Ne
         HIiSZT/eOZEtkcfdg37LVPR5s49t4I4Q7Di8TNQM41mGxTgy0bTE6kfh93FaZCLP2Gwb
         ICRuIsVIS9A5HgWc7wpmHvEu3wXWVPbRkpli30OylEHTGOSUt1H03wQftdlo5S1gfWt4
         99NhZPNLn4LDmDr93WWqSwdW8MYK9eS0H7iEv9Uzfo+Uw3B5DSv/UMvSySNprRSYKimX
         Hm6ILlb2n5fg+63iM4EZf4mZhaE0AfwJ9MFilPmYP88XBizMO2A/zWoXFrPCEkMrvdxU
         yIEA==
X-Gm-Message-State: AOJu0Yy4FjLX9YSLCCXvOkK8wO9QhZthehVGNCSGibkkl1ee3D/Fqtet
	biCrn8BlPTLMs6t6M6AgqK10OGpqx1gW0rNkhEEvdGARxViVWViiu5ZXbi9+xLoIvP9Y1QnENyM
	=
X-Google-Smtp-Source: AGHT+IHVde8nB5hJ5UXuxr3qrbncHTLN7dni8CO0gUMe1chYKfFsOlYRv5RLdhkbBl7t/uW7Lq6Pfg==
X-Received: by 2002:a17:907:7790:b0:a6f:1509:49e9 with SMTP id a640c23a62f3a-a6f60d2973cmr699552266b.22.1718610243300;
        Mon, 17 Jun 2024 00:44:03 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56ed369bsm484840566b.100.2024.06.17.00.44.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 00:44:02 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a6f13dddf7eso489858366b.0
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 00:44:02 -0700 (PDT)
X-Received: by 2002:a17:906:48d:b0:a6f:501d:c224 with SMTP id
 a640c23a62f3a-a6f60dc4dd6mr586322666b.57.1718610242267; Mon, 17 Jun 2024
 00:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240616231350.6787-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20240616231350.6787-1-laurent.pinchart@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 17 Jun 2024 09:43:50 +0200
X-Gmail-Original-Message-ID: <CANiDSCsNa_agem5t=5tHbppyem=OhbfULsArWJquxUCrCwAW9Q@mail.gmail.com>
Message-ID: <CANiDSCsNa_agem5t=5tHbppyem=OhbfULsArWJquxUCrCwAW9Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] media: uvc: Probe PLF limits at start-up
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

On Mon, 17 Jun 2024 at 01:14, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> This patch series is a new version of Ricardo's v2 that incorporate my
> review feedback and squash v2 7/7 into the appropriate commits. I've
> decided to send it as a new version to speed up merging.
>
> As part of the squashing, patch 1/6 now implements a slightly different
> filtering logic by ignoring mappings whose .filter_mapping() function
> returns NULL. Apart from that, the series should be functionally
> equivalento to v2.
>
> The patches have been rebased on my UVC -next branch. The base commit
> can be found in
> git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git. If
> this version is acceptable, I will add it to the branch and send a pull
> request in the next few days.

For reference this is the diff with v2

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index eb930825c354..79c6dacd516e 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -495,8 +495,8 @@ static const struct uvc_control_mapping
uvc_ctrl_power_line_mapping_uvc15 = {
                                  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
 };

-static const struct uvc_control_mapping *uvc_ctrl_filter_plf_mapping
-               (struct uvc_video_chain *chain, struct uvc_control *ctrl)
+static const struct uvc_control_mapping *uvc_ctrl_filter_plf_mapping(
+       struct uvc_video_chain *chain, struct uvc_control *ctrl)
 {
        const struct uvc_control_mapping *out_mapping =
                                        &uvc_ctrl_power_line_mapping_uvc11;
@@ -2408,8 +2408,7 @@ static int uvc_ctrl_add_info(struct uvc_device
*dev, struct uvc_control *ctrl,
  * Add a control mapping to a given control.
  */
 static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
-                                 struct uvc_control *ctrl,
-                                 const struct uvc_control_mapping *mapping)
+       struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)

Just curious, do you have a nice vim code formatter that you can
share? Or is it just "what looks nicer"?


 {
        struct uvc_control_mapping *map;
        unsigned int size;
@@ -2670,14 +2669,14 @@ static void uvc_ctrl_init_ctrl(struct
uvc_video_chain *chain,

        /* Process common mappings. */
        for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
-               const struct uvc_control_mapping *mapping = NULL;
-
-               /* Try to get a custom mapping from the device. */
-               if (uvc_ctrl_mappings[i].filter_mapping)
-                       mapping = uvc_ctrl_mappings[i].filter_mapping(chain,
-                                                                     ctrl);
-               if (!mapping)
-                       mapping = &uvc_ctrl_mappings[i];
+               const struct uvc_control_mapping *mapping =
&uvc_ctrl_mappings[i];
+
+               /* Let the device provide a custom mapping. */
+               if (mapping->filter_mapping) {
+                       mapping = mapping->filter_mapping(chain, ctrl);
+                       if (!mapping)
+                               continue;
+               }

I guess that if the device is too broken to fail filter_mapping we can
skip that control.

Thanks!



>
> Ricardo Ribalda (6):
>   media: uvcvideo: Allow custom control mapping
>   media: uvcvideo: Refactor Power Line Frequency limit selection
>   media: uvcvideo: Probe the PLF characteristics
>   media: uvcvideo: Cleanup version-specific mapping
>   media: uvcvideo: Remove PLF device quirking
>   media: uvcvideo: Remove mappings form uvc_device_info
>
>  drivers/media/usb/uvc/uvc_ctrl.c   | 184 ++++++++++++++++-------------
>  drivers/media/usb/uvc/uvc_driver.c | 131 --------------------
>  drivers/media/usb/uvc/uvcvideo.h   |   8 +-
>  3 files changed, 105 insertions(+), 218 deletions(-)
>
>
> base-commit: 75007ad7544c3a4da6b670983fb41cc4cbe8e9b1
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda

