Return-Path: <linux-media+bounces-40421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73363B2DD53
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 15:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2CAA1BC2506
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 13:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F85831AF38;
	Wed, 20 Aug 2025 13:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z90v5UK3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15FF3093CB
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695252; cv=none; b=W/xTP0jX+7PoxGX5uS+H0jZEs9tUxbr6JOTcTxkTYv6hVbZsN3xbz2Sh5jkZMX37+l0am6jn1z0Akpm8kHgg3yWH7+7/BpNyVV7K57ii1RbjQCp7tt3XxejsglM3yg8snPlr2qYz4AfD68qby3poaH6Ir1/2hIYbZ/qYoW+eJ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695252; c=relaxed/simple;
	bh=X/HnEbOt1kxd7Jy+231ddpEnGbEAx2HX1Aw7LGzcYH0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3o4VvbNMBa1M+bnK9ZjHuExsEiuYDXaoUh+JF68wrP0JR91T5kyZqNUWLq1m9EhGPHdwJiNISk9pBB4UlWaazzSPyAGHWEKllyAz2wNDcUUp1kOxaxQ/44UunTkqJn061CVhUtk0PRaYjezqa51xRWfUOFSGYhQI6aD8onorhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z90v5UK3; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b9d41c1963so3306921f8f.0
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 06:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755695249; x=1756300049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5OQS/emDfXIYrpr8riBnRkgKKKbGxRuLEAKZuS2I3s=;
        b=Z90v5UK36HBuw1VTYpild7A/Oal5ra7mugHxqlXyXDnupvc3EHhKCRNq3sCyidFxDT
         ogxLbUylBaarO1W75CerzBKVScgEnajMssq1+cjSCM4YbilAMVdE9Oi9y1Cx8f+0qL6N
         GhRD3/6pg1lJcMEx5qbYA98txoPnUcBcB987yKZDIipPm18GIdJeve1zXe862h4Xyhfn
         FHqm9Omo5+w9iBSutiCBKm1wrDi6XYL2/BqQkga99X7ZSFibitJfTQH5OeIdymQ1TUi7
         DSu+JRuOR+3h5KLzUlNzZ1m1kbyW3YDI1CG6WdeI7Mzm54pUgA4rXI6FtOenYSvU2vGt
         vfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695249; x=1756300049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5OQS/emDfXIYrpr8riBnRkgKKKbGxRuLEAKZuS2I3s=;
        b=CYAYCRij5WafFCFhT8NK/TXfEQoNw70hFvcyiDdvgj6/h1X5ew4iMkHrtxQxbJA1GH
         rA46WgEmOI+mCjRMC2mILRYs+uWWdf6iVTfYB0y8Szl2BiK007Ly9/Q4hwKdbyi4clZS
         bPN8n+FQjREkiEq28QixjlQdlIh9ntPrBP2JK24iwZ3w47S70wjF3yLwqUt6jrHRPtCQ
         J6bAnJB4PEhQdf8zkxEhKqsu2w2zQv5wbFC8v48iaHudEmKF9Eud6XEAe+vUP+IY4dFR
         tzY9c/bMSnkSVymeDN0s28FrTEfBxDp32iVEDQU3kIkEj/VLvFTgYhCjfOXJF6S3kpFL
         pZlw==
X-Forwarded-Encrypted: i=1; AJvYcCUiDDSWYb1Pc1OxkzgWJ+TJmjof5TZAjXU4UNlNVfETbkI08DSpy0R/uBGg4od4/LyvbdUt+6xnYRPBwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8w70uGcfnIw2LA5ZedlWhtS+CPljVP01qlOHJOR2+zDhpNeZn
	d1TBVqZD/tX75B5sivd1NhbLtLJkeH5Sm51njp9kErBNCtSnQzPPM1epeuOtt2V2EbQ=
X-Gm-Gg: ASbGnctYfswajcX5kGFTJY035YUNOdJzCBS4K1lppSIZhw5HM24Nu0U+2yQsNyKV7HB
	16czHlwx0CNEWU8U107qM1QeWi+tpibUI8IoUS50pctzgu0xyW1xA5EstJduS12sVdj4v0fwyKQ
	s2AJ3BcoVBP+fsUDBRx4/OByKl8WxrVNL0pr6wocWFYvKTaKfFEj+TxxRqcnXtIU9O5aSRjDg+3
	uLDx5X3XFlBKz/eq8yJnDxsy9y9KqmlCWquGxxP9ghhEE/PVOuCxxNNOFAeG12mw9gbk+ekMMTu
	Jl+6/dpYj+flZqhBU/41dOaUpe7LqjCpuciQ2BufPAThIIbxH/PV5FZvXd2j4duDhm2TPoDjPpE
	rdai5rlq0WeZb1SOveJnE+Y3FfvzwXANd/Y7Vt4HvWWAXow==
X-Google-Smtp-Source: AGHT+IG8orkF5yWVfvMT//81luXMNidmsJjDH/qnlbhHQmtj+2joW4b+rCnpdIDDxhcI41r837UxXg==
X-Received: by 2002:a05:6000:420b:b0:3b7:8410:22b5 with SMTP id ffacd0b85a97d-3c32bf5cc96mr2025869f8f.13.1755695248723;
        Wed, 20 Aug 2025 06:07:28 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:d9eb:6295:cf25:b839])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074879f5fsm7662631f8f.4.2025.08.20.06.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 06:07:28 -0700 (PDT)
Date: Wed, 20 Aug 2025 15:07:24 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 09/11] remoteproc: pas: Extend parse_fw callback to
 parse resource table
Message-ID: <aKXIjAGZVnMy4EYb@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-10-mukesh.ojha@oss.qualcomm.com>
 <aKWI-izL5BooL61p@linaro.org>
 <20250820111448.tjaz2wld2nxg52aq@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820111448.tjaz2wld2nxg52aq@hu-mojha-hyd.qualcomm.com>

On Wed, Aug 20, 2025 at 04:44:48PM +0530, Mukesh Ojha wrote:
> On Wed, Aug 20, 2025 at 10:36:10AM +0200, Stephan Gerhold wrote:
> > On Tue, Aug 19, 2025 at 10:24:44PM +0530, Mukesh Ojha wrote:
> [...]
> > > diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> > > index ea7034c4b996..8456cca3f3e0 100644
> > > --- a/drivers/soc/qcom/mdt_loader.c
> > > +++ b/drivers/soc/qcom/mdt_loader.c
> > > @@ -22,7 +22,6 @@
> > >  #include <linux/slab.h>
> > >  #include <linux/soc/qcom/mdt_loader.h>
> > >  
> > > -#define MAX_RSCTABLE_SIZE	SZ_16K;
> > 
> > I'm confused why there is a semicolon here suddenly. Did you edit this
> > patch by hand?
> > 
> > Applying: remoteproc: pas: Extend parse_fw callback to parse resource table
> > Patch failed at 0009 remoteproc: pas: Extend parse_fw callback to parse resource table
> > error: patch failed: drivers/soc/qcom/mdt_loader.c:22
> > error: drivers/soc/qcom/mdt_loader.c: patch does not apply
> 
> Yes, I did this edit just before sending when checkpatch caught this.
> Will avoid this in future.
> 

Please don't edit patches manually, fix the commit instead. ;)

> > 
> > >  #define RSC_TABLE_HASH_BITS	     5  // 32 buckets
> > >  
> > >  DEFINE_HASHTABLE(qcom_pas_rsc_table_map, RSC_TABLE_HASH_BITS);
> > > diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> > > index 62f239f64dfb..92ad862e733e 100644
> > > --- a/include/linux/soc/qcom/mdt_loader.h
> > > +++ b/include/linux/soc/qcom/mdt_loader.h
> > > @@ -8,6 +8,8 @@
> > >  #define QCOM_MDT_TYPE_HASH	(2 << 24)
> > >  #define QCOM_MDT_RELOCATABLE	BIT(27)
> > >  
> > > +#define MAX_RSCTABLE_SIZE	SZ_16K
> > > +
> > >  struct device;
> > >  struct firmware;
> > >  struct qcom_scm_pas_ctx;
> > 
> > You added this define yourself in PATCH 08/11, so just add it in the
> > right place directly. Make sure you scroll through your patch set before
> > sending to make sure all changes are in the right commit. :-)
> 
> I did this intentionally, because there is outside user of this macro 
> with this patch.
> 

I don't think putting it in the header without an immediate user is a
problem, as long as a user appears somewhere in the same series.

Right now this patch touches multiple subsystems at once (qcom soc and
remoteproc), which should be avoided when possible.

Thanks,
Stpehan

