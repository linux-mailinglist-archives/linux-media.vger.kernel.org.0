Return-Path: <linux-media+bounces-43630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D3EBB3ADD
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 478E53ADD41
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039291E7C2E;
	Thu,  2 Oct 2025 10:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="q0LG8jdR"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3793F253B42
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 10:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759401929; cv=pass; b=J5C5jFkhe6bJFgyCTpSdzWKksyQZVbiE4ttzMwuzHz20s46gL1ZD7ipgYhV8h9KEtxPCT/uYwJBAFOUBi/WARKjxr3DG11WgjWL4CU41wu4SiDitaaTvuJp/5wmkSqHqagbjtUFYucumY4YAz7ASOLB2FVHJ1kilMRmrQn1Of3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759401929; c=relaxed/simple;
	bh=8lLuUmUX1N3sDML4/MosVrLnupRv7H4edQ7djcAh4t0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWJGJJZ94QWTuagykHxI6xSVjM/dOry5kxLGnSNvYhAIjaBod2c5mmctoMOEwWKR0Zr0CL7PsBMOrif4OHV4hHzVS2IF1Hwn1oRvRwZx34QUWDTeaEWY7yVTpV360LU8ZrSLH5Tkqjs4AMgZflzB/SGazYs7jCzVXC37obMCdV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=q0LG8jdR; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4ccpND3fZYzyQK;
	Thu,  2 Oct 2025 13:45:16 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1759401917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1PhEveae8+7Q1wu2KtK/AakuImY7EPh36PZhrXj0et0=;
	b=q0LG8jdRn6fbutOCC2MHhOjzoSW6KU/EMq+PNnTN7yyLgKeLAwNdkhA+41yN9r20xpO0bG
	QBV+HeH4TmFQ18uRCgpXGr+0E4tB85xDalsisQ7DABtNazyuBoDEndu/DwTSRgoKgbnrEV
	3smPn/xtqO0cYjyACb4ZLMDFHHqNDVU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1759401917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1PhEveae8+7Q1wu2KtK/AakuImY7EPh36PZhrXj0et0=;
	b=T3Ej5JJKq+L0qp3Zq2amJIoKDl7RUchziOOszNStCUyGafo6PQY3v0N+UPfYVlcNIdkyIm
	nJLiO72SFvRam093SwBzj8TkZW/iG+nSGAxlUc3+LkVV8gCMcffkhdFJAlm8BkU7Y90cDB
	xJRAOs0sybipQsiYgr2UgNNamc24uMw=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1759401917; a=rsa-sha256; cv=none;
	b=SjVKMTW7yUvrAOO3ZcptQPkiX/f715CXWCIJYxREKi5rwsfbBNUvX1Zhbfja+q4ZYfNsAB
	AwBab2SpvfA57lq4XUY0/k6/3V5gLsWyyH4tMqUBTnGWMcjO28DOweSB2aQXaV0atXfGOT
	kE4AI3MYAiv3wPqfwoHqAfHBmod9XJI=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id EA7A1634C93;
	Thu,  2 Oct 2025 13:45:15 +0300 (EEST)
Date: Thu, 2 Oct 2025 13:45:15 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	hans@jjverkuil.nl
Subject: Re: [PATCH 3/3] media: v4l2-dev: Make macros to obtain containers
 const-aware
Message-ID: <aN5Xu6GU7mfElsSH@valkosipuli.retiisi.eu>
References: <20251002103256.2081947-1-sakari.ailus@linux.intel.com>
 <20251002103256.2081947-5-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002103256.2081947-5-sakari.ailus@linux.intel.com>

On Thu, Oct 02, 2025 at 01:32:56PM +0300, Sakari Ailus wrote:
> Retain the constness of the graph objects and interfaces in macros to
> obtain their containers, by switching to container_of_const().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Please ignore this patch.

-- 
Sakari Ailus

