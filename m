Return-Path: <linux-media+bounces-7292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B6B87FA11
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 09:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0D25282B94
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 08:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF8D7C0B2;
	Tue, 19 Mar 2024 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S/q2qrf/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A5E7C0B7
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710837654; cv=none; b=CLOcnxjdBORMDQiuj0iKXpB2RbWXhJTx5U10Ui5Ys3ItZ8e8y76FIw29maQ5YDhY3nTaBC4UbfVXMGOYgeSnTO4s1mGOJO8Z/plFWxnydRpcSKL4pn1UQLASsU4Sf47w0xUj1bUwzJMy4efbFwl4UJBzFuPpp0Oy3QY8T1ZJxmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710837654; c=relaxed/simple;
	bh=+lllqe1oGamg54GIj07KoJdepo5YUkK20ROlGfy+QX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPQ4QFcYatmcCv4mMB4eOU8HmzpendA24/KHy0vYDfBmBc6YlH6a9yDJ905/n7DUHhtTSEab/0D5cm5T556lfnzmVpkV4YFY49k/h1rBr/MV1E33Aa3ENDTEwNXA1AyLfRg36osJwv1YqvmaD94U3EkdBSKXJUZKqpRkprL1cLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S/q2qrf/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1df01161b39so26161355ad.3
        for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 01:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710837652; x=1711442452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1VAbjMoPwP6lJtWhwCQoX288twS1Y5Av3wBQ4HPYz4c=;
        b=S/q2qrf/jsYWIfnadnLl3p1Iv2MksHfpMDSwQaXbkt0nJ7+fQm/HWSzatnq7hIe0hz
         rR31OPInc9kXDcQcJkqoFhCSq1MpnChA33AlSnWLFbAuUSP/K676ZEzwC9ZdfYtSyE61
         k0Itz3IEVqvkP58E/BIKry+/fNdvuH9D5Bp8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710837652; x=1711442452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VAbjMoPwP6lJtWhwCQoX288twS1Y5Av3wBQ4HPYz4c=;
        b=EUV0HuSv2ykvJ3YeI4Kl+HV1GAAmJSKroKo0M+4v3M3Sz0XWDSva38LzoGOX6w6Elx
         g2uADA1Yrmzt++SJeYLHrWaR+g+0BaungWrCm7QGgnaD6sHDZkRqI1vhy+YVFtpwl9AZ
         R78lPDINvM/azlqbejcsDPmSPKgi1Hq2Um9uuWw91aBUDweCWcZjh/iMOxS/lJnaJQ90
         dtwKanJW8fxJpEib84vdMMJG7CobHjLFHaOMEfyfYghL37aCPKwdK/AayPhyNw23FIBr
         jkQ5pg98/vr6dGxM3LxALWR6eVRi4ofqDCR1ioZvQKhsfIhW12+svELV2S5UOiiLEWpK
         zwpg==
X-Forwarded-Encrypted: i=1; AJvYcCWiuf23PQU3L2iuajL6mBiIjnsor79cENkh3+VHYDiZhubZ8Jt0DfNNk4eDKtph0aqwQbIXuGXomusW80hed7IvzyBFys1Tt71IHVA=
X-Gm-Message-State: AOJu0YwoEG/c/DQaGjm/pcVF5oAgrzCQROfNBLirYNT9OM1JGVm3dPYa
	BtTOyK0e4cjJwWoBUJsj92C44x87h4WtVKhKU10NOH7BRZfOYQqC6EZEcGc91Z4T/4GRpUsrSrw
	PwQ==
X-Google-Smtp-Source: AGHT+IFkekqhASItln4Exvoi3VtGSD6RbwGcTZF1ddA3Qcwn+Oy9wecz8g1YC5sxwbpWJ00N0RtJMA==
X-Received: by 2002:a17:903:1c4:b0:1dd:7e30:4b15 with SMTP id e4-20020a17090301c400b001dd7e304b15mr16645851plh.29.1710837652007;
        Tue, 19 Mar 2024 01:40:52 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:c250:918d:64f:6463])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902c70a00b001dcb18cd22esm10845105plp.141.2024.03.19.01.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:40:51 -0700 (PDT)
Date: Tue, 19 Mar 2024 17:40:47 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] media: uvc: Probe PLF limits at start-up
Message-ID: <20240319084047.GA1041856@google.com>
References: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>

On (24/03/18 23:55), Ricardo Ribalda wrote:
> 
> The UVC standard descries the values for the PLF control for its
> versions 1.1 and and 1.5, but it does not describe which values MUST be
> implemented.
> 
> So far, we have been adding "device quirks" to provide proper limits for
> the control, but this is failing to scale.
> 
> Add a function that during probe-time checks the capability of the
> control.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Looks good to me

FWIW
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

