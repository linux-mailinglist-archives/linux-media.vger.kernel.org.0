Return-Path: <linux-media+bounces-8806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A6C89B800
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 08:55:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B96D21C20B02
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 06:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD3E1CD38;
	Mon,  8 Apr 2024 06:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NOc8pfV+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8882725619
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 06:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712559307; cv=none; b=DYrizGZLqdB5J50j6f/bGy00p8D1Yphw2lWBPPi/UmEZWV0EFG7gSqBkiOXruQtnJqlqzY0qiN/0N4fnTBpxdtYOgAMvAPtglGZrNld3lrnkHxmsFHDCVaqsQJE8N6kG29rUyTrB03BTBnu0ArXzj8gfBCb1/ubFv3ebP/FMDd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712559307; c=relaxed/simple;
	bh=YF5Jo1qTNj0ZDbmCwsqTyLbCMgOmE9ETmfDauLkYRcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyHv0m3h4kIhpQAwiNYBedzugpgWTTD/xqNO6JbmZ09ZNP5hDEh0N+M4geV/gvZtvjnWlCo22UDtLeCTXPSuiY6GJfHHG2H6CffTKTB8jqfKkKC0qmhZFmFPdxeCqZL7MIRZHto5a8zd3ZsqwU+2YEHYoGJCHi+SV8q6HMkg3wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NOc8pfV+; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d700beb60bso65424101fa.1
        for <linux-media@vger.kernel.org>; Sun, 07 Apr 2024 23:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712559304; x=1713164104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T7x+3F4VTN9kvcPpc0PoCNu1Naaveso2bmCAcYTzyD8=;
        b=NOc8pfV+5nSmMgL/Usrul8MI2w5k6LVeyOkkiI9Jp2JnyFfmLwTj5SoVwz8YVV073a
         i35PUTTu5XlYH51IOzg1O4Z2WALxHfQac/U5ka5DY3wlGhTtB7THNYkWipIsLvsUcz7A
         rWBawPJk6J+FEqBjox6Vll6dXak3DIcTDQZc4UvbfBQmcsEYsYHk9ewGCfmgOBaJjHXD
         kmO5YtDfAnNSa8Ity0tFsiCw+tBN1WibbOaAIbGGrtzxe7/5F4VDqQ+8e1DRwoaoUlyy
         Yz/2TuSw8ZbE0CKetSQlEzFaVHYGNjAdQOuxwfDqQgavhk900MNqcPCxxomOgl/HuGYl
         vN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712559304; x=1713164104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7x+3F4VTN9kvcPpc0PoCNu1Naaveso2bmCAcYTzyD8=;
        b=rkwM4Buw425AlYqTzpIV22a4l/CXlh4huCNkvpOkL4Rb+lnp3TJC0KiNXaBvkYpq5h
         +3SsyECIuApBYiqz/vJmK6JOqU8fDhI4LO3rJd4edDKwk2GCNq6x95sAqnwMGa9Ag6e5
         HLhmWmRNVxYSYAQiQ0jITqpz6XqaAvlyfkycjLs6fMHMdqU/7u2D5+l0G7aOH8aHRU2E
         CTmW/nzBUgf9bp5iHmklNj3jVp/GlHCQC71kWCTrkYwGCc2aFRZd2MbUkQSl1GT1uyef
         s0uayqSDNJJa3issnBIn0q1PeEUID9MAbcLxf8mmbkU/RsjpxplA5/WplWl+EfrNZw4q
         2jbQ==
X-Gm-Message-State: AOJu0YxCFcMMEx/hqVkKYGoreoetRYA1owcZQfplCr042kRRXStcAj+J
	C3LgNDhatZts1Fy0L4HV1YWsxPUvFxkT1nS/iYzPg0yh86JvRtW3FmkrTDDn2FwEJ3qupkvWi/V
	j
X-Google-Smtp-Source: AGHT+IFtugLr+wETImmwUpYywimllWV/rdknDMooanioTnSe2IQHK58P3RbDA3iKHdp5Zow3yM8Ukg==
X-Received: by 2002:a19:2d4f:0:b0:516:a686:8ae1 with SMTP id t15-20020a192d4f000000b00516a6868ae1mr6218419lft.62.1712559303423;
        Sun, 07 Apr 2024 23:55:03 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id m9-20020a1709060d8900b00a51ba0be887sm2754574eji.192.2024.04.07.23.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 23:55:03 -0700 (PDT)
Date: Mon, 8 Apr 2024 09:54:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prasad Pandit <ppandit@redhat.com>
Cc: linux-media@vger.kernel.org, Yasunari.Takiguchi@sony.com,
	Prasad Pandit <pjp@fedoraproject.org>
Subject: Re: [PATCH] media: cxd2880: Add terminating new line to Kconfig
Message-ID: <5ed66f6d-ec4c-46bd-9498-71520d82bb25@moroto.mountain>
References: <20240311100407.1271331-1-ppandit@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311100407.1271331-1-ppandit@redhat.com>

On Mon, Mar 11, 2024 at 03:34:07PM +0530, Prasad Pandit wrote:
> From: Prasad Pandit <pjp@fedoraproject.org>
> 
> Add terminating new line to the Kconfig file.
> 
> Fixes: 9dbaad428d69 ("media: cxd2880: Add all Makefile, Kconfig files and
> Update MAINTAINERS file for the driver")
> 
> Signed-off-by: Prasad Pandit <pjp@fedoraproject.org>


This isn't a bug, so don't add a Fixes.  Also the format is wrong.  It
should be on one line, with no blank line afterward.

regards,
dan carpenter



