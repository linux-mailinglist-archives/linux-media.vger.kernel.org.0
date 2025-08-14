Return-Path: <linux-media+bounces-39941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AC6B27002
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 22:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 767CE5A7AF2
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 20:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64E92528FD;
	Thu, 14 Aug 2025 20:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="lOhA+ROm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F51248F4F
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 20:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755202243; cv=none; b=O51HTeH5whViLV6i9X4LFagvWYE5oOhr0AT5rLtePQNqiH0Rpwh0YHBobZqOwngmToCj6yIcXg9IWcWTU2PQLGtbnlzFV2huaf5XxPjx7WCBIIslEYW3N9VFaPN4KwIPic21SwAxZlZiyM9acV/MsCuSVAACsgCAmSK1iAiYyOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755202243; c=relaxed/simple;
	bh=eYgA3N4h05PhIefRPlZZxd2Kvoq2AoymFCQfoY+NFpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dnz0OTYv2ihi+nAnnI2QOQSJK2U+4FLtUbRNiCNBY3eZv5Uhx2aEKoZkLKe47mMgbQiXmLW9D/3cDyRRH1X6oc2cJliX7T4m6lY0f8/r0gZj7JhuiEXMd454lcuwWrywqKTd8N+xOgqOEgrZxni5hVCVAjyXjPWcTSvH9Zne624=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=lOhA+ROm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a207aef58so1168105e9.0
        for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 13:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1755202240; x=1755807040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYgA3N4h05PhIefRPlZZxd2Kvoq2AoymFCQfoY+NFpI=;
        b=lOhA+ROmf3+IsheI8EuwHGSVkC7SrlZuUzxielDEps0Y0Jce7/o+j8vo4vehsFmO2M
         zxVK7I1Zzybq1KLewQXJxO291KGdjbFpRnNtmRsi0HcmJ3JD6BAGTDq34IyhfT9+ma2U
         +p2y1sic76NdErVYsHbT6rNcsZtBQYQuj0Xvl5iB88Z1gPj3bB1Pd9tHXfgPzdTU2zwG
         pcsAFVCZLgGK6SqawiPxQ9pIqjrsvKDDD8q8qtMnB83BLtfL3NEkih9drlDXjgvGSss2
         KraSIot6V74MIPxVt/rYshNK+IiMnYJwIWcDIoKW+jRZzN9Qbdby/EVk57qG7zFCPyk3
         uexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755202240; x=1755807040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYgA3N4h05PhIefRPlZZxd2Kvoq2AoymFCQfoY+NFpI=;
        b=oOY45e9+0m7zs2cHQaRwRG1RinqKUtHLSRCpxG91mNId+b6F0kXIH+IGW4N2i//wN/
         0x63ZlQBcDAUbXjkCBb7m+GzQHuZDTfASI0hGss6tija5R3Jjm3x8BNLs4ZtCh6jn5wv
         e9mEOEkkX6KY5xU7QFotys75vK8wVpbIEVfU4Ml5dwwL5zIwQFo4GwGnuU9kls5YiFz3
         YDudA7K6xqrvn9FLQ6AVHnuC+5ajpkiZpUkpwUjZMbcn1lSdzmOZzxvK706GORYrGhK7
         N4WBLJcpHP9gTf/WrG7RBreeKts9YyvIcBQ9L8PixeZBlm9+Byp1BplrUs+QLzd1oJOs
         LSnA==
X-Forwarded-Encrypted: i=1; AJvYcCUxOUUjVCNZfgJCbZXFhMf869Zrzw9D5R2l9NExXDyCI4yzr+sYEnXW8f4f+tZUlaCrI7RakBboeciI7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFeH+3nDPwLtiU88zyoX9jZpXSELZcjSDStHqODMo43O/2l93Q
	Owc8TbwTynyX4u7x+jC5iNBxwgGRm6dF7IN0N0r9yj6tOIEXTxNrjgq27jsyGpdZdeE=
X-Gm-Gg: ASbGnctnvtszNUFahZJeK5JdP675cSvkwsIZM4F/HkTh1CiY+A9i95JJfpxJpa7Tvdz
	ulYEh0ZuUHKE73aMIyXDVT7yWujmdV/AdC31kgzC2Tnj5M47ZiPIfuvyFqnu60+XgnpbFI4tmoe
	6Qy5IvBnnJ2dF6fLPjfYnP5cIpm4MdeyD+nJZv+zrAXNxynsrFh98XSKgEUt2dHHBzpyuAFTyfl
	l/0AOq1+vXhrH86B0+XWFQiuHRvN/KUHl8AMBmydiXWgNhjA8LAXJvzmO1yFT4CH+mgF6kbvXsg
	0i1PPB+hPOopwe4KGEp93Pj+JV46FaW1UKYEJZdQN7pNtFlzeYXD+Imy3nkzIr/fo1ELuDTVg/m
	lYMW9bikLE+Jc5pjI0ZvqsJmAJy+aimdNTSNoTCSzqSG2DQjoPg4=
X-Google-Smtp-Source: AGHT+IFKimWuBri2WoewJAsYNvoksiCVAxKmqE+2453BhQHj6EQUXYD9g2OaPfcuoOtVVKHO6X1LWg==
X-Received: by 2002:a05:600c:3b1d:b0:459:443e:b18a with SMTP id 5b1f17b1804b1-45a1b7b3133mr35254355e9.14.1755202239865;
        Thu, 14 Aug 2025 13:10:39 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:8a22:14e2:8791:d972])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1f7082absm18740525e9.24.2025.08.14.13.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 13:10:39 -0700 (PDT)
From: Aliaksandr Smirnou <support@pinefeat.co.uk>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	support@pinefeat.co.uk
Subject: Re: [PATCH v2 1/2] dt-bindings: Pinefeat cef168 lens control board
Date: Thu, 14 Aug 2025 21:10:38 +0100
Message-Id: <20250814201038.15054-1-support@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814-intelligent-industrious-cassowary-b73c9b@kuoka>
References: <20250814-intelligent-industrious-cassowary-b73c9b@kuoka>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 14 Aug 2025 11:04:10 +0200, Krzysztof Kozlowski wrote:
> You describe here the entire board, not the MCU only or lens motor
> only...

Since you asked about 5 V, I was explaining that this power source is not
relevant for the driver.

> Can the board be used outside of above setup? I understand so far this
> is only for Rpi where both above supplies - 3.3 V and 5 V - are coming
> from the header pins, so supplies would be totally redundant.

There are several variants of the board, differing only in physical size
and type of CSI connector, targeting different cameras. The board should
be compatible with any single-board computer that uses a similar CSI
connector pinout and MIPI signal lane assignment. For example, the NVIDIA
Jetson series replicates the Raspberry Pi camera and GPIO header pinout.
So yes, the board can be used outside of a Raspberry Pi setup.

As noted above, these supplies are redundant and were not included in the
driver description. Given that, is it acceptable to remove the vcc-supply
property?

