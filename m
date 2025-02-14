Return-Path: <linux-media+bounces-26139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A5AA35594
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 05:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C74933A507C
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 04:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E094154C1D;
	Fri, 14 Feb 2025 04:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Sy+p8AUf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCDE15C13A
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 04:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739506089; cv=none; b=Y8FyA23tj1O0W+stKH5Lg2MvqourLCrp+oGHp2Tf9628G8Mjf3hdSloUWZfOqgLj86Bw3kWa2DtnAoyJc2C6YGxIQO1EIlDrC02RDowXLIeSha5+6TFZDpHdRwSGuxD9R6SOhnlVSikpckGjANaXWEtVnxxiGWvHfSBbb8JYY78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739506089; c=relaxed/simple;
	bh=dvXwJyiQ7kbBkPkEKIKX6x4FnIKWpx883EeHOCyAwm0=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type; b=T1doyU0/t/NqI9gK+atbzLiGl/MCpmKxDLiPRf9i3KNie7VcuaRb8Iw+IOShUPGSWyoUNlp9nPZp7P7lggGtRwnkHYS+YTy5iIfGEoFjxcBjjSoXFITiyDSo1aqObTMSkOHqrdm/uX6uqQcBuzNKjtBAVYCsZDGbkFHdtKhbQkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Sy+p8AUf; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 168DF3F29B
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 04:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739506083;
	bh=q7xZetj9buJug2rOgcAsEYkiw1rJXQFbEVmTrPJ2JzE=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type;
	b=Sy+p8AUfXGD63NM1dV1dQ/XgZagDyGHADTCis6K5bL9p5Zps3lB2iuIKid81XCeZU
	 Edr47QQ6VrC2YxOYcoyJu7W74UnYrQm93OHwwfCLoVmw+BwMnv89j4IESElN6J5+s7
	 JggJ4gbGTDfrG/tzw2NmGYgxmo/XXtowhNGahbdvyPc46zvlZW0reCgUaBxRXyYeIa
	 Oa0S4bvcH7jd32BNCRiskJyh9Wet3DdM3ZAsxdEUVLhAslVTMcZj/yENI29w9rrKh5
	 uVxOWJeYUCCHhtVwygojI5y4vEZ85ZTJ0oiDypqJegK1TAsM00KK55bwMGAjl2eOsC
	 VAxj0XxY+jvWA==
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e4434d78e5so51006026d6.0
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 20:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739506081; x=1740110881;
        h=content-transfer-encoding:subject:cc:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q7xZetj9buJug2rOgcAsEYkiw1rJXQFbEVmTrPJ2JzE=;
        b=Ty5ThGQbdgBOD0zDgTscuOKYsddF/04xNd/mVtMleiWo+nLE4Raq5KYVsZeLtIDAjA
         deAFNwpxY43wzHeMOYBjpTAW0Ow6RWcnjAgfOxdJYaMalmnEDtcBIo7KOM/gSOamke/l
         aESDajF0UKMuPtPOWWv7qUb4CZRGQEKI7aZ/HvRxqot4YHf3YBH7z1eU+L1lMZDhJnh+
         8if/9TibS4gMFHgNk0iiMXsrnrAfCZ2sllkHiBOCr4Awxc1d+9ca3TNjbaDZmpTsJLf+
         pwR0/mSy811ZHkLbFIGLX3sMrXL3Rm/FcWY8CQyaedOEvnOlMsLPS/KRvFi6C8F8ARB+
         ibvw==
X-Gm-Message-State: AOJu0YwbcTasPe4xxNsi9RNS+RSfJge9vIK23JdNlAKkR1msVPNrID9s
	OHdX+dLObXjx6/Tuk2FiklJ565bpHY2gR9pc+Koz4Lq5VDutrSncAvVmG3zlBdHRjR32eH0Gsd8
	afXP4fZNnY1JWrtg7FIiKM01hVNh8/AqzOKPvd8EvidkqARJKN+9ProPSRXTNU6p2j1FI5VK+0x
	A08Es6S0bz7Ck=
X-Gm-Gg: ASbGncvhJTa3GzJM/57Uhmdw4qzZDNIC/JZlnoGDD5Ow5aFwjx7fhI1Sqozm9Qp0RsF
	utZPMgkz6Pn3/2EcOagAODCViR+yWTHo3WyD9mtgdzQX453CKtDMvpFg2g3FoaaDnFwrzpNHlm0
	nFzaSYLD/2Tht+cZaEqc1U/HINKRifP+RLZCvIvGlViIiPS+/8o4yzlL3kekhaxeyNVwPwWVxMf
	TPGQZiDNPPqRm3sXYlCP5aEuv8gSD+0TK57gNv/o5xJbYlllgRejwdI36CBVQ+2s1xMp0FLBe+3
	FhqzQaYzg5JB
X-Received: by 2002:a05:6214:19c4:b0:6e2:4859:f062 with SMTP id 6a1803df08f44-6e65bf60babmr119941546d6.21.1739506081665;
        Thu, 13 Feb 2025 20:08:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRuPHDl9+0vYiOGPjF7zqW9KxTRul9aiJYm7zVii9QPlc7+wCQA/Gp4SjVU/cWuefZZMGvRA==
X-Received: by 2002:a05:6214:19c4:b0:6e2:4859:f062 with SMTP id 6a1803df08f44-6e65bf60babmr119941316d6.21.1739506081333;
        Thu, 13 Feb 2025 20:08:01 -0800 (PST)
Received: from [10.0.1.3] ([149.104.30.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d7a4379sm16945346d6.64.2025.02.13.20.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 20:08:01 -0800 (PST)
Message-ID: <b79acb7a-3990-4275-b5f8-8eb3453d3c3a@canonical.com>
Date: Fri, 14 Feb 2025 12:07:56 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-media@vger.kernel.org
From: Zhaoxuan Zhai <zhai.zhaoxuan@canonical.com>
Cc: Ethan Hsieh <ethan.hsieh@canonical.com>, jianhui.lee@canonical.com
Subject: Questions about image size listed in VIDIOC_ENUM_FMT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

We are working on a camera driver. We plan to use v4l2 interface to send 
image data to users. We have a question we'd like to ask.

The situation we are facing is as follows.

We have an image processing unit that can process raw data collected by 
the sensor into the V4L2_PIX_FMT_NV12M format and send it to the user.

However, due to the requirements of the V4L2_PIX_FMT_NV12M format, the 
width and height of the image must be divisible by 16.

For example, when the sensor provides an image size of 2104x1560, after 
NV12M encoding, it should be pading to  2112x1566. But the additional 8 
rows and 8 columns are padded with 0s and contain no actual content.

So, we would like to ask, in this case, what size should we list in 
VIDIOC_ENUM_FMT? Should it be the actual image size with content, 
2104x1560, or the padded size, 2112x1566?"


Thank you,

Zhaoxuan


