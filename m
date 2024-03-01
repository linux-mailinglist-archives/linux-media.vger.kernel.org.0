Return-Path: <linux-media+bounces-6238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 247C686E27B
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 14:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53BAD1C21575
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 13:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610587003E;
	Fri,  1 Mar 2024 13:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z4InROop"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D556F513
	for <linux-media@vger.kernel.org>; Fri,  1 Mar 2024 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709300528; cv=none; b=Dx/C34VTTUcIm1axCgWaqX7W5qFjTKRBYHlQ9L/BhGe93C5s7VvAF+DlcT37ezkSCf3e9cl0KJX3JmpAj2MjLturEErGKoycDyrV442SuPtaPoIC66cyioqX2PhSkcBp3vzcUc3bRfOgni18fGFba0MojItq+nNWbF97LHtgT98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709300528; c=relaxed/simple;
	bh=fOoQnUhhAc6liUjXqMNkl7SNhfdn9BzELDOo6neJx2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jH3Yk3HlDwHQ9AoW2pYGojKwhgOGOTGXBAd+eWOJYo23wYcbJLSBH2OzEwEYyB682xfRx6SMHJdaQj9lrETQE0EzyM4tawWcaAWPoeh0rxyCDnTD45thVC0cG5GZ3YVAMa9lvTLyRIrhECNt9c11MsiR/LirBqzdtXjfMJZDtNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z4InROop; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412c24280ffso11111315e9.3
        for <linux-media@vger.kernel.org>; Fri, 01 Mar 2024 05:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709300525; x=1709905325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lQGlreTAyn3APLCjXtSXcpGzC35vL6EiYGDd6miAJ80=;
        b=Z4InROopDzhU7Apc0/GT+twrfz2OulyPPQXnzzfb0kgRRFWyh1Nu1pGX2E10Yy9ATI
         BRWWgVklkfb6Kp8znCMLf7mpqPMG/LLtr/Z4K+ojpNrfquJJ5EftIXMy6EfzhOtPnzU7
         lYF2XfxN4bZ44a/9OUWAilq1tn+8cyulV2NCegqDC7dmSU6+zT4vSaps0FFwRrwwiS2d
         ofGpV6GYolLnEZjDwk+Eqw9gaLiw+PqtB8Kv3W5Ss6zV+lnjNrX7fq80T5f/K0/e9sLk
         EsfuZAWXxSAEPkZF7kxghi/K20JaieGvB8o9Shzok9HXKBVzZACb+nswAOlOMKsjkpTP
         GiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709300525; x=1709905325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQGlreTAyn3APLCjXtSXcpGzC35vL6EiYGDd6miAJ80=;
        b=L4ukXft8/kUzqtCecvfnhfs7SwGNZTOesjQQccx1WeqY1Ji+Yd75s+ei3hm9MUFt5m
         kU0Z5MpxEunxo5x686OGrJZWDd6n5IJ7dfrcVnRyMy9X0BA+ncIZ6yLLcrE2UNmHHaNq
         LXxqUeiqe8Y20TJCsytDjTr1RrswEniBzuoIWLsQBu17JFMYrxSsnajUvBEHeGrPlowA
         wMjHS7hhTE+pZFJr4QKHygGd4BzSIM+RO0htBi20Q6h5jAuTDtKbWtlq/ovea/x92xnM
         eAyO2+4mfuSK+SeU70jhHV8EOpJnZLICxsM3XM3UbYd1B6lsUrBrLPN93wbf6a4QZNOE
         3paw==
X-Forwarded-Encrypted: i=1; AJvYcCWTo+W9b18KwA9xifAf3r9N4IVpRX/M0Rg8AkM4Wtsz161BVrAaN5DQtiRIWlNvLwke77Otuvn+RHQW8bgxcDeB1qvs9qOhiAAUfNM=
X-Gm-Message-State: AOJu0YzEVcMlTxiLtwucCVY4JyYuVhrjP6slX2NZXYBP92JD9tXkGWSj
	ocED1umScwbju68uM5MViBzIu/iSVug9raT05bX8zu2ZolnqcIuRFpAK9Twj3k0=
X-Google-Smtp-Source: AGHT+IH48oxAyLV5Vg3GSB9oA4Go2//qltAa2mr/bRjgpNO14ZrIKBf+t0wA6J1OaFB3e71GBnGabw==
X-Received: by 2002:a05:600c:4fc4:b0:412:c8c9:c844 with SMTP id o4-20020a05600c4fc400b00412c8c9c844mr1287765wmq.26.1709300525246;
        Fri, 01 Mar 2024 05:42:05 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id x4-20020a05600c21c400b00412afd8425esm8364247wmj.24.2024.03.01.05.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 05:42:04 -0800 (PST)
Date: Fri, 1 Mar 2024 16:42:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Markus Elfring <Markus.Elfring@web.de>,
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: rcar-csi2: Use common error handling code in
 rcsi2_parse_dt()
Message-ID: <260d82b6-e7fc-40c3-b414-50a883709fd7@moroto.mountain>
References: <8b4203dc-bc0a-4c00-8862-e2d0ed6e346b@web.de>
 <CAMuHMdWwegdks3eEviEsBJE3AvUVKbZqHduYdhuwz=8xTMDs5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWwegdks3eEviEsBJE3AvUVKbZqHduYdhuwz=8xTMDs5g@mail.gmail.com>

Sakari Ailus pointed out in another thread that we could use __free()
instead.  Something like this:

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 582d5e35db0e..c569df6057b7 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1372,8 +1372,8 @@ static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
 static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 {
 	struct v4l2_async_connection *asc;
-	struct fwnode_handle *fwnode;
-	struct fwnode_handle *ep;
+	struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
+	struct fwnode_handle *ep __free(fwnode_handle);
 	struct v4l2_fwnode_endpoint v4l2_ep = {
 		.bus_type = V4L2_MBUS_UNKNOWN,
 	};
@@ -1388,18 +1388,14 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
 	if (ret) {
 		dev_err(priv->dev, "Could not parse v4l2 endpoint\n");
-		fwnode_handle_put(ep);
 		return -EINVAL;
 	}
 
 	ret = rcsi2_parse_v4l2(priv, &v4l2_ep);
-	if (ret) {
-		fwnode_handle_put(ep);
+	if (ret)
 		return ret;
-	}
 
 	fwnode = fwnode_graph_get_remote_endpoint(ep);
-	fwnode_handle_put(ep);
 
 	dev_dbg(priv->dev, "Found '%pOF'\n", to_of_node(fwnode));
 
@@ -1408,7 +1404,6 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 
 	asc = v4l2_async_nf_add_fwnode(&priv->notifier, fwnode,
 				       struct v4l2_async_connection);
-	fwnode_handle_put(fwnode);
 	if (IS_ERR(asc))
 		return PTR_ERR(asc);
 


