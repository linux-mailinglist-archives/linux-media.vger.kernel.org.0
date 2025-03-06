Return-Path: <linux-media+bounces-27785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF42A55B28
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 00:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EBAE18961BA
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 23:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298A8209F22;
	Thu,  6 Mar 2025 23:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=senhasbis.com.br header.i=@senhasbis.com.br header.b="UBYUzBhx"
X-Original-To: linux-media@vger.kernel.org
Received: from tiger.tulip.relay.mailchannels.net (tiger.tulip.relay.mailchannels.net [23.83.218.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E24819E971
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 23:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.248
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741305215; cv=pass; b=IRDVnyRSXOCRzMDd0xLbCAXfrFfjYYrDMfP3W6j5wvHu6ZJiQZs2dRJrexMszvUVeA7Q0fMrAobSYg9HEEkuukUElyG7y2lhhKmTMoZv16ts/M4SEOrF4oB6VEoVrkglghQOe502xQTCRvgbTj+p9STwBoarMTSkROeVoptzjfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741305215; c=relaxed/simple;
	bh=n1BJpsJAcg4u3+46KAwbPyfqTZHhyulhhATG0b422HU=;
	h=From:To:Subject:Message-ID:MIME-Version:Content-Type:Date; b=Y+9RmYPr9m08nnourcs5Rby4TaqCCsWQARHrkGCT5E1pwhY9K2okaKm8mXILU8eDOLs64WHN+PBNbG9OqKW1E5ySqEhWo8SFfbKyFGjU3xrBZStfDnu6HiBzPd3Ti+Vwhd8Jl5mCR3AcyI1B9tZ+CHmeVjJQDC5HEMAsFZ/vV+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=senhasbis.com.br; spf=fail smtp.mailfrom=senhasbis.com.br; dkim=pass (2048-bit key) header.d=senhasbis.com.br header.i=@senhasbis.com.br header.b=UBYUzBhx; arc=pass smtp.client-ip=23.83.218.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=senhasbis.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=senhasbis.com.br
X-Sender-Id: hostingeremail|x-authuser|senhasbis@senhasbis.com.br
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1862E1837D9
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 23:53:26 +0000 (UTC)
Received: from fr-int-smtpout2.hostinger.io (trex-3.trex.outbound.svc.cluster.local [100.107.186.7])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 660B118394F
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 23:53:25 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1741305205; a=rsa-sha256;
	cv=none;
	b=a9VJHyFzldcix5LAcl6kIBgoWW6GfO0XdFh5oDgvsPr6KpbIW3tIHKJDEfQGlXeolxowi8
	TDe222NmIBvC/ty53epkob+LOGBsQ2XMnS7qs4xQvP/LXN7v3gD/RV9A8HueJNrjE4hvTi
	YjerJ8g0WxxlevvxxAUKbZFs/WV+Gc7cVVyzQkSbCyWyyhTUmGZx8FXM0d7tWVJdQnKPNG
	U91aqHIHtfuW28FDuwoYMkOEX1jYwtS3uV4G9TIlRipO1JTvtLSMGGqsM7WfCl1QHHlUBC
	3JnozAbeo3ARqwb+evJScOcGwRfAoPjJNr58t1wqTIhvG6qRmS4Iitoz3nWs5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1741305205;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=n1BJpsJAcg4u3+46KAwbPyfqTZHhyulhhATG0b422HU=;
	b=kmhZO8MMqX+uri2wmrMXmAtVcnJU5HHizrulYwA+3F/oJS3cbnnQzNmGzmqiPghk/9vGaV
	hZdJW1e/spy/RkPMV173gRkCbl/h4CEdWlmIt2nvGWvCMvKvHOveK1Vm+sBKF8N+EzPgLd
	1xpL71bX4Z3Vi02OHBJcUnKVfR6tgcqs1VG55cxBi6qus1dY+QdHWQBMTSEbbpZVjp7F0R
	M3OFoF0j2XeQDUSJ9k5taaGi05+97xLoan7CQG3oekxhxHcs7Ojuglke52LrspN2rG08Jv
	AQuNHCmVuOa/EJMIHrYSm4eNLbGmP/7rwBYjRPVUwz9sAZS/SYp3vxSOoW8wTg==
ARC-Authentication-Results: i=1;
	rspamd-7ffbdd7fb5-52x5k;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=senhasbis@senhasbis.com.br
X-Sender-Id: hostingeremail|x-authuser|senhasbis@senhasbis.com.br
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|senhasbis@senhasbis.com.br
X-MailChannels-Auth-Id: hostingeremail
X-Whistle-Language: 1abd02e979e729aa_1741305205929_2503731309
X-MC-Loop-Signature: 1741305205929:3218256589
X-MC-Ingress-Time: 1741305205929
Received: from fr-int-smtpout2.hostinger.io (fr-int-smtpout2.hostinger.io
 [89.116.146.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.186.7 (trex/7.0.2);
	Thu, 06 Mar 2025 23:53:25 +0000
Received: from ec2-18-227-52-104.us-east-2.compute.amazonaws.com (ec2-18-227-52-104.us-east-2.compute.amazonaws.com [18.227.52.104])
	(Authenticated sender: senhasbis@senhasbis.com.br)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4Z85pW0jtXz6nv68
	for <linux-media@vger.kernel.org>; Thu, 06 Mar 2025 23:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=senhasbis.com.br;
	s=hostingermail-a; t=1741305203;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=n1BJpsJAcg4u3+46KAwbPyfqTZHhyulhhATG0b422HU=;
	b=UBYUzBhx2vILgLh5RD5rEnTQnfvkmanK0LPQTcdp6cu7RRPxLqAGPw4OsLNxEuRQ60Vd1s
	QZDtAy5Yjaf+5Fr4xe48Kxc8bOEojSMVqPw2jjShkyP/cDegfojxuHGx2RN0FMu23kSTlj
	AHqo2qQReF4vLSZUXighxwDhJUwqiKrZxYL+lHLnc8A/kh0JzBK0JeKN4vBJDM1y2V1ZLj
	ownRnzVmRV5xtV+fLEc0FN84oQKr0fkxTRSHGh7KslsOme7hWA5gBlaqnCydeIYX2Gfcfw
	Rc6xDqA/FxJiKowAm0JXh45wSVpkr4IXW1rrFNkOCXdNCkUf0OunZLF5Xh1a2Q==
Reply-To: ifaldazos@federante.com.ar
From: senhasbis@senhasbis.com.br
To: linux-media@vger.kernel.org
Subject: Contract #. D=?UTF-8?B?0LB00LU6My82LzIwMjUgMTE6NDY6MjEgUE0=?=
Message-ID: <20250306234621.04D9BE55A1DAEC7A@smtp.hostinger.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Mar 2025 23:53:22 +0000 (UTC)
X-CM-Envelope: MS4xfDFbGS6j+kG0TSQVdfg4grF83o4DFn26CApdigPUGnN1tGtMDAXyQd0LnjysEAzyy4haK+YML22yEjHfRZhsY0hw/3hmACynBiJ6/kHQoBDcryOP73Xg IqCnVVPI+gHhrf3XAs+XqRwUljRULCk//zATN79jPSaKAuGehPrNTJbSFcJr+nNieOjJLf+mGuVxE0yh2TXnbnoXAVHFV1j+hMTWoq2ClkxOY4rCyPDpJHLO YfnWMsEgEL81zBTi+RFypQ==
X-CM-Analysis: v=2.4 cv=e81USrp/ c=1 sm=1 tr=0 ts=67ca3573 a=PNr8vWZJDW7mT2DyFscmbA==:117 a=PNr8vWZJDW7mT2DyFscmbA==:17 a=IkcTkHD0fZMA:10 a=5KLPUuaC_9wA:10 a=Jlx8vXo6AAAA:8 a=yfqaB9iOPoRs9SVuPHQA:9 a=QEXdDO2ut3YA:10 a=j1RKUZb8YFR67jhtK3fQ:22
X-AuthUser: senhasbis@senhasbis.com.br

Hello linux-media,

I=E2=80=99m Jordan Patel from Federante Ltd. We=E2=80=99re interested in pl=
acing=20
an order and would love to see your latest product/service list=20
along with pricing.

Could you kindly send the details to ifaldazos@federante.com.ar=20
at your earliest convenience?

Looking forward to your response.

Best regards,
Jordan Patel
Federante Ltd.

