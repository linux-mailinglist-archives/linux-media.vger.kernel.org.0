Return-Path: <linux-media+bounces-16807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B61A395F241
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E82551C21336
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFFF1547E9;
	Mon, 26 Aug 2024 12:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="avfSzHcW"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AFA155A34;
	Mon, 26 Aug 2024 12:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724677176; cv=pass; b=dgCka9FsxhEgVWIdd0IjRnLcxniDHzrZormUxFGMkcL0Mts0Vnlm4l8fnpadTCI5/1D4zg9b1mO3nRZ+GJ4d9MpLsV1jyQfM+fvjzGl1I+mI5uwxy/pBBD2CzhVuBXnzOAisbEK9yCr03JqcsyBPqgJuutZYCS/OgIO7/jE2XKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724677176; c=relaxed/simple;
	bh=S07T6Qa86tFUAwwgNhyuAeSzWq14Thi/doGLWDuh+WI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDVuVSJ2RBAAXB9c2Pzy15EdI8QwZqGlmjV/IBNrAXYwaN02fSR6Jh/mpfycmiUxfzWeefWcSO8ChSoFganvy3xkrKbzO2Kb9JBtGTGZ1/ZmBNCH5lnu+NPCjdYB+jd3ViuhWQHlxA2SwSpnfuGBGdqUPKV+20j0n3x/7MnxO74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=avfSzHcW; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WsrNW5CNjz49Pyv;
	Mon, 26 Aug 2024 15:59:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1724677165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sA8EMDngYLF87wRxKvm5MIwsPqA42yXIBepqO8qOVmg=;
	b=avfSzHcWXiPG9F565+LNBQ734O9k2tdVp0NU5uX1DUodJjENb8A68SyWF5dkRajn9+gCHr
	Me052wu90KKRsU9D2U1TX8ueKhYb/JyxNANaaXe3I0tbRPcXh2/q3osCaQoIROjeYhTIuf
	YJz6fUh+0K8Gn8wJieUCwiIQnTILK4BAtMke10Ie+gcb9tA5gCB20Cxn6JSXmHkNbth+o2
	RGKfEJYuIURfS1tabKtdT9NI40GzkPcV6VTH4RNIAH/0nnKUsQtvd2t5RLRh2Dk9dJuyHB
	vUrOCSbmgPyYsfUdTXAE5Z6RXgxLOvp5egtzr+nFCg7rc1kZhNqk2pELk/LaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1724677165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sA8EMDngYLF87wRxKvm5MIwsPqA42yXIBepqO8qOVmg=;
	b=RbEO6n5UKL80WEd3wlIf2Xxgk3T4A00UU20ZoTJJ0nC/jLsh1XrACkzshNogjTLCs2eU0A
	Jpqa7qZidwkHXTAV3QZhJswZ6LLqtypatf+hciH4Ipwigm7XNyWbzsWJGDoTDfsfLMS1eJ
	18xoUyf2b6pPxEjIYD/NNSD6b6ft7BodfgVMSZvU+g6N2rDD6xZExuq7feRA2YOD/3uJOu
	KwQuo4A3oFJnjnrQtkFO1+Vimq1IwCgILUAxYOUgPBC9ZgL4HrGdk0ZMX5lKWMlmZC75HF
	9MtVUeHghsmr6NXtY1ZV43QjYNFLlEEUkf5BAYR+oYHSxdKuSNmcqCKIv/1f3Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1724677165; a=rsa-sha256;
	cv=none;
	b=R0rXRNHEclNspdTv/P/jk7k34+CqGmLHah+QnD4vnJU2VEkVZ2ySV+kYuUTPaQwzXXQd3v
	BnLeC8pLoEaMcHMLp3+fG+vsyAEyZHvNvHHixH6xhKvUOjmXph9oSJAjTy7sSNaETm9T95
	Wuvd3EFBaeY/1ky4FYf0DhHuRLkrf1EuV9KS8LrdsJRuexbzXDxOYdoquVUKUHL3SZS0Bn
	lu4zt7sRYBQJDhD+m+XYwogBZm3KeRjHrAlr8DfFMDqw122cK3z+hALRyu4nKsL7B1iWmR
	XZzwOQ3YoFaq+N1t5nLrnA11ORbTcEtPAnklOrYLjPjrZpvVc9ReMj+88+dFOw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C00E6634C94;
	Mon, 26 Aug 2024 15:59:21 +0300 (EEST)
Date: Mon, 26 Aug 2024 12:59:21 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 0/7] media: v4l2: Improve media link validation
Message-ID: <Zsx8Kcgqat5jSXPD@valkosipuli.retiisi.eu>
References: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

On Mon, Aug 26, 2024 at 03:40:59PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series improves the link validation helpers to make it easier
> for drivers to validate all links in a pipeline.

For the set:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Regarding the sun4i_csi driver, if no-one has plans to fix bugs such as
missing link validation, it should probably be moved to staging. It's a
separate discussion though.

-- 
Kind regards,

Sakari Ailus

