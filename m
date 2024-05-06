Return-Path: <linux-media+bounces-10822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8C38BC72F
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 07:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8F571F21AE1
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 05:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D630F481D0;
	Mon,  6 May 2024 05:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fat3NDdf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809D047F4A
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 05:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714974990; cv=none; b=mPcjyz2M3mhpfcI/GT3B64ZulM/rQxPSgy9d+ZYBrwGPuwKrkDEyaqT/qkRNGEofp+ygwHVWoisgDPiB82AhicMNkPXy7R1rGOwTXoriAx2xIrSFermZLPV8pju4nqMmdcs62e7yNw7yq3CSyzwj8Fdx56ZDn64yzLIQCVkEcfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714974990; c=relaxed/simple;
	bh=C98g/I9JwAn/FiEJehpiwSZuPG7z1VmWJumqJd2jVIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfrKGsMkcs2BxceWIZRMicHGKVOhurjyp1w+6T4/K9M1CNxh+Gdasr9pBCadqZVyg4DYk7emGgttqMD9B/zNyWDp5gTQ6KIaFDlrgIbkyzgyxnSyWU4/5m3CzuDasAc+9foszroTvCrDU8VEizXy12ATxqrvUHRYPh4yd+geKz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fat3NDdf; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-34e28e32ea4so1248940f8f.2
        for <linux-media@vger.kernel.org>; Sun, 05 May 2024 22:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714974987; x=1715579787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Amm02fq7NCfmTtk6L7AfZpPCsk2Km8qi+JGCzLzXu7o=;
        b=Fat3NDdfgQO5Uovhv0SFs3SuBNFllqxU9o77ZnmSx+d+iDmeO8Gp2rgaQ0VPp4797h
         ECQrSBJaS7e7q+qsh/xFbM4zqNJ51AXHdiQUrgadALh+RvtNTzNBiQR5893pzsfYWfQ8
         Zy/fgmzRm8sa2q1x8LJoj7AkXFtS60dnXYBWL6L6bS7EKfwKT7HeJ/JHqcWjON75ytui
         m15FOavX8bYNjgClEYKKzTuOSbUzFFzUV89gvJ6tvgEIjd8KVg4RKP3Mv3NfNbN1OkKK
         qnwgm/w00iP1Oojdd1ptRyk3sofpNz9nASe+k7ctJ9CyP5JZndnrfJhsuAukRA1W0KkN
         EuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714974987; x=1715579787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Amm02fq7NCfmTtk6L7AfZpPCsk2Km8qi+JGCzLzXu7o=;
        b=JOigjdHvbDJBPO/8l4kJUGnwDYt6Y7nRklNfsthm8yLRS60HiaHP9KabAAn/9th4Si
         lV5Rq8O36P3/ujezdxvmue96fP1MHocSPL+ZpOLP55E6uB+XWGQ+/o4sbeOrN7Ml6vGc
         0wquIWPj79OaP25IrauwFTSh9nrXvKPkYE/x/OcGGs6D6yO4sU87fSFbaxet46JDzIjc
         23Ws5Oejen7Aj1yzBzuK7GQZwma8osR70QvMV7aQJmmoXmaoFP1UUTMi5u5a7uJwpUF4
         9eYjDAlkxcQc+0029gEhrQpV5kshcaL9E7Z3nzVWiIAgfi/WAQDDtQg9Hw4UT36Lgg71
         BLcw==
X-Gm-Message-State: AOJu0Yxu5J5k1QaILc5PNEuW08vbi2G9mBwxwY2jUSU779hqir90NmNV
	kW5/7OSM7Nc7i1kH7Wl/tddJqu99VQOJq3gCe/ocS1bilOKyhSv11Ie+jNNa1SM=
X-Google-Smtp-Source: AGHT+IF15LEAmFnFZc6hllsBxmGfTZhsSLdPkM0eCGoPq7Zi7WEgl/1fO9BxJNrh0pUNpfo8Xm4/OQ==
X-Received: by 2002:adf:e0ca:0:b0:34f:10f6:b2ce with SMTP id m10-20020adfe0ca000000b0034f10f6b2cemr1972114wri.38.1714974986673;
        Sun, 05 May 2024 22:56:26 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id s20-20020adfa294000000b0034e285d818dsm9828017wra.32.2024.05.05.22.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 22:56:26 -0700 (PDT)
Date: Mon, 6 May 2024 08:56:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Johannes Stezenbach <js@linuxtv.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [bug report] [PATCH] dvb: b2c2/flexcop driver refactoring part
 2: add modular Flexcop driver
Message-ID: <4caa1870-900b-4d61-a707-c98b6010068e@moroto.mountain>
References: <e42e10a1-f414-40c1-a804-36bc67270088@moroto.mountain>
 <ZjaZj9Eo838SQAp8@linuxtv.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjaZj9Eo838SQAp8@linuxtv.org>

On Sat, May 04, 2024 at 10:24:47PM +0200, Johannes Stezenbach wrote:
> Hi Dan,
> 
> On Sat, May 04, 2024 at 02:24:21PM +0300, Dan Carpenter wrote:
> > [ This patch is 19 years old now...  :P  Sorry!  - dan ]
> > 
> > Commit 2add87a95068 ("[PATCH] dvb: b2c2/flexcop driver refactoring
> > part 2: add modular Flexcop driver") from May 16, 2005 (linux-next),
> > leads to the following Smatch static checker warning:
> 
> I think the patches were from Patrick and misattributed because
> I was too stupid to operate git correctly at the time.
> 
> > 	drivers/media/usb/b2c2/flexcop-usb.c:199 flexcop_usb_memory_req()
> > 	warn: iterator 'i' not incremented
> 
> > --> 199         for (i = 0; i < len;) {
> > 
> > No i++.
> 
> >     208                 ret = flexcop_usb_v8_memory_req(fc_usb, req,
> >     209                         page_start + (addr / V8_MEMORY_PAGE_SIZE),
> >     210                         (addr & V8_MEMORY_PAGE_MASK) |
> >     211                                 (V8_MEMORY_EXTENDED*extended),
> >     212                         &buf[i], pagechunk);
> >                                 ^^^^^^^^
> > I think adding an i++ doesn't make sense.  Are we really writing a byte
> > at a time?
> C> 
> >     213 
> >     214                 if (ret < 0)
> >     215                         return ret;
> >     216                 addr += pagechunk;
> >     217                 len -= pagechunk;
> >     218         }
> 
> The loop is weird, but I guess it worked because the len -= pagechunk
> would have terminated the loop and supposedly there was only one
> iteration ever. I doubt anyone has hardware to test it, so don't
> change it. Well, I certainly won't touch it, you can do it if you want.

Nah.  It's fine.  If you don't know, then I for sure don't know.

regards,
dan carpenter


