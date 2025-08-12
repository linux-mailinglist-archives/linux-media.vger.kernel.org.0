Return-Path: <linux-media+bounces-39514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46461B21EC5
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 115801AA3257
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 07:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014E82D6E77;
	Tue, 12 Aug 2025 07:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="xLidkTda"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745472D6E71
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 07:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754982351; cv=none; b=Rv1G+VUo5l4YPIfo3D6IWuBRMYk2cFOdMB/LuaKt+wqyqsYhd4DTZbZSJgXHPILSA9k681UTOIba1AGsEWqQeDmrP796US4rfkfAeT1gosz2fTRJxahwKTh647GR1x0Fz/UINlwGGbPeeLLNVmJRwGyAhofqtyqCTgy57MGFwf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754982351; c=relaxed/simple;
	bh=iv9gB6ADf25LTSFRnlbo3W+NVpAkEfoVPtZrQ5xNiTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D1pSB4avmp0mi5aMY9ptfl1j1knRoa4OFyw3K6xDTsKVgLigreD8mB3neunXKhM78Otun9fKaYpCWMxiCIVA1fz/vBsJNpA9/jZxQ7wOhcMvnYBzUzeAlOPA00sWg8weFhq5T02j9fKfZkySA+zIT6Azd4sNPA7oIn1FWRjKo/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=xLidkTda; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-af949891d3aso672262866b.1
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 00:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1754982348; x=1755587148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WkylEyKarEYcVyP0A9Aw7tKAav9T4A9FCLsUYnI4mr8=;
        b=xLidkTdaViF/koOeNeev4YCzZPedlIdVfP1RbQNcz3tJypFspZ3Kg+Kse5SvIFV4mB
         uy51zJxlbtzxFzKMwbDOUQDQuX/ws1pZRV9m3RWrNKMWC8rILAKzwji3/VoyTl5ZJyfU
         gVgKSdUorGfBPj+7oMXvB0z539Ja8N3oOu80g2YxHlJcMexTyFZHTgN/7PCro9luA3s0
         NzxQ7fkim52h6qi2lsxZh3JYE9VzB2+rAqZXhdXkVv98Tq5Tny7YsQ1VPoDdrupgImOt
         dV8Km+HIEyWouqJjoeSMfpgY4VRKIdOc4M3JZ4eS02o+5B0vMgUe4O/a0YiN67saow1h
         Fniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754982348; x=1755587148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WkylEyKarEYcVyP0A9Aw7tKAav9T4A9FCLsUYnI4mr8=;
        b=xN4QHJuKpkaTEy0AEJ0GoXr6WlnjwIYYJ46nDRkRBDNWEV0jj0MWfiqAsxNMDx4qHf
         UD/5d1jckzhqIf+52SF/wl18FYQMTikHXAiATNam3CSahAPHgNQpK2mOLdEfyQyqC1ql
         Y0UvYlUx1TkqtWmlvArHMdFUeEnLgITH2T/QyYJkeWdFTXloq8Pd5903m8KPxsihHHrS
         v4Qnd8Y4yvmxh6982Jd8DLO4zO3rgHEpeVLrWi9CTb04bwjw12GIAkBQagAPALsqw849
         98AREkAPpuoWMxkKc4VlTwr2UL0bV/uh7BP8PoLJt+f9IdUHgn8+AbPKjcoCdxq3Mkti
         RGOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlafAsx1SQrneWxmkGz7z3Wl+fWQbfTWEfgKQjQLfClpAqONEpUHFoI26LV1pZD4a/WxxsGHkAF0oDEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTTZS12kdWjWiRLXnFWyEQzFcwZgLJHoQJRWkTugC2bCsNBN1b
	YF1vBFDzKLqDkp2Y14/QSbg+Daft1C1fPqsMdcdGEEKpgcY0xX1jI+tvVzJhms+NyBE=
X-Gm-Gg: ASbGncsSDp/kRQerJ7uhSVOfXhAOtaeq6Qz+CvtmQgQOaWxSPDsItcrEHfjizkMRrmw
	TUAy6h2Kj1gh/IyUHohlIfOctXpNrtH6y9Z7VyMT6gGSjMk6xkCuEsyBtOnHQiVPF0S346GMWx8
	6smS3MDuMjh+NGkvUa572ANb3BqtMlVrs6h3hbVw3aYG9iEZ8XpD9HMnnsDTR3AHDxXd0qBkWwD
	qQPc+zN79CjPktsAasSUsjRajn5Az7mbGeJG3qDZ0DFxFmPu9Oh9OFthcKP3G5UkyVvHWbsU2Cc
	S0VzvieS2Bk0mc2XpAf2h12OZQrgoHU+FVubT/T2/ifREJrqYZa0BTNsDE1OGe9X+mPl9t5Zwzp
	I1XZP6zXlqKkRMeNxqXpeQM5yJD3QNQdFH3nClNF16gB6a1ZG
X-Google-Smtp-Source: AGHT+IGDS8md6bo6faQkaiVbRFOO+4S6XZDvmgGYp6W1lD3w+bBDLbKXHYSpi94kdynUZuujjLDaHw==
X-Received: by 2002:a17:906:fe49:b0:ade:6e3:7c4 with SMTP id a640c23a62f3a-afa1e00b3b3mr192911766b.23.1754982347676;
        Tue, 12 Aug 2025 00:05:47 -0700 (PDT)
Received: from ?IPV6:2a02:810a:b98:a000::503d? ([2a02:810a:b98:a000::503d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3361sm2153532666b.39.2025.08.12.00.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 00:05:47 -0700 (PDT)
Message-ID: <56c3cbcd-10b4-4a6d-a4e8-294393fedc3a@cogentembedded.com>
Date: Tue, 12 Aug 2025 09:05:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] media: MAINTAINERS: Change rcar-jpu maintainer
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Valentine Barshak <valentine.barshak@cogentembedded.com>,
 Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>
References: <20250812060612.2120340-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <20250812060612.2120340-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Assign the driver to Nikita as discussed on LMML.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

