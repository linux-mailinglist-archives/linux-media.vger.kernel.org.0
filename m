Return-Path: <linux-media+bounces-26141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C75A355A6
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 05:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 970BF1888185
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 04:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF99215747C;
	Fri, 14 Feb 2025 04:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="ACBxfdAY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39A01519AD
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 04:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739506774; cv=none; b=poPSgckzYUGxSJvctHYHeZXTK2GHutsjO7JThqAimWDhIEpNQSTHyy16LESDd8b1HeI2CTvqCtJfh5CqBhO/6XenM0PZbo1AT4EW56PrTY+QlNMGBDIYHXnDSmp8A3DTJKuo1DDAf+7xuL20HEd5vnej9Q0XYD30ZmCiTh8Hkrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739506774; c=relaxed/simple;
	bh=+9XO2NLU9UPU81HuW24qqKwg7KwzBgiDjHVk0MSsmL0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=keQQdHovFNciD2xyrfArhIjq/HF007lp3lrz93ayIXxrSXlYTCEmx7mnndxO6E7bbvAIZ1AHuSBVuuXnRMQw/U+mIMT2L16hrLst2ao9RmH4x7FeCK7Km8BbEYqEjnpMmC8cLnbGI5QHiOfvKttp1APSTzUXsb5W3fDfxd7FzhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=ACBxfdAY; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D1BCF3F29B
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 04:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739506768;
	bh=H+XreHAdQJCZU0l57Kc5VwelT0CU23nDfiGbUsfR1UQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type;
	b=ACBxfdAYaSD2Lh5tDozrzOfdZZX2D9jmm5i2L0jJ6ReZgstqZTX3HW+84QhBjWo6O
	 JAW0p0IlB/JXI7ij/wKVDDRtES5tmLo6QY0beCqqSYUCbP7YK30h5X1VSTNLSiMcNy
	 wSaroepQKQpL8+37nTaeJl7g9uuxrJ8Xo+dg5JQnoWBXbbe6BUcJeekvT8Vkb5ddVx
	 JC8Z6T52K5QApCW4XdZaNJ5SXNlF3klTfP0x322Hym4PDevLeUud4TS9M6c8FfKl5I
	 ZUM5KkwWndHXJe1aqQVEoWpzeHB9cU5wycfjz2vSxaayRWXwaix92AmlF5i+Vyx4X1
	 3QhR1nTeNYtVg==
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e659664db8so58589216d6.2
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 20:19:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739506767; x=1740111567;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H+XreHAdQJCZU0l57Kc5VwelT0CU23nDfiGbUsfR1UQ=;
        b=uqlj44ReuwMbswgS9gt1uSJR5AtmvT0kuj2r2+9cAOOplClPK6WU+kWGevdQjvSz2r
         17nUnMLi56IDKaOUg5bH7J7JLX+JW4L0+UBu1wsHRG3je5OhRs+Y9sBXzSvQYIbJxNDO
         AH7Q+Yg5z22lsX9p0NcZGOxi8FZ+kQ9TYf2hyOJKyo4inlhr+TkWncOeWDm4jvjS/Stj
         mWzNfJrPUrf0QxFZVVU+zoxNLFK7pWCCvWfdhSDe0MKa/F/gFoS4qMY/oF8Kxw/MPLFU
         NPtJjvpd8YZitwbaqFgSd/1C40jfPoKvKFLUmmxAFwbnGqgsiJOuPaqNaF9LA5+ViR0x
         VZng==
X-Gm-Message-State: AOJu0Yx2RxcjznyI/bXjR6pgtTu+n/cRK2QJncmzg1vc1h3Ejs+GdCsm
	+na7f273mjpF1qf5sMl0tUmUZWVqVQp/9w1ztUkTZMiPQAhLguGrhkRjkf8JP1wW6LpsuA7+VLD
	O1hsEUcQPDYULkR+lzZBOYOwkerRchqEuMzT0s4+rOTKnZDHApADGlV9Is2ulTBfzqtep+8gxYz
	zOh0bPckdyXt4=
X-Gm-Gg: ASbGncs2Pg76Fchfsz+t8Zlm0npYuMBClZOfRsqI3GA4aLWrzdzWwwq1DbpSVWqVbH5
	BaxmlMcZaVyCs3fvXJQLDmQefbnMQuqrAdbn8K0FzE5L4BBdIj65pJ5Kg6g2OMavdBsnhTVEUxc
	mgQzjz/yzA09x7jmL1+isFk/CigfsENI5YRsqHD1AzIillk8GPYYoXX/cAOin+5DcKn2nSUZsYN
	JjQEQpW0hMUtsMxMmaHuATBhOx9A/5zwm+M+FjbXlGyh8WkepUqDkYYACzW8TJ/SghPZOGGF+YE
	gc+s/0+TtEBf
X-Received: by 2002:a05:6214:21ac:b0:6e4:4331:aae1 with SMTP id 6a1803df08f44-6e65bf20a3bmr127718496d6.8.1739506767344;
        Thu, 13 Feb 2025 20:19:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfWWPtjIG92RtehXKDoRtBajym22Lk6BYCHr0VuBevrrJdA4tBNZz8402FMzLLWHtT1REB5Q==
X-Received: by 2002:a05:6214:21ac:b0:6e4:4331:aae1 with SMTP id 6a1803df08f44-6e65bf20a3bmr127718326d6.8.1739506767120;
        Thu, 13 Feb 2025 20:19:27 -0800 (PST)
Received: from [10.0.1.3] ([149.104.30.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65db006efsm16825026d6.106.2025.02.13.20.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 20:19:26 -0800 (PST)
Message-ID: <3bd7482f-e41d-41df-9d25-08cb62d5d0db@canonical.com>
Date: Fri, 14 Feb 2025 12:19:23 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Questions about image size listed in VIDIOC_ENUM_FMT
From: Zhaoxuan Zhai <zhai.zhaoxuan@canonical.com>
To: linux-media@vger.kernel.org
Cc: Ethan Hsieh <ethan.hsieh@canonical.com>, jianhui.lee@canonical.com,
 guoqing.jiang@canonical.com
References: <96f6dff1-f5c7-4fab-94e1-47004dd916a6@canonical.com>
Content-Language: en-US
In-Reply-To: <96f6dff1-f5c7-4fab-94e1-47004dd916a6@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

Sorry I made a mistake. It should be VIDIOC_ENUM_FRAMESIZES instead of 
VIDIOC_ENUM_FMT. I'm sorry for the mistake.

在 2025/2/14 12:08, Zhaoxuan Zhai 写道:
> Hi all,
>
> We are working on a camera driver. We plan to use v4l2 interface to 
> send image data to users. We have a question we'd like to ask.
>
> The situation we are facing is as follows.
>
> We have an image processing unit that can process raw data collected 
> by the sensor into the V4L2_PIX_FMT_NV12M format and send it to the user.
>
> However, due to the requirements of the V4L2_PIX_FMT_NV12M format, the 
> width and height of the image must be divisible by 16.
>
> For example, when the sensor provides an image size of 2104x1560, 
> after NV12M encoding, it should be pading to  2112x1566. But the 
> additional 8 rows and 8 columns are padded with 0s and contain no 
> actual content.
>
> So, we would like to ask, in this case, what size should we list in 
> VIDIOC_ENUM_FMT? Should it be the actual image size with content, 
> 2104x1560, or the padded size, 2112x1566?"
>
>
> Thank you,
>
> Zhaoxuan
>

