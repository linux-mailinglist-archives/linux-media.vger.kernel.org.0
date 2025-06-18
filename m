Return-Path: <linux-media+bounces-35122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31599ADE22E
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 06:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D59C01799A2
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 04:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028C721C185;
	Wed, 18 Jun 2025 04:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qRX2V2EL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CE91EFFB7;
	Wed, 18 Jun 2025 04:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219786; cv=none; b=uMpcbI7dBlA1tyOY8zncVdaaJs3slc6e4q0JjvY7vfFL56yRhjkMjctpKQoSpaHrThnHxn3ZtgMe9WW3EiHr2hTHgEwrWBWUIaRJHN9jWJxFQnTBMgE9ycAlq7s4/UIgaP/saFQ0J7fl7y8FkZxZULe3u5t6pDCcvDCZ26xF2z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219786; c=relaxed/simple;
	bh=kSJ3WGKfs41bcRFEt1n/CSZLqzjyO3aMDkpb3PL+vnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UXExEyZabyzqoZ/lnGH4jK88A67IGjBwqmqMDp0IQ8fanZcov0aREAJfp3XrK739j/SQUYtnxpazcczQD+t1KCxwo2vvePaCHwrdwRa04fZpljUPisL2sElfiIMeRKeoHTf43mwa0swrn8xqUZjJDpdYNHXT9IU2/JLE9YAK4i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qRX2V2EL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6284C4CEE7;
	Wed, 18 Jun 2025 04:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750219785;
	bh=kSJ3WGKfs41bcRFEt1n/CSZLqzjyO3aMDkpb3PL+vnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qRX2V2ELljuJ72tQWdDb9IiTz06g5hV2GDm0iGUN+auqIjqQDnGopBM189VzDbDwQ
	 QG5h3CzIfFvZWfuYRv4GPtuORo1cNBrlJOarR1mSScZlUUbVfuEt24WB6xWmERzbDE
	 veosD9W7jAK7SxzTURd0MwSC84SCnziz1bYbg7vSDeyX78feHQigEs41n/tPyYdmQS
	 qdzgLfPsMdXkcDcBcnlFLOBEJSG5l6yaH/R9pzuxZZKbrgmT2rTER++zqQZlUfb4J7
	 jQfbY4muHRCXh+3ANKR2ZPA28NY0rNnQwL1D9BtsiqaQ+mdoW2ngI4W2xWg/z/QERq
	 L2ocw2qky5lzQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/3] media: qcom: iris: add support for SA8775P
Date: Tue, 17 Jun 2025 23:09:27 -0500
Message-ID: <175021976639.732077.15682101947623278875.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421-dtbinding-v5-0-363c1c05bc80@quicinc.com>
References: <20250421-dtbinding-v5-0-363c1c05bc80@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 21 Apr 2025 20:16:54 +0530, Vikash Garodia wrote:
> add support for video hardware acceleration on SA8775P platform.
> 
> 

Applied, thanks!

[2/3] arm64: dts: qcom: sa8775p: add support for video node
      commit: 7bc95052c64f45c24affbb7636489dc9a1c2a982
[3/3] arm64: dts: qcom: sa8775p-ride: enable video
      commit: d33ad6600453fbcf6a9275864ad120079bd540da

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

