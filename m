Return-Path: <linux-media+bounces-29374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BE4A7B8D6
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 10:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22126188F556
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 08:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2498199385;
	Fri,  4 Apr 2025 08:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eVY6lAo7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CB718B463
	for <linux-media@vger.kernel.org>; Fri,  4 Apr 2025 08:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743755267; cv=none; b=fvaQwEPt9Ay6ZIPGmnLY30DBjD5oT7PMsecgXIG5uJeYyI+LVqkQg7chKG5+/50Bh5VFmrYbIR8+RIw++kUQZ43dzY4HcM8N99ZSk2obumHLd0iBXUERd+l6p5IPvcQ64B+aqq2g3xJVI1gGcaUh1sC1ZbHUKZ4YRL8oVXhI6Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743755267; c=relaxed/simple;
	bh=6J59qiE2/DyR8bp12iRSJ3b4eCHXTbUSaacflaSE4Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c625hQdbYh2vQo6mGSiiBUPFqGw4uBpjHD9Sl3DhtV+fcGml5Tkxdc3D9PrMKNN5qVaZnk96Ye5X6dhnhH2e8oHi+fP3k0QOitiBP8lPshMKmA/4UeM7daB3Li37XyzqviVeTv2MeXvS0BrmhFD6ZUyp8bkcJ3ii2AfgJ7Kgq9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eVY6lAo7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so1517901f8f.3
        for <linux-media@vger.kernel.org>; Fri, 04 Apr 2025 01:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743755263; x=1744360063; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DJa0y5uHqB+uXYxg4Ee5P8Mqg/g0/KhhIdf1SuA6v4A=;
        b=eVY6lAo7hqueymdGO2mdjSexjzxtDzQEKqNPrKBPhgQBYIvNNaw8XHuRFY6p+ZYoo2
         QFnOfowEhaBIQNj3DrG4iUIc5ckQRfNrVn28dvpYCCwAhBGmsVMNTP5ggBGdTpVtjV7X
         FgMpVAnsGlH/t4LqAQlY4FTmRaONUV5yuIgRnhB5kLa3DaMtQqW/VXuRcy6LUWVp157/
         eVb2F2P9xgDLZtcwhhHL5X4oabKmoWkr88QC5KXwncM8nPgxzStN5yNYjHH+nPvLBOM9
         d1qCy5b1A7ZCZqBKqMWpPdc4tpP8feSrJ/RDV2ygKOKB0dnapGzV69iqmOn+xfDN1c5a
         EcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743755263; x=1744360063;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DJa0y5uHqB+uXYxg4Ee5P8Mqg/g0/KhhIdf1SuA6v4A=;
        b=N2XOe9FYEHB6ZHvYWdDSS3OlfwcNVuQn8YkTqLtrXub/SwsJmmF4vRtSBQSEdIFtJj
         7jICVHkmHu2w4JMwHgSvqFjMzjlVCqzgpzG6LDIXLftS4nFpAXxX8jSKEebTfNoT42GL
         xrKgFWWvSRMocu/IEKPPbkERMeK/HhLrIfJgraVyo46KDl6cC8Bg1dsz64aRwOKXbIPU
         8HKnt5RMns+lvBmg15SkUwlsXdMd2tj9bCohQ4sBJlOney2WgrpaUcMGlqcn0dt0cHnZ
         B2pHp/91H7ORNzZcX3nen1sDB/mTd1Nud/aUmA1K4vyU1CkIGGgK6mXNGOwN+CmBLeNH
         s+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWB0vYn8JlwZIG0N/xVKRWxvcfBycdogwgVo91lHIokr1dqdRRrSeHoD5hET23nSTP5iBA7XlXPvufbDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YycE6azUTIoi5SV/5cnsbJGXphsum6MWFQjWLHP7z3CngLd3wPj
	rJyfsCFePrTP3KkctkNBw0PrA/C90sIv3VvbKCZDn6bsRUXrWyvbR5hblQc8yR8=
X-Gm-Gg: ASbGncs3heAnGN6ajVuMqgb91MzUsuyVBSeuanqBBg5kt7m6ZqzWA0kBc7QbUqnpdRq
	G6zPhFDT18LJhcjPamlknyYthby14LpAT+HeSDw/lmH83i3fhCrs9UHF8nLjDPtYlT+GkD9t0s+
	dGfzIZ4vjxCuL7PgOfBDEHk1QimAO1k4MIBlCc1dIbROiN8fx+ZRpIXbJmx5RTUSTu+HtKja+01
	i7pRArQD+xDypLAqU1lI1Hp4UO3fwCJ7e1h8tjwd5jJcU53YGcHslPcD9193Xxpvw9xsU/qKcQh
	QYRfqf8YiuN29uR4Y4Eh1VDzCCqbbRhBVcnDa/JZFWi6LeVtyA==
X-Google-Smtp-Source: AGHT+IG+NDQDuY7wpbCJM2rLv7MTUqbCkkmKdHj5rYcXcQpcsNWGZu7a+1mkk53652ueI0HgxX47pg==
X-Received: by 2002:a05:6000:250a:b0:391:12a5:3cb3 with SMTP id ffacd0b85a97d-39d0873fd19mr1619780f8f.3.1743755263387;
        Fri, 04 Apr 2025 01:27:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c3020dacfsm3780694f8f.72.2025.04.04.01.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:27:42 -0700 (PDT)
Date: Fri, 4 Apr 2025 11:27:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Rob Clark <robdclark@chromium.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dma-buf/sw_sync: Decrement refcount on error in
 sw_sync_ioctl_get_deadline()
Message-ID: <03c838ab-3bc8-4e5a-9f0a-331254701b0c@stanley.mountain>
References: <5dbd6105-3acf-47ad-84d6-2920171916ac@stanley.mountain>
 <0e832ed8-9692-43ba-869d-8db3b419f3a9@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e832ed8-9692-43ba-869d-8db3b419f3a9@amd.com>

On Mon, Mar 31, 2025 at 02:02:44PM +0200, Christian König wrote:
> Am 31.03.25 um 11:45 schrieb Dan Carpenter:
> > Call dma_fence_put(fence) before returning an error on this error path.
> >
> > Fixes: 70e67aaec2f4 ("dma-buf/sw_sync: Add fence deadline support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/dma-buf/sw_sync.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> > index f5905d67dedb..b7615c5c6cac 100644
> > --- a/drivers/dma-buf/sw_sync.c
> > +++ b/drivers/dma-buf/sw_sync.c
> > @@ -438,8 +438,10 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
> >  		return -EINVAL;
> >  
> >  	pt = dma_fence_to_sync_pt(fence);
> > -	if (!pt)
> > +	if (!pt) {
> > +		dma_fence_put(fence);
> >  		return -EINVAL;
> > +	}
> 
> Good catch.
> 
> I think it would be cleaner if we add an error label and then use "ret = -EINVAL; goto error;" here as well as a few lines below when ret is set to -ENOENT.
> 
> This way we can also avoid the ret = 0 in the declaration and let the compiler actually check the lifetime of the assignment.
> 

I had some issues with my email and it silently ate a bunch of outgoing
email without saving a single trace of anything I had sent.  I see
this was one that was eaten.

Unwind ladders don't work really well for things where you just take it
for a little while and then drop it a few lines later.  Such as here you
take reference and then drop it or you take a lock and then drop it.
Normally, you can add things to anywere in the unwind ladder but if you
add an unlock to the ladder than you to add a weird bunny hop if the goto
isn't holding the lock.  It ends up getting confusing.  With that kind of
thing, I prefer to do the unlock before the goto.

free_c:
	free(c);
	goto free_b;  <-- bunny hop;
unlock:
	unlock();
free_b:
	free(b);
free_a:
	free(a);

	return ret;

regards,
dan carpenter

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index f5905d67dedb..22a808995f10 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -438,15 +438,17 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EINVAL;
 
 	pt = dma_fence_to_sync_pt(fence);
-	if (!pt)
-		return -EINVAL;
+	if (!pt) {
+		ret = -EINVAL;
+		goto put_fence;
+	}
 
 	spin_lock_irqsave(fence->lock, flags);
-	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
-		data.deadline_ns = ktime_to_ns(pt->deadline);
-	} else {
+	if (!test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
 		ret = -ENOENT;
+		goto unlock;
 	}
+	data.deadline_ns = ktime_to_ns(pt->deadline);
 	spin_unlock_irqrestore(fence->lock, flags);
 
 	dma_fence_put(fence);
@@ -458,6 +460,13 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EFAULT;
 
 	return 0;
+
+unlock:
+	spin_unlock_irqrestore(fence->lock, flags);
+put_fence:
+	dma_fence_put(fence);
+
+	return ret;
 }
 
 static long sw_sync_ioctl(struct file *file, unsigned int cmd,



