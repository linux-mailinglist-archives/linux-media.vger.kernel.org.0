Return-Path: <linux-media+bounces-17014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64186962748
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18C651F24B83
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 12:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EA816C6BC;
	Wed, 28 Aug 2024 12:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="Wu/UPfPi"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1832176230;
	Wed, 28 Aug 2024 12:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848690; cv=pass; b=lVdJoiS+o5rJRvnF4eUbX/XqoNpennb+OQ1X0T38tdqulRE6UtF1uHQjt2LTvdsVXw/9EiRGZcA0B2KxATSFvPc7QykmvfqtEVC6Wnw8mRDgPXe3aFD26QGaq8yfYNjKkIRISsfC8f5p1FMQqyl5WhmrWjXWBuv3x5Q+E13U5Bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848690; c=relaxed/simple;
	bh=kMyj4YBc6puxveIqCDmzv3nNraOi2NWSRcoEjJaQGWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGDmadTj9Km+DfQW+fwxl/8yh+pfes/bwJ1HM5iZBhxuSKqo7zcLQ/0+x7upAtdg3oZriZEhGRwLD8lzLoQDGeobybTKugvfC06xKMp4ULa+u56id/zwmSVEsMalZ5Bm0WUeaEKEd3bbCZErDyO8MsKS9vKH3ecrLIhdSIH9Xmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=Wu/UPfPi; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724848683; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lz0EBeC2yKRVRoHEGFqAGyOaAHo/wLXnRhoo69Fw4Aqon/fRsXVrNdlCJDddol58q8V4AaDnFciWryQppqd82OXvo4Tn3mK2aCxuIzpAnJAjmm+P/7Du50QYiQ0f0T5sMtIPctnbK/u2Dd5ZSQfvPwQDgJLc50p2c2hIFFhvn/E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724848683; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7+CGrZpEtCDKylNu6wIBl0dF6DVgnJ0MiECLBKTis+4=; 
	b=PeC/m94MEf8r4NDue2uMXKTViVLUh1On5Vt0G6F7CBSYEmzJAHPNOORWJ9KBfCJ21o1ZQn9CUTLAJflrV3Ck3fQZCTMcFrO7AIQu3Jec+afpBXcpXf2cJB7m7Iw2jDNAWcKNpBTsEAtFhzV3q9P/ik+5+sU0mydSTA2lvr2kDu4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724848683;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=7+CGrZpEtCDKylNu6wIBl0dF6DVgnJ0MiECLBKTis+4=;
	b=Wu/UPfPinOdZzDuMBkdNKkQmngTJr6hC+siNL/59cx0QZ9aET7XyxahmKvwD9GK0
	87VNL+OcTO+0VEzA69ppL1HSW+44EEO41lEtTTzcQ9X+8PuMGBFAb8jxBwt8p7odmE3
	FoG7xpzm/A26o02Hbcjn1Q7EI3iEl7EiOQ+6yVFM=
Received: by mx.zohomail.com with SMTPS id 1724848683090989.2034020737112;
	Wed, 28 Aug 2024 05:38:03 -0700 (PDT)
Date: Wed, 28 Aug 2024 14:37:59 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-input@vger.kernel.org,
	Erling Ljunggren <hljunggr@cisco.com>
Subject: Re: [PATCH 1/6] media: videodev2.h: add V4L2_CAP_EDID
Message-ID: <20240828123759.ctnxlx4myhddtvs4@basti-XPS-13-9310>
References: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
 <485324508040defc0ba0fb211a6596dc65f2d994.1723190258.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <485324508040defc0ba0fb211a6596dc65f2d994.1723190258.git.hverkuil-cisco@xs4all.nl>
X-ZohoMailClient: External

Hello,

On 09.08.2024 09:57, Hans Verkuil wrote:
>From: Erling Ljunggren <hljunggr@cisco.com>
>
>Add capability flag to indicate that the device is an EDID-only device.
>
>Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
>Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Regards,
Sebastian
>---
> include/uapi/linux/videodev2.h | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>index 4e91362da6da..987c821aed79 100644
>--- a/include/uapi/linux/videodev2.h
>+++ b/include/uapi/linux/videodev2.h
>@@ -502,6 +502,7 @@ struct v4l2_capability {
> #define V4L2_CAP_META_CAPTURE		0x00800000  /* Is a metadata capture device */
>
> #define V4L2_CAP_READWRITE              0x01000000  /* read/write systemcalls */
>+#define V4L2_CAP_EDID			0x02000000  /* Is an EDID-only device */
> #define V4L2_CAP_STREAMING              0x04000000  /* streaming I/O ioctls */
> #define V4L2_CAP_META_OUTPUT		0x08000000  /* Is a metadata output device */
>
>-- 
>2.43.0
>
>

