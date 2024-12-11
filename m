Return-Path: <linux-media+bounces-23178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C759EC89D
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 10:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 652DC280DF3
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 09:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850B4207A18;
	Wed, 11 Dec 2024 09:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vymOPRtk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DB01FF1CA
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733908500; cv=none; b=lBOIlnADUsMU32X6v8nvVfIqT0TEO86QeuJjoacQ6haq9UpTlr8AycZzou+Psam/MFb0XLasgGOwErvAnTL0n1vH3VYFoZfADFTUSFpZ+t5PKGxXfMa0U3CwDFfHc83FLJUUeE7cYkAuUwxsIbBUFbprIR7/L93T7db8Py9xwqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733908500; c=relaxed/simple;
	bh=JUXrxkRS6ra3CHJ9SyF7bUw/4jbQj+KL0Fb1Fh2MyHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7vxLV0mltNNPxvny4/dKQniRF7oN5nG9yeX/40RLHjlLQbNffaIyKSb0JzlmaSlcwVmCmmsyPt1cl8iRKFI08WVibc2wudjyup0OTFVwPSlr87Hd2cemzz+KzBYi9VpuNwss7wDE31YIx8RqII6MnTi6IVucP3rkGy/Iy/ruiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vymOPRtk; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so4314279f8f.1
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 01:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733908497; x=1734513297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6FDO3wL3i1XscIg74LPG2N/BXo43Ca59PIHDAIDDUjg=;
        b=vymOPRtkPVD6OqtxNN3Zn78DuUPGf0D2EtPIVzre4dUGjBcy72cxW+ZKSHV9Uh8NWy
         L+XdJKYILHL2gZ2nItX9wAJX0DeDjSg1ZjXi777nGzj7YWMBE0jvKlIaUwet6VyZUxtw
         QNxJ0CfcHrvC8MEZ2mGb7sx9ZXQqix2buzRBYdfhLEX76dVWIIzfLU4v0AUXUmFoTTwV
         Dy61krov4I8gSzSXaSKRhFqA9nQLxYbJ1fRWV2TAGqvLm9QDPBXcoOvZE3xC1cgHqhHe
         ub1KvME6gyPg5rEe/pnxTaIFo+JKSEpujW2gEtBYZw7JMYz93jvG+/Hvxdw07gBNpXBi
         Dghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733908497; x=1734513297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FDO3wL3i1XscIg74LPG2N/BXo43Ca59PIHDAIDDUjg=;
        b=TDCjbwwQcv+A0Mzz9NKzlIulvAJlZuOK8L/fQGKy0mDmLYC0KlnHS1Bq6YBQQdT+ub
         qkgZNEwKra/HpzEdQHnWt4MEDeUKCpOiQOFaG4w9DdWH2kvPqy5dJGVPhBmhHqYEiTKT
         LAwKHm08xy2F1XTsx9qRwZC669E9cQEcbR8IJNOlFYVvjSCSgt4rmDtP9OiKSef62+D2
         Nnxuzrst16jSm1C06Q9L1PK/0hXjLXrXfwciP1BtT5YkKz/IvtrIV3Gqsfn/j3UfcX4y
         SdIMy59pZtpMNG3X3BWWeOMbioxWRqSB29tI8c7tNVsvOfL8ibbh6Hh29WbEhrHDJyvi
         2ufw==
X-Forwarded-Encrypted: i=1; AJvYcCVRQMO5zZHMTCWv+Knt5KnsIxmlPsn8pTuIZjHPEgnABTiCCbYlvg2gQ+WwPOt/+LhN7Br16us5XiYE/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzsH/auO32fmpbEdmxu7PqYJB33bc1XvkHSgcSK990xLHtlLMC
	y/seXDeB8vmrYaz5d5CRV1akCvfYGlLkKH3i4SC1+B72zqgT8jUJ+/4pwllBH8o=
X-Gm-Gg: ASbGnctUYGeLsixFBpatbCdeodXBs1td8TU1+Kv8hAINq8XiZmG50hBXubHNPicVjNE
	yhvCUTYvav38Hb0s5U2W1a76LOFeHGxxbq4HqavX/dcsgnVH1yzo74hQBCdy3Gq2SlK+dRkSP2H
	QHgdXVOJbaAMFEjEP5RGfG84GtE9WlC3H8NochJIpNKoapG/mRnYKmCGmnxxNphHEbBu32NP1jj
	9PxhM2XTQlZ02zyOcgsreqE9ywK3WIR4LX2ZIAjwaWF10bchRhBgqlgidQ=
X-Google-Smtp-Source: AGHT+IHOLK/ljbtyNYazbMd4hvX84Qm4ErHQ/BEuJGZ5dGRRjqOpg37GnjWdhZty1q73L7x1DOcRRA==
X-Received: by 2002:a05:6000:178e:b0:386:3702:d2d8 with SMTP id ffacd0b85a97d-3864ced69c8mr1574947f8f.58.1733908496679;
        Wed, 11 Dec 2024 01:14:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514dd9sm803351f8f.69.2024.12.11.01.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 01:14:56 -0800 (PST)
Date: Wed, 11 Dec 2024 12:14:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v3 7/7] media: ipu-bridge: Remove unneeded conditional
 compilations
Message-ID: <a91a3993-6c81-4abc-8609-8f41804fdf62@stanley.mountain>
References: <20241210-fix-ipu-v3-0-00e409c84a6c@chromium.org>
 <20241210-fix-ipu-v3-7-00e409c84a6c@chromium.org>
 <20241211091954.42a5c778@foz.lan>
 <Z1lOCGJvgFcqmR3R@kekkonen.localdomain>
 <CANiDSCvPNf2KiEpr6Tboon6bjUxwEkD=+_AQjhiOA7RDTTpnCw@mail.gmail.com>
 <20241211094854.407ddd54@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211094854.407ddd54@foz.lan>

On Wed, Dec 11, 2024 at 09:48:54AM +0100, Mauro Carvalho Chehab wrote:
> Yet, based on the title, enforced by its description:
> 
> 	> One of the quirks that we introduced to build with !ACPI && COMPILE_TEST
> 	> throws the following smatch warning:
> 	> drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented
> 
> I don't think it makes sense to c/c stable, as this is just a smatch
> warning, for a configuration that will never be used in production.

Yes.  Plus that check has a lot of false positives if you don't have the cross
function DB enabled.  I thought I had fixed it, but I still need to work on it
more.

regards,
dan carpenter


