Return-Path: <linux-media+bounces-17755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEFE96F188
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 12:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 577571C20FE5
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 10:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E57E1C9EB6;
	Fri,  6 Sep 2024 10:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtXubLW2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CFA13AD2F;
	Fri,  6 Sep 2024 10:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725618721; cv=none; b=NlCLKng5JXaqBo25LYUrgeo+nhZcIiixU5/KiORSCHH0LE6ntY+c8BR3N6B9g6GyPXDHXVv9W4StWyKBsFemXAPyVlp8XZf+WBASN6TLDNmB6jyos9y3UsdGJY3nB3AvuyuXxID7y11fwdZrJin2T8+M2q1Ioq8QRejHeP8IrNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725618721; c=relaxed/simple;
	bh=3Stpd3s8niKl8JIeCH9GDcE6lKHFmxTeJhJWz/2nSyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdEF5Mofr1wltho/Y20oGaax+KEMLOhDdzRxsHBF2lJUB3EEw+j+aRozKLlARIqu0Py6N9N5I2f/7UAg69DyHhhWYy4qfXuf4esZJjRNF98PPE7m9ScorrmIiehmSGh9VvLwK3kPiL5LHImjeJmLFF5+gr5LeQiW/8R28izAamE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtXubLW2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D50C4CEC4;
	Fri,  6 Sep 2024 10:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725618720;
	bh=3Stpd3s8niKl8JIeCH9GDcE6lKHFmxTeJhJWz/2nSyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QtXubLW2MAbKVrWdGsR06hHTLXPRFBnxNJGuiMOf4ya/9VCFTqky8JSTRRQ/vmVT3
	 TW9dJhfo0OF31oW8sb+nXn+CUR5LfmHzQR70YXxXJnXbD4lvGQj9vOLWwyBnbSyLip
	 ZvYQxkcvrcb1uQKVtv1K2vlY/oIe9zdi9Mj6Cz8QPU5L1WIr37yie0sZUlMYUlScwG
	 nO2p6XBHqTLAtSyYBRC3x0NNSRr5PATgVxarOMM2wSEp0bWCr59oFfk23FLRevTtt1
	 mAy2XKcAV2Z1MgdYaxpnOZ8HJCXrgR5zRdGZXbogSZxjk8cbqcNpCYWtoU/uz+PhV5
	 KzesK5gtHXaVg==
Date: Fri, 6 Sep 2024 12:31:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] media: dt-bindings: media: qcom,sc8280xp-camss: Fix
 interrupt types
Message-ID: <run5ffs6udya6a2opphkt2chenjgelnlmnjtyeyulinpuxacmn@im72ytiz33q3>
References: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
 <20240905164142.3475873-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240905164142.3475873-2-vladimir.zapolskiy@linaro.org>

On Thu, Sep 05, 2024 at 07:41:37PM +0300, Vladimir Zapolskiy wrote:
> The expected type of all CAMSS interrupts is edge rising, fix it in
> the documented example from CAMSS device tree bindings for sc8280xp.

Subject: drop duplicated media. One media is enough (the first).

Best regards,
Krzysztof


