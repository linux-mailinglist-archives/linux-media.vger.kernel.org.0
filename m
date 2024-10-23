Return-Path: <linux-media+bounces-20064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D148A9ABCD9
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 06:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BE3B1C22CAD
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 04:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DED156F3B;
	Wed, 23 Oct 2024 04:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGa9Z2sa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF54E15687C;
	Wed, 23 Oct 2024 04:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656987; cv=none; b=VCSpex5DZW9RiHhiMp+oipfZ6rbdcsq+eS2d+tS8sLBP9eSfpj6JF+6cNsFTFTBUbsuE0d0XxVlh3+4gipX+YFFP7kG01HDYJ5tWAjHtHi67HlnlSk4h62u2Wq44SJgdjH9I3PFky/WtgHEZ0aCVv0JstEGxwiSl18WxTKsLNLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656987; c=relaxed/simple;
	bh=QvJhyhGAH48Vsp5JZ+z8SGfd37iEk/ar0t90u0rj0bE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N/ZJ+NQiprXDQHxCbJHuAX3sCc6tBP8nHWK1AiQqVqDugrZ1ZXRaGXs+SzLI4ajjvl5qLA2BN3HPhugu5Jk5aqrEVOg6tH0B22npeK+qQmCEVTKxbH2hFU3Ki8eX3JyXieNScZANT8ePT/nicuUfXSKqTwuPQcy5Ry+bTO2d4lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGa9Z2sa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446EEC4CEEC;
	Wed, 23 Oct 2024 04:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656986;
	bh=QvJhyhGAH48Vsp5JZ+z8SGfd37iEk/ar0t90u0rj0bE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kGa9Z2sa1F9ww860SLMVAvRZyxIDSvz8D+dpOjQ+Szl7G3O25jDg2quCbHIWKt6AD
	 567Szo5hkm3rQkzKyHxDu1XB+vg/yghA4ilNR/cpvfem1dUyhNTB7U9JVhIcIYx8vs
	 hIs0CwIb/sjJ1VWX+7veFB49a6FxDM0L+QAh88C+rjfGm23Is9moj7QeNAzSJfJf1G
	 bU5DzvPbgHltgjOQ+E1LbhPoliXrN6Gps/eTDayasVXryh5wpw5tps3XRnE+tkCKr9
	 YzEksIWNQAjli5ckKzNH9mXY4xwNRutKNbGFiUCSdg4inwe0CQcfw5v4SxBlwqj9qG
	 bMaFw1zQtdjAg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	agross@kernel.org,
	Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	quic_vgarodia@quicinc.com,
	stanimir.k.varbanov@gmail.com,
	kvalo@kernel.org,
	quic_jjohnson@quicinc.com,
	ath11k@lists.infradead.org,
	dmitry.baryshkov@linaro.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v7] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Date: Tue, 22 Oct 2024 23:16:02 -0500
Message-ID: <172965696403.224417.11055570024633295493.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241011041939.2916179-1-quic_miaoqing@quicinc.com>
References: <20241011041939.2916179-1-quic_miaoqing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 11 Oct 2024 12:19:39 +0800, Miaoqing Pan wrote:
> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
      commit: 7b3e9ac60da7db51394889f8bf92d26b57845f4e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

