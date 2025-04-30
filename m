Return-Path: <linux-media+bounces-31375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE94AA4551
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8B5E1C0227E
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A147217F36;
	Wed, 30 Apr 2025 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yGUnTNVx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686DA216E23
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 08:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001650; cv=none; b=U2dE1Q0owp5LujmYLb4DL+QDkmib/nq3aEgyZb/87RNw4IG2bt3kkMRkObo3Oddj4rkE9ccomQX9UptXY5EcMPxM8fWKWVhocYeHa/4yE8vpS+VES6VQneYyyJR60caBR5fXHjH0cgLloRukgSMGgC9bUpK5Ilv8q7ROYFWq2S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001650; c=relaxed/simple;
	bh=xPP7d3J9Mbr2HWLZwvqRyujPuKr6mcqoJc9CxFzickE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BydmKjOMcgEo3neC0fPRY+7NrnRa3xe3AEbP7V/SFWM6v9vBFg4VRDmAvLfUbgsxSGR9FOekOI52Bb3op41u5VZHe9FEvYYybgIrYrFoGyIaPxAs8hwM0ryFCxN2QZjdkroCBgyF3Syv+q3JAC/x2VkUqA3BLtzA7jSJPUy1MEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yGUnTNVx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso43992345e9.0
        for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 01:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746001647; x=1746606447; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wRxUK2FUEvHutdWtSofNv9/gWau2hfAWBjlb4ZMxnvk=;
        b=yGUnTNVxneNswlEqap/AcAMeh4io1lZHSWnOlMOeHH+0k2r5aofIDLinlnNAWudJ8Y
         I006Tqebt6qMuZ7kXnU5POsNb9qDoyBHpmcGjfnRLVIkeCLC4vxFUL0EeTXmSpN0S5nw
         qxXKj3l3sjVLOEQLZ7qyQlrQ7Buyaax2M3KPkNHrEGDHcZr/u2Gv7m+c7ZxaOyu09dY2
         2zasulIkA79FNcCI5/hO7buR4Lrfns1eobdNPNenBZq/8WF5LpcCJr/y+FQk8idjJuEf
         yEB6M6tRTCij5iCM8sc3PeGx2Qa8CjO2BL20erjdv0d3kM2hnkIHP631E8FmHr+E5se+
         74MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001647; x=1746606447;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wRxUK2FUEvHutdWtSofNv9/gWau2hfAWBjlb4ZMxnvk=;
        b=DIbcoyQWx0ufEjntEDrjmhWq1R3PhUETflZog6ax3qrDSwj/Z3v47JfXcY2YFmkqvm
         4w4UwNl0EuqvACAL/2fwT2AY8JdGxa5NI+TqAHYRT2gtxbNgkanqEFFFNnc5JIPBzdE2
         WVrrAA7S1KDzpsMSlT9xG4Q6QdZXkkJz257WRDeCfVvcU9NKEqcOvqO2drfn/NhXxSLt
         +ADXXJjHK6AoHCrfonb268J7JzeZ/BcSNHa6IjQeLOXLY5zfrnyYpPqG4kady+vLAGeO
         hrinkBhioh38PrlvA6xPv/lE4PP+xXKObXujNGYDf52mxgvXVFbCKWyQqR4BsYkzC4PR
         F4qA==
X-Forwarded-Encrypted: i=1; AJvYcCXU8fBF6fNe5PXmCaDl+LDvthyXEUox827kyGorXZGxDuIQPWg2Rai3KWBTwijuoBht23McVG4RoMF/Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxeqhx6VASJP1LA22h2LIu4naZAhcOeyVQ5siPn1HRbsdpIi40
	cBkZEij0qBCIjRZJ4OjOjFa/815qhfr9CsoZwDKrWO9OkJh/VoajrCjrKKZwAXg=
X-Gm-Gg: ASbGnct59C/WRKVG4+nXbro4hP09pTImUWi2iNi3VliAHJJxHCYBAoaut6M0C2N/hhM
	LFaHwGuObRxGBNpKr5Hr+94VKGSiieTAFhWfFIxY/dQoIJNJr4A+d2C/5GBo03E5r6Q3aSOH0fX
	kEwvlZy7s/aUT53VV5wlVWJGsjJ5o4mH4weszsX7R60kMpArBZeisE0HwIyA3cX4ABKpQDa9Y9n
	CIdplMY/wmpfuiiK5PIyH6qgKCrapNi8wrlgZO2RMgq+jdlw+e2R0BNJqrIUFQnNgWG+lYgaZ6X
	dRtrBz17a9xiU+jl3glMxLNYQR0dbnztN+9vwYMIG6NvUQ==
X-Google-Smtp-Source: AGHT+IGLgSE82V30QGFI2YTNb5zjWgrYnQeumoN54mXutxmesQkpkc+itpXoS/eNr3nk+ofe2Yujeg==
X-Received: by 2002:a05:600c:348e:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-441b1f3060dmr18338955e9.7.1746001646622;
        Wed, 30 Apr 2025 01:27:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2aecedcsm16461545e9.15.2025.04.30.01.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:27:26 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:27:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shravan Chippa <Shravan.Chippa@microchip.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/3] media: i2c: Fix some uninitialized return values
Message-ID: <cover.1746001540.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These were a couple uninitialized variable bugs detected by Smatch.

Dan Carpenter (3):
  media: i2c: imx334: uninitialized variable in imx334_update_exp_gain()
  media: i2c: ds90ub960: Fix uninitialized variable in
    ub960_serializer_temp_ramp()
  media: i2c: ds90ub960: Fix uninitialized variable in
    ub960_rxport_bc_ser_config()

 drivers/media/i2c/ds90ub960.c | 4 ++--
 drivers/media/i2c/imx334.c    | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.47.2


