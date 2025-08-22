Return-Path: <linux-media+bounces-40795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22386B32105
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 19:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53049AE7EBD
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 17:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FBA31352D;
	Fri, 22 Aug 2025 17:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="XfQbI8zU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947F830AAC4
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 17:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755882282; cv=none; b=cZ9en8kMQ7JjZFMDqA5/yPsFFXs6JfaFqgE8PPLXFvD9O8WsdtJvt51J/vPJWddhgvPy8qdYpPjABQEf0d3EonJQldYBHojUXh2a1SQhskc3nhp+TMHIsIlaXBkdJG6t+Fi6g4rtotukcqgQxU3O9kZttf2Kebkq6m9z7Dk17Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755882282; c=relaxed/simple;
	bh=5dfaUAllvYL9ZgEKiJLevm9at1ZnpgDDAmK6vElqIsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mD3MW+uZSieG/F2dXBpY/oUM0zzP3S3v4QRSlFZWQGYnisxvaKlZ51xFOxUr9q7LGWGbUMkTr3WC/wQ9s6Mh297GBHGEn4GTUVYm42F2+Sp9hGIhB3imiilUvoLj1SYG5VGpyln9FlBog8Wisbqhx6Mvzbks0ZNWK9vFRxoPlu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=XfQbI8zU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b4d892175so10652725e9.2
        for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 10:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1755882278; x=1756487078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ruBVDj+qOB6imevgf8x/SkAW4nSEvcagJ8QJX1Gamo=;
        b=XfQbI8zUxpgJTmv8XIbtSrpY/gSYzvuX61lI4/gG+UoOzBmjy6my1WpBoBgDq//WtY
         W1PBTSsbmV3g4KMzoNnpf9bupmiIA+AeQ7UD0slkykC1YGd6D40Mh6csEo0XGfVBjMjA
         VjDSwje7qCTuvWT+FUupzSrzYOeIxIfmubg/AMO1Os9HhtC18flnanpVOZ+shOuoS62Z
         fefgoaI5ex/YAdE8PySN/WAi0VKhU5NkDqmFOTXc2KnYb1fZCp3RHTBlzyfRHJi/plvl
         c/brlce7+Ko/7tASUAF7IZLoimHbXVRyKVdYaRlZVQfq1k+rkUBU118+rTNmAWSqyW9m
         SD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755882278; x=1756487078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ruBVDj+qOB6imevgf8x/SkAW4nSEvcagJ8QJX1Gamo=;
        b=Sl+IfWhOFSiTXyz4ZLgOHInIGjBJ2miuna10xMvZNAsm7KN+zF3jSF6tntjFlfWJqd
         9apDWXWF2fXxAA9Qram0eTU/QXO5Zg/DO1sRH+ySnKySFSvgAjNN94vbsGk7Fp0x2zYz
         zb3MXn6TgOPlK40FQyStzdFXmqPQM2cM+CwD+Tw624VYp2wBgSTQ0221Dy41zyXW3+Hh
         Ql8CzPxalWjR/7WUZN9pDSZWJgVovjVAuKq7WdCX6oZngdmxqfo5T8bMqS9fNB/Mrs4q
         qB9O8cTIrs9KRZya8g7ZWrKXdrrA5+ooOB9jzsc2wBru/pGkAz7cj+nxrkXe6ES2+jTq
         hPxA==
X-Forwarded-Encrypted: i=1; AJvYcCUeElOXnJ0uDana8QL12eHPle3E3vsGwy/q/t/9oMQRJ6iWMwDjuMalRmo9X3+HIlF/xODyR9t0HmBYvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxX56KULq7CeZM2F/tPHXr8TM9XqNDASSg7L24L3kU4IxfxfPkx
	z62u3wC6ayamlzM9XwjP0FYICUngzVSnRma5mLDzqoBL8oq2Kqj9goi/z6qbdDzzTWs=
X-Gm-Gg: ASbGncvH6mRwFKyGPr/1OBrEaO/moZyTAoNY7xbvtn9+XEUY1+Sy5PbTparLcwG8/+K
	ZB5h5db4r3yPcs4okFV9KaAiFpZBLYhM1L+0s7GWI5pdDKKGS65IROiYthIDGgHukGkUfbRbcHN
	HTeYxsSWlm30EVKd1X74M4mApdapZ2pyEc4siCHP02ypWZxNF+XJlvHvuDb9c+RGxQB7foQMH0O
	1FOIKjiSLw+4PqGncjGRYMFNE8PwNwS3NmsyDkXOOYd9h5jF4+lhZdvMiS//oHCN3jq2X5TyFby
	LE5h3f3dZ3DZldeT8UQIz9vZJ5B+HcS7Rhu27yxVXpUiwtgHgv9ls/w7AjwRZ7EhV4rmgK//Z89
	OeCSCGi12DL0czy0m8m5V1rnPBE4OOgcOz6Ps/7EN
X-Google-Smtp-Source: AGHT+IGJm120I2fO6Ejvhyi0cL/lXZlUxGg0+XxiLpAUXgJGj5+mlfzbh56yVxIwk9g2fimpHbnuYg==
X-Received: by 2002:a05:600c:4586:b0:45b:47e1:ef6b with SMTP id 5b1f17b1804b1-45b517e0104mr29338505e9.34.1755882277427;
        Fri, 22 Aug 2025 10:04:37 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:c77a:e59e:20e0:4966])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711ca61d8sm160312f8f.61.2025.08.22.10.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:04:37 -0700 (PDT)
From: Aliaksandr Smirnou <support@pinefeat.co.uk>
To: jacopo.mondi@ideasonboard.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hverkuil@xs4all.nl,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	support@pinefeat.co.uk
Subject: Re: [PATCH v3 2/2] media: i2c: Pinefeat cef168 lens control board driver
Date: Fri, 22 Aug 2025 18:04:35 +0100
Message-Id: <20250822170435.7057-1-support@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d2ka3glpjiisjs7ydx7knzzfb2dzi2lyc2r7d4hppqor33xate@2evtuolz6wah>
References: <d2ka3glpjiisjs7ydx7knzzfb2dzi2lyc2r7d4hppqor33xate@2evtuolz6wah>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 20 Aug 2025 14:56:38 +0200, Jacopo Mondi wrote:
> > > > +	    ctrl->id != CEF168_V4L2_CID_CUSTOM(data) &&
> > > > +	    ctrl->id != CEF168_V4L2_CID_CUSTOM(focus_range) &&
> > > > +	    ctrl->id != CEF168_V4L2_CID_CUSTOM(lens_id))
> > > > +		return -EINVAL;
> > >
> > > If you mark them WRITE_ONLY wouldn't the core take care of this ?
> >
> > These controls are read-only. The data they return depens on the lens.
> >
>
> Sorry, I wasn't clear.
> 
> If you mark as WO the controls you don't accept here, will the core
> handle this for you ?

I see what you mean now. Indeed, the other controls are alredy WO, so the
core will not let them pass here. I'll remove this check as redundant.

> > > > +#define CEF168_V4L2_CID_CUSTOM(ctrl) \
> > > > +	((V4L2_CID_USER_BASE | 168) + custom_##ctrl)
> > >
> > > I think you need to reserve space for your controls in
> > > include/uapi/linux/v4l2-controls.h
> > >
> > > otherwise this will never be visible to applications ?
> >
> > I found there is no need for that. Custom control become available
> > automatically by name via the v4l2-ctl utility. For example, the focus
> > range can be read directly in the terminal as follows:
> >
> > v4l2-ctl -d $DEV_LENS -C focus_range
> >
> 
> Yes the driver enuemrates them, but you need to add them to the main
> header, otherwise USER_BASE | 168 will be take by someone else.
> 

I see, ok, I'll reserve 16 controls for this driver in v4l2-controls.h.

Thank you for your help.

Kind regards,
  Aliaksandr

