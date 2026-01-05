Return-Path: <linux-media+bounces-49946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DE1CF5550
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 20:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A558B300EE51
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 19:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BEF3451CD;
	Mon,  5 Jan 2026 19:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mt6TBbDv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056713112B4;
	Mon,  5 Jan 2026 19:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767640601; cv=none; b=esOvd9HO6uwCd6vM8QnA+ol0JzTAch+0JUcryyTiC6ATR9bvZhhH98GGLzs5HW7SlIIQGse3M+7kdGThG462HDd4X7v8EcC3jHqDYePLmnPTstUDhvBymdGKtTQrBIuqUwZPNDkdfmGG/HJ9gY6mwJGk/aLpYX0IAWVRakcBggE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767640601; c=relaxed/simple;
	bh=+ius9zQo9Q9QI7YzArmNKIVZiGB4iJha+FfrhltYWEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t/Vd9+5TCa2l+5nKKed3HcgPXCqkLTD++Jb1IrQmBNg90Zoy1xRRj5ol6sMP2m5N8Bp5Rs1gBFpRoK7JUbLVNhvBpuvhlRDs1BG1iOEWLMhNrnY7PvqsoYKS2iiNPC1JJsuqJQhcaGgvtLkLbi0KASHtu4n2sR3XlmoV3Nw+iO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mt6TBbDv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47203C116D0;
	Mon,  5 Jan 2026 19:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767640600;
	bh=+ius9zQo9Q9QI7YzArmNKIVZiGB4iJha+FfrhltYWEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mt6TBbDvYj98Ndc4pMoDVLu/oUfPNrlt8cnJYbAVLV0Y+Yn8GlcUGz59WjcoMLLgg
	 RHt58PTXGJxVpr7h4eqaYOaGxLke/hzvytoWBPoHuazcla39ojQ/69lV7w80mJiuZO
	 G48Tkp0R1YAJ//QEF7e4M6MwpxXAKxXkty9ykGAGkklgDpU37YyoYOTri7lkb1y7l1
	 L6NvF7IxHWj3itahe3K7bMbOFfrU8HWkG/jmdQT/3ImMFnZDswNx0id79/Jdi2rYE3
	 MjaKMwi7tCaUuU92w9DpWof4FhLoSEctD5BDb88KM80Zx8gHh3oh+HUNscy5LMjBKD
	 d1itd1+txJrCw==
From: Bjorn Andersson <andersson@kernel.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v9] arm64: dts: qcom: msm8939: Add camss and cci
Date: Mon,  5 Jan 2026 13:16:20 -0600
Message-ID: <176764058405.2961867.13783282805903485831.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104-camss-8x39-vbif-v9-1-0d47c7afbb2f@apitzsch.eu>
References: <20260104-camss-8x39-vbif-v9-1-0d47c7afbb2f@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 04 Jan 2026 19:31:53 +0100, André Apitzsch wrote:
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 615.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8939: Add camss and cci
      commit: a502697b840d8377742e1f31000cb52695df33e7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

