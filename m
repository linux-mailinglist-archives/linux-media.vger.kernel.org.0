Return-Path: <linux-media+bounces-30757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21576A97A66
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 00:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 263AE189922A
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 22:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA492C1E07;
	Tue, 22 Apr 2025 22:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jEO23b0W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986982C10A4
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 22:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745360586; cv=none; b=qlSyrZP3iWQYiybT0hOtudQfeYEk2uQqls7L4Hl98Gpar2NSMlsNRbt1X6lnaPFbIYhnZjjo6a0d3hPEVXCCAca0/5iC96acidj5uK4CGdWnY9O0jR8Jzz/CHBtg2X8tvOxeFkw0R/RgZm30rQS/M+BieCkAhBFR05L7jY0TOak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745360586; c=relaxed/simple;
	bh=e2uRwWrb8ebhkycf61ed5XHbka2o5yaZh1hlxBkjDhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3+/ZU6C0ZPP7Nkd4Ft8mbCZiCFoou897zQlJQFkEQecCTiJBtJey7wGWXG6j4Ooi/z1PGFmxz5GAzZ7+QjSaFEJjNj4iOjchSSl1ecRZ7brcovQ34Dxvdq8kzVijozmjtKawnnKT5opBKmnd9uKIzFdoLSvJK5dVceeqG5LN5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jEO23b0W; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bef9b04adso52807091fa.1
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 15:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745360583; x=1745965383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2uRwWrb8ebhkycf61ed5XHbka2o5yaZh1hlxBkjDhc=;
        b=jEO23b0WVqe76hU2A4ZzLru2kUgZ4k45WEDovoqlJUD5tIrmxp3QiCpwCamYoVMlEq
         H9nTEB54qEtTaGx7KmAPCTRBeVNhTq6ANRPZ6W2v7wKK06A9fe4+oZGzEzgK/JcjrXS+
         T3tkPEnsuVbq7CcrM0dZM6bU/jTM8xY258VC+8wLuGZMSuJqGYuHBN09MSYdGj2P+WMM
         svvUe+I99pYmKxXLRDDTCkxf+eIN2k2mfSo1zVZneoMwXIQYuezHR+ZkCsefxOMhK7FR
         TzwNZf5oBDO2Kt4bDf7ydjqkfLJP8vK60exG/EnSYsLY2J7pAWIvWIqGpByUOgb/CuD9
         7Yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745360583; x=1745965383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2uRwWrb8ebhkycf61ed5XHbka2o5yaZh1hlxBkjDhc=;
        b=DDwxug+lTByVbVXQEORbYItBgRFhF+uhgcRgsZTqH936XM2T5zo1rst+jrgcYBtjUL
         +oyVjKXbipEXSFzE9+I6d1cQ94VnjFqXn2+d0L10ElL/eDLqiK4SCEcrVFNF6l8hPzVf
         SZL5yr6+5qu7IUl3HhnlVNRa0UtWd3n4EThcY+Oj6GZIsSzinS1dq71TX4XOZjo5EhDh
         X19wo5h0RFDNrd27tTQ4MLcM+lYQbOlEXgcyeERaowrXPeOKaIivIeZDO0vlql/FJFAJ
         8OdohMPSyRC4i3iGU5WSAIvNsHlvvwcwJfXukUSWT8q7CqHWrLlByrGkjP2Z3Dyk9lBr
         lXyw==
X-Forwarded-Encrypted: i=1; AJvYcCUYl1Bqb35NNkERR/6kbDT65lB453jSHfX8BVWqh/TdmwzZfdQeUh+7YVVcEUJyCdbOnfk4UqEoKnI4WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCW6pAQk/7rJwRTFnNMAAp51vYn4OizWTmI/YNEjqmK4p5nkez
	qQQ3BB7YOcTtDHuQwtB61S5gqpCaU0bTtqi5bLDsGHxyQjsdSnczbSLD7KXRulAwUoqPb2dGWSk
	Bp3J+BZuwLilnK3nLR3HyrKJ53JsrgYnxs6E=
X-Gm-Gg: ASbGncuft7d6He9r9QK3HNhHe9o0AZPFwkS26fvvbI49OjzyGV/hV81PnBnesvCzTwi
	ANnGpU2E83BtalIpt4Rg7ZIE5riHt6EWtQdVPNMEh7d2IG0c1U1+USjpAJOqWML/cG+K9qC1RlU
	1363scRethaShdTkHdwDAQMId2xVIvpBXu43+ewiOHSEQ3snU3Ldg6m+R9TX30
X-Google-Smtp-Source: AGHT+IGrB/MiyfMTsIh+vYbWS/FNQhnUERjXD1nH9PAly6Ako+aVzVIOOf/PQlHpqWj+hJ7n2hzR9xaSmnbnValKnS0=
X-Received: by 2002:a2e:bea1:0:b0:30b:f24a:651a with SMTP id
 38308e7fff4ca-310904c626dmr45311251fa.5.1745360582583; Tue, 22 Apr 2025
 15:23:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422191939.555963-1-jkangas@redhat.com> <20250422191939.555963-2-jkangas@redhat.com>
In-Reply-To: <20250422191939.555963-2-jkangas@redhat.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 22 Apr 2025 15:22:50 -0700
X-Gm-Features: ATxdqUFD0eE26rdQ7w42uNdNNlbQHNUlvuTnoRS4o--E4bvf8dH1hzjOR3S0oaE
Message-ID: <CANDhNCpqSeSUkV2QvgLW3JY+Tsf_UOBjBrn4vBkYf+dvbtq2wQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dma-buf: heaps: Parameterize heap name in __add_cma_heap()
To: Jared Kangas <jkangas@redhat.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, tjmercier@google.com, christian.koenig@amd.com, 
	mripard@kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 12:19=E2=80=AFPM Jared Kangas <jkangas@redhat.com> =
wrote:
>
> Prepare for the introduction of a fixed-name CMA heap by replacing the
> unused void pointer parameter in __add_cma_heap() with the heap name.
>
> Signed-off-by: Jared Kangas <jkangas@redhat.com>

Thanks so much for taking this effort on. Looks good to me!

Acked-by: John Stultz <jstultz@google.com>

