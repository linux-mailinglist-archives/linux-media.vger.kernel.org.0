Return-Path: <linux-media+bounces-20356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C89819B1DB5
	for <lists+linux-media@lfdr.de>; Sun, 27 Oct 2024 13:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F15AC1C20964
	for <lists+linux-media@lfdr.de>; Sun, 27 Oct 2024 12:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56361531F8;
	Sun, 27 Oct 2024 12:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKDJhDz3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD3A1F5EA
	for <linux-media@vger.kernel.org>; Sun, 27 Oct 2024 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730033604; cv=none; b=chYk7Xg/8XtpDcgAv285TPPpEdNmCPGs73q8DgL2h6Fsviykjgf/C4zidbUjjmPeAFvQet84P08Pon2kaniyYQZ9bfl+EZ1uo0D5BfAtibtcARSAEIS80TiqNrdRgWZq6lThWqvFoNqgo/RM34vxJWpeykNA0bDL4wPo/64V1Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730033604; c=relaxed/simple;
	bh=VQXNcp64SArhQBDKBVByfOCM2G/6QD+M8O4IM3px2oM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ruzv2DuliaRaIvKd0SSI64Br25+bczViSkqxkig+Bo/tNA9Ach4xtPOr/cwL7x1oV3p3ziME4XSUeU6BsY8nAW+IUsIhqdzz0ohxlmh5pnj/+vE4bFveANJsepKafGPs6iCloCs2lrtK8U8gCoNiRsJZFFDrIWCLRzcKRH0WK7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKDJhDz3; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb4ec17f5cso31612541fa.3
        for <linux-media@vger.kernel.org>; Sun, 27 Oct 2024 05:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730033600; x=1730638400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z60UI+IxbR9VTlGt4bCMTsv7KedBoRPJumkiYMAMRUQ=;
        b=bKDJhDz3Hrz1b9plSO2wPIu826kq39uF6vitJGLCB1J0VOHY6oqUjVxQ0NEWdpWJrn
         KIb2Izw/rZE/CmqNdk4Pjx7pP8PFc7z/nQ3Y1XTNzlB287ZJxQmG/cJbHwLl5gOiT+9z
         bPlQ01ZuAVgDuuKvJlWyJfl3VXI2it1B26Yxje1Z4t4UKr6nejEJFsaTaqP5FDsoWCyh
         8fPAiL9xZCG0emnzq2ZstDXIYUTZGIykYrOGSZY/ASsolLgbm+OGAsrBh2W2wfH8ii0A
         WWA55Z1M87YqBlDwDZV4U3ibxtrk1aHuDRSUEf++C/Zn2CL7PJ2vPS7r+DAXRYQXL/sK
         rIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730033600; x=1730638400;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z60UI+IxbR9VTlGt4bCMTsv7KedBoRPJumkiYMAMRUQ=;
        b=eSSXNiXGk1rX0sbzgxF9lNmzHJCJXpXgljpUJArzoQ9DhHOSVcxSqh5ZCJaEs1D6/f
         pGTSPRhVXk1jMp9m3TNO1R91WGOn7cUCksdbcRINGR+xIgr+a8uCHIY/MZnUbiXFBCQb
         yRi9xqpSZnODOrjVcEhwwQriK2Mh0Ad7hxd+UyFA+7Arml4i+dHAKL/Q5JICg84ak9Ow
         CZJ322+9TK7ORXm8pHwgkIm4sKD2SmVCVO6ExQ4lNvx7Z4ofU+aJC176LYYZW2wxnMZe
         fu5FNgjPoWpfzVcqZIfzqgEb2K/7sPlR3xMsej+BFrzI+svnKQjno4TyQZBVh7FJYnI0
         kGhg==
X-Gm-Message-State: AOJu0YxiOFL+bf5PqrYrApponxzUpi2zQ+DQ4aZbL5mWq1cXyuHI3Q5w
	51jSp4OXGmYaKBynHWrpDkAPQ5PJzFb1dLiCdQ+eTlJgeXkfDXOG
X-Google-Smtp-Source: AGHT+IFDY1YBEueFYDrfHZAmGtwPayhD5T1B/0bGNnyh10/bnLY6l1Q6Nr9gmPYXqdZNF9f6f9Y/NQ==
X-Received: by 2002:a05:651c:2123:b0:2fb:403c:268b with SMTP id 38308e7fff4ca-2fcbe05091bmr20376041fa.34.1730033600065;
        Sun, 27 Oct 2024 05:53:20 -0700 (PDT)
Received: from [192.168.15.130] (94-240-0-2.lukman.pl. [94.240.0.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb451a2bcsm8406041fa.31.2024.10.27.05.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2024 05:53:19 -0700 (PDT)
Message-ID: <ce2e4959-d546-47c2-8444-2a652e644b01@gmail.com>
Date: Sun, 27 Oct 2024 13:53:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: Re: [PATCH 07/10] media: platform: drop vb2_ops_wait_prepare/finish
To: Hans Verkuil <hverkuil@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-media@vger.kernel.org
References: <20241014-vb2-wait-v1-0-8c3ee25c618c@xs4all.nl>
 <20241014-vb2-wait-v1-7-8c3ee25c618c@xs4all.nl>
Content-Language: en-US
In-Reply-To: <20241014-vb2-wait-v1-7-8c3ee25c618c@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Hans,

I again have access to (some of) the relevant hardware. Please see below

W dniu 14.10.2024 o 17:06, Hans Verkuil pisze:
> Since commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
> are NULL") it is no longer needed to set the wait_prepare/finish
> vb2_ops callbacks as long as the lock field in vb2_queue is set.
> 
> Since the vb2_ops_wait_prepare/finish callbacks already rely on that field,
> we can safely drop these callbacks.
> 
> This simplifies the code and this is a step towards the goal of deleting
> these callbacks.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> ---

<snip>

>   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c                 | 2 --

For s5p-jpeg:

Acked-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>

PS. I had to limit the number of recipients because my email provider 
refuses to send an email to that many people.

