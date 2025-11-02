Return-Path: <linux-media+bounces-46153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E364C2947E
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 19:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45719188DBA9
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 18:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7CB247284;
	Sun,  2 Nov 2025 18:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmK2eDp5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5796B242D89;
	Sun,  2 Nov 2025 18:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762106789; cv=none; b=ZC2W9Cn4DgSvn4RRiUa9B0vmBbTGcpRhPY/OlYPqkw7DT0jEPcpKptR3uyVfq/y2orFTmAsSklx5R425fbglzMNMo52z1iqtyfeb63GzKXoJKT97URQRKqsnS4FCOJvohB2SgWuvHAemy0m4zNvihV7x0WTBDCqGMFE/eKQb0Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762106789; c=relaxed/simple;
	bh=1TZCJUeBLO0U3mUpxJExSj5MN2qI544N6AtRMAL1BhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oPI/GC6aaXP7FwuqWcloYExQKa7HdtHc1yXz0QHO2mZlW9AGVRBdy46kOHwoNKc2JkhurY1zETGb2Ed1CyxT++5UUdM5BYVYduj9ML4za1AZgAvyQ4tem7ao2Pkxl0vvkWrRjQNmKmAC/1jdwWS9laBQgAwavk4Cr7MNSE4Xk7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmK2eDp5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2ECC16AAE;
	Sun,  2 Nov 2025 18:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762106789;
	bh=1TZCJUeBLO0U3mUpxJExSj5MN2qI544N6AtRMAL1BhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PmK2eDp5qDZ+HzrTp2U8qpX9kwo1nqvW4/0vR96ND6Z2e3oIsTrPAyUT5wEy7H0vV
	 KjTRIYO/qOlj67VPsSZzPIapvEQKNtYTzwL7o4IueG1iVju7vqxmhAjDMdwN8B6E+K
	 Z8uFyc2sLXp3hgxLFn34l7N9nhrlh12+xelZ00jyaHI3H7PT9wSj0UHH4F/bctXLIt
	 CbQCcvRIvFNcdeZkKpX2M7L9MC0zYGS5/Vsekb2ReFet4z182lhGr2trgPvCO+5f26
	 ZIdKyQG1yaVYpVWs9/3veg5AZNUJsWr0tZPdExfoYXqHk2p8U747yrH98bjgKhqF0a
	 lus8xqxZ9+YOw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bryan O'Donoghue <bod@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/4] Add support for Dongwoon Anatech DW9800K driver
Date: Sun,  2 Nov 2025 12:09:46 -0600
Message-ID: <176210698645.937813.2707440531629000949.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016-dw9800-driver-v3-0-d7058f72ead4@fairphone.com>
References: <20251016-dw9800-driver-v3-0-d7058f72ead4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 16 Oct 2025 13:35:21 +0200, Griffin Kroah-Hartman wrote:
> Add devicetree bindings and driver support for the DW9800K VCM driver.
> 
> The driver code is added to the preexistent dw9719 driver, which has
> similar functions and method order, but different register sets.
> 
> 

Applied, thanks!

[3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI pull-up
      commit: 6678d5cf48deee17b903aed72f2e20924fe016d9
[4/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add UW cam actuator
      commit: 1cf6be79a865a15ac34c6dacc16205304bccfab1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

