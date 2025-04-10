Return-Path: <linux-media+bounces-29845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 565A3A83912
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 219DA1B63353
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70C7202F79;
	Thu, 10 Apr 2025 06:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="htEwGSK2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE26201033
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 06:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744265987; cv=none; b=pqBuiptgFPTP+WiCPtl/TlkAAvFNsCiG6q4XpL35MtsMF4asQi84vOEvs8f2y0UPVbYaqdfV3OOi9Mfa7WAgGVackfC5+h2w08FRRK0tPaW/FKdAeViimTfrYfoc80bCY0VyLGhTIHcy6naUnalDCzn62E+Qwt6UW5ZdKwM6HB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744265987; c=relaxed/simple;
	bh=fNKcWfeOv5X1UZBWJNkpzhwgnAdoDWDmVg5nRct5t9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5FoHkyROZsEWLbAavFMVetXuc9l25sR7mwf2aHTy7unwE+ELiZAiBhRuPaW8r1NUBXW+qF0AvwPblTwAZ1NF0B80rsQvytoLNgjYNSHTSmGvelxrBFeE59BATiL07cgXJpKb3cI75PQPx9i3xYWleepz6oNaMOHrToxWs+7Q5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=htEwGSK2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf848528aso3287875e9.2
        for <linux-media@vger.kernel.org>; Wed, 09 Apr 2025 23:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744265984; x=1744870784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fNKcWfeOv5X1UZBWJNkpzhwgnAdoDWDmVg5nRct5t9Y=;
        b=htEwGSK2vTaIz8z9lllONirib9yEqiD5v/DZnd4q4o9BpuIaC3KgzNXckydokW0lEe
         NAR392W9t4STF0jnCmN52u2421PR1SMbkM15nET3h1l2TJj1nUTvuRSX7gxOW3h5/qP3
         62BgvUgneCIaJpWKDGSNed47+ML9q0wobqdVuZraRw1uChE8LKanoEvMGCBTHmKu9l9H
         xxie6qDQptIb2l1Ad3idobgkwu9niKbRnwLk5QE/W7wpvbhuE9KmsSHnDMoTTUyZ3/39
         iusfvqJk1r4Y06GTcB7C8bR6KWQaVArohb2f9XCLTuErSYPhIs8dTsUncCzfNK4jzHsW
         PMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744265984; x=1744870784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNKcWfeOv5X1UZBWJNkpzhwgnAdoDWDmVg5nRct5t9Y=;
        b=DG29q5bjuJPXwNih2qL6IgwR2wlXtY01Q/TqmVPlf5HDruQcCA9srdTT1pG6hiGqE4
         oTbBAPSR+JXIWEhsUqEHFLCSGrxIuUJGNVyRZUrSfAweXojh2yiHn9wKnP05HFe0/YYy
         6Sq3baX/kDw4EaD4Xz6RZdCaXL6kuBsAgHsX30YYveWYwMJiPSvMYygKjqX+7lfIEh0v
         BXY1yuQdn4IZmz0Pg9CIB/7fqqrbRThY8RnUsxZnilig7lv2xi3I0zDtTvGMC6cVocOZ
         V45skR85xqjCpTwL4rwIQn7/KYkRPgYcT9yvYZGWWIJ5/55UR4RgwWDxbXlDqTZEuKY3
         4cPw==
X-Forwarded-Encrypted: i=1; AJvYcCXY/fqvZya+SDyhEChImiU4F4nrMeLbz73MGK3aoKosOo9xMpMHhWMtY0yZvSeNOYxwhgmAJ9X8Uf7hxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEGg6kQvY4tPJcR9HNdOjPLrNmbLy4kxJghQvNvAekTI8Y9Xhq
	oi38Iq7NTplv7m8525nBS5mVI9Hi4JQoAodEq4w/wl0+q388056R4Zg2eCXmAwA=
X-Gm-Gg: ASbGncun9ZWDcPaHqkcUrPIudUD6qJsCthIbGZKzyNpfCGALOSMzVMk4paZv+9blX+d
	LT32qymAcoum6Z3mGA+mq1gwN1S4wuehJv43GJhUcPWbYLf5QDxfr/5yHgg64IJR9zyq5Z1BqBO
	mn4TU6PSK2ESYLAjn5cxFpXUdrCrPJeYVJTFzARiDRUTfSmp7AFdMjkSRGK+28zSJZJO5+hUhbc
	bZP6bi65eFvoXDeXh8bVbLfZQBQoQqdSsgDpv05o4oBGoGHZR4nNw630y6twzCAWYGKXKQG24jt
	VeFlnLtd/XKyqH7gYLbLFYYcacQdGSOmpK0xm4Q7eSwVV7FRdT++e1Ui
X-Google-Smtp-Source: AGHT+IETxKgteFp+KK8rObwmu67CyaszSv6hN7I3pcGlN+mzeZYmJ4TDp+koJRpZX2WmH9ySINK8Og==
X-Received: by 2002:a05:600c:b8b:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-43f2d9604f3mr15862495e9.27.1744265983907;
        Wed, 09 Apr 2025 23:19:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f23572bb2sm39720035e9.29.2025.04.09.23.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:19:43 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:19:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Siddarth G <siddarthsgml@gmail.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH v2] media: imx: Fix NULL pointer dereference
Message-ID: <e4252054-69e0-4f65-bb75-54ba4a24e5d3@stanley.mountain>
References: <20250410050543.6963-1-siddarthsgml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410050543.6963-1-siddarthsgml@gmail.com>

The same comments apply.

regards,
dan carpenter


