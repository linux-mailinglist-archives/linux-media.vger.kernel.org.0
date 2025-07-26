Return-Path: <linux-media+bounces-38505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30456B12CB3
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 23:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7F68189E570
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 21:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D782222A1;
	Sat, 26 Jul 2025 21:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="I2pb7UzD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E1E21C184
	for <linux-media@vger.kernel.org>; Sat, 26 Jul 2025 21:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753566110; cv=none; b=W+NRjgtrMLM6h6aOrGSMpSYAEnT81L9BeZi0Krazu8UAJI7y4ajNfpSFRmC3TTmjBta5yRZw4gFEa2U8kKHUxfyonAYZgbqGq5W9HJKN4/7Jf9n1BEdN9aVC9O6ZARArMTpJEmTpT6gHE7esXpNL3HOtTUp080jnsReHPGSEtvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753566110; c=relaxed/simple;
	bh=/C5sZYXLh1D3x18pubyMwI6xQ1bhbBON3vKomijkFZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cABX8xAmf1MW0OQs/2hYrT3e6QVNPu20L8iAinMc2K4WVE3spLiV32Tkq8VwM2LV+ZMZxxwoyKw1ZlBV4DVe7NAynwxC9Kb9BHrQ89c9bSP5ONJI+cp94Useo7cdaUnMB7VDO6q2n2LltEIoE4mTf8Z3ih+N7xtHcyfF+rZ37oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=I2pb7UzD; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2349f096605so38692725ad.3
        for <linux-media@vger.kernel.org>; Sat, 26 Jul 2025 14:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1753566107; x=1754170907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rs2+aUKXKDAWp/9xZPQX34KN7Y9pjWo08LcS4J6bqco=;
        b=I2pb7UzDX50w0ug3X90D0gg8Dq7enpqE9JocficqFcDjTJGisWepkKvPt8E2hKifem
         J1MnA6f8PYZb19Rd1CbAQQZMU78FilgDpLIngI8sd6FAjBIzfBPpFc7F59oYTTyAJEsM
         Oa5c47hskE6kpVE48zonIW2wWoehl6eul9SuSbEOxuBgwNTieCaXocTaavYVYOFGbDbn
         EdO/J1mWJRBRKAmWK3QlS6eC01ncB5DknT7KHR0Vnb5+habx3rFgD4dfZJhs1dlOeE5E
         jGMecENNyS733DzoouuAVmQRKKRTW1lTPtPuyIGSak4U87vMPKiOZdsgI73eTDEsGrT0
         vTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753566107; x=1754170907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rs2+aUKXKDAWp/9xZPQX34KN7Y9pjWo08LcS4J6bqco=;
        b=QFOrIMFK7NiPtBOQOBEoqHb1r6PyOBN0ci3S+nJXk4+L/rF+SBAUsARnyJdeKj0A0R
         2YhkrZaEd7RqJetYfxOpTLBQYP5kvT1OBWTHgiEPhOIRJWfOMpq/LLEUVnEnmlqrI5Lx
         yF83IExEBRE3AtY1L8aw9ET0+v4mV3HU6tAI9oA88+xX7nUfvAN5odG33R3B/MnK4MkQ
         CERi1X/r3dX1VD+TWJEwvW8iU/pZ+FR5CFSOnmgFl+fw3j3azANQA9msfdT2u99Xmyqw
         rcvUHnZPwKr55K2KfxBlH16s7iRIIIrS/6yI1A6I3wcToUEskkOlQtXhVcykkt/4qxRo
         S4Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWflLnvKWS0Mwf86sXr+yXiMlwpKiLiCqS5m+tUfbO1sBgYTHhXImyFgTBF7XFm3uXc163LiI7eKGhZnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfuP+Ozw/czWEGS4g2kvOUgjBqB1jgXg/8tlUvF9sfKvIeuYA3
	jkUhHAx7Rxyr/c/BUvaZoRluyGBd0jLHNJ/mIIr2NBGao+ED5AC/3QcnWgZIRLGwSfcS
X-Gm-Gg: ASbGncsSeSZKMBTCVdqv22ECxyaMZlzwjOmla9KCUXxgHkk6BVv1D/01EpDkA8b4N5I
	0jAQBeNkk8ExZoYZdIfnon/j8tuZh3TJ17aQ9NExbzSlNbuYkpa45HrLF8dNO3E7Gw8b896xBgB
	XiYkwWZnv7kbuhhtEkzLxB9reCTNhnnQCtT0lPCWFkcQxyo9xldk4w14uzWHY+fXBaP869TMC5g
	I5Yq5uIRKqIiAJCI/CuN61VialQ9XA9GcyabcK09bya4e4LO6aR3jER35RjxAIwFQM3BCGBXOll
	0KpHGP853fMiJiN0K7qaXUKAm014j0O6P0qO1BGrf0s8kPSWjgTFt0tWYPY9LlyMcdwE+c7vG9L
	GAgb8KVRcOBG1qc0T1RruonMGZgLsvXKQfsE=
X-Google-Smtp-Source: AGHT+IHMVJv48LgJP5O70k5eAvSlSCPV6tDJVlD6+m6sZAVPOjxebsZVtdpCfVfSxyoEwWE+zeaiXw==
X-Received: by 2002:a17:903:234d:b0:234:b123:b4ff with SMTP id d9443c01a7336-23fb30cc681mr121327155ad.21.1753566107244;
        Sat, 26 Jul 2025 14:41:47 -0700 (PDT)
Received: from sultan-box ([142.147.89.207])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe4fc7a4sm22848025ad.120.2025.07.26.14.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 14:41:46 -0700 (PDT)
Date: Sat, 26 Jul 2025 14:41:41 -0700
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
Message-ID: <aIVLlZvTQFoBL70r@sultan-box>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-7-Bin.Du@amd.com>
 <aIEiJL83pOYO8lUJ@sultan-box>
 <ff2f17c6-c5e4-4b7b-b897-8abb4cb79c35@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff2f17c6-c5e4-4b7b-b897-8abb4cb79c35@amd.com>

On Fri, Jul 25, 2025 at 05:22:41PM +0800, Du, Bin wrote:
> > > +static struct dma_buf *isp4vid_vb2_get_dmabuf(struct vb2_buffer *vb,
> > > +					      void *buf_priv,
> > > +					      unsigned long flags)
> > > +{
> > > +	struct isp4vid_vb2_buf *buf = buf_priv;
> > > +	struct dma_buf *dbuf;
> > > +
> > > +	if (buf->dbuf) {
> > > +		dev_dbg(buf->dev,
> > > +			"dbuf already created, reuse implicit dbuf\n");
> > > +		dbuf = buf->dbuf;
> > 
> > The dmabuf is reused here without taking a reference to it. When the get_dmabuf
> > memop is called by vb2_core_expbuf(), it assumes that a reference to the dmabuf
> > is acquired. So you need to add `get_dma_buf(dbuf)` here.
> After test, we found we can't add get_dma_buf(dbuf) here because it will
> make cheese APP fail to open camera with following error:
> amdgpu: [drm] *ERROR* failed to alloc gart kernel buffer (-28)

I see, it's because buf->is_expbuf is set to true even for the implicit dbuf, so
the initial reference on the implicit dbuf is never put, causing a leak.

Also, the refcount increment in isp4vid_vb2_get_dmabuf() is done every time even
when reusing the existing dbuf, but releasing the dbuf will only do a single
refcount decrement. This also causes a leak.

And, isp4vid_get_dmabuf() may fail but isp4vid_vb2_get_dmabuf() doesn't check
the return value, so there may be another leak when isp4vid_get_dmabuf() fails
because of the refcount increment. The refcount increment and setting of
buf->is_expbuf to true should only be done on success.

I have fixed all of these isp4vid_vb2_get_dmabuf() issues in the following diff,
please try it:

--- a/drivers/media/platform/amd/isp4/isp4_video.c
+++ b/drivers/media/platform/amd/isp4/isp4_video.c
@@ -476,18 +476,22 @@ static struct dma_buf *isp4vid_vb2_get_dmabuf(struct vb2_buffer *vb,
 					      unsigned long flags)
 {
 	struct isp4vid_vb2_buf *buf = buf_priv;
-	struct dma_buf *dbuf;
+	struct dma_buf *dbuf = buf->dbuf;
 
-	if (buf->dbuf) {
+	if (dbuf) {
 		dev_dbg(buf->dev,
-			"dbuf already created, reuse implicit dbuf\n");
-		dbuf = buf->dbuf;
+			"dbuf already created, reuse %s dbuf\n",
+			buf->is_expbuf ? "exported" : "implicit");
+		get_dma_buf(dbuf);
 	} else {
 		dbuf = isp4vid_get_dmabuf(vb, buf_priv, flags);
+		if (!dbuf)
+			return NULL;
+
 		dev_dbg(buf->dev, "created new dbuf\n");
+		buf->is_expbuf = true;
+		refcount_inc(&buf->refcount);
 	}
-	buf->is_expbuf = true;
-	refcount_inc(&buf->refcount);
 
 	dev_dbg(buf->dev, "buf exported, refcount %d\n",
 		buf->refcount.refs.counter);
--

> > > +		dev_warn(buf->dev, "ignore buffer free, refcount %u > 0",
> > > +			 refcount_read(&buf->refcount));
> > 
> > This refcount_read() is a possible use-after-free because `buf` is accessed
> > after isp4vid_vb2_put() puts its reference to `buf`. So something else could put
> > the last reference to `buf` and free it after this refcount dec but before the
> > refcount_read(). Maybe just remove this dev_warn() entirely?
> > 
> The warning is important to debug mem related issue, plan to keep it but
> without accessing buf or buf->refcount here. Do you think it acceptible?

Yes, that sounds good. So something like this:
`dev_warn(buf->dev, "ignore buffer free, refcount > 0");`

Sultan

