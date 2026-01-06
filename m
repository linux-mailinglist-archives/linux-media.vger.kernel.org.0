Return-Path: <linux-media+bounces-49961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC61CF6A0C
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 04:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9088E3043F4B
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 03:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11C426E6F3;
	Tue,  6 Jan 2026 03:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KJcU/Duy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F713265CA8;
	Tue,  6 Jan 2026 03:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767671542; cv=none; b=K7n489Mik51OyKoJGV7nrVtYisfo/jv81nKRU1wtBa/gGB1lLGRavzkxAypF7c1TKxlbayqo42m0nX3saQz4IHC9bMUZt0tRi/tcx+HSxxUTd1M2+pg1gt4XDnxw5GP9/5BhlVyrJdmSTI82LBm8MCynC29ISlPr7xvJ88CTSDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767671542; c=relaxed/simple;
	bh=yWKqgcI8mjjgqD/70eA8yzInTTLacpfM7nla7BPmOwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jG1Bi66pajwPagvkZDtsinZjOBYQdmK3kCtrC4Xad5gJO2zfW5owE20JI2VBILai/9Pu4kxgI9yjUkYbZT5bee1/6UcsNmgyX1jgt2vGk5i93h0ufKlbrVp581IXCstbMtbo2kCSv1uhPEwV4uaSzsfDghB+OoG6cbLJiML1NBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KJcU/Duy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4106AC7A;
	Tue,  6 Jan 2026 04:51:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767671518;
	bh=yWKqgcI8mjjgqD/70eA8yzInTTLacpfM7nla7BPmOwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KJcU/DuydHJVzWlLhJhqK/Uek9My3+nvQODd/pFj39StUMzrUP3c3ieXs8X0hi6/V
	 rno4UGCBpquxqLSiAnweOSSFcB5wtV0UCYfPfCuYw9yoXdDYB1JBFHAjaXZ41ziiUp
	 NWIZ4i2p+TBwzezaWSZ3G5dxf+lJIssib047iCBc=
Date: Tue, 6 Jan 2026 05:51:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chen Changcheng <chenchangcheng@kylinos.cn>
Cc: krzk@kernel.org, hansg@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, mchehab@kernel.org
Subject: Re: [PATCH v2] uvcvideo: simplify spin_lock using guards
Message-ID: <20260106035159.GA11450@pendragon.ideasonboard.com>
References: <e442c69e-5257-413e-9f3e-490aa5e37378@kernel.org>
 <20260105093512.194988-1-chenchangcheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260105093512.194988-1-chenchangcheng@kylinos.cn>

On Mon, Jan 05, 2026 at 05:35:12PM +0800, Chen Changcheng wrote:
> > This is an undesired syntax explicitly documented as one to avoid. You
> > need here proper assignment, not NULL. Please don't use cleanup.h if you
> > do not intend to follow it because it does not make the code simpler.
> 
> Thank you for your correction and feedback. I made the change initially
> because I saw similar patterns using "__free(...) = NULL" in patches from
> other driver modules, which led me to overlook the core paradigm of
> cleanup.h that requires a "declaration with a meaningful initializer."

Do you plan to send a v3 ?

-- 
Regards,

Laurent Pinchart

