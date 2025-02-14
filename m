Return-Path: <linux-media+bounces-26145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A034A357A2
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 08:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E300D3AC840
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 07:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D6E20ADFB;
	Fri, 14 Feb 2025 07:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="NVOn8vVc"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B5A2045AC
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 07:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739516917; cv=pass; b=Y30eASrGdyogZkqOWVTLEJTNhNZowheoVUiQUpFX0MCHm3zhziN8d5QMEuk1/8OVhVkDYfNWnse65De4bOOyumju71RpK4qnRxyZoCsIeyx8/wnVO77UuBTRr48REtpsvoeC8QNr+gflXQApslLtjxMmXld271/WHSEmk4dvRXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739516917; c=relaxed/simple;
	bh=vh48s07C3jWBLtSNri9qzQobnffgjT0Cgl26oy/5OnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdXNlyTEHD4HHInbhTlZm9x/FvrDK3EHIdv4bwNvPdkjY6gru6PRAyAvWR8Oa70PUtm0Z5ZxTCGpNVvkQZaOGXkGs42/JVJOoT0/RBxkWp91ErgRF40s8QgN82W3qZNAoTXUF9oequu6TsnKZ2Y1DYO5VXvc5TRCKnaR1x/u4xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=NVOn8vVc; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4YvNSJ2GJ4z49PvR;
	Fri, 14 Feb 2025 09:08:32 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1739516912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iwDIvJknk1yuhhITdNCLU/bGtr4PpPqU+vfLmPZeI4A=;
	b=NVOn8vVc5916bBLX8QuTn/GI+QCPKIGk7UAfdnJH6MxJmH8NDKKCRPXc5g3UxaIv+uG5tl
	G83nkGK+SvCy+Zvn1YWHSDY2bQV24tsa4q/X3UgoY5lt+dStX3MX/QcylQVaMfUlOmg9c7
	7Z4jtzWtD8lUhg5v/2AfsqgiLjKhsdLW2FZdrSVAGIk14ZhnT45fsiWvthVBTdzK8E3Cd0
	M02sGwKEsXwUQe+2L8d1ZUR9Kqzpv3pxmuE3uzfUnecqDBfk65o9e7vR/KWIFl/pi+oJBt
	tvIuo3nSnRl92lyqwDkh4iphMWTzpjrw2UAemia3o5CVgsSK2SuVHhODqOdwpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1739516912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iwDIvJknk1yuhhITdNCLU/bGtr4PpPqU+vfLmPZeI4A=;
	b=CeEBr7CmQjKoWx9c0G7D5gl7WKfAGZolLewg51zMw4nMRSXHGzhpcrKdyz5o3oRxAakmSv
	OW5yHbivLhTeF60Vfg+rTHtt+sXE5q4AbDvjncn38x94U62OJ2737fTCCZ8hyJRb8YMe5u
	5VxASrx7mdyXEBbAzse9h7jYORKVBhiGuRNzriGNBJGkZQJNiVzLybhmdyO/ELFahuCHre
	nH9uCQPnOTtBh9rvb6UDebChy4W9IkFpi1X0Q4aEyL5JQ6WNIDSqXClJNQ6+RLtcZYqgYg
	sOa8Ns43QWGB28lcU7+yrEfgrtxKHiaK38bkms2JEgu10mfPpi/Oowb4g3ipDg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1739516912; a=rsa-sha256;
	cv=none;
	b=hNXJ2kx0D48Onz7qIBVhCiuWFLZEEUflC1YGrgSqZ2Esn74WFkhWu6qQYyVq2GdESnb1ov
	SMdElxJP7SwmPJUPqGT9tLRW5m801Z9q+2OC/eiEvc0/FVzfuVvlDi/tJFFsO1WD6hiG+a
	rm2lhyIsfMZeiF2JrvLDLFQUt4P1aSQQUnEZ6mSJyEijL82ltVx9xlBJHNXP67iQsGGEg5
	nhSy6G9Yvg5AA8/auKmI/JBtvv390gKB8fY1494rCdIDI7kDBPI+1E6buIagCD2/qZuG1n
	TL2D+PnWGO/nImJx8M2x50OCRt8HHrtrn+l9TrhiyFldS307kU0nvqeFTEv/NA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 13E2B634C93;
	Fri, 14 Feb 2025 09:08:32 +0200 (EET)
Date: Fri, 14 Feb 2025 07:08:31 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Zhaoxuan Zhai <zhai.zhaoxuan@canonical.com>
Cc: linux-media@vger.kernel.org, Ethan Hsieh <ethan.hsieh@canonical.com>,
	jianhui.lee@canonical.com, guoqing.jiang@canonical.com,
	hverkuil@xs4all.nl
Subject: Re: Questions about image size listed in VIDIOC_ENUM_FMT
Message-ID: <Z67r76Fg-SOEbOJf@valkosipuli.retiisi.eu>
References: <96f6dff1-f5c7-4fab-94e1-47004dd916a6@canonical.com>
 <3bd7482f-e41d-41df-9d25-08cb62d5d0db@canonical.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bd7482f-e41d-41df-9d25-08cb62d5d0db@canonical.com>

Hi Zhaoxuan,

On Fri, Feb 14, 2025 at 12:19:23PM +0800, Zhaoxuan Zhai wrote:
> Hi all,
> 
> Sorry I made a mistake. It should be VIDIOC_ENUM_FRAMESIZES instead of
> VIDIOC_ENUM_FMT. I'm sorry for the mistake.
> 
> 在 2025/2/14 12:08, Zhaoxuan Zhai 写道:
> > Hi all,
> > 
> > We are working on a camera driver. We plan to use v4l2 interface to send
> > image data to users. We have a question we'd like to ask.
> > 
> > The situation we are facing is as follows.
> > 
> > We have an image processing unit that can process raw data collected by
> > the sensor into the V4L2_PIX_FMT_NV12M format and send it to the user.
> > 
> > However, due to the requirements of the V4L2_PIX_FMT_NV12M format, the
> > width and height of the image must be divisible by 16.
> > 
> > For example, when the sensor provides an image size of 2104x1560, after
> > NV12M encoding, it should be pading to  2112x1566. But the additional 8
> > rows and 8 columns are padded with 0s and contain no actual content.
> > 
> > So, we would like to ask, in this case, what size should we list in
> > VIDIOC_ENUM_FMT? Should it be the actual image size with content,
> > 2104x1560, or the padded size, 2112x1566?"

I'd say the actual image size (i.e. where you have pixel data). The
sizeimage field needs to reflect the padding and the user needs to be aware
how the data is laid out in memory.

Also cc Hans.

-- 
Regards,

Sakari Ailus

