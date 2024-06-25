Return-Path: <linux-media+bounces-14110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA1B916AC2
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 16:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F28A71C20EF3
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 14:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EAF216EBF5;
	Tue, 25 Jun 2024 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oHNJh8ki"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D6416DEDE
	for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719326427; cv=none; b=bYvkcIZfP1xgBe7WheGDXsVxVzl8RtJgTfzBgvwsi3ncZMfpwuS2BTXJ5f+Il9vcgyj3U9uurTowqoZqEbwC9s30J6rNao1Pv2zHIVo2MsUR0Sif+B6jGp9u5GvHdWISG2ddg4Gc+lwMp+tOZgjSgDzJzA5ZnQfczmxPsnmHql0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719326427; c=relaxed/simple;
	bh=trALs8KdLx6VhITV+c8+7FsleAuPSHSH71GZILSGCq8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OYXnsx/jljWrhUNzfQwJlJQDzIyltNCCYY03FogDqWlKEtIZH+t01RfBBn1ZoiavgfI0WcmC0Tr7SopM3wyfep8FFaEBO/vwFAzVK9Vjv/8T8rAYRTPwF8hUIwdQm9QoLcpsA5MV+Ouhuu9LZuRaeqZyckBau0e+oV+GwkSnvS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oHNJh8ki; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42499b98d4cso8803615e9.2
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719326424; x=1719931224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSANmUbEh6D7VW1j/tL/xnWMrzPKUXm5bDXQ8ewTync=;
        b=oHNJh8kikWXt3JTsg9SRimjq6SKmnkmH2Ag4dH5nl5IJvby0LErFjtGTsskBk5Ezhq
         X3+CFvqZUI1IN1fzTYY5Njd1kL4dneyw2O8U8Q3zKIg1SHgwF0YcK1fa5Rd3A5LJ01eZ
         DYmv/78x+qzw3o7zPxSZ93wF6jA76JtPKy+fYw4Ux1Mfrm/qnm4BGxmgV6bB/4iMivQe
         g9YCM3g1RzbK2N9yzdHEXbUlae1rakkBPFWrXJvkPkiEFJ9rMIG6GrZYyLfscrCWukBM
         HBTwK4/WckrR26ctoXz+27yJ102WZd/nz5sW5Ph6c7+UKVDVvrCSnvztkKHSfhH8VxRF
         m4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719326424; x=1719931224;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSANmUbEh6D7VW1j/tL/xnWMrzPKUXm5bDXQ8ewTync=;
        b=sUsNS+8oZkBrB6ynJIFOxyFSpQ3m1JAVuR99gJYzhpQJLpVC8GN3mxStcd2B13JG+H
         1/PeMzWRFlsrJuzuvQ9em4atUukKAg3HNKpipxF0iEzdOFzikuk+yKjxy9LrOgbA/Acb
         mGM5UkNJPuwdbw2w053iY7chU1CL69xOj1NPZS2VvyJtRvh6JyphECkiK0UmpsZyI0Al
         Wz5zp9kMQW61T9cdkYEGj/f7yq4laMrRQG60pNmIl8u9n9HLle3NeO+Vd9JoHbA+Ao7g
         +eYHaycjw9yQ+MXK4SWoRsF8mBFLh/elimoUEWM2+VMITiWgpDALwot1elzGzAHwrMMB
         icLA==
X-Forwarded-Encrypted: i=1; AJvYcCUswEsp54AKD9Lc8pQG4xpidTGsHzi/O7gLJesDiLljI6PolAlDoURuKPzSA47tdQ4LyAtlzbtrpve1Ynt9oIh7T/AdSteqlE5zBac=
X-Gm-Message-State: AOJu0YwrCLSu6haOWVgaYeG+yPozWtr8iHHPcdCWJ59tMirnrxoIyD1P
	mHJvbXZETyUW1xkL3eGAxQv5eoxp5nkP36T5TDXA92/AkEn2rghRG/0Iecb5FIY=
X-Google-Smtp-Source: AGHT+IHETM2J/do/2SDqnSnmgKYgYsfQ586CEBVmGuu5NWFMEzbLBxusn/KmGl6Yk1pyNmCJDNWl4g==
X-Received: by 2002:a7b:c3c1:0:b0:421:2b13:e9cf with SMTP id 5b1f17b1804b1-4248cc66b18mr53553185e9.36.1719326424339;
        Tue, 25 Jun 2024 07:40:24 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d208b3dsm218556165e9.34.2024.06.25.07.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:40:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20240624-fastrpc-ml-v1-1-5dad89dce78f@linaro.org>
References: <20240624-fastrpc-ml-v1-1-5dad89dce78f@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: CC dri-devel list on Qualcomm FastRPC
 patches
Message-Id: <171932642324.352395.16698786992801289835.b4-ty@linaro.org>
Date: Tue, 25 Jun 2024 15:40:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Mon, 24 Jun 2024 11:19:09 +0300, Dmitry Baryshkov wrote:
> FastRPC is a way to offload method invocation to the DSPs on Qualcomm
> platforms. As the driver uses dma-bufs, add dri-devel mailing list to
> the MAINTAINERS's entry, so that DRM maintainers are notified about the
> uAPI changes. This follows the usual practice established by the "DMA
> BUFFER SHARING FRAMEWORK" entry in the file.
> 
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: CC dri-devel list on Qualcomm FastRPC patches
      commit: 47bf4198bf386018e99673c1ce5dbd8e5eda293e

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


