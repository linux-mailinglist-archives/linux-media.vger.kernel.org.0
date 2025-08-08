Return-Path: <linux-media+bounces-39127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AE5B1EA34
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 16:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE7651AA6566
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 14:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA18227EFE9;
	Fri,  8 Aug 2025 14:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tFxKlQmX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823DD275B0A
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 14:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754662680; cv=none; b=Ue5a5YX/XRGa2e4Bt6cQm9C2PR+bLrUTGiyMiroyrmRCFjeg+JuGZLteJbdKWIBZauriBzz63imq/N2GyxWy9RXRtjS+spPnmpR5xGtN9+e3jRFE/abdMtIezZylQ/DbbRJTK4yADAgYPLCeuPPVZy4z0AAp1C4i/rH48xo3nCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754662680; c=relaxed/simple;
	bh=daIX4JK8NK3VHE7qAVQNF+gGHWpHY0OS4ETmy5cXu7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwV8na4ak+fItdGfZ0qNtjmxd6qzYWMiLe3Kx8uYeyuopco7IMxy0HF99scEFa+gmwL8k9eVn3kjrJuPx2hEaJn64CnB++chbEiLDo/EgoPUyl3hM3qJAVSQ6veL/aLZK9DEgNxW/g1zj27xANiAodF770ihLBnN2r5ky8iIv2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tFxKlQmX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b8d0f1fb49so1310502f8f.2
        for <linux-media@vger.kernel.org>; Fri, 08 Aug 2025 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754662677; x=1755267477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uWZABYiSs8SrBKzKqRb40mOmDVtsHcPHk62yBk6hQeY=;
        b=tFxKlQmXUPooHogoQUErjPnOEGbqw3bFXRjp5x8iPYfWJRbQ3DolIZXfX6NuHhT8tJ
         RhctZ36i3WJZt6V8Z2ChaviRmPMGow39uHNOgK6snsFx5B/SVqvx/Y55VmTy8IkBKN4I
         FDVbPEAUJIqID0MkGkgFS0hvWwg0kW8pjneyYi8fF1YqAtgjLln1M/4f93/n7QIma4E9
         JjfNnJWUqGFzOkHEiXN+7JCwhbWl2OIM0D+a2OhU3LC4NYQz+8UGMujqaL5yiLhoetqx
         OopfLoC9vNbVH9Q4MU24sVY59UMhO8nMBhbkRDkT4x4Xgp9MupVgwMCJsm+nv2rbvE+A
         uGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754662677; x=1755267477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWZABYiSs8SrBKzKqRb40mOmDVtsHcPHk62yBk6hQeY=;
        b=mSiphHPs4phLpc1lXiaHx9taWlGU7m4IuasotXQXjAzW0fH0T3TMmbD5BhmQsRh8h6
         zb1NlHb+WK+63q9bDgZW4cWQOGCPdNfN/SV4Jf3BlagWJnZbQNL9mfK6hWPeSw6JX1aV
         QmDHc+fYFiZCEXr8idIxR4K77ExJuWgriJAcf1U6KDVsw89eYoLDtq33z9tOwaJ+zJhg
         Nh+uiDfSokbsASBGPz/u5SjhP8yf6aArT2fUb8dmTzbYiKdVFwSYS7tOib3/O0VA8jQy
         sHisnzcasbJdsZ7V9fB1HZRArMKBr6qmBMgFaMY2iLB+Liia8i36oGy9Ng8RE4e6JcQg
         eA8w==
X-Forwarded-Encrypted: i=1; AJvYcCWxPzeIvT2eYU/dY7FDF//r6C8g+Go/Ufi01CKYAy5wh1tsUdpZPLT/31DatgeiGjYRIw5Rathz1t/PyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1N16VuN3dVA3BohBtZLNPnjPoMIvZAP5OAIrjEhPWffT109ug
	Vl22aEkttwqTepiFjjcxf5e6yS4GCW3ikmI13i0nDFnP8qm7uVQe9/b6JpQtnjQ6Yo4=
X-Gm-Gg: ASbGncu85rdU4LauaQe5QkwxtgcZFFgG0940TusI94JTv4SxIRP2sjWuJ8xJNllo5wb
	x3W2X8ZetpfBh33Ywjk/Ado2dhTm78VK8aTefQWT5XYTEO+Kj4J3fSeNFD0LWedS9O7M96mDh5a
	uWD/C32EfXIvqReukadtLMvAqmNk1vvLBWjpB2BqKcE4pTTuvQv9JpuPICL3lN+L92m+mPhZJYg
	Tj3NsI589K5Yv4rD5YHrr7J1F3sxiK216SUejKa6qiRtM9UDp3nQaRJlBuEh8CLPTEXPYYWNbOB
	ZIaHwYH5QbNu6entbxPYSjcsfOef/mGLFdXmWygR0jcyqy56KcbIrmatoF8KSmCRKeNubB5PmwX
	htXfWlkobCIEjJDOloQYc1oLxllU=
X-Google-Smtp-Source: AGHT+IFPPfJMbG/l0hwg3hY9KzR9hWEGIjCDtVw/Wfa9LU/nZh+B3l1yZ8BOL2K2cF+u/tp52PSl0g==
X-Received: by 2002:a05:6000:2308:b0:3a6:d92d:9f7c with SMTP id ffacd0b85a97d-3b9009298a6mr3071537f8f.9.1754662676678;
        Fri, 08 Aug 2025 07:17:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c4a2848sm30099218f8f.71.2025.08.08.07.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 07:17:56 -0700 (PDT)
Date: Fri, 8 Aug 2025 17:17:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Colin King (gmail)" <colin.i.king@gmail.com>
Cc: Yong Zhi <yong.zhi@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"mailing list: linux-media" <linux-media@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: media: staging/intel-ipu3: css - possible typo in array being
 assigned
Message-ID: <aJYHECY1gjZ2xsSP@stanley.mountain>
References: <9b3313da-9cc3-4d3e-b271-05ee36736e4f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b3313da-9cc3-4d3e-b271-05ee36736e4f@gmail.com>

Yeah...  It probably should be the below patch.  The commit message would
say something like:

Subject: Fix copy and paste bug.

This code is copy and pasted from earlier in the function and the NULL
check should be if (p_pl) instead of if (p_tr).  Except that p_pl is
never NULL and the check can be removed.

The impact of this bug is that for several callers the
"p_pl[pl_idx].cfg_set = pl_cfg_set" value is never set.  (I wonder why
this didn't show up in testing?)"

regards,
dan carpenter

diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
index 2c48d57a3180..2d1c38119258 100644
--- a/drivers/staging/media/ipu3/ipu3-css-params.c
+++ b/drivers/staging/media/ipu3/ipu3-css-params.c
@@ -1617,10 +1617,9 @@ imgu_css_acc_process_lines(const struct process_lines *pl,
 				/* Inside the grid */
 				p_pl[pl_idx].lines = process_lines;
 
-			if (p_tr) {
-				p_pl[pl_idx].cfg_set = pl_cfg_set;
-				pl_cfg_set = 1 - pl_cfg_set;
-			}
+			p_pl[pl_idx].cfg_set = pl_cfg_set;
+			pl_cfg_set = 1 - pl_cfg_set;
+
 			pl_idx++;
 		}
 	}

