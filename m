Return-Path: <linux-media+bounces-18391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EA197BFFC
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 20:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07DC71F22409
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 18:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F011C9EB9;
	Wed, 18 Sep 2024 18:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b="Wh/MWKT6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.mythic-beasts.com (mx1.mythic-beasts.com [46.235.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37052582
	for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 18:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726682916; cv=none; b=C4IWrbYfKzDQXvVAxgzawgtuMfKN3rby3xKrEZiyWcq1dk0x3Xt+dSvlRdW/Qo0ip+g1C161BkuPJHHXOV/5nOlOBRFXjQa8zgL7Ik7c1gJVGxcBF+B1Uu80sg9PXQOEc0ZV/PUxa0EqzFQknUIunNCkh1PUvyfetzcTnufj2Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726682916; c=relaxed/simple;
	bh=UU2KNfFO0iLSLby7LtbFgAQZLo/1XDqYXgj+5+cdhU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wg1yCGfqSetQFL5e28q+zrTnDwDfHZoUzGFqzMgUs81SMRMgJlR+qITN3VZXbzsphGxlLoSYungdDPkyCbwW289VAuwOooNzHxNb588+7keyKqw1nfD+yIEo3OxaWKLDEOWBYRy54xk2NAhnak03IY5vbZ/wzHDMGAimxBXnzB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com; spf=pass smtp.mailfrom=cowlark.com; dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b=Wh/MWKT6; arc=none smtp.client-ip=46.235.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cowlark.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cowlark.com
	; s=mythic-beasts-k1; h=To:Subject:Date:From;
	bh=OJ6rWoBn1Md5GU72g6nl2znODULTnax/wbae9mEHQ8Q=; b=Wh/MWKT6qoffZ+8gpd5K716Wer
	F2RRB3MwB9Qi+r5xa0EZ3z0S5FY6Bd/Ui2h2ZU9Vr/G8Z5DVs08F/kcmr0xT0T1g4LpbccNuYrNc3
	R6BNfJIoOdUmKEcGW7mpSK2TOaORjaOpA+9YCTMcLttK6FYOl7Mgqc+WlofVLQSD2bXRaSh96eCUi
	a6/lEuXVmp9IZ+sJSJEiUU2/ZuOXLun7gnBrQBoheelfDVTk4hCYGdpT06H3vhh1+OuzU+6NYkY/8
	at6ueWDLB47GDvviXKi5TSya3OMwqPzmwncjxFUCgpiWiBIOvDKudGdQQaBSTT2e6+FnyYqSbnno6
	sCRZgygA==;
Received: by mailhub-cam-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dg@cowlark.com>)
	id 1sqz6L-002F8f-MP
	for linux-media@vger.kernel.org; Wed, 18 Sep 2024 19:08:29 +0100
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2d8a744aa9bso32719a91.3
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 11:08:29 -0700 (PDT)
X-Gm-Message-State: AOJu0YxoUlWOiVAD6Jn5a2I5iTucRVqTxecS14gYL1LhMJi5TfL/ynX3
	zKACTXXP0UyU3mwR5QS2zhkiY3j8GC0N7HAnAwvctzQ6z2RIY+BScl2t9NeOEb4jPmKHufbMplg
	6PponwLRTMnbziaD8UuFiyh5SwFA=
X-Google-Smtp-Source: AGHT+IEmR1Yjxh/gHG/jCmnoDMfaQV/wz8gntWaaClhZhonyjcomcTGy7NQFL+MEUzkMF/zaAPP3BV4pbd9Cd5TTRog=
X-Received: by 2002:a17:90a:e2d6:b0:2d3:bd32:fc7d with SMTP id
 98e67ed59e1d1-2dbb9f761b7mr24588947a91.39.1726682908018; Wed, 18 Sep 2024
 11:08:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917215728.50342-1-dg@cowlark.com> <20240917215728.50342-2-dg@cowlark.com>
 <CANiDSCtH93upn++v0_xOOetN+wVCtTnu1_XNPA9RWNmy7qRM5w@mail.gmail.com>
In-Reply-To: <CANiDSCtH93upn++v0_xOOetN+wVCtTnu1_XNPA9RWNmy7qRM5w@mail.gmail.com>
From: David Given <dg@cowlark.com>
Date: Wed, 18 Sep 2024 20:08:16 +0200
X-Gmail-Original-Message-ID: <CALgV52hNm=0jJJmWfSqrx1nynBnvY6bModhJ5dd=887AQCDHsA@mail.gmail.com>
Message-ID: <CALgV52hNm=0jJJmWfSqrx1nynBnvY6bModhJ5dd=887AQCDHsA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: add a quirk for the NXP Semiconductors
 chipset, as used by the Kaiweets KTI-W02 infrared camera.
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
X-BlackCat-Spam-Score: 0

On Wed, 18 Sept 2024 at 06:07, Ricardo Ribalda <ribalda@chromium.org> wrote:
[...]
> ERROR: trailing whitespace
> 38#213: FILE: drivers/media/usb/uvc/uvc_driver.c:2431:
> 39+ * $

Fixed.

> You can run checkpatch on your patches before sending them to test them locally.
>
> ./scripts/checkpatch  --strict -g HEAD

I actually had, and it said they were fine! Turns out I'd put the
Signed-off-by in the wrong place, and checkpatch clearly just looks
for its presence while the linter on the CI server is stricter. (I'm
not a git user, and am having to do a lot of this stuff manually.)

The last time I touched the Linux kernel was in the late 1990s. There
wasn't any process back then.

