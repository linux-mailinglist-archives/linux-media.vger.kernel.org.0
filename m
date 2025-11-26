Return-Path: <linux-media+bounces-47776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A538C8B55A
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 18:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0F364343496
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 17:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A134933FE0C;
	Wed, 26 Nov 2025 17:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLkY4fxd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9624131352B
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 17:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764179199; cv=none; b=f5+xx7TZYpKqksnl3hf3D2CHmK+O7X27i3i6rldc1ZlW8vfaU+CyEz0DNRDeulpy6vygWYHbZto7+lzLfa6Y4V1WSTfm9Cej2JTNkC4o/oZudc6yXIyUA2GpFiPBUAifYYOM8Ce7iZmabl/kj6Ewtl+65y3ge374iXv0B5pzumA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764179199; c=relaxed/simple;
	bh=Am+osK7vayhOko5hQTbEIu04oq+zoOyklk3hpxkh/08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPopczr16gi2A7Y5ZTqzKifRpT/0SMINHy/HXYKx1ThK0/ujLoA+jKM5/ioN22OR1oTuPqrZY8o6kY8WgP+y3rKG/3/Xal2+RSoL4R23iL0wR5EXUx4BpOFnPcg1A1cr9jltIVG+CNTvMqVJIOUkf/Jo9Z/gGpQWP7NRUeRupxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLkY4fxd; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso10820980b3a.2
        for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 09:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764179197; x=1764783997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ssuEpobEWlhQQAerzIq0kI7Vt1bdlYPe67OtsIpvbek=;
        b=JLkY4fxdIN8FJQA9mV7QuGrCoPbf8kZb5Cp2iIFtpQvvLZhEPLSID6hcO0E83DQWJt
         jjPOfs2ptHqnz5Be42vFQsAJe6hdBlwtkOvZ03FIfyG8IYbhYSvJxzz9xLm/uE59YJvG
         7duP1oh1d+TjOYdlC25lis8tYyvg0QYWV09Pwzjdg95JaARdRHDmBFNvibwFHyRM6ADb
         T1FEkhXczWpOlS24ZCGLL73qc+GlZS7bQYXbHLN02Zs2H0k6wNGNo+r5lKHUl0xdpYsC
         SmkLgDOARoxKOcnScpzGkLi8Rxk11e9FVlyfL9JAb+jZAPPW4VN615a4ui5tVE+4Tdxa
         CQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764179197; x=1764783997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssuEpobEWlhQQAerzIq0kI7Vt1bdlYPe67OtsIpvbek=;
        b=BUJYJ9yP6FYVP4b6AMTvuD8upQthiX7MLGXCU6VWoUa43p+p8NfUduKHn5AlJJQzhv
         KMCBo9+BGtW0kCnl9IgOW/AZuL4ZG6OraRsoAynrFn7aQxz4sHx2MBNeFgXyUnoPiAz+
         KXg9EbTykgo0+BHJ20JFUwDGylXYlebCzyUejw7RnEFsb4XbYclHBOQYVo1szJ7jNsc+
         //ZY9n5kHJfYs4hjBB7DpBEqysSgUk+uKDIyZrQyrf5y6BZUzUIsK8/Wnww0tC0dfzbM
         ZIoTz0UMJU0fN2LJtdbmDiCKM9JLlsdHUQXEzLHPvsO2eGWltLZXbSak3u//GIFCTwqh
         IAYA==
X-Forwarded-Encrypted: i=1; AJvYcCVFwLgK+gZ+PgHUXad0LkslHqL/+dYRXryp/BxfOhitRmGfLA105CNGxALMHMd7axgy7vmG5TQvLx88yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfX5PHytYdvrzahHOF9g4XSSF6cX+Tgsq6syMY67t12coSuSIx
	WitSwA21MwRW7vuDu1VbShP0FekGOZxrJTsjNb00hVDUr845mS45U97E
X-Gm-Gg: ASbGncsR0DQBnBUx22m+/ToV4SAFlLYdCty7PVbs97iCHi0rrp3Ls7Cp1jUEQ7XhlPw
	FAwoRrnb/BWY3J1ENxfYMazFND5GCi/v/XOa0GOaw0fu7j+QzDFuRWyCqy6qMcpqvf4UZeAQ9Dp
	n2sjx3kyfRFNKTx/DRocGvz3CD2DdXXvtzY2EoZLgUcefYBtWEeSC3EHr2604s+U0gSnskNcVXD
	3kvu0nHJVks+9p1JE8lo8QSKaWwgmzBi//mRZyiEJHjl2NIJhMctS19ZCToWKk0+dnh2v2HeB1o
	Y6gqqo7vyOc/JzgWTvl3virweD1/wjPwbyoS1U52DqiJ6vjslFq1AudSLHm7tEPUTSIkEau81N6
	QFKyfLPzIVXBe3FxbCzL+Ofl/ck+xgpoP5xbTdw1kYWzDFgmiQg7HmbgEa8sKIFtdB3MLEw3RBU
	akQg4=
X-Google-Smtp-Source: AGHT+IGVmmEGqnMT/AUh6Nucf4OUy8xYPKuRcAkg4DrSYqB9z9GxZOOKvBLoKzrqr9xxyCnllV5M5Q==
X-Received: by 2002:a05:6a00:4b4d:b0:7a2:7a93:f8c9 with SMTP id d2e1a72fcca58-7ca89a6c1d3mr7478347b3a.27.1764179196837;
        Wed, 26 Nov 2025 09:46:36 -0800 (PST)
Received: from essd ([49.37.219.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f024b7d2sm21669323b3a.40.2025.11.26.09.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:46:35 -0800 (PST)
Date: Wed, 26 Nov 2025 23:16:28 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: ssrane_b23@ee.vjti.ac.in
Cc: Hans Verkuil <hverkuil@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	david.hunter.linux@gmail.com, khalid@kernel.org, 
	syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] media: radio-keene: fix memory leak in error path
Message-ID: <tm5swq4u2t4lkvbk7b6qt3mstecmvypspbbbjir6pyha7ao52w@7g2ychpstnv6>
References: <20251126063000.28493-1-ssranevjti@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126063000.28493-1-ssranevjti@gmail.com>

On Wed, Nov 26, 2025 at 12:00:00PM +0530, ssrane_b23@ee.vjti.ac.in wrote:
> Fix a memory leak in usb_keene_probe() when v4l2_device_register()
> fails. The v4l2 control handler was initialized and controls were
> added, but if v4l2_device_register() failed, the handler was never
> freed, leaking the allocated memory for the handler buckets and
> control structures.
> 
> Consolidate the error handling by adding an err_hdl label that
> ensures v4l2_ctrl_handler_free() is called for all error paths
> after the handler is initialized.
> 
> ---
> v2:
>   - Simplified fix: call v4l2_ctrl_handler_free() inline before goto
>     instead of adding a new error label, avoiding unused label warning
>     reported by Media CI.

v4l2_ctrl_handler_free() has to be called in the last error path also
(the one after the v4l2_device_register() call).

Your v1 patch was correct and also better because it avoided repeated
calls to v4l2_ctrl_handler_free() in different error paths.

To fix the unused label warning just use err_v4l2 itself instead of
introducing err_hdl, because both error path that goes to err_v4l2
needs to call v4l2_ctrl_handler_free() to fix the memory leak.

Regards,
Nihaal

