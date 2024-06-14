Return-Path: <linux-media+bounces-13258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DAB908947
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 12:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1FBF1F2B9ED
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 10:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CFD19645E;
	Fri, 14 Jun 2024 10:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NIwvjP+v"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBFC1946DA
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718359514; cv=none; b=BTQJnQklCzTuaCS0aYGhwYk8HSWqMaJ2md9q6u2vDbkXu9A78xlwqymYQlpmtlONLE9wa4chGEebKw1iKaDCB2ahluMxVQ063Dohur3hLtkLuOuH3/bN6NlkYnlureay2cpGAZA4ns5iZv3oAd/xu5ovKcEdp/viXepuTG84UKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718359514; c=relaxed/simple;
	bh=1cSEYIVLVMVrPQQTyeBz4Agvc1ojCmB/BaLXooDfTlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIj7w6QoHZE8SBF+aR5Ch3klKZj3+M817nl8rpdQ/xIiIUovwQSLwOJa4LIEMjr119J0e/zH9xlRtPJbo8oVTwI2HBQQOi0cHottgWYKpAft/McUq5ikJ8ETaNtiVO0FMXXdzvUF3/hD6gA0RcmRqbg8Mc33yGTURHE6I4y381Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NIwvjP+v; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C664EB53;
	Fri, 14 Jun 2024 12:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718359490;
	bh=1cSEYIVLVMVrPQQTyeBz4Agvc1ojCmB/BaLXooDfTlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NIwvjP+vgBeSxSBif/nisToNc0vGpqvubuCpB6Bm8QVuLF5EaiAPE9g/Ofv2ooBM4
	 6CaScCIFMmSXRzxTNFPaJIBwBUHP79H6/4YUcbzgNR1QfW32is4Aj9QNuQUULahntS
	 KQr9iGmHX1bQKDvzcoaovnNnUTvbo7TtabKEiWx8=
Date: Fri, 14 Jun 2024 13:04:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neel Gandhi <neel.gandhi@amd.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, sakari.ailus@iki.fi,
	mark.hatle@amd.com, varunkumar.allagadapa@amd.com,
	vishal.sagar@amd.com
Subject: Re: [v4l-utils] utils: media-ctl: Install media-ctl header and
 library files
Message-ID: <20240614100445.GD6806@pendragon.ideasonboard.com>
References: <20240614065120.896247-1-neel.gandhi@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240614065120.896247-1-neel.gandhi@amd.com>

Hi Neel,

Thank you for the patch.

On Fri, Jun 14, 2024 at 12:21:20PM +0530, Neel Gandhi wrote:
> Install mediactl and v4l2subdev header and library
> files, which may be required by 3rd party applications
> to populate and control v4l2subdev device node tree

We haven't done so because the API of those libraries is currently
internal, and not guaranteed to be stable.

> Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
> ---
>  utils/media-ctl/meson.build | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build
> index 3a7b0c9a..40669b4c 100644
> --- a/utils/media-ctl/meson.build
> +++ b/utils/media-ctl/meson.build
> @@ -3,14 +3,24 @@ libmediactl_sources = files(
>      'mediactl-priv.h',
>  )
>  
> +libmediactl_api = files(
> +    'mediactl.h',
> +    'v4l2subdev.h',
> +)
> +
> +install_headers(libmediactl_api, subdir: 'mediactl')
> +
>  libmediactl_deps = [
>      dep_libudev,
>  ]
>  
> -libmediactl = static_library('mediactl',
> -                             libmediactl_sources,
> -                             dependencies : libmediactl_deps,
> -                             include_directories : v4l2_utils_incdir)
> +libmediactl = library('mediactl',
> +                      libmediactl_sources,
> +                      soversion: '0',
> +                      version: '0.0.0',
> +                      install : true,
> +                      dependencies : libmediactl_deps,
> +                      include_directories : v4l2_utils_incdir)
>  
>  dep_libmediactl = declare_dependency(link_with : libmediactl)
>  
> @@ -18,9 +28,13 @@ libv4l2subdev_sources = files('libv4l2subdev.c')
>  libv4l2subdev_sources += media_bus_format_names_h
>  libv4l2subdev_sources += media_bus_format_codes_h
>  
> -libv4l2subdev = static_library('v4l2subdev',
> -                               libv4l2subdev_sources,
> -                               include_directories : v4l2_utils_incdir)
> +libv4l2subdev = library('v4l2subdev',
> +                        libv4l2subdev_sources,
> +                        soversion: '0',
> +                        version: '0.0.0',
> +                        install : true,
> +                        dependencies : dep_libmediactl,
> +                        include_directories : v4l2_utils_incdir)
>  
>  dep_libv4l2subdev = declare_dependency(link_with : libv4l2subdev)
>  

-- 
Regards,

Laurent Pinchart

