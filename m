Return-Path: <linux-media+bounces-10787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5388BC07E
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 15:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 664E1281C3E
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 13:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A769A1D556;
	Sun,  5 May 2024 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="3emlAbN4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DDDF9F5
	for <linux-media@vger.kernel.org>; Sun,  5 May 2024 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714915010; cv=none; b=YRgxX51yOmLPX4iKCXU+MPVpaGAunjj8SpIW6NPwe98w+dpzIgyPSpPEYpa1opFfuVsy6LWMKCF5E1KELuFEqRh2YGfxJ2agqIhkOeSgEScXQOdckQQby0BOw0hGJTBIv/rnJzH17SenfA7T+C0pBFVQQQ5wKhiQFrtVJGwpAbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714915010; c=relaxed/simple;
	bh=JUeAkc0VpjizPXONmHIR8AUIb0zyYhhxLFu/R8GLIAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXXyZNIna8KXbPT6n0/sDDfarkmsdbFEFYNXmnhcCD5o6COKXxloTd7qJUGYs93oKwz0iJp8ORtt5uj43AIpqy3wh+rHzb+mtnQ4RhBo1b0A2Ptn5tce8ryjtdNnr2UVbYz5efmTFNU1Wo98K1Mtx/dqheVlbW6KIkNqPogeyuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=3emlAbN4; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2b432ae7dabso325870a91.0
        for <linux-media@vger.kernel.org>; Sun, 05 May 2024 06:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1714915005; x=1715519805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p9gsKxFa2cb/3Cv8aGgzqyrtC++fhIDtBe2EGByMdvY=;
        b=3emlAbN4XPRGbQJ6J/axEWYOz7PNGS6F5ZfPzFLH3bl4V64uU4ORXv2tiG1A3MlEal
         hAp+JZww008FXmF+BC/76OvE8hldCOpDF/wWV4eFGl03wNpXloISgRRe10nQLvKModmp
         G4oCx6qPKqGWNzICyDgCk7XpeejD59ksjs4vdLci4pWGaU+YWr7N51RMv/g7tQlVxZb4
         CsKPnoyPksIkYjWog87W2teeQ3s25Tj2JS0XCIX80AmWLiL/bO+nV4eWdj/jRUgav1HP
         6JTpil/1lzJ3QHhg4d+aIOEENgG1N7dVbf87Y8DEylqrzEKAW72YgGZ22MtqqcHXKWM7
         pxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714915005; x=1715519805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p9gsKxFa2cb/3Cv8aGgzqyrtC++fhIDtBe2EGByMdvY=;
        b=fZF8XE3gKHrD9L+hYzUtkMatwFMPwID6g7ssv4DG4yEfnDf8jHXT4rKb/ZSp2PI3ip
         yRi18SXTrhpa341Jlu5fG5qIPQ8m2z0CoZSC57beVxIrHjO7EMvlqgs7c5kx5rKwlcaF
         GVmxFIvdX+EyDi0s7GtG2XVDxwlcxdu7yd4NSY4U6luodZjtH64bE8D/2iElURav8lG0
         b7hLRQEZVZYrkiRImPQQf1QjQuMjJ5Q8n593ebMtRuawPtifrGE3HJaCVRiayJuFkroW
         pSKn7H3n1X8QcpTe3vBD44Oay1LoUDdg6EugAetmeqSJA0Zph0E3rPgi0YyURZlo3uT+
         ps6w==
X-Forwarded-Encrypted: i=1; AJvYcCWdEfS7+4sKE/hCwJV7QwPnbvVgjBQqApkq4aq2/M/o31nsImkm/wltJaLUbrAV/lJM2WPhApvROnHmcV5vd1YIelMjFopopDqtTu0=
X-Gm-Message-State: AOJu0YzIzaY0bl1iHPd0zVN2CVoHqnfsIOxo/Jek+E3PJHQZj40hDeJt
	znsHXtjq304XUHnbQMB/FIKlOp01SHssDU2QU4DrDlfiBvrK8p1NsWwcyNJilL6YTWmsIyLCGNw
	j
X-Google-Smtp-Source: AGHT+IFVYhWBd6jHteuSZMdw9jRtZj/mjMdyHP4zXZreMovDGI55qccUxGeVr3BmjAf0Bb06UPxb2A==
X-Received: by 2002:a17:90b:4a0a:b0:2af:d64:4887 with SMTP id kk10-20020a17090b4a0a00b002af0d644887mr7186558pjb.4.1714915005545;
        Sun, 05 May 2024 06:16:45 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id w3-20020a17090a528300b002b4329ec537sm4711379pjh.53.2024.05.05.06.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 May 2024 06:16:44 -0700 (PDT)
Message-ID: <01a5c073-463b-46e7-beae-c5de4eb0ee11@kernel.dk>
Date: Sun, 5 May 2024 07:16:43 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 413/437] media/rc: convert to read/write iterators
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20240411153126.16201-1-axboe@kernel.dk>
 <20240411153126.16201-414-axboe@kernel.dk> <20240504133055.0ca70f7a@sal.lan>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240504133055.0ca70f7a@sal.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/4/24 6:31 AM, Mauro Carvalho Chehab wrote:
> Em Thu, 11 Apr 2024 09:19:13 -0600
> Jens Axboe <axboe@kernel.dk> escreveu:
> 
>> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> 
> Please add a patch description to media patches. Also, please
> c/c linux-media@vger.kernel.org, as otherwise patchwork.linuxtv.org
> won't track it, and such patches will be silently ignored[1].

Certainly, it's all just a RFC to get the full picture idea out in the
open. Any individual patches/series will go out separately to the
respective lists and maintainers, and it'll have actual commit message
as well at that point.

-- 
Jens Axboe


