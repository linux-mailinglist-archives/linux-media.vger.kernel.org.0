Return-Path: <linux-media+bounces-32450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A4AB6718
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 11:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81DFB3AF685
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 09:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09EF225396;
	Wed, 14 May 2025 09:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TXca49Zk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921D421B9FC
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747214245; cv=none; b=d0ggW6DVN8WePGep6cspYMKrCa5mFfGIhZWuvd37GzQTs+/c3pH7/JqQUz6DtqS5n7Zhm9WzEhDCeyMToI2UCsC3HirX8cjmFY/9VXQ5i21b1KiTMvCoSYofACRdckaNdJQRQKbRwqIhZkjVdwiKei3tfE3vYB4+qz8RfiKhczw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747214245; c=relaxed/simple;
	bh=pEmPsXkZn2LmqIE/lJhivP5HaBIetx4VZNaXDTcmm/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCan6vbeMjkGKNcipy7qZ4SvNkJLtVqAdzyNkkBGzjVwctpZEi9FymED+IWydPAjCAL+CVVC+ooos4mGFW7ry2y9bYai9JwnR05dJFEB1xCQhLeS42S2KshVtMDCgvqjyevjckyW9Ac5v9bqAbmIN6GH8yy17Lep3DtOLO1lo3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TXca49Zk; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54e98f73850so7705537e87.1
        for <linux-media@vger.kernel.org>; Wed, 14 May 2025 02:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747214241; x=1747819041; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9l61OPQYUyrwxbE4WLEA0UZlwRfXVKqAkVC77MMSPUY=;
        b=TXca49Zk3xquiP4FDZe8OxVcWeKmm2swhgGg0/oQsGVQcfWHmPl3d6cIGnE41qEw/m
         icmwaXt65pMx5RDmDrbYFmX2T8OPB1d8II7w4tlsZMM8eLnzJIinUs2P2fE+C/PtFS9m
         QEAKyqH8mUYvWoRomh+IGPp47WKBEevF1y+mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747214241; x=1747819041;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9l61OPQYUyrwxbE4WLEA0UZlwRfXVKqAkVC77MMSPUY=;
        b=GNO6XjEP8DkXrZvWbFIPa73+7zm0+rqRz0Ulu6i+gjEqd0GkVq5jiSLKLHLC1bKOy0
         Hrxcgqyhala79rUtsy9UJK7g5r0JV22kCSFS6trvX6Bo/xRu+NIshTNXPZlgRQrsqqJ7
         UnIcx7vFbf2KKdznkIRsTq1K32tJCj+99D52N84PSI4TDw2T6LSd2RdFzvGFjuvxAE13
         Rz+37rOW31E3dJincTgheWp4FwsxkzY/2/Fkvu2swgJhZU2aDwxPs+xQNi4lYrjvDZb+
         10vQvKhhUCjDeAOjaCcPhMlkYjHjHkfQU1PuphhF9O9h4+epbnbCZ0uKQzWmX74TnnQQ
         HDXA==
X-Forwarded-Encrypted: i=1; AJvYcCWEDYt/d/rHBDlOcJP/LOb2s9ZtLGd+hXBlk1fOjAPg5xNd1v+ngLr/15D9kLVADl7GVGuMroJCaP38DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtIsUlmL8OyXx1W0/blbjzzLtGMeyk8g/9jV09703q7pAGoxfN
	3ur3F1kmHdk51KfDPYZIEOXmKnuEdcDEcjEd4VLGriwwAG9fhif4NKeY+f1lcErn062a06lZ7WE
	=
X-Gm-Gg: ASbGncsj/1fKfm0fZEvz5jDpRwiBwJLBVvMuh4X5fDgeJ5oPOs1VBqaYSQA6PN0dYDv
	UR7CM03u78aC1PdqmxdZQg+Tp8fxCqzpUpBVaTfxuqHE75FK87cyqRkkGm91Gb8y3IJLnUYPWUs
	h8GUoVmVH/liiKBewkeiOGqVIyhLDoRCD+g268y68RuyeBCZzpIKi5wIS/w8sOVJ/P9tuvH89+x
	rg2L2pSDNNGw6CUzw7n41gRNm1kva2kXGdng7hfbjdCfjKa2yWQ//Yln+fvxOiXu83flsqjL2JD
	U4a6naQMDY4AkvDpSbVLHDVskiv6JI2Ky0ZoOSLnYukKpqdi/MyKUYz7Buy2RaOJBP3KT/Ri5G4
	tR5JLhTKo8sfA6ka5BA==
X-Google-Smtp-Source: AGHT+IFi5gUhIycVbMI8Ugxfo+M/9Wcb+VDqqMVohCmfocu1XJoTFGxDQgc1Yd1sBbI2WHHFd8Eziw==
X-Received: by 2002:a05:6512:2919:b0:54e:a273:d339 with SMTP id 2adb3069b0e04-550d5f7c2c7mr928970e87.8.1747214241471;
        Wed, 14 May 2025 02:17:21 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fcbfsm2172987e87.50.2025.05.14.02.17.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 02:17:20 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-310447fe59aso61175001fa.0
        for <linux-media@vger.kernel.org>; Wed, 14 May 2025 02:17:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjZbHJxExS3V5+/dCEGuJi5O8olOdI7Ijzxpg4cwb2AqRwIBpDwEXy03pqbUHoHJIOtJ/sRvPr4PYdEA==@vger.kernel.org
X-Received: by 2002:a05:651c:2206:b0:31e:9d54:62bc with SMTP id
 38308e7fff4ca-327ed0d66a9mr9898921fa.14.1747214239624; Wed, 14 May 2025
 02:17:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250510061803.811433-1-ccc194101@163.com>
In-Reply-To: <20250510061803.811433-1-ccc194101@163.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 May 2025 11:17:06 +0200
X-Gmail-Original-Message-ID: <CANiDSCsXPgQZVtq9RL_TkXCAW9Bt3kMO3-cR4X8GZaQvmYCQyA@mail.gmail.com>
X-Gm-Features: AX0GCFvV5LPFwjfvUWgotcxdHtaNHc8xIDNoSaAFhOasi7TjbYfRetkWjqFlOtU
Message-ID: <CANiDSCsXPgQZVtq9RL_TkXCAW9Bt3kMO3-cR4X8GZaQvmYCQyA@mail.gmail.com>
Subject: Re: [PATCH v10] media: uvcvideo: Fix bandwidth issue for Alcor camera.
To: chenchangcheng <ccc194101@163.com>
Cc: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, mchehab@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	chenchangcheng <chenchangcheng@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

Hi chenchangcheng

Thanks for your patience fixing the warnings from media-ci :)

Regards

On Sat, 10 May 2025 at 08:18, chenchangcheng <ccc194101@163.com> wrote:
>
> From: chenchangcheng <chenchangcheng@kylinos.cn>
>
> Some broken device return wrong dwMaxPayloadTransferSize fields
> as follows:
>     [  218.632537] [pid:20427,cpu6,guvcview,8]uvcvideo: Device requested 2752512 B/frame bandwidth.
>     [  218.632598] [pid:20427,cpu6,guvcview,9]uvcvideo: No fast enough alt setting for requested bandwidth.
>
> When dwMaxPayloadTransferSize is greater than maxpsize,
> it will prevent the camera from starting.
> So use the bandwidth of maxpsize.
>
> Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..a74cf89852d1 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -262,6 +262,15 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>
>                 ctrl->dwMaxPayloadTransferSize = bandwidth;
>         }
> +
> +       if (stream->intf->num_altsetting > 1 &&
> +           ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
> +               dev_warn_ratelimited(&stream->intf->dev,
> +                                    "the max payload transmission size (%d) exceededs the size of the ep max packet (%d). Using the max size.\n",
> +                                    ctrl->dwMaxPayloadTransferSize,

Minor nitpick. I am trying to standarize "UVC non compliance" header
in the logs for this kind of things.

"UVC non compliance: the max payload transmission size (%d) exceededs
the size of the ep max packet (%d). Using the max size.\n"
> +                                    stream->maxpsize);
> +               ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
> +       }
>  }
>
>  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
>
> base-commit: d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3
> --
> 2.25.1
>


-- 
Ricardo Ribalda

