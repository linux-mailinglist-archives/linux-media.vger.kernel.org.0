Return-Path: <linux-media+bounces-34569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F4CAD6695
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 06:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 733893A7A49
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 04:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A8F238C07;
	Thu, 12 Jun 2025 04:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FqIetFeC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C9F23315A;
	Thu, 12 Jun 2025 04:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700873; cv=none; b=YWQlm687dVHFPKlRBCHpP/2ac3TyWXyTjILQ+4xyREL7tmYC8tOoEZ1kc+gvRn6BYuJLT7dPa1CWn09LlsicwnrSWO0bw19itwVuUc+w4T94QmLq9eLvKe44KJnSJffUNc3/FygWCuLDYlf+LDx63UfrbRNprlCoFewF7B7zXO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700873; c=relaxed/simple;
	bh=MksUImPZA979XdX5UwujVDcIaositjUOeT0Z3M6VUMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LXQKJOGvxd8vUk3Immz10G1SaOKpUtHnz27SZFGBf6dLnSq7vzH5HCfMdprJEmZ1EHhWfrL3nvDE4sZT/L8RBszQ75iXV0hO1fHypOiOF7CzsDxb1gu/mNpwjZPitcYoPyyhS1KWCBhpqtAISkhanSMWfvuIlk87vB5pFIO4ELA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FqIetFeC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48E9C4CEF1;
	Thu, 12 Jun 2025 04:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700871;
	bh=MksUImPZA979XdX5UwujVDcIaositjUOeT0Z3M6VUMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FqIetFeCberubPDGlGZJA/IEYWGPz5EtC9DqmZ36bb/EOhWURSgCETLv+7SCbBJDp
	 2Qm9hGDNEccZO4u+14cghaQRYf5X0iPv4P1GEuKLjStL9XHo5Oj/vWWZxSiovLEOTg
	 I3IELBqahNaYi+edMH7Aqr8bLJm/kv6lY0bMjtJq48BAqiTedujrNWME0vCeA/lMXy
	 sye+f8wTn9Qv1qhZkPwwDdtWqkJagb9jm+3zbFBBV/O5krC0oZTXSU15xkiY3NZ/YD
	 pXm1hkF3UH2nJ+KvbA1cdmiREidWkTZTsOlz9DNnvRy4Yc5zX/0P9Ox6jroJ4KkKjX
	 gDDeIL12rsseQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v7 0/5] media: qcom: iris: add support for QCS8300
Date: Wed, 11 Jun 2025 23:00:50 -0500
Message-ID: <174970084194.547582.4302512086798820865.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250501-qcs8300_iris-v7-0-b229d5347990@quicinc.com>
References: <20250501-qcs8300_iris-v7-0-b229d5347990@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 01 May 2025 02:16:46 +0530, Vikash Garodia wrote:
> add support for video hardware acceleration on QCS8300 platform.
> 
> This series depends on
> https://lore.kernel.org/all/20250417-topic-sm8x50-iris-v10-v7-1-f020cb1d0e98@linaro.org/
> 
> 

Applied, thanks!

[4/5] arm64: dts: qcom: qcs8300: add video node
      commit: bf6ec39c3f36d5f65335e68f756b639e872869ce
[5/5] arm64: dts: qcom: qcs8300-ride: enable video
      commit: f981efd411d260794f3d24bdc7f26cb6200e21f3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

