Return-Path: <linux-media+bounces-56106-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGAUOoKJuWmTJAIAu9opvQ
	(envelope-from <linux-media+bounces-56106-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:04:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 463702AEDC2
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2815A31533E7
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 16:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512E63F23DD;
	Tue, 17 Mar 2026 16:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZvxKyZkl"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0343EAC6F;
	Tue, 17 Mar 2026 16:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773766285; cv=none; b=qQRm99W9+Js7Q3Ol1MbKbfxBpTXIOa+vEPasosdpGbYV4ZLbNKwRsP/Wf55eT1GwQ6Qa2IIvMTfCz0QpfM36qKzb/J8NWIoLILCk8xvfX1AAYuioY7beLJG8U0xvsb6xbuJ2eQdPemRGaRaMefL8NC6ZmqtgzbnjvnRmHXq+yIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773766285; c=relaxed/simple;
	bh=KWhCOBu1XaI2x2mEIb/lsnEQSL8ruempzbLEXwXjGnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MQkp5UfscsHMP0y0a8qBAOElTAIwFyYMw9tORWBV3lStoydjANvDkGJoRXwijm7Y2TG5QeItDj/9LYuYKR6qCQf9rSJdDuCvcPNvO4otxUXAmCJpq44z4LP1k5lntB5g7a8EvyFVSAMXktZyaBco2etkcykiDHHLtAoCsPDktTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZvxKyZkl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773766283;
	bh=KWhCOBu1XaI2x2mEIb/lsnEQSL8ruempzbLEXwXjGnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZvxKyZklLIUZcP50SdWyyPMhOkUVSps9y4PaE3u4jJ44riC/1SckVGdearmncCHV3
	 NYIvGg/MedCQuH8esmmmrUSnXoeUX0wuGTnLICEwLOv79NtTSwFGy7ID6OwaBhEzRy
	 CQNw0l05jscuJKEnBogxFU75U5Hz64RtEE2I939QVijI/Zu/CJMAmonJAe43j5faao
	 wFEJBlr+NvN7/5YrDVsUgxYJDpGFGDAEbZkJzhrdW9pIiVg2Ds8Mz4njJln4V0IBnc
	 uiAnubitHsMO1bHJx7DdrukGmFJg+6Wzk17HImN+zbgRGqIPdW1MjDhhUF2LRf8Wd3
	 GP56Ov0p/XbyA==
Received: from nicolas-x1.hs.collaboradmins.com (unknown [IPv6:2606:6d00:11:b76d::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F7F517E0619;
	Tue, 17 Mar 2026 17:51:17 +0100 (CET)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org,
	ming.qian@oss.nxp.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	mchehab@kernel.org,
	nicolas@ndufresne.ca,
	benjamin.gaignard@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	ulf.hansson@linaro.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	m.felsch@pengutronix.de,
	fra.schnyder@gmail.com,
	linux-imx@nxp.com,
	l.stach@pengutronix.de,
	Frank.li@nxp.com,
	peng.fan@nxp.com,
	eagle.zhou@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v4] media: verisilicon: Fix kernel panic due to __initconst misuse
Date: Tue, 17 Mar 2026 12:51:06 -0400
Message-ID: <177376614640.2015221.5231981229215959103.b4-ty@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306031059.801-1-ming.qian@oss.nxp.com>
References: <20260306031059.801-1-ming.qian@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56106-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,ndufresne.ca,pengutronix.de,linaro.org,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: 463702AEDC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 06 Mar 2026 11:10:57 +0800, ming.qian@oss.nxp.com wrote:
> Fix a kernel panic when probing the driver as a module:
> 
>   Unable to handle kernel paging request at virtual address
>   ffffd9c18eb05000
>   of_find_matching_node_and_match+0x5c/0x1a0
>   hantro_probe+0x2f4/0x7d0 [hantro_vpu]
> 
> [...]

PR sent to Mauro aiming for RC5, thanks!

[1/1] media: verisilicon: Fix kernel panic due to __initconst misuse
      commit: ab2e204b1e76e1a85ff75592dcbfefa3d783a683

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>

