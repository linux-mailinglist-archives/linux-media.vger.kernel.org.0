Return-Path: <linux-media+bounces-20322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E219B0839
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 17:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2C441C21234
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 15:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9303013B58B;
	Fri, 25 Oct 2024 15:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yjAbxMFe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE1E42AA4
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 15:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729870123; cv=none; b=mKUcTMK9ZhwwPHpQMpe6PibgdyzZjuFFjCjv8bZKPhR7cANeMrtxiEF+y4WJ9GA56xNywne8PhD5LcjRxmWuNj5fsDhQhtUmU7mZxFC+Yfq6lwW+3ykAZ08wbItWZezBjCpr+vx+kRrymC0GliV2prf0yK5JkZU91ABwT/0pKck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729870123; c=relaxed/simple;
	bh=TPLNGREibIadmUC7AbHzKfAjrIRt1A7o5p8SIlwyePY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o5yOVZklMp4PBi2/6Bq6oQOzactDOjTRiC+GhJAmiEle46/NYqecHoATlt+JhUdibbgEJfVHucsBRt5myjv+Ijj3iebiaZnycCq+nnm4a+BzPRoC4bOaPnEBXlYz2qwx27HrfeSNsLF9aVJkpQjvXf3pMm+hsTbgsEViGgRBY1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yjAbxMFe; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so21881065e9.1
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 08:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729870119; x=1730474919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gwi5fJapzFJHJ1EZ8CDQGKguKx6U+UJZ6uS+K0pO9KY=;
        b=yjAbxMFezZl/o2MvLsFWhQQNJ25Aeml01DI8EG+y1NKnqAYdzL6HhoqVzW6JCKrk5x
         NRDGQcPfrQcNydFXcT19eBvktUhHyzHbc2NWEuKcTdqa0xum8rVkrzFYXFezXM7LibIQ
         GVrBnE03jchettE/syz1rn1cIJAQtVuzvvZ2Eu+BjbTZqodeRndU7kUlI5890SLILHfV
         NYEsai3ADKKArLp8KbmsIXwepQGnwqTk/nIGcIlfh1nsNdS5fDEdJIWBVDX6JZYcXCIJ
         Jsvv5juXw212RRV+uFpolziPCvQpnl46GFSIvAkPuxKyTURgEAtUE/omjfIc4z4gf90G
         f8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729870119; x=1730474919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gwi5fJapzFJHJ1EZ8CDQGKguKx6U+UJZ6uS+K0pO9KY=;
        b=GCzJgu0lntgliSAGZlT2s+wROhM06pQIcptfqI0ePoKtOu9k7fnD941gQul32UJ9Iy
         Nt8WeZ+R8OSKbTKr8xzpfH0MxFDSqkpozQP+ox9+Rk/MwDMWkMLcXjtGE/X6qj6ZNQ1u
         HHZ9UunB3h+I0yHcGRCdM5sf0VuzarZbXNJFHQtK70ge9M0sRirT8fLHxfTJpC3lNCoV
         3xF1aQc34hwVpG/sTgKDKZ2zwftTH3uemwXeSQXjGq5u4zXn5H9WGPPL2ZX6akMB/o27
         VSSSFEfPlkwd9V08wHjEX2W42H1GQzPvH8JGIR5jVk12OGQgZ1kVeghxSZOHefoMpx3c
         2Kyw==
X-Forwarded-Encrypted: i=1; AJvYcCXwB9TmaC0YPj2bGb/a77F694o6Rc/9i04QNaBXelm5P5owhfJMU4syzKCokzUCBZc6nEzfOCsukeRw2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxVAJPwBPcrcnaB066li2Rp9NvcQWcyoYKh5J0V7BWfCRLK80d
	XRwyXR06UVHtc64Rdwhviuwgr5P3r7+RAU9vm1XxycsCeS+0NsNImrkYAQUYaH8=
X-Google-Smtp-Source: AGHT+IHHiVTelEepIRcreU7kj3W5ReMmTDDEE1z2hoxrf5ppaSHlQGvr05Io956A+fDSJB3J67XptQ==
X-Received: by 2002:a05:600c:584b:b0:431:9397:9ace with SMTP id 5b1f17b1804b1-43193979de0mr24191885e9.10.1729870119415;
        Fri, 25 Oct 2024 08:28:39 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b6f838sm1788206f8f.83.2024.10.25.08.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 08:28:39 -0700 (PDT)
Message-ID: <ec78e336-b0c5-4d92-8716-46e435009495@linaro.org>
Date: Fri, 25 Oct 2024 16:28:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv5 3/3] media: venus: factor out inst destruction routine
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241025131200.747889-1-senozhatsky@chromium.org>
 <20241025131200.747889-4-senozhatsky@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241025131200.747889-4-senozhatsky@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2024 14:11, Sergey Senozhatsky wrote:
> Factor out common instance destruction code into
> a common function.
> 
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

