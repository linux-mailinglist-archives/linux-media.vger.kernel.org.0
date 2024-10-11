Return-Path: <linux-media+bounces-19438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CF76299A6E9
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 16:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D2A6B26526
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 14:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BBF194A6B;
	Fri, 11 Oct 2024 14:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FegWE1Y0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6CB405FB;
	Fri, 11 Oct 2024 14:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728658249; cv=none; b=RlBUJ2J4TWphpq9avNNCyJuPgbrfjACTbmh0OP7Lqc3iPQCCI5iDSEiDaNVQmTroSumr4kO43X+ZclDOaHU4Cy2bVKG1+V7di2AJcvFDtCI+MYfHW9WLCG8hVUegQCPUa2kLabiU4whdoUvOw1TDnm06vtteEK2iKVhvg+XeFAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728658249; c=relaxed/simple;
	bh=Rd0bpW7n9rloY5/RNhAxsX5ICdfK6l/7T8T/9yvyw1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApzuU4ItFEwJezFItiLK08SQQOoF9MmLsCJPIznt8rn9QWfAJsl0fC6J05V5t6z6VPdZIOHFdXRZCfhXlsijpToXs/nyir2NH4IumvN/kDS4pIGVERpj9Q2xENoZRdYqppBG9vedu3dXnHuveocKpMWDLdyyaVhfKu6dvNarTYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FegWE1Y0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC66C4CEC3;
	Fri, 11 Oct 2024 14:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728658249;
	bh=Rd0bpW7n9rloY5/RNhAxsX5ICdfK6l/7T8T/9yvyw1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FegWE1Y0YvZAdTbVxZV+pKGeJOBvvYAOhxF4pv1P8O3LitC0WbcuBmu7+2xZCTvNy
	 DRyBsenH3h8uQelzeApYDwwyuJiD0Sg7NEAYj/qHae96380V2Q2tacyzJIB9dQdE3o
	 uDFYZbkuoupnHn8MXBpVPhb6vWL8L6ft5msbLCrR0TvGJg4ONZalBqE0BFbUe3iKcC
	 CztoQLx5y+h0t3kSYRYvJSvP6W5hnpk+3DD+X883XvNMWKQbfe4+Uc6UjRsjk72btF
	 ak6vz2d7zePYosNLZaerzNR/szd3xLEUQWIL9G85OOxsTxs6bI3GJ0SDijkafDm9W3
	 6dCAynMlf2Ujw==
Date: Fri, 11 Oct 2024 16:50:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org, 
	konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, 
	catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v3 2/8] media: dt-bindings: Add
 qcs6490-rb3gen2-vision-mezzanine
Message-ID: <pieqvo3t6mzghrisaikfyiqflam7acpi63rwwqvz6aqdofu6wl@p453fy4x5nvj>
References: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
 <20241011140932.1744124-3-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011140932.1744124-3-quic_vikramsa@quicinc.com>

On Fri, Oct 11, 2024 at 07:39:26PM +0530, Vikram Sharma wrote:
> The qcs6490-rb3gen2-vision-mezzanine is a mezz on top of the
> qcs6490-rb3gen2 core kit. The vision mezzanine includes the
> IMX577 camera sensor.
> 

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Best regards,
Krzysztof


