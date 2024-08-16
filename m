Return-Path: <linux-media+bounces-16389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4C9954AB9
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 15:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EF8C1C240EB
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 13:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9576A1B86EA;
	Fri, 16 Aug 2024 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nEf0lCrx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE281AE84C
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723813487; cv=none; b=iJQ+J0RXyH4/RRqjT9GvnFBaE1rsD0IglrpIbEu+8USN8BQJ96/HCtg+UBulFSn0H9i8mJ7WWcVhB5HpyqR3172qImbVT8ynC6JLVaxJv9T1sC28OQnDrlfmUql9LTtpeIGzZUoTP1DyMEVfpi8o0iBR/SgipghUbWCze7PeIig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723813487; c=relaxed/simple;
	bh=xCA+fzmmUO/Z2zZ9By4jXpGmtLk1cHqcR8WLtleZB8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nr7GnoufX4In+Eh/yO8Z7UvGc/ck2oaXPsNIRj27BvTj+/Wq2padvnh59Qr6pmZQ50Tddj4Zk8bK5cb6p3lGAkhASQvxCUcNcznJGrigXC/jVb34mVHNJouqzZxOh6mXhJKCaHEBYCIBwtX67iC0Q1zY3UpH65uJotXcTIiOdUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nEf0lCrx; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4280bca3960so15395885e9.3
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 06:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723813483; x=1724418283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LwH+A7WJGbb7oRUSLGU41BUJqJ7C+LPqpHnCCWzrpI8=;
        b=nEf0lCrx3Kt4mlN6xR1MexJZxfnHRhy/WfA3SZTAczhesCZcfQpJxg0ogCdQR/5nk7
         xJ561IRVDVEle6Xq/zxD3vzqYoD9ca0cEUP7FSh55BwIy/mHOEF5QjD0iq3NJlU7+tCI
         OgtIlFg2tA7QM/YrUe3Uxru4aWawBmw+Ie8Wujz0nKnTd1t1k40DEGRD9/nNDPHiqEpb
         irStWVJaI6HHWkkBa288EGMme2RYiBwkTVsCOar+AlCT61n8rt/dKvC/of14owjqhNUS
         k58S1hrnFLMupfjlqZspJgEKRsSkEuiLAh4dEHBnWhP/pnzjmXZ+ZKcE8EckOpBlDBAD
         rWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723813483; x=1724418283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwH+A7WJGbb7oRUSLGU41BUJqJ7C+LPqpHnCCWzrpI8=;
        b=MeGs3k6sRY02+xbPaDbo098g6zcuv9KcZiTCiQikP1PokKS2rfahUcEEZKuAWO2JAz
         jv8NrdYPtyvNTHep9D+cEuRvHCzThIMs9A0iEM14fBTu3DPKMXxqN+q8VXPaMaUhvobd
         wjdFTIIM9IKYJJZZKv0WzBfxvim3UNNVWQakeSGx+ramoMrDd+OgsX85Krws1xvmjBFP
         JnxzYmJtt4b7/x+sjYLm0uRz58GIDvJZcB0tAlFZ3D9ktSb52fTPgdUcBHlnGPMCbhS0
         rQsNzg4wHUOD0tM3ZCa5GjC25gs5spA8Gz/FqkCnx+3eYYSXcpJP3iILT3E0uFlLyrT2
         WNQw==
X-Forwarded-Encrypted: i=1; AJvYcCXgrzvyLn8PLfvGxTMUVpBmPeLBhtJFvydRr6wEoFYPepUEBDUi1lWsu3SPB7QsWaKvEOxPFHsnKfmaEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi2LcCKDwope41A3XAb4SVmrBAsh1dYuAlVVgU7/cmD7q6VqBQ
	gYZPUGC5G51hNyiiPV+wO30tnL6yea+WLXAsXeKkUbeizcPjr7Srk5kpX+AfHjk=
X-Google-Smtp-Source: AGHT+IGfiKnlklC0Ei5PXNRVvsnbaf8I+4iFsT9ypdhWM+np2PgwPcKV7gjfF++N+9WO7Z0ipv8AUw==
X-Received: by 2002:a05:600c:500d:b0:426:5e91:391e with SMTP id 5b1f17b1804b1-429ed7cf0f0mr17537005e9.26.1723813483555;
        Fri, 16 Aug 2024 06:04:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898aabdesm3610389f8f.99.2024.08.16.06.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 06:04:42 -0700 (PDT)
Date: Fri, 16 Aug 2024 16:04:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [v2] staging: media: starfive: Add the dynamic resolution support
Message-ID: <0680445d-1108-4400-b150-4804da63ddba@stanley.mountain>
References: <20240816125132.514488-1-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816125132.514488-1-changhuang.liang@starfivetech.com>

On Fri, Aug 16, 2024 at 05:51:32AM -0700, Changhuang Liang wrote:
> Add the dynamic resolution support for video "capture_raw" device.
> 

What does this change look like from a use perspective if a user is reading the
git log?

> Fixes: e080f339c80a ("media: staging: media: starfive: camss: Add capture driver")
> 

This looks like a new feature and not a bugfix.  Please describe the bug more
clearly if it's really a bugfix.

regards,
dan carpenter


