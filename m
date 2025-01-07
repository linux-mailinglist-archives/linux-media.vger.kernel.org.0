Return-Path: <linux-media+bounces-24353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A72DA046A1
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 17:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F6543A3987
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 16:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52141F12E9;
	Tue,  7 Jan 2025 16:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAGlS6N6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB5A1F667C;
	Tue,  7 Jan 2025 16:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267951; cv=none; b=B4wd6IDyI4c1mydCRGe0vNe02CbARCsMD5+E8Zd5fwM8iTHfChBTH9fAvpl1kS1sjOT2GDoAk389hMWfHX4AZU8X63l9ScZmoQ31hF8RReexbNYXEZPxPX4DyjI76w/tCC8uWIF4l8w45Gw7ybqCtx8/FfKaeBLztIciAlnvRjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267951; c=relaxed/simple;
	bh=+y5VPCQSZ3iOvbjUez9JjjnUBGmWE7u4QVulhWXo08A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DBlw3Lbs9lxQGvJDj7gi+tEN/DFpi6TsyS+7NDAZ6QbAij1DGu9R/4DK0+uaY5yUiy+714OuNVblbVLADt5M8LmJL+dQlFjDkFrN1jG/7WUbSURX0U78ZiwjwC+o2AZEuXylR4XdEzZ8kBBzsR8Z4hqmZn6nLepsi6XBBmbj6bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAGlS6N6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FED2C4CEE3;
	Tue,  7 Jan 2025 16:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267950;
	bh=+y5VPCQSZ3iOvbjUez9JjjnUBGmWE7u4QVulhWXo08A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MAGlS6N63wTdoEa4UI0+E8DzcXED0f0jAzvpMILZj/ohyOJxISyY9OvtAXTfuRzXz
	 knT1ewvzmZcmzzAKZ61W0LnBwhyJHfKEivYg9wX/bwnQShwiYyJof4PsfSzshg1qNk
	 JtMHHb+hc0xDCQp+Wx+Fk6Z/yXG5gAb9rNzEPbqLsp17HltxLQDsgqIXiuk2E9DtFz
	 /8haXx6PP/Wm/pENFMGjU+LAyBhFssdZ7B1vgKSDnVk0MU3xFt9i4gJUb7Ad/E59NI
	 BbDiPOl+4L227fJfQIeGAEsupMj5b9zXRKeI0EuUamcbA3mZJjvPgrld3zNkAPf1y9
	 CqZtiUE6xF/OA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: (subset) [PATCH v9 0/5] Add SDM670 camera subsystem
Date: Tue,  7 Jan 2025 10:38:41 -0600
Message-ID: <173626793403.69400.10932700285706894647.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218231729.270137-7-mailingradian@gmail.com>
References: <20241218231729.270137-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 18 Dec 2024 18:17:30 -0500, Richard Acayan wrote:
> This adds support for the camera subsystem on the Snapdragon 670.
> 
> Changes since v8 (20241216223019.70155-8-mailingradian@gmail.com):
> - revert clocks before interrupts change from v8 (3/5, 5/5)
> - pre-declare endpoint nodes in dtsi (5/5)
> - rename camss node to isp@acb3000 (2/5, 5/5)
> - add Reviewed-by from Krzysztof for camss dt-bindings patch (2/5)
> - add Reviewed-by from Vladimir for camss dtsi patch (5/5)
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: clock: qcom,sdm845-camcc: add sdm670 compatible
      commit: bf6aa2d6935cc86b5eee67cdb8edef53fb6374cd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

