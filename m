Return-Path: <linux-media+bounces-25467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD91A23E20
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 14:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE49D3A529C
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 13:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766DE1C3BE9;
	Fri, 31 Jan 2025 13:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o2ekYfG9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D921C3C0F
	for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 13:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738328978; cv=none; b=lUDu7WfCaOSCWnD/LJ1yXF0RYBMqlDIKYqdYVo26K01D/D20YK2zbxnrTcb3mgw01te/I5AJZq8zl6bY1A0fkDZZ5lN3xUUfBmY7pcDjmkD4M2GM9VEfO8955Riil89yijKK223EPYX3o/aniGAVg7poB58BrIgJ3JNwocAQCug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738328978; c=relaxed/simple;
	bh=3pG2lOTXB63LELIdX7wJ+dxbCbVDRvaILFGCdMVkqJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QOYOR9Yn22g65pJDMXuZ4gqbj0qeLateR8UWxugRcFWDHHBT/GVgdiBYSm/bYXe2Ja+/IAzWY+RYvsRn+h2W6UFEj1/JyNcdkZIhntvQUEX9abJu1J6wkG3LisGhxA/5paff3x5I3SOXRYxD3zgDrXR5w1Abtj/DX9P/jbgtvxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o2ekYfG9; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53f757134cdso1965606e87.2
        for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 05:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738328975; x=1738933775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ilJofaI+jD2h//x50bz+rerCHryaBa9HkfCASwoHRM=;
        b=o2ekYfG9SLFwE9Z0ngbXhwFpEEaADdUYnhSkNFC7jaVXTZ9mWsx3zR3GiCRE6cp5vd
         KY+iPNLPbXuaFHwkFUeAVJi6ENd59PhjOfPK3nGCQs/vwgA38L3klS2iKq9UNgzEySFQ
         DIcydf4giR/8YranRGlio8dxNO/glsc5/utqOiBigXnDnJMvNlQ97+2KTVtCaPqhyZvh
         vvFiJJYw8ArVTL5q3dh564lkMceVZk1FM/CZTo+xMUJgXfethZxaLgH7JJmRjawjQ1jc
         0cCUNaj83G/hBgY7yJHQjiwIx4J/suStSADrnvpPISTjsUezfPWXh+CxghouR/aJXnLx
         vpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738328975; x=1738933775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ilJofaI+jD2h//x50bz+rerCHryaBa9HkfCASwoHRM=;
        b=dOcYatBSnFE8761ZDXxevQcyp5Y6SdoD7TLH1/hvLuUD98fyJ8SfzGkBvOwcJQ4Smc
         QXHxQ5LGvKLsxGsajUhARdzXQUyECKVv/egvuixgZQtzKfUTn7XZAN64jyIWEFgsyFFO
         hvnoDrERqi4g+xHBDYPqQ8nuDVKXACEsxe8wg0ZLkXYJ/JiXyorzcL7IL1o5BELgxwEl
         T6JnqUfNKcHBKc/ai18gntEzph2mc4gvyIcVaa0he+lYcJyd6FnfydxJcVN9bbH3OXeg
         itrXcT7RKwYkHfpn0a6fhxFOF2qNEi/Q0O9JTzQPBzkgIDStQZ/Au2kCkEbV3dzRdfPv
         wr0w==
X-Gm-Message-State: AOJu0YwZUl9F5fb+/nlq2aOnPySWAgYmObzIxGIxFykMLmknpMjPhzQ6
	uaYpi3kCCspVr6/FSezNdTYbO/bMOVGmdhD8g3zEBxYrs8l829Q0ZnQ3k5RUeA8bzxX4Ql3liSm
	xFKU=
X-Gm-Gg: ASbGnctVi5kV7LJduBxVlRyLRHCkvjJiIuydEweZ6gQrPsoay9i2apG8AgDqX6sqrOZ
	I6LMVDE/PVb6OrutT+X1HknVD5elhcBiealQMRV3l4oBsYi/72XsikqoY81jgnvsTxBD/2Zt7YJ
	I9AFLBblgdBNgNjuiXnLmXligVtyc6qLlfsxio3VdZvKZP84p+HNauEI/CS9qODL4Iy/eJ5ZSb8
	4ed7qdXT0yJK2GO7jJFQjovAVWzyNeByAzIvwc/QSfvhOJrGsJEr5R26k1OI+LlmHp58vtMtJ86
	0NKL0DRZ2NRioONOxh8dUKC01Jr0nxpxVhbWnudTLJf2v17BHVaZzzzKP3c=
X-Google-Smtp-Source: AGHT+IG/+GMx6g1W5tJ6RHEPx6kKDqXp5EIrmUMWkH1XrLaoko3F5JbTbkHk1lZfpv6wKm3f1EcviQ==
X-Received: by 2002:a05:6512:3ca4:b0:53d:f177:51c2 with SMTP id 2adb3069b0e04-543e4bd63bbmr3786512e87.11.1738328974760;
        Fri, 31 Jan 2025 05:09:34 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a30993adsm5719941fa.46.2025.01.31.05.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 05:09:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Farblos <farblos@vodafonemail.de>
Subject: Re: [PATCH] gpu: drm_dp_cec: fix broken CEC adapter properties check
Date: Fri, 31 Jan 2025 15:09:30 +0200
Message-ID: <173832895910.3304844.12852379411429746576.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <361bb03d-1691-4e23-84da-0861ead5dbdc@xs4all.nl>
References: <361bb03d-1691-4e23-84da-0861ead5dbdc@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 29 Jan 2025 10:51:48 +0100, Hans Verkuil wrote:
> If the hotplug detect of a display is low for longer than one second
> (configurable through drm_dp_cec_unregister_delay), then the CEC adapter
> is unregistered since we assume the display was disconnected. If the
> HPD went low for less than one second, then we check if the properties
> of the CEC adapter have changed, since that indicates that we actually
> switch to new hardware and we have to unregister the old CEC device and
> register a new one.
> 
> [...]

Applied to drm-misc-next-fixes, thanks!

[1/1] gpu: drm_dp_cec: fix broken CEC adapter properties check
      commit: 6daaae5ff7f3b23a2dacc9c387ff3d4f95b67cad

Best regards,
-- 
With best wishes
Dmitry


