Return-Path: <linux-media+bounces-47058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B3878C5BCDF
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 08:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9EA484E1BC0
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 07:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B01A2F60C4;
	Fri, 14 Nov 2025 07:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nkw+G5Xu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD7F24679F
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 07:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763105756; cv=none; b=V0URrSzgh1MquBygJneIAtckuPxGsY1fIYA+y0W2krZ21izLay2vdUQkX4rduzwwdSHerhRsCZGbFZyYJZw9bHZkVi+jsiNNySxdDU9WUht6MSI5KT0icEj83nmDNujBOt2RWjRglVbSpqGIG86mhO+/Vp3BI7gcUv5wadFxSwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763105756; c=relaxed/simple;
	bh=HCFB0gf1PTZ8qxvL0c9ZgT0prON/gQ9PbNIYjC4hFrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O7/efOEvLaEbGujTGo2BTc7bfrDJz74OOG27C2ZC/Un7gDsg2mV4jUJxQZDiOijFVF5/peVm3caNKbFf8+HqN7jlSi77Obvgoi+JBp2nyPFbiVd0u8lyeTVPRFHVroHvAvn3iJddMqirnt9KG/Qn68CqIAZ+krbokWHmhAJ/IMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nkw+G5Xu; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b736fca06ceso24794966b.1
        for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 23:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763105754; x=1763710554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFLTfYFZo+inPQxPyq4xaMb0Ju+C3NcGaHtCUNuaidI=;
        b=Nkw+G5XuPphbM8Z24zwvM6Jx0KTORY4EHAlx/cE6LCUfVWPLhpDr5VrO5bKeTbvHaI
         xLcOjfliPV60r0j2inpTVfyVPNRmFJeF4HGAazXdkZgZCDN0YsPkSteP21TatNwDEy/H
         am0/pz9AZrClLc1zXKUQ9cc3psQ8AThUsxNm1LIVGCu9yG8uNuO5B7hMgQw8uPahHFUf
         lvsqKI3RD90/wHhVmsNe5R3p3hsFwIq23cHyna8clpI3bHRnFIToT+WSFLMEHL/ikXFG
         9LZL3VJjm2ZfOq7kevlnzWDbYiAAlf1stT4cKwllJqyiQ/h6KUWA9+5Wsb9cxWR+YmNF
         +IzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763105754; x=1763710554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lFLTfYFZo+inPQxPyq4xaMb0Ju+C3NcGaHtCUNuaidI=;
        b=mjJNYqLXfs6Bc201qgdkVBjqHJujIpmfD+bwlC3WmmwDVcdUoGvvTiyNd07KDUUOIk
         wR36tXZKIGFr7Dx41RSx3M1+XH/i9Rx9hxqkn8P0Ue/8Q+pFuVnfljU4tkrzkTIW5CR9
         O8sNXppnjkcaaa0JUtAX5mesb6MAn7Q+R5n2GSefPv1AQ2J6uQNCeuq8GFIJTfY/bVcp
         Qf4zYOFhR7fgHJzlSNQ3aQJcFKEAfWj5eVCRQ8T18XPVYTPQfkcZa53P6WrPvN/BuF9K
         XUfCimFomWmj9Rs88ekSk64gPdqs0yKgr+yrRiEU3+hgEhMBZQ8AggQMj/+C/oyePSMM
         xxcg==
X-Gm-Message-State: AOJu0YyNFZcbfCRU+SRfA/ncsolNgHFph4dZz6wbPo96ACuztt/ajAjS
	QxGNLoG60SE7aW5/7M61QCT4UjDmYa8/bo4wQfp+L/1WktpAyDe5nxQT5KuFFA==
X-Gm-Gg: ASbGncvkp3Nyk4/UI/utY7OrSc/M/6BBXy2IvADI1ElSWgG3CgMxISR86A0TtHeyn32
	Bf3JRbHdmrbCRCcCDot82rlOl9Nox/Nu5z1UGMModn/2kHdE6YceRemEOXnLaf6NUULM0R5q8pw
	nqz9PFo8NCbi75DP4W5LHVlxV2SBdmICkY1jOOX4892zAbiO2kuN48lyyvUtEmISRpy7+srYScF
	fzo6RpcdEOc9lOsGshAbCBRjNvB0Xo20gRONwZVEdB/ir+BTMZZbfehw29bfBFBOCdDhcXH2liX
	2zSH6r9IIOSdA5igXHQsdyetSm9Qi+Jjf7T48wiqpkuDhZowYab8J7QfgxUVC/lSmg9HJ0ZV3XL
	l0risiZmnxOsB0W12xlAmXhJ49r6vEyN+8Pq2P/0sMujBHRyKpPLjg/DXOIVWHr4ZGg1b61fkCu
	NbJ1KZTyR0ltW0QyJdJ0MB
X-Google-Smtp-Source: AGHT+IHP8f4IDOhs+3WdtpM7lYYKMk1Y/gzrU/hQkgwM7xC+v+Hy+cdkWU21+fN20Ut6b8xaehwCWg==
X-Received: by 2002:a17:907:d09:b0:b3f:cc6d:e0a8 with SMTP id a640c23a62f3a-b736786e693mr156169466b.17.1763105753546;
        Thu, 13 Nov 2025 23:35:53 -0800 (PST)
Received: from foxbook (bfd52.neoplus.adsl.tpnet.pl. [83.28.41.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81275sm330810266b.13.2025.11.13.23.35.52
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 13 Nov 2025 23:35:53 -0800 (PST)
Date: Fri, 14 Nov 2025 08:35:48 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans de Goede <hansg@kernel.org>, Ricardo
 Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2] media: uvcvideo: Return queued buffers on
 start_streaming() failure
Message-ID: <20251114083548.54251544.michal.pecio@gmail.com>
In-Reply-To: <20251113214056.2464-1-laurent.pinchart@ideasonboard.com>
References: <20251113214056.2464-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Nov 2025 23:40:56 +0200, Laurent Pinchart wrote:
> From: Michal Pecio <michal.pecio@gmail.com>
> 
> Return buffers if streaming fails to start due to uvc_pm_get() error.
> 
> This bug may be responsible for a warning I got running
> 
>     while :; do yavta -c3 /dev/video0; done
> 
> on an xHCI controller which failed under this workload.
> I had no luck reproducing this warning again to confirm.
> 
> xhci_hcd 0000:09:00.0: HC died; cleaning up
> usb 13-2: USB disconnect, device number 2
> WARNING: CPU: 2 PID: 29386 at drivers/media/common/videobuf2/videobuf2-core.c:1803 vb2_start_streaming+0xac/0x120
> 
> Fixes: 7dd56c47784a ("media: uvcvideo: Remove stream->is_streaming field")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://patch.msgid.link/20251015133642.3dede646.michal.pecio@gmail.com
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Reorganize error path

Look alright, thanks for taking the patch.

