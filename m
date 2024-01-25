Return-Path: <linux-media+bounces-4169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7322783B678
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 02:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A05211C21545
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 01:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E6610E6;
	Thu, 25 Jan 2024 01:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N55z4rPR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904357E1
	for <linux-media@vger.kernel.org>; Thu, 25 Jan 2024 01:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706145453; cv=none; b=VuriHA53JFCU6lXHoTUDuunEQf6cyI11AJOkiVONQQLSy7GxPlc9LPk9i2jRD4dCkjnz7h28HM6zje+mAHPF230V7KjTrfqnVk2F3eJ2v43fBcv2erMReZkOGowU/tL7k+pd5yPvHIi/7Q6seySaNfO+3Tg4FFhjwsRue2imQ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706145453; c=relaxed/simple;
	bh=IeXUhaAiE7fzzO91ojxhS+9y/TlBdwr7byA7PBjwuaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SlAaZfYPIngvTPuXWF037zO4lVhrmS6oXSAGG+SiSJs3vML/5bxtxqkRbIEzcpV9JfDjxxYseYQCI/icvc/sfH8LgC+fGDfD2ZA/707cAwpiZ5gC7R0nUGmKjzhu+GYc4pp/V5TgZ+kGRgHy1lrsibV3Xf7+ceQEW0PpGxxDJyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N55z4rPR; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7bee328027bso208200039f.1
        for <linux-media@vger.kernel.org>; Wed, 24 Jan 2024 17:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706145451; x=1706750251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OPt8AF6Yk1ex+vNSSyNrDkYnOkhJrziVmuix4/BY1K0=;
        b=N55z4rPRtHs21zdr2cTW/qKQWCn3902z6zLtiqcklWXvmxj27VFHrZ8jFRTiPcJoQN
         Mj543Pp6aTESMkokzSt22Ap5ndAaLeN3E2zLi9ygKxONY1Anj/DHiwyYVk2xne8JBFnG
         SWjYzugKwcKyi3XFPEksR3mYmWdY35MNOz5+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706145451; x=1706750251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPt8AF6Yk1ex+vNSSyNrDkYnOkhJrziVmuix4/BY1K0=;
        b=adtzYdb5m8LJJByvEyzZljNC7cWsfhjk3Y6jrgbq8/w22w3+dYtjyHeCVPiffR1mvR
         KRzPZKeMZ7VOwY2dW/RAUIzFCZh5VKqDJZMb/nOx0cPPDCgCGM1N/XYUUswji2SWbyvr
         XNxNwmg87hxzVtrFpj0vjC9bdctSGOeLLOUsc0pUBxtSrGGRfV+warZDhKdCl9Y7e7Q8
         drlogcN+HlIFmeVCHbO5Zg3rW2nmXxcZv8Ma2D7HyY6nVp8aSHzcToRQq6wROO5fouzm
         NBBp98Wx7ZUU8zCumtqBvzCg2SKxbWGQPcTmZp3CzuQMPiAlijU7VAaQifPHcMw9SXOB
         tCwQ==
X-Gm-Message-State: AOJu0YyPn5b6UBTBOqPlVe77O2XmeCrCmP4b4Bt842Nh2omwmaBYv0SF
	HENUbRevBAYWPG3EiQurkGzsphrOXKv3Y5ckP+nl2ot0nSTYuGWe2isYd6Nlfg==
X-Google-Smtp-Source: AGHT+IGGMc89fxwQTvp0FHdeCBvV/b3zSVTEmbATWUZojer6Ob8uGywitjqti3mMmZNJtM3xSB8jMg==
X-Received: by 2002:a05:6602:3415:b0:7be:d961:6b0a with SMTP id n21-20020a056602341500b007bed9616b0amr491648ioz.18.1706145450758;
        Wed, 24 Jan 2024 17:17:30 -0800 (PST)
Received: from google.com (KD124209171220.ppp-bb.dion.ne.jp. [124.209.171.220])
        by smtp.gmail.com with ESMTPSA id p23-20020a1709028a9700b001d7226de792sm8812921plo.219.2024.01.24.17.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 17:17:30 -0800 (PST)
Date: Thu, 25 Jan 2024 10:17:26 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: "Chen, Jason Z" <jason.z.chen@intel.com>
Cc: sakari.ailus@linux.intel.com, tfiga@chromium.org,
	senozhatsky@chromium.org, bingbu.cao@linux.intel.com,
	linux-media@vger.kernel.org, andy.yeh@intel.com,
	qingwu.zhang@intel.com
Subject: Re: [PATCH v6] media: ov08x40: Reduce start streaming time
Message-ID: <20240125011726.GA194356@google.com>
References: <20240124144301.1126453-1-jason.z.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240124144301.1126453-1-jason.z.chen@intel.com>

On (24/01/24 22:43), Chen, Jason Z wrote:
> 
> Because video duration involves calculating the streaming time, and i2c
> communication incurs too many XTALK register settings every 4 bytes with
> i2c START and STOP.
> 
> So we have opted switch to the i2c burst method.
> This method involves writing the XTALK registers in the order of
> the register block.
> 
> The start streaming time can be reduced from around 400ms to 150ms
> 
> Signed-off-by: Jason Chen <jason.z.chen@intel.com>

FWIW
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

