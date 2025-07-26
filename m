Return-Path: <linux-media+bounces-38506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D397B12CC0
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 23:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D6605427C6
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 21:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387382222A1;
	Sat, 26 Jul 2025 21:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="FjYv7uJH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506A720C029
	for <linux-media@vger.kernel.org>; Sat, 26 Jul 2025 21:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753566613; cv=none; b=Od2Cr82cJ4N5B5TTIHQQFw2pqTkoB6MSBj6Aun+nWzzxJCf8wXoEBr0mHJC93puK9jaclFcYV7GOrwpincwVb1uvc25Q5+kho5/CftwZpjE02qVQbeQHpRw4AY6ZAPpDUc/dI+11k8Bzxh94T4Bs9q7d9PfQojiC5+C/a0Ctbp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753566613; c=relaxed/simple;
	bh=kSk6pZi5JERX35vTFewHBzc9w+TCNbhDLEr20oEZUH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcYGNWm2MJ4QJELcD4B5ixejkFZAgLaX4x7guvsTvc8iyW5hW46knoWYYU2+UhSFqP+h6Qn+4fCnCEFekNYb2bg3UEXdSSAcattElF6xuCo1SSqO3jrxT2Keqp05zBHCOW0t0mWBXwMyhfLFjXv6SAiuNTLpJDpEOtk/jx6KW3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=FjYv7uJH; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b3226307787so2741938a12.1
        for <linux-media@vger.kernel.org>; Sat, 26 Jul 2025 14:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1753566611; x=1754171411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OfyX0fUAfObswyvdjCTspDSkpBigkD/S5xxQ8c6KV3Y=;
        b=FjYv7uJHRGCMal4GaUhg99baBOP2kMvBuHwNBYke92hwbshg745PM8jv93O1pmDHa2
         6FWCjYQlYgNth9gK4eqCp3jsNK3E35d/utH1/aftvRQgLrEQPe3/eQBp85bsmxyxFIle
         VI+1Tw8sb+B59c7sk3NSuE9pBnbCO8wIGGfkAfPwfou/WHjDyDpPxLbpHQaheh/guQRy
         jJcWQfqAU7HpOuB4PIVsuKtmTfoUGSMpAQWQkHkt6IMHwfaYxtJoawI2eYtanGjUBJfn
         l+mX0Ht5UGjdOuYnZiOJ0QqIWw+534q5KukeUIp471iDlAkCxsg1knqaq/GMzN7eBrdo
         EL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753566611; x=1754171411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfyX0fUAfObswyvdjCTspDSkpBigkD/S5xxQ8c6KV3Y=;
        b=ErNmcWno3o2vybzij3ujNzOG/aCr8cSc6CMs1iBbprDzk2/HwIJCNcaas3HE1+p03x
         b1aIoGuMe6D7Akja4YR0ZIx97uFzXBuCrJJ2QNci9zPNK2FkI/GZFTD2MBeD6SSVMh50
         8/bHa4tJtuILQV+yQardulH2GZXing0Z7AzMUnHCQYhnSOYWY/bO4AjQ6CxUHL/X5yjC
         gRWQtz6Fgeso+tRIh/wrNUy+jDqCf+obSEQCciXHVQA4rs2DGAhjt0O6//2WRUKk07Dz
         HzgDD9QYmDSpJGVM6lb6Y0emeKmhol/LKLsTG8z3fQHdZMcYO/Ta0CR5Ug+uboCcLDHA
         rZsw==
X-Forwarded-Encrypted: i=1; AJvYcCVCaQ9I5H1f+OwTOUhlnJxHYVXYH1QGb5glbnu/JEx2YO2kYyMxlP+HAsXOPBET2tNR2pXHTtH10SSkvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3QvtvhKsHRF3Ng3O2GJw0mBAX8/b8BXIH7xKYvEYKe/4wAZy0
	GWZkAQXQn5uSL5QWMxE8Q82nG+k85VShEO+NSr/VDfAeZnNNUfpP6Sn9q0EXMyXbBV6D
X-Gm-Gg: ASbGncvwPnuOESZg7XpffauKQIUuEZor4h8jOKoblgvJXvEvf2OAoPGkBuXDjCo1znd
	hT7VPJSyqVlCSwSwj7Qavl2Op1gBvZu2wRIP9P8E5FSdRRIz65m4Z+cumN/kGkNJ825lVBVtCOd
	acwv85Dr1THZMVjccxzz7ZTJ6AxpupIdbYrQ+cZLuZVofZF+bg8N0jX6ThswKbN+7kWc766ykaH
	EW7XBfmb33XkhrnduHN6knUPjXylw4MSg+GGaJ8XCZHrdqPYm3kWjPM0jmDsXEnzEplPcfmplAv
	uuOgrUFblrN1afzbeOnEiB6FOnNS+03eL5stQb6zWsmbqvHyRpr9VZrQDw8GNTLKrJOINPev7W+
	ajeyMQp6D7bipFMAgVB4p1UnKnv3WXXuxxss=
X-Google-Smtp-Source: AGHT+IEkYrj6kv0r98d6vdlLZ7nm1KHBvgDzCH8zTJu/LUIUWNAlJSeF/oMmjr7mZf/D/M56RHi9Iw==
X-Received: by 2002:a17:902:e74f:b0:23f:ac71:ef0 with SMTP id d9443c01a7336-23fb3197539mr109807735ad.43.1753566611371;
        Sat, 26 Jul 2025 14:50:11 -0700 (PDT)
Received: from sultan-box ([142.147.89.207])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe30cef7sm23128315ad.26.2025.07.26.14.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 14:50:10 -0700 (PDT)
Date: Sat, 26 Jul 2025 14:50:07 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com
Subject: Re: [PATCH v2 6/8] media: platform: amd: isp4 video node and buffers
 handling added
Message-ID: <aIVNj1DLab18eArC@sultan-box>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-7-Bin.Du@amd.com>
 <aIEiJL83pOYO8lUJ@sultan-box>
 <ff2f17c6-c5e4-4b7b-b897-8abb4cb79c35@amd.com>
 <aIVLlZvTQFoBL70r@sultan-box>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIVLlZvTQFoBL70r@sultan-box>

On Sat, Jul 26, 2025 at 02:41:41PM -0700, Sultan Alsawaf wrote:
> On Fri, Jul 25, 2025 at 05:22:41PM +0800, Du, Bin wrote:
> > > > +		dev_warn(buf->dev, "ignore buffer free, refcount %u > 0",
> > > > +			 refcount_read(&buf->refcount));
> > > 
> > > This refcount_read() is a possible use-after-free because `buf` is accessed
> > > after isp4vid_vb2_put() puts its reference to `buf`. So something else could put
> > > the last reference to `buf` and free it after this refcount dec but before the
> > > refcount_read(). Maybe just remove this dev_warn() entirely?
> > > 
> > The warning is important to debug mem related issue, plan to keep it but
> > without accessing buf or buf->refcount here. Do you think it acceptible?
> 
> Yes, that sounds good. So something like this:
> `dev_warn(buf->dev, "ignore buffer free, refcount > 0");`

Sorry, to fix the dev_warn() we need to make a copy of buf->dev first:

--- a/drivers/media/platform/amd/isp4/isp4_video.c
+++ b/drivers/media/platform/amd/isp4/isp4_video.c
@@ -584,8 +584,9 @@ static void isp4vid_vb2_put(void *buf_priv)
 {
 	struct isp4vid_vb2_buf *buf = (struct isp4vid_vb2_buf *)buf_priv;
 	struct amdgpu_bo *bo = (struct amdgpu_bo *)buf->bo;
+	struct device *dev = buf->dev;
 
-	dev_dbg(buf->dev,
+	dev_dbg(dev,
 		"release isp user bo 0x%llx size %ld refcount %d is_expbuf %d",
 		buf->gpu_addr, buf->size,
 		buf->refcount.refs.counter, buf->is_expbuf);
@@ -601,8 +602,7 @@ static void isp4vid_vb2_put(void *buf_priv)
 		kfree(buf);
 		buf = NULL;
 	} else {
-		dev_warn(buf->dev, "ignore buffer free, refcount %u > 0",
-			 refcount_read(&buf->refcount));
+		dev_warn(dev, "ignore buffer free, refcount > 0\n");
 	}
 }
 
--

Sultan

