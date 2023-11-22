Return-Path: <linux-media+bounces-780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D447F43FB
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 11:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 314261C20B4F
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 10:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661A658118;
	Wed, 22 Nov 2023 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IRNYxJ81"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AD93110
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 02:33:48 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-77d66c7af31so28918585a.1
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 02:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700649227; x=1701254027; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PTuvgdJsaL7l1CgYZKvzYqjZuoxEs3GDgWysnbP/+Eo=;
        b=IRNYxJ81KmLlATYtCWX/DELvh/9a/fzEoj9QOkCT0+y8NiUoVF7F2WBCuXW3NAQ1VL
         VI4P2JzJ0Goce7tDCdC5q1jLgOdMi32bsMzPBJLP+kuZvA/QvU4G3w+HvwNS9wMS+aq0
         IJa6CuzMIjDov4Gbt0BNBbcWE1aR2d3/rvC9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700649227; x=1701254027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTuvgdJsaL7l1CgYZKvzYqjZuoxEs3GDgWysnbP/+Eo=;
        b=VJqievFOH3xKJmC0Sy2UhFGSXoXshG5CA5+DfEaCrRJvEufCr/b8vAovQYZRiGT+I4
         vXn2PRjw3KCI51ocHnZ+xx+Cxl3UYVptdljey5TALcR9881wFkrivnKtL53TD2spIwPZ
         EQpGMBWx5/dEaL8LBc1P4F29YmpYIX6DDCHnF4RltnQLgd+1q024s4IJykkU5FVjMXbZ
         EzicdecjkOacM6mN+h3hdABHttyn1P0Lw8bf8mvzcd1XZN73QcrIo8pRMKKFxOers+lQ
         VXXkjz/HCv7UgoDEtdwtVVyltofGOGwt8HXS0xKkEazK4rmAVGFi4RWEZbPVA+JiYNne
         pIfA==
X-Gm-Message-State: AOJu0YwKvnUdDTBel/V01Xt8Qvqgx3MQ4MGAMbLnFj7Kpd81gHJRCD3F
	n8Zg28AuX9BFS2Sig26QcAWhdgkswxcRVIA+hGFd9Q==
X-Google-Smtp-Source: AGHT+IH9RtRrXvNBdJksEbxSZ/oFLIjL278IqLiZ0mSvaEP+08kVW6PsrFn+S0Gvl9eFzDZJP1IkiA==
X-Received: by 2002:a05:620a:1202:b0:77d:6194:e41 with SMTP id u2-20020a05620a120200b0077d61940e41mr2956039qkj.17.1700649227455;
        Wed, 22 Nov 2023 02:33:47 -0800 (PST)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id w20-20020a05620a445400b00767b0c35c15sm4320911qkp.91.2023.11.22.02.33.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 02:33:47 -0800 (PST)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-66d0760cd20so5861926d6.0
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 02:33:47 -0800 (PST)
X-Received: by 2002:a05:6214:d6d:b0:66f:b0c0:93bc with SMTP id
 13-20020a0562140d6d00b0066fb0c093bcmr3335961qvs.22.1700649226645; Wed, 22 Nov
 2023 02:33:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121-guenter-mini-v3-0-d8a5eae2312b@chromium.org>
 <20231121-guenter-mini-v3-1-d8a5eae2312b@chromium.org> <ZV3QtDOLj-6js07v@valkosipuli.retiisi.eu>
In-Reply-To: <ZV3QtDOLj-6js07v@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Nov 2023 11:33:35 +0100
X-Gmail-Original-Message-ID: <CANiDSCsuX93fQur92A_4TE1SHZSXGaTFEZwqqM9RBqpxKbnxLw@mail.gmail.com>
Message-ID: <CANiDSCsuX93fQur92A_4TE1SHZSXGaTFEZwqqM9RBqpxKbnxLw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] media: uvcvideo: Always use uvc_status_stop()
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Tomasz Figa <tfiga@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Paul <seanpaul@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Wed, 22 Nov 2023 at 10:58, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Ricardo,
>
> On Tue, Nov 21, 2023 at 07:53:48PM +0000, Ricardo Ribalda wrote:
> > uvc_status_stop() handles properly the race conditions with the
> > asynchronous worker.
> > Let's use uvc_status_stop() for all the code paths that require stopping
> > it.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Thanks! I have slightly changed the code in v3 and kept your tag, hope
that it is fine.

Regards!

>
> --
> Sakari Ailus



-- 
Ricardo Ribalda

