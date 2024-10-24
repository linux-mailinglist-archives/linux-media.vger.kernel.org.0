Return-Path: <linux-media+bounces-20152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 676AA9ADB2F
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 06:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8631B224BE
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 04:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33261714B2;
	Thu, 24 Oct 2024 04:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P8xWttk/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4381D15B96E
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 04:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729745923; cv=none; b=m/+y9WVYe/YXqM2Bo5y4l5GvvVAOfKGJEoRqBRj0heu6PtMHnFfBdJHnnveZFWA+CujWtF5vh83IzPP26cQw4j/tsJNzCzE/kEbD3NHsvLsUwGCq7RY95NfGcWZUDbKC5ItrFSJZCUdFdd7P/YSaSRDVJ/kvJyeRlqsGewFXpjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729745923; c=relaxed/simple;
	bh=eQoCV5up1tey6WgtRB78V+YpCdsuV159fN2z76ECvcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITABRACGqqazclxsud5rsqdmhwGiWWaQZWd7fgtsDIytmDxuLa+JMe+ACCZVg1IzyP283ETJryyvNZlMbYFHPLzkZ4GVdVHpvSNbJLFQuSMYs25RntDBK8Var2ct8pe55iEzfyKcbjNakXDvBPABHBHYJ5BhiTMZHAzsnI2XRwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P8xWttk/; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-71806621d42so288728a34.3
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 21:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729745920; x=1730350720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pY5S8Qe/tH8W8TFzpfKnpbVyCJ3jraqzxFrdzi0BNfA=;
        b=P8xWttk/4xq4GFbg7+SX43JTg2Af/ZoR6+piVIGRa0E49nBE6uX4Arhy/pKmSC4Jub
         t7NhLI5Vj4LSMqicuBjd0fZSzveuNahJ3J6WB/BL49WPxs8hgliP4NtPcPC1z2FPB8O4
         5G41eAdN2h8pnI+fatEicTVVFSliE2OXo9Bzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729745920; x=1730350720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pY5S8Qe/tH8W8TFzpfKnpbVyCJ3jraqzxFrdzi0BNfA=;
        b=NAjzPGRKlkolZ5QLYEwX2/j1We01ZNe6OKF08pZpwRFux76gx6ahY8fgtuMRnZkKxR
         ikC5tpswtrkBorFoUc3fWnyIfuGj+kcvmfDUJF71B7YLG7C9l8Q2ZYLFRMVDpndbAI9f
         W+c7ZGumgxE3NScnmGoikNR9H6tGI+ZuM/mbGPspHnHbu8bBOTTBEWXNXGcOyOxyEDQw
         D/NwqrQ6FsT1wVqo198XwHqccvgSTFHXYHw4OceQrJCr0zDJoY2P6Rvf5QHN1Q8TEmV7
         vBCB3W7FqwGcfRWbmwjJMW89y0owZmf9d1nxyQfrsZ064Aqh3BYjSX0E1jpOF9vQKGeF
         Z4mA==
X-Forwarded-Encrypted: i=1; AJvYcCVPe7DxJm2CnBr3KayRGr74KSLghULOGYNQnE85UdSksaGM6ZvzqVji6gdTAfRN9UrpgeKoAKIefiWQTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdznHLuymDzaGO7MK8HAtjPzX2DlsftDxxGCcjxqYhJ/Bts984
	du5W85wUt/44JE6+HoXa6maaxCWGo3+qC2KsOlKqbWHQ4i8aCqHk/+qRTlmnrQ==
X-Google-Smtp-Source: AGHT+IGTufG3SwLv8HMF53KejgGChB8t3QXUwJKa0Hl6/xl50zmRsVDRjPkfsdWLF3O9keVQ1hy3FQ==
X-Received: by 2002:a05:6830:3141:b0:710:f1fe:241b with SMTP id 46e09a7af769-7184b2a9b33mr4911358a34.6.1729745920483;
        Wed, 23 Oct 2024 21:58:40 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:9422:d958:f749:9a30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab33e99sm6659281a12.33.2024.10.23.21.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 21:58:40 -0700 (PDT)
Date: Thu, 24 Oct 2024 13:58:36 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: venus: sync with threaded IRQ during inst
 destruction
Message-ID: <20241024045836.GJ1279924@google.com>
References: <20241023052444.139356-1-senozhatsky@chromium.org>
 <20241023052444.139356-3-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023052444.139356-3-senozhatsky@chromium.org>

On (24/10/23 14:24), Sergey Senozhatsky wrote:
> Guard inst destruction (both dec and enc) with hard and threaded
> IRQ synchronization.

Folks, please ignore this patch.   Stand by for v2.

