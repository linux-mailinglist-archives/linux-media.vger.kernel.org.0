Return-Path: <linux-media+bounces-55379-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIuDITxbsWmGtwIAu9opvQ
	(envelope-from <linux-media+bounces-55379-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:08:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAA22636EE
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCDA53053CF0
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 12:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93283DE45D;
	Wed, 11 Mar 2026 12:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="AEXZQ4Bq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB883161A4
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 12:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773230812; cv=none; b=lDmIRzyIEbb9jPd549uF2hZ7zEuiaoRpjJkMx9zEUjR0r7zNKV/KngtO9UVbfUmwA0Y5Fy02ky6YAoA4BySSs+KAmIwewuvPzFaRmm/fBTg8SPmiRCIP6ZetAjv5LW5xX+J7X9dHO3snYoJd5FjE5AuBgBobYoWhrySISk0qgyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773230812; c=relaxed/simple;
	bh=5ZXmtH045hjysMA/sKvjaPzLvB8ln7AQNBNr7xSrgrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zt/3Ze0sQiXljzjMDaTPeGlRNLlIlQRxJUgsDWvJUXuolkdAdBlA6v2n5zAMpVqzUw+nPOB45joJuaQyuYO8donQ4NUkdjmr0ZQr2vBiuMRWttGcuhp0bT2LuCilnwb7Z3d9L2SVj6VJQupoaIVHKIqjfIx5pzxPYEq7SzOMG1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=AEXZQ4Bq; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-89a0d53f3d1so98145206d6.3
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773230810; x=1773835610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZXmtH045hjysMA/sKvjaPzLvB8ln7AQNBNr7xSrgrM=;
        b=AEXZQ4Bq2M9kowIMeJUh4YaqvAr60rGSgD52OM1UECSWnxD0iOSI9EhF8FnLQrvxcM
         /hgkZIJaicVdvVvlwUtPlgfGhD+pyx6OvhEPtpmdEXGsK9rc8Bn4d1jYgKL9HtpvUsf5
         ya689HXCOLm/uoICLByzEYDmPU4Z/n2rPbwdIPastuOxXsh97qPFsz4ME8G5qEA3mhRF
         Q/oT+rvONjdP2+RgkXSXfShMB5vLRArAChsemvcATMc1x32qXMqwKWzDECZidaefEP40
         aOmuPu/yRmEqyWU6PxZ5TYjS9SExnmwnlDFaH9+qToC5kzcGzVEFloJ9XESSTV6PtBk7
         Q9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773230810; x=1773835610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZXmtH045hjysMA/sKvjaPzLvB8ln7AQNBNr7xSrgrM=;
        b=DAsMPPXyNkxNYogEZfynMHAMTO9duK6QZxb7sf9d9VDiOUxmFgzoioy2U3xzDuGfY5
         j9zxSRyK348a3B0EE+H3NxuKsZ++Z3sbyQDb0cEr7pHixcbJuUhEh5OU3BZFNeuZUZS+
         LhUzD8GYzDcZz/Bqz5nL0mddOr4af8yp5Mky2WjOeCn+x8jt6UPLOXw4TO1PeJcBDZGb
         g3e/XBkC+TMay6zzrrOAgYgaHHUJWRzYQnWOdeRJemgJmsbUqdrkJCLC+th0+qzHm2BW
         C75ZL5EmGO+Kw0KYe3vhrZVzO5btgboy0gP6wCpRsqL2AgUDAgGYyHLQMBYp0Kxsc2rn
         yGFw==
X-Forwarded-Encrypted: i=1; AJvYcCW1tJtMTLd3JxG8XsUz7mBLASJH31NtDPZYCbyMUwbW+P4T05Up9SJT+LecNxBHk6AAxMDL0SrFA0vr3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6/0yZbS+0+GtUg+dU44gcPrKIGo6+9BnCiAhCvZEQLz97tZ80
	4EXQD4XPorvIRWKcUPYR28D5M9GCWAi+Zy8Gd4NxfyRifyaTD/f2nUv0n1TqPCV0w/I=
X-Gm-Gg: ATEYQzydWlI/UUpEM7gdc2oFlFlh9jH0RFDXyJf+2Sr/eDt38ot5p+vnli6nv1/l/Sc
	s4hx0rx38eBJWgDrP4UF0hJZeVgA7m5TCmO186mEFz52i9o5lFwnxGLlelrCH1i5UaWBW8GPDSK
	CqLPAZT89nZe4Xl1K0mTMsX1YXqBsr/L2EDUbQ9AZRPq2kFsl5uznHo8SA9e+pewGpLbz9x0CdH
	7sQA+whkDLfzwaqvhrd7LfKAhNnAcvS4R8evQfRNkc6G25M+0y7PyusE66tkEnXdd7F7Pu5TpCe
	1/gVy4RDINjSY0Z64mneL+QbhypIh1Vpgkxkwe1zKARTXthgwyKYJGveSBmu+VNPG4lz60q1Xv0
	FYkqXS+beloIbHc4WJ96KwBshEKYPR3a8FjiYdDd+4gNmViz5BcOUlaKJcEaP0GrVt5AY1+UyNz
	Mvxhpk/mOtau0X8nfjfvysiT3iD8gXuLx1DUn0UMcKWg/Xiv1YH36YXeMQnT0rFJUqywGWT99yc
	NRDkV4l
X-Received: by 2002:a05:6214:c68:b0:89a:18bc:2b32 with SMTP id 6a1803df08f44-89a66a85f91mr27777226d6.37.1773230810200;
        Wed, 11 Mar 2026 05:06:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65cfd520sm12610946d6.36.2026.03.11.05.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:06:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w0IKu-000000069ke-42RA;
	Wed, 11 Mar 2026 09:06:48 -0300
Date: Wed, 11 Mar 2026 09:06:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Julian Orth <ju.orth@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Deak, Imre" <imre.deak@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH] lib/scatterlist: fix sg_page_count and sg_dma_page_count
Message-ID: <20260311120648.GV1687929@ziepe.ca>
References: <20260308-scatterlist-v1-1-39c4566b0bba@gmail.com>
 <20260308180826.GG1687929@ziepe.ca>
 <CAHijbEX=LN_ntp6zwsqy3sW7EB+E6cBCWnrKZb_RqdNG=Et_3g@mail.gmail.com>
 <IA0PR11MB7185574E3A63285860017D69F846A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20260310125953.GS1687929@ziepe.ca>
 <IA0PR11MB71859E28938D1695D4223B8AF847A@IA0PR11MB7185.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB71859E28938D1695D4223B8AF847A@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Rspamd-Queue-Id: 0DAA22636EE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55379-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,intel.com,linux.intel.com,vger.kernel.org,redhat.com,linaro.org,amd.com,lists.freedesktop.org,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ziepe.ca:dkim,ziepe.ca:mid]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 06:53:51AM +0000, Kasireddy, Vivek wrote:

> So, given the current situation, what is the right thing to do?
> Should we take your patch that brings back the pages array and treat it as
> a temporary fix until equivalent folio based APIs are available?

IMHO, yes. It saves memory, increases performance, fixes the bug and
uses the APIs properly.

Jason

