Return-Path: <linux-media+bounces-35121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC14ADE21C
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 06:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35C6E1899076
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 04:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F335F217659;
	Wed, 18 Jun 2025 04:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhxSHpYX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4CF204C0C;
	Wed, 18 Jun 2025 04:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219779; cv=none; b=QnT0xWIxW6WRzI118GRjfUpTyfwfPytunl/8FkS0QoaCpxuMuswb63HYmge+fAaim7dhXMDHZYybYJxr3DWJoBA0me+6IbkdCoVPmC7XRYyTbHKSKWXK/WVefiX3lankLSNpTCVcG0n/XaUDSwD7bSazjYCc+ClgbygY6uIfNQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219779; c=relaxed/simple;
	bh=XbxKM+ILM9Br2Ciy5HdYz/SG+DUaI1tz/J4B54ztTk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lJLWt35bS4xe4pmozY551P6ekHpPsRMdyfCwJXARPqBGAzsIbLpaY4GRF9Wj+iOGz95cCNDfXiH9j4tjbalaE+xOf52+9nqud1kCMRGjpDFzHCNzY0+Z/KxuToMUdXxqZ5tChBdxBHHkVdoHi4lmo4cv3oodo2OhZXsdOQueD1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhxSHpYX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006F8C4CEEF;
	Wed, 18 Jun 2025 04:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750219778;
	bh=XbxKM+ILM9Br2Ciy5HdYz/SG+DUaI1tz/J4B54ztTk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QhxSHpYXWX/T5BZ5jjs7/Aqh2T5zWNoQlzemUOEA67HW74ovrKfbATmTsiXc38mKj
	 ycF+Y/FBdtfMTncxj+VuCwYv7vMJWQz9d+oc8E+decIRjrrlVMXc83XtuIeWwzaxDD
	 ae429wZcv0LAAyvzVLMK+bx/VEO50bNOyfwmHihdFMvPKoEpB7TRpX7qX8RQoMecAU
	 r1SPS/1+XU3S70gpmOS7mgEgrd7pha0Y6AGy4Ju4EbE+/FuHiVLByBAvKiI8m8ZIv7
	 /97W1ILcz6ONA4jxlwsoOMRRg5G4jpo6dnRcmkTyt16KDrTc0JelnDZ1ctQ8Sc6Fys
	 BeXcp4e3AK9Dg==
From: Bjorn Andersson <andersson@kernel.org>
To: bryan.odonoghue@linaro.org,
	rfoss@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: (subset) [PATCH v4 0/6] media: qcom: camss: Add qcm2290 support
Date: Tue, 17 Jun 2025 23:09:22 -0500
Message-ID: <175021976640.732077.17373726712302548417.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 23 Apr 2025 09:20:38 +0200, Loic Poulain wrote:
> The Qualcomm QCM2290 SoC camera subsystem features the spectra 340 with:
> - 2 x Thin Front End (TFE) - 3x RDI + 1x PIX per TFE
> - 2 x CSID
> - 2 x CSIPHY
> - 2 x TPG
> 
> Support for Pix Interface and TPGs is not part of this series.
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
      commit: 2b3aef30dd9dfd6cd2de3026126413a30028b850

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

