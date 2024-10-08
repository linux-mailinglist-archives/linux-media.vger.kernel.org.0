Return-Path: <linux-media+bounces-19283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65465995822
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 22:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35D36289BD0
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 20:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F39215004;
	Tue,  8 Oct 2024 20:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="azKDdbcS"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2553213EDF;
	Tue,  8 Oct 2024 20:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418141; cv=fail; b=iLWNUK8U7BRj7IBNkEI9YOCq8EoFx6cbhK5twvzTBim0Ouu6NQty6WFNYreyaxR7fs07lZXi0cgkSYK9FhIRSehk36kp4NRsxubUBmz8mMtFoyM40g2QUZyD7M4bZ3CTnWztgRfIyaBf6JCv0u1wof+gCvFo+pGo/806TdNFIl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418141; c=relaxed/simple;
	bh=biyN8fZcl4L/ZAt5IxImhVwgiwH5PHm0a+LUEe5g8JY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDxCRcd/0KT8J4LQUWyAoG9Dib1dXtT4OyMGc5zRP/5XvpRf7h8WYRzbwtzSONBgBD3Pjz/80jHx0lG7z91L7VcO7eFAODfWIn2Y8DwH5l//CVIkjL8VG60+f3pTxZYToHffgh+mm/EtamGK3qm6+LsGMnFWzF8UjLrthr+NjVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=azKDdbcS; arc=fail smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4XNRtH6C6Tz49Q3N;
	Tue,  8 Oct 2024 23:08:55 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1728418136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A8RNetjppGXHuuTuS1zTBTCmn7pmNM0hlisQvQX0tOU=;
	b=azKDdbcSMiaHqZe3v0KQNxDFWvl809OkpKhLUIYAXYmZG5z4aNvCzC4YFoYbzwWe1KehH2
	sUSni/rtohL6cn/DvOIhrE955E8GGxMt8nRwbfoCt6F+WbvAabYYCTwRSbh+oYBCbvK1BA
	YEDFEk77jbrnV9lmo9ZUHZOYJmvU8zAVzQEEZqHO6Tz/PKcf3RvXhWhjNI3ubdkGW9m/YK
	eHbCkvRh3AfTv5pWZw8PbYw0rioCodzz+RyunckRZgiUu//sF6JBP77T9KRCEs23BQ2dv2
	PGCDQYAmup4v18O9d9H3rhmcBhCAjarh3jhMQxxumQIUGil17GfE2btH/kEvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1728418136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A8RNetjppGXHuuTuS1zTBTCmn7pmNM0hlisQvQX0tOU=;
	b=njNqN3tjEptd/QvqruKR1ovC0x5oJY2g9xXgvWxFBrbtetxFUzhDFNqNbr0rRWRQ46KJzN
	7dKM+wfS5AupkOkEjIq4BhMboNHsLcbWflaKgYjygVd3EsLOMvz4rfqtn471yEhAsaB05Y
	HJZcxndpO2sbzvUiAu1c981m20Yfa8gE+UZnovoherZejyyNbMKI0cNU55XPvrEzK5cq3w
	9QTentcJvBhUQ7mLSW1wrAdp7NtneeJTB86mroDifA9cfcfHs9/nqN+4OxslhYaWKN+dmK
	xpFW+2dB7jxH82px6u7TY2MmvHqL91uJEMuYYAc26Srks5Xca3hdu6gLoER/Vw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1728418136; a=rsa-sha256;
	cv=none;
	b=Gnvy92aXAfjnqmUjN1QP2g098SqZfm9Dy9DvI46kSyYxRNmFgGrn5abzjtG4Rj4H9hq9nu
	GIuPYnxzGmy8C/cCM/AdSPYgkfN05LjYYJBQYDWPntiFw45qeD1SbVXAGMbNPewQLGM94f
	iAddXJsqsxMSik2USnrDc7RlQstlsQx/kewtnERi6nVFe+birSUck/yrSUuvV+7dqUmWx9
	MlNy+CzkC6FwFSPiIXoLuKiEO6Ra9063iO721K+uctRKWKZaDGa6uxyrot8jEJWeqlJ6l4
	bOOpnP8HuqDsek9J4gv4NliwKPV0wA2Hcaq+7V4iTcoiEXtnX+T3pQ8VQnBtig==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id DB9C4634CA9;
	Tue,  8 Oct 2024 23:08:53 +0300 (EEST)
Date: Tue, 8 Oct 2024 20:08:53 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/2] media: uvcvideo: Support partial control reads
 and minor changes
Message-ID: <ZwWRVXnNhq3q3o5r@valkosipuli.retiisi.eu>
References: <20241008-uvc-readless-v2-0-04d9d51aee56@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008-uvc-readless-v2-0-04d9d51aee56@chromium.org>

On Tue, Oct 08, 2024 at 03:00:06PM +0000, Ricardo Ribalda wrote:
> Some cameras do not return all the bytes requested from a control
> if it can fit in less bytes. Eg: returning 0xab instead of 0x00ab.
> Support these devices.
> 
> Also, now that we are at it, improve uvc_query_ctrl() logging.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

For both:

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

