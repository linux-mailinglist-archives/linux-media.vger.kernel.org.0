Return-Path: <linux-media+bounces-20174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 503199AE136
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 11:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14E4E28178D
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 09:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058E71D2F59;
	Thu, 24 Oct 2024 09:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WxUMJwxe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28A63D97A
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 09:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729762763; cv=none; b=YVLTrix1StgF/u+XmLxdL+VaD1e2kX02iQfe5iTU3qmVTa+YjPmjqWC+HJEZiEDiXQ5Z08YsdnwtjDHn8jFdvBCAaAOXegxmsf1nkd1+4r4PR9XBjZqtF9lo9i3D9qLuY4812u4m7j4ZmIpIJnCg+zMDDXqQxFSm7itzALxQ3Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729762763; c=relaxed/simple;
	bh=psIUbzYLU4wFIXrzpbnQ/vVEnWJP9SPVhMuz47ZQnSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dwtka/OY4wglx1nypSbKc8Grm6sGmmfBYf6KkSy8BvNRQdWefTl90OnjpuZb2zoxIQOxZ+PwYeqRkeJPigZAX/g84r6sCb9WvS+5h/k0tq3XvI8/oy1gsH2ssU78nQDuZ1hk6yhfT1JBMHEYYzwCCimyXC1sCSCwUuHCHMZaICA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WxUMJwxe; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ea7e250c54so467501a12.0
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 02:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729762761; x=1730367561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=psIUbzYLU4wFIXrzpbnQ/vVEnWJP9SPVhMuz47ZQnSI=;
        b=WxUMJwxevqeDB/jkSpz8EWP7IxD/8hYPRCGf51b6WZWGdDxaCmlTPQhZP/oNyf8f36
         OaCq+4zJlS1SYVUJCebG08o6qU+ZiARy8a8kV1jgcl0AohbnWyaAuZprGvrdt2e7ZvDU
         JwpRCuuUCIEf4obZZyvY7IvXys5jI55Bo+64Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729762761; x=1730367561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psIUbzYLU4wFIXrzpbnQ/vVEnWJP9SPVhMuz47ZQnSI=;
        b=sJVmoMBs44eIwspI4FQ8r5tG7JIX5mMhiD9G/tJDAFG7rcetf2nL1vWUHDZU/xafPf
         HPoKPO9pDImHDh99Bz3JTJuhg76pcTOXEbPnzyZ1ufDZYbZpmIy1VuZyRabTqwEE++cg
         x+9gAX2dq0DGhaU861DQiZ8Aq8nesE61u0JUhhfJMTRWOoyBnkUBVgDEE4uCXTWdhV1c
         +HZm0er5tTN6RgX9MLifMD3rP/gMNEg7ofoaVqVYVAoji0UUyEnPG9eY6dV1KXHZFCv/
         B7gauaVAedV5/zEyf60uiZPZevbHF/3T9EDPdURL39IBYRge8BqXaz/VrrCdr+dPTPca
         CLiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDoeKdaCNHU1Q2iXfjIjCTtuKO9YqWIajWNAh2YnDv2wyj6ukMiCS0yKJ42fh851DqI6HhFcQH/3C7eA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx06T0lBqRH461GGPwvNdRbvysIKLukVG3+6Iazpy9Vzj6OcU5i
	E6ao8NmHQdZiigUbMk63yatE/SJbV45t2Hkc57EeB7NohCGa9O3x5iXwHE9g5A==
X-Google-Smtp-Source: AGHT+IG/IKjjlwb1UaL7FOR7rGdqnfvfZnxV4AE1xFUVjA5gLqDjXVktzbl6HM0Z4bmYO3X6wcbh1g==
X-Received: by 2002:a05:6a20:d492:b0:1d9:19a0:c36e with SMTP id adf61e73a8af0-1d978b98610mr5702616637.31.1729762761004;
        Thu, 24 Oct 2024 02:39:21 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:c7f5:2aa6:333b:bb6d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f36f3sm69432655ad.263.2024.10.24.02.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:39:20 -0700 (PDT)
Date: Thu, 24 Oct 2024 18:39:16 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 2/2] media: venus: sync with threaded IRQ during inst
 destruction
Message-ID: <20241024093916.GM1279924@google.com>
References: <20241024061809.400260-1-senozhatsky@chromium.org>
 <20241024061809.400260-3-senozhatsky@chromium.org>
 <4b96f1f8-e084-4599-abe9-05039bfac569@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b96f1f8-e084-4599-abe9-05039bfac569@linaro.org>

On (24/10/24 09:59), Bryan O'Donoghue wrote:
> This needs a Fixes: tag too.

Ack.

> It also occurs to me that most of the close() operation code is shared
> between venc_close() and vdec_close() a welcome patch for V3 would be to
> functionally decompose the common code to a shared location.

Any preferences where that "shared location" should be?

