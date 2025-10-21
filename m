Return-Path: <linux-media+bounces-45116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37174BF5764
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 11:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3D6018A754E
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 09:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86FAC30596D;
	Tue, 21 Oct 2025 09:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0MwssBb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A272FB0BC;
	Tue, 21 Oct 2025 09:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761038287; cv=none; b=QG4Qlof5pvHGkmuBqa8++F9XQ650IQjnh4oLgWaedjE1nkqleN+zCAXweDb8tnLI+Mhz8sDBLbrUF+sRcjWiIuwJObzlVi5ZdBIwypp/xMo2H6EKzocJkIuNzenyB4tdbhy27BWzWEjHAeCnI6OnB9c7OS9HFIb5Eyxaz8HYQUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761038287; c=relaxed/simple;
	bh=UuBuv44gNzyj1+yUJap8HHMxkyOwxw2EgIgQnSBwTI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrBQ43sfDi9Ab5yBjEpqJeV9LGak5QDRUGxl0ym6ZufkaHp4uF0msjnnBjPQ7pRALT5C6KNpM4XuIF9bFAiOySh1kPZ4xCAd8Z9YpYJ7OfNy5DazkoyNK68APB15BFdZE2kzT9thn9UCPjByxRYRBa1E7SSPlCW8XU6qVZznq6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0MwssBb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761038286; x=1792574286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UuBuv44gNzyj1+yUJap8HHMxkyOwxw2EgIgQnSBwTI0=;
  b=T0MwssBbsCN3WsR2TApPm/xujNaOD1PnKbfU3vJFkdgbm52vQ/kh8mp3
   wsGyivC/Tne154KQ/7MqIwjk5ut0F8zChJGN8VYitXGV9bAxS+c+Kzj50
   NNUUek7XHYIbePqRg0pL6/Q5HtQKGAonhVErRShTIqRD6teXCCG/C8ea4
   WXJ+ZENuc/W0RB8EIOglXjOTvYPuH1LflqnAQXW+x8jhApxfx1sfnrShD
   99IuFVa+Kw3Y5cCoZyux9ul7WA/v4ExSTRrx0RkG1vVp7fveO2H+j+FD0
   2SyNjlnhiWRLSvG5Ekg25RqwdFFM933Qw4VjYsmpaNcvpuEhIuCW1YhBC
   Q==;
X-CSE-ConnectionGUID: HpZSDNspRYurUv4fwfjSDA==
X-CSE-MsgGUID: jQPH9pDMQnmxPwTZSP14VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88627838"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="88627838"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 02:18:06 -0700
X-CSE-ConnectionGUID: mDuXJpdKSTqo8OBCWx1+TA==
X-CSE-MsgGUID: TtcfR3JkRTaQOgzl1jDMMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="214505506"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.134])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 02:18:03 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 499B31202B5;
	Tue, 21 Oct 2025 12:18:01 +0300 (EEST)
Date: Tue, 21 Oct 2025 12:18:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: i2c: imx214: Rearrange control initialization
Message-ID: <aPdPyc6Lasmp3EzC@kekkonen.localdomain>
References: <20251020-imx214-smatch-v3-1-2c9999efc97c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-imx214-smatch-v3-1-2c9999efc97c@chromium.org>

Hi Ricardo,

Thank you for the update.

On Mon, Oct 20, 2025 at 08:18:13PM +0000, Ricardo Ribalda wrote:
> Smatch is confused by the control initialization logic. It assumes that
> there can be a case where imx214->link_freq can be NULL and ctrls_init
> returns 0.
> 
> Re-arrage the function to make smatch happy.
> 
> This patch fixes this smatch error:
> drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously assumed 'imx214->link_freq' could be null (see line 1017)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

