Return-Path: <linux-media+bounces-45125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FC2BF5E13
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 12:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A5DA189F793
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 10:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D349329C7A;
	Tue, 21 Oct 2025 10:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UMMTqj9H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C85F2EA72C
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 10:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043812; cv=none; b=onCVAd8ePcFnuYEpnOHShDr7WgPgfivuWDgrOf8CwKgDApyyjjM8XbkXBid26TYzVNf964CRwZAzdfK6+A1ywc3GmhMVimi/gu6KcoUodPGK5Ybe4FopI8wN4cU0JNhMU48DKOSL5EjgKo1DNzQgtuoACq5vPepFYIGtURPAJKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043812; c=relaxed/simple;
	bh=tibOHuElsdn98IyG9GdCHJwfonoWwofOLVF9QyGZnAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rj9r2iNuizQ+1YDenFjJDfDjVEWHhJIA9hkoxMi94mzQLZ41+YqVULv2Dqe2Kj0t8QqMZJkc4OzPOLVZzmY/vltkN17IKeYozK3XK39r6Ih8iMNrkzOzozfX/vp42+EvaXpRHTARezivyPHD/xfYAWBXcU9Z8r2lFr6ZkgYbAPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UMMTqj9H; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-781206cce18so5533002b3a.0
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 03:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761043810; x=1761648610; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5mx/neDnkeSOkePEkm6VBEHII9lIyY01G34R6H9ZvHM=;
        b=UMMTqj9Hy7W/mc9pJK+Er3vEJEMR0TZ6k5cZyTAAx58xGM1Xk3K+iUzqcJST3qBpJJ
         onR6q1TZVpSSU7SQItNbmNTls0MH7vkvSunbU9k0bFNsoZo82AYnOGzEk3inXo9ykQDR
         qlMA+4ntnG1aHbmgEvgOFapQAoH1zsOe57PY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761043810; x=1761648610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mx/neDnkeSOkePEkm6VBEHII9lIyY01G34R6H9ZvHM=;
        b=GCxRtW6X/UuAbmf7EzYbMsumHhtnw04j62Ys62HzFn/2w0eMV4yK5WZLpKduLHo2M8
         zDnw+Yn/SwWkeUz96rooxivNIPmfb5zb88+BhKocBZmHh6mUfmFMHTOuidBzoFdKC69n
         6tU6QVcURE/pxQx/iDOyeHau5jGtVyJ831EiFOpjF63TLomqNhs7yX+6O5qfSEWEPzme
         SawcxuXm34eFW18jcUKUg+epKEfqqf2UhjNac1CVL6BOE+xanmh0dGsDfisR8TA/P0Qa
         9rUQ5m/GF3TnGg785zED3FxBjBJrqO6bjFSlPZIWD281w9C9C09M3Tcj1qONPfWkqTL/
         Ma2g==
X-Forwarded-Encrypted: i=1; AJvYcCXjZ3oQY8g8N79jS+kF0rgwFqaOGC3IyrMucIecK9OYti70IN8GTuxR+OlTv135yNKawn+8e08maxM+zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJcIVTRTCdKMHHFnnrG39xq2xExT7KrANW+USaOfCC9zHQHd0M
	I1v5j7uUlf+GTp7cd3I0Eks8dMPcQ5yv3XWfJMZyazCeoRuQEGloOGf2D3QvpZQG/R587Rnj4+n
	tSo0=
X-Gm-Gg: ASbGncvk+A3X6ioBojWb0gFqm/5ABxu+WMhVdlRsl8qP62PtjeRAL3LpFTli6HBfYaP
	u3qGUgywYT76BCjwayS3r8pZ62Lv1tDEmRh5rbU1thO/SbmUxKsEJo5O0u6I/CsvXGvKw9nKTr3
	DWYx/9u//uqFvD4oA33bjWO2gvObvra/FoIjXA2TnUSSwuQdkOI4xmE//cxKhPGtnjacUHK6Igw
	D56hNx9hc8DSeeqwDrcx727gFbIlDOSOgMrXsvIFT63226SfsEUb2Kt1hrVVXJv41mIwwEapOtt
	a5aF18vW0dFe3I22VXZ2v6y0llfasmHmvIqYjBpr/BP4JkcV9Bd+9qIyZMoh6FbHqzdHzPKYeV8
	KFDb5NLuK/XNkT8VQY6UqyTvaJE5i7NMw3z8l1DCCcBdaHwuxNX42NYq/geExxrzeQdN+JYNf3s
	0BOAo+tRE9Jtz06Vzpnkk0bOVajdZtOxLnKzgFpLeusQ==
X-Google-Smtp-Source: AGHT+IE/zp/PuGXhXW+ucVRVsKjUeL31G1Je/nbAG9BSsKADaWaoT/fMzOm9QTLITC9zmyAv913u7Q==
X-Received: by 2002:a05:6a20:939d:b0:243:78a:82d0 with SMTP id adf61e73a8af0-334a7a4cb6fmr20464885637.29.1761043810098;
        Tue, 21 Oct 2025 03:50:10 -0700 (PDT)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com. [209.85.214.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23010e211sm10877573b3a.62.2025.10.21.03.50.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 03:50:09 -0700 (PDT)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-292322d10feso29088495ad.0
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 03:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGcoCe/weLrVKhih+0VeRLYMaA5WxLTiJ7eUvAmVnbIN2oHAGXZhPKToGg0IwL1RcVLOSaN7SpqQpi7Q==@vger.kernel.org
X-Received: by 2002:a17:903:8c8:b0:269:b2e5:900d with SMTP id
 d9443c01a7336-290c66da7c7mr197621385ad.5.1761043808846; Tue, 21 Oct 2025
 03:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020-imx214-smatch-v3-1-2c9999efc97c@chromium.org> <aPdPyc6Lasmp3EzC@kekkonen.localdomain>
In-Reply-To: <aPdPyc6Lasmp3EzC@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 21 Oct 2025 12:49:36 +0200
X-Gmail-Original-Message-ID: <CANiDSCukjH51Gi5S3ra6Jm_kPWhkrsTPGf42DurC1Mvrd3XMnA@mail.gmail.com>
X-Gm-Features: AS18NWDdcIC1YbprgDnT_wuE3AKXtOoVu1iUuwaBxos__XTSpHjlvHJQCCjcNjc
Message-ID: <CANiDSCukjH51Gi5S3ra6Jm_kPWhkrsTPGf42DurC1Mvrd3XMnA@mail.gmail.com>
Subject: Re: [PATCH v3] media: i2c: imx214: Rearrange control initialization
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Tue, 21 Oct 2025 at 11:18, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the update.
Thanks for the prompt review


>
> On Mon, Oct 20, 2025 at 08:18:13PM +0000, Ricardo Ribalda wrote:
> > Smatch is confused by the control initialization logic. It assumes that
> > there can be a case where imx214->link_freq can be NULL and ctrls_init
> > returns 0.
> >
> > Re-arrage the function to make smatch happy.
Re-arrange the function to make Sakari and Smatch happy :P

Best regards!

> xhci_hcd 0000:09:00.0: HC died; cleaning up
> usb 13-2: USB disconnect, device number 2
> >
> > This patch fixes this smatch error:
> > drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously assumed 'imx214->link_freq' could be null (see line 1017)
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> --
> Sakari Ailus



-- 
Ricardo Ribalda

