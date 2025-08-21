Return-Path: <linux-media+bounces-40568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE83B2F7F6
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32C901C81FF6
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA2F30EF6B;
	Thu, 21 Aug 2025 12:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dt47RlAC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655B91DB34C
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 12:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755779349; cv=none; b=dTfBgO4ppW4lXoj58kzD28Bu4dhypJJGzcZgi5dgIwCbJaQqelAbwKkEMv8aiRhaYGdtjQUPuVwmtzIs6s6WFVH651c8Dsr3BcR6E3pRqZf766cUM9C0PiHQf3OCvpP55mf1KRhR1hEgGN/9mB+eZcqMDsHwfwcfsLHCejPm5yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755779349; c=relaxed/simple;
	bh=ipyvJjqvXQZXiCECZcXAcXKFk38PARAX3ClkU4503z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJdkIqAm6dEVishTmx+UPhs3pYWJoIQRglusnBUgQ8d4fU+U4u+jI+Kdl42BJunp2+ypRR7hwwwxNylW+L/QF4Jwm6ZkqoCeHDXgx5UszmPv1N/sIryoojYeLVWkrSDMlVGrS3PXSlTLZYSnPf9K8aIr+jKiRo4m27rDzVm7cp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dt47RlAC; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b05ac1eso5432235e9.1
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 05:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755779346; x=1756384146; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uk+Gw1wsKmJ7CUTVerhhurDygK4Wa2zZgqD1NupOrg8=;
        b=dt47RlACZaACMEuspGRIAm0S+AhxBX+t7/xkvF7apLxB25qoDhgK5a3dIXw2g3AZqG
         ACdCiteUf/nc4jPe7RCqJjtA+4IENyFT3zvzmmuN1+n/EhdIBEHUVXUPHLx0zFH9Rfbv
         0E9EUqmiRVMnW5hQBUUSy8uEeiKMdUwY/2og8EhfBmdkSP0WFWjY+3LcCPpNdLkfWdsO
         Xs8hjmlnc+cH72q800mHkUfxLxWnu3DDySk5hMvgwfoJTp+1DMgCQyilyZtKNsgrCXGe
         j7hiRm6Ze5OgdpKS2kB7+FULaIsm3Mof1UvZBTSJGmQ9K0xv9MW6LBRB4vpFGKgQ7yvm
         M5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755779346; x=1756384146;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uk+Gw1wsKmJ7CUTVerhhurDygK4Wa2zZgqD1NupOrg8=;
        b=ZwhgrcYwiyNCslBYkEd+acxU3xkINnYWzX6aNt+hWl5e8ADu54EmiNPGcvxaHrHhjY
         7UdLddQjcNivMysrp+rX4unur/cVukdIhxgtFVAeFhIpuLPVHJwMjnTZrddeYXYk3Oln
         PVJ5PCrv7dtJRcPLb74D6dl9W1gcRsWN8N+5bxf0UYeSliKcoNllBKWy1tWkvgyyZ/zY
         TWZ5raWVv9V8ZxUMg6njLpDubHfOhYRh+ZjWXMQ9xV01UoYWS1hYZc2Au+vcFwnQ0Hf/
         tpmSCpinVG++zUnNOzmxTUwnk551weYhXiz2mkfaHeZgrZPFj1AvWmw65bdPbDQVGyPM
         DNcg==
X-Forwarded-Encrypted: i=1; AJvYcCXytr4Zd5a83Hh7lYoCSGJr0S6qSn7HC8R+NPgzAXKG78GAlzZbxfNmHCZ5FLvwR/TJ2N86n4vXpIMX7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4jhhXo3kIVPdDurJ2t2lxubhxKkZa8GvDPP8Noj0svrNvL5xW
	ulah/yydG09gRgTtoitc8nEkh4Mq7b6r/z6e0wGTXScLa5Cw0sQd59031ghZjvP8+0Q=
X-Gm-Gg: ASbGncsQ5P6ESk0S6Xo9TtjPIevr0rlOwWjGQrInjuSV+V1yTd5H5A4GS1kgxjezJ0Z
	3vCJFkxDCLdnCw5iw9mC7/UonHvzYaXmtxJciCJl45MaXadcTwVh5QWfSG+l7e6Hcjb9OgODP7O
	y8zVYacbTayuUGC7awGFR/ZANroY6KV53Pv94sJnaBs1o2S6fj11oKx3UqM2CpCZKSJrQclT6IE
	8VKkLQoUej+v8h5GovyFHqF4CcIq8kfpvJ4pY9lri6KSRB0pLVeKSagxCnxrKbArr/xVsg9ZxPj
	xYnGL+7p3Bwh1hghFYZXgOTZ7FJag0QVkfyTeDwoCbwy5AOUeajr+BMLLx0PDqmE/7Huze7S2rt
	Oy0eo5jGulpkvFISjUy3IAjBIXupiOCVbmb5qRA==
X-Google-Smtp-Source: AGHT+IGJrYKPC9BNmSR70F39FVaCXjHhbs3ESqGZ+t90Sf0UFy3gTnptWt8uEhlEoOhqqmoO/zvgsA==
X-Received: by 2002:a05:600c:4743:b0:459:d6a6:77c with SMTP id 5b1f17b1804b1-45b4d85db41mr19889845e9.33.1755779345665;
        Thu, 21 Aug 2025 05:29:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4dc25b04sm26193375e9.22.2025.08.21.05.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 05:29:05 -0700 (PDT)
Date: Thu, 21 Aug 2025 15:29:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/3] staging: media: atomisp: Remove unnecessary
 inline declaration in gdc.c
Message-ID: <aKcRDWlRQ1gughvQ@stanley.mountain>
References: <20250821070130.2581766-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821070130.2581766-1-abarnas@google.com>

On Thu, Aug 21, 2025 at 07:01:28AM +0000, Adrian Barnaś wrote:
> Get rid of gdc_reg_store() forward declaration because it brings no value

The subject should say "forward" instead of "inline".  Also add a period
to the end of your sentences.

regards,
dan carpenter


