Return-Path: <linux-media+bounces-18317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA6397A7C8
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 21:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20DCFB295DD
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 19:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B93415B572;
	Mon, 16 Sep 2024 19:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b="dw1juqPI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx2.mythic-beasts.com (mx2.mythic-beasts.com [46.235.227.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC8B2A1B2
	for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 19:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726514757; cv=none; b=n/wYVjpROdqOhiOH/OK5keB7YuwVcCaJqkj28iISI+ntStPSBdGnVyrc+iGrEYS7Z8zwEtSzYpxDd0PXH8Y5VD4Y0Wo85bpt1pUznw5iu0651gcs3uLtTJ3YE7E2ILr+b8lrf7ozA4IHX+jY9xuWhwFy5ZjGNfiKPVhexi7+gUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726514757; c=relaxed/simple;
	bh=rpbBMqXnXgw64DgY3DGktdUktbDRJdxo6w5PqTYSEa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NfLdttWnJnx1ZU1zj2vG+tPv9DLq23LdpvUcanT5iUTo2isc3uFQVZj9kHM61ZsUGFnGlgGS5UQNkuduecjVqGaD0czIhI3Cc2rT7eA6lZTMzNlxqMIUROI1SSVYftD4ASlBatvq2guAMm+Xal+EQUADjKx7cM/Aj52WgLbrRzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com; spf=pass smtp.mailfrom=cowlark.com; dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b=dw1juqPI; arc=none smtp.client-ip=46.235.227.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cowlark.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cowlark.com
	; s=mythic-beasts-k1; h=To:Subject:Date:From;
	bh=rpbBMqXnXgw64DgY3DGktdUktbDRJdxo6w5PqTYSEa4=; b=dw1juqPIfETmgNxYLr4B9VnBQO
	laraRtc8kfNn8OjIr1s1w4g8m5hfkXrmQ0UAGqQ6aAJFi6QpaH+hWsiIY75gO9hPQqYkVtgH+2ayO
	KsucN8NzBarW1maUrhE7qAl5el6VZM54cwT9JXtpd5fDv5MbSUtZ0gEynSbKbHbd9G1oP6x+wh6Bv
	FhONMOCS3dge8rkVwW0fZ3j05BTdEQK+PUbap0qsUkN5PKeC13pi4Jld04Pj13duptpHM5qwxPQzJ
	2mR07DnH1+4JC+FRJj180IPWg2Sgnw+cKs4SrWXCLNQF1LQ1+3M1Pata8ZygqySwsto8tA+rPmsQz
	JNRFbD3A==;
Received: by mailhub-hex-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dg@cowlark.com>)
	id 1sqHM7-003cez-Js
	for linux-media@vger.kernel.org; Mon, 16 Sep 2024 20:25:51 +0100
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d8a744aa9bso2484070a91.3
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 12:25:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXomVdcsBgHH/mKn/6nn2LglD4hXgWb6V5MUjCyFMu0vwFmGygLKEh9mQjW2nuFYl4Padk6psqYScH/bA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5M4G2kpHLfU2wMBrPrwf5MjOz4ur2VjZ7Xa4jLloh86d6A373
	JfELS9/3e0i+1aTG8UpKJhTiIVdTyzj0vHrFCAmq37+fqkkp6r7NW0OkpaaiZaPj87qhXbVXBpM
	wB3h9H7yHLnZX8P0+4BE4RwJOQ+g=
X-Google-Smtp-Source: AGHT+IFniF6Sq5oNbD1/o2Ajs18eyEfzvh15VhkZggiKoqjg+XJ2223oKpp1pPQ/oDkMJUOdQL6CLrEFi/zL5kNC8vw=
X-Received: by 2002:a17:90a:ee85:b0:2db:5b14:3e4e with SMTP id
 98e67ed59e1d1-2dbb9fb43a0mr14059728a91.41.1726514750095; Mon, 16 Sep 2024
 12:25:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALgV52gHPWrcBBv2m6fAAyF_i_8T7cRTtBRS+FKe4TgfRVG0DA@mail.gmail.com>
 <CANiDSCti8SmcNWjhEKm1qM+Bzm30dumU=dptmHzcHeiObv-k+Q@mail.gmail.com> <20240916120314.GA29857@pendragon.ideasonboard.com>
In-Reply-To: <20240916120314.GA29857@pendragon.ideasonboard.com>
From: David Given <dg@cowlark.com>
Date: Mon, 16 Sep 2024 21:25:38 +0200
X-Gmail-Original-Message-ID: <CALgV52hBF7260vCX52OWznFdaKr3HWGdD759++-SYY2MsT19qg@mail.gmail.com>
Message-ID: <CALgV52hBF7260vCX52OWznFdaKr3HWGdD759++-SYY2MsT19qg@mail.gmail.com>
Subject: Re: [PATCH] uvc: add support for the Kaiweets KTI-W02 infrared camera
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-BlackCat-Spam-Score: 0

On Mon, 16 Sept 2024 at 14:03, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
[...]
> The patch should also be split in two, one patch to add the new format
> to drivers/media/common/uvc.c and include/linux/usb/uvc.c, and a second
> patch to add the device quirk to drivers/media/usb/uvc/uvc_driver.c.
> This follows the "one change, one patch" principle of the kernel, and
> eases review as well as backporting.

Done.

> Indentation looks wrong in the patch, did you format it with
> git-format-patch and send it with git-send-email ?

Turns out gmail expands tabs to spaces when you paste into it --- who
knew. I figured out git send-email and have used that.

https://patchwork.kernel.org/bundle/dg/kaiweets/

