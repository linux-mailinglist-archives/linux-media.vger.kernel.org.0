Return-Path: <linux-media+bounces-12091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F40218D1D52
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 15:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AD651C22501
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 13:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A3A16F0F6;
	Tue, 28 May 2024 13:46:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FD911187
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 13:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716903973; cv=none; b=ZsVQ0J0nDzyi7l4U0tn8alJZCZUhoM/+mluUaQ4DKgIpyzZ2TyrXOe46WXPN5ugIftSDOgXIHbUaz0INto2FY4z3e9bnWXXNmva+gI7vSRLqWgW4rjC3RCsfV/tCXNH/s9zXV25mAYQsD+a7Acl5glkUgNpIR+O3X07D1lpa7Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716903973; c=relaxed/simple;
	bh=KcBKNOc/a0yWDzrzTnBHacI/v+q0k5/IM/NT7bw/qN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcoYO2tH9ouAgmW6lWyykqUwAPAWYEmyLDBXlt17rY0orh4lOxJMm5CiJCC1W7F60RWA47A2IVWmgYn8bNW+ZEAXswZUT7V4oBgzrXbCg1K/J5+GTN3EM+tS0lIamMi+6yFrVwhId5bmIwjKMU2dZQuRcxItqMJIBdfsfSp9oDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1sBx9R-0002U4-Hb; Tue, 28 May 2024 15:46:05 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mtr@pengutronix.de>)
	id 1sBx9Q-003Kpq-MF; Tue, 28 May 2024 15:46:04 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1sBx9Q-001NB5-1x;
	Tue, 28 May 2024 15:46:04 +0200
Date: Tue, 28 May 2024 15:46:04 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	sebastian.fricke@collabora.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE
 condition
Message-ID: <ZlXgHN4DPfRtZaPS@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
	linux-media@vger.kernel.org, sebastian.fricke@collabora.com,
	linux-kernel@vger.kernel.org
References: <20240528020425.4994-1-nas.chung@chipsnmedia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240528020425.4994-1-nas.chung@chipsnmedia.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Tue, 28 May 2024 11:04:25 +0900, Nas Chung wrote:
> Explicitly compare a buffer type only with valid buffer types,
> to avoid matching the buffer type outside of valid buffer
> type set.
> 
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  include/uapi/linux/videodev2.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index fe6b67e83751..fa2b7086e480 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -157,6 +157,10 @@ enum v4l2_buf_type {
>  	V4L2_BUF_TYPE_PRIVATE              = 0x80,
>  };
>  
> +#define V4L2_TYPE_IS_VALID(type)		\
> +	((type) >= V4L2_BUF_TYPE_VIDEO_CAPTURE	\
> +	 && (type) <= V4L2_BUF_TYPE_META_OUTPUT)
> +
>  #define V4L2_TYPE_IS_MULTIPLANAR(type)			\
>  	((type) == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE	\
>  	 || (type) == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> @@ -171,7 +175,8 @@ enum v4l2_buf_type {
>  	 || (type) == V4L2_BUF_TYPE_SDR_OUTPUT			\
>  	 || (type) == V4L2_BUF_TYPE_META_OUTPUT)
>  
> -#define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
> +#define V4L2_TYPE_IS_CAPTURE(type)	\
> +	(V4L2_TYPE_IS_VALID(type) && !V4L2_TYPE_IS_OUTPUT(type))
>  
>  enum v4l2_tuner_type {
>  	V4L2_TUNER_RADIO	     = 1,
> -- 
> 2.25.1
> 
> 

