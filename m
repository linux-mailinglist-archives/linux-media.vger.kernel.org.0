Return-Path: <linux-media+bounces-67029-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UzP7HYloTmqCMAIAu9opvQ
	(envelope-from <linux-media+bounces-67029-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:11:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC3D727CB3
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:11:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TBTJV9Td;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67029-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67029-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 726F030CE884
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C884C8FFC;
	Wed,  8 Jul 2026 14:57:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AAF4C6F16;
	Wed,  8 Jul 2026 14:57:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522636; cv=none; b=Pjjr/TNFgaBI+BUyo9NH/HtX2WSqpuCdm/dYwCAFj8Qfdmp7U+kAVKZkUAhL6FT4NHgYZkTbtPyHg0SetMViyqFVa2Qaw+EpwqVc7JjkVPbXB4DLAabz87pRO2dw4QjLtzwpx6S/LoUEGwZIyQu7q4lOgsOwIziiW9HCw9ZNQSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522636; c=relaxed/simple;
	bh=5yhOIY6EeIe2qy5Zt0ltoCyxQqu3Zj/XMFPY5RZ1drk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qfsYEBznf2geCnL03ejPcWSHLrr/MVP8M/WwqhT0M3/tiZQLnlxhVvGJKuPmtZUKiwnrz5NThIXK7pbiornVIWLGmWev6yyy5AXNav/v6elUeZWnNE26yzfUvrcdl00bDPB7CEmCg8mUkdQ25bEliJdgoxyxdzTJMe7vxUptxKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBTJV9Td; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD41E1F00AC4;
	Wed,  8 Jul 2026 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522634;
	bh=jtRoaleXHYtvwj3YsxcEm5vvvb5LD6sGb0KJPRIn6bE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TBTJV9TdKSBN4FD7dz27nYiA9jgvXMEJe2sV+GjyI/tj9X/9Zf8x45PxkhI+EX4Di
	 eHfWlzi7zlJ8j6+zKzDSF3s266lIH2rbPoO0oDYEnyMvSdRq+muBU7ncOwEtY2a49z
	 MF4Fsnd61cbAd9XY39CyHCaTBfekNrachdkTrjFhHtOqxIhS9pf/UqNuPNn1ihX8zW
	 4MWRgvz1LsQRkReF5z91PJSvT3MBxLPMzftwgybVJxRbkKFq+zScaBCVqhx1ZG5qe/
	 e+V1lpUygZxIndGWCR7D0X4J+nB/1t7p58xRe75VbBcRAIL9lwTBpAXukd18EeNe7l
	 gp0PTa+8CX3mg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/4] media: iris: bring up driver on SM6115-based platforms
Date: Wed,  8 Jul 2026 09:56:15 -0500
Message-ID: <178352261575.2235436.7747224578732326606.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:konradybcio@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-67029-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBC3D727CB3


On Fri, 15 May 2026 14:59:23 +0300, Dmitry Baryshkov wrote:
> The SM6115 / SM4250 / QRB4210 platforms use the AR50_LITE IP core as the
> video en/decoder (the same as Agatti platform). Extend Iris driver to
> support this platform. This has been tested on the Qualcomm RB2 board
> with the normal HFI Gen1 firmware. HFI Gen2 firmware for AR50Lt doesn't
> work yet on SM6115.
> 
> V4L2 compliance for Encoder fails due to firmware / driver error:
>  qcom-iris 5a00000.video-codec: session error for command: 3007001, event id:1007, session id:d3b1e000
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: sm6115: add venus device
      commit: e0511284f0c14e2929aa6cec435a9cb8bec259b1
[4/4] arm64: dts: qcom: qrb4210-rb2: enable venus device
      commit: 43611ba2955c1f349a0694b7ad7ab6a2794910df

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

