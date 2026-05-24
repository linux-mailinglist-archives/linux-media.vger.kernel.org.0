Return-Path: <linux-media+bounces-62689-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAhVJpVjE2r+/QYAu9opvQ
	(envelope-from <linux-media+bounces-62689-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 22:46:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 371045C4379
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 22:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 63E5D3002B32
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 20:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308993195FB;
	Sun, 24 May 2026 20:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akWfQici"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A75630566F
	for <linux-media@vger.kernel.org>; Sun, 24 May 2026 20:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779655568; cv=none; b=RKMai7aueGPCNPpPqm8kNrGdg2pl0/MGSqk8OWtxgL0K57lTrdPhufIofzsR3i4I+PBQJk5gyE6WaY5MWf6G/Wx2RIzANvUDTT2J7r6Lzxk8VkW5byT5b/Yvitw6wbq9ATiW6FbyOSaqRDNs0bYBkGpsbOxSDv1oMov4Nwp7SuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779655568; c=relaxed/simple;
	bh=8WVxnkBnaIkxI1LgprD2KtWd60tv+yMPpETPl/aD3pE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J5amBdS4EpY6lVDmVk8rzLIQVrH3CzNasQSsQTedESAy050C1MNOgyn5E7jHJfNkXMu3ubzBXjqYU2YRT9EzhDrhwTVyk6Z5J8uOykUcKKavsoCfwyvuWtuq3geygqKcEJK789P707Us30wL1CSbCMGoERIRagsp7JiOaDW3krg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akWfQici; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49056b9f04aso14507345e9.0
        for <linux-media@vger.kernel.org>; Sun, 24 May 2026 13:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779655565; x=1780260365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fsgVrTtHCQi+YIBQZKm7aYFBiVdjbejCJa8esm9q6Ds=;
        b=akWfQiciAlehtdP5WNpjQwwvhBeft1+C5MkAa6piwIoa64pP/hIpm5uBQoFptdOcN6
         nIIH95WBWG1LmGhE8XzfX2SrB6gneLfwDYVj8Sb068dqBe4po5SkQm2DfxxJj9eqa3XM
         nN/CtscKsVoUtoTXGXytaqNUDvkCaxCDZ98Wi8dtRvYLobQ1ko9m0SLLKGMpdnhsZS+R
         ZSGOqqLpvy6R9Nql9g7rBc9AHGzx0QkP9jfg/w6x85vnTn2YdnSVfSWCEp4uFQmqadVl
         JI+TZGvWhfkFSGdTZRn8I0EzCSguBGeO1u1jDUsDlb85aQJ1zd7kgsv5OXE557+gOfce
         hhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779655565; x=1780260365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsgVrTtHCQi+YIBQZKm7aYFBiVdjbejCJa8esm9q6Ds=;
        b=Jd4iZo9WfZOcwKriV70vESy3V6wRf8jZbgiNC17rmh3PhDtDjwXdIseRMCQ0HqFDEM
         wFpJxfmSrN/D3XXJSksWKyqAPSQSAmy6nOYLAh+by4GlHBSClqy6MxtA+vxA65ByMPya
         MZkNmd+HIMp4uMJRZxwSffmZVeJ+YzPr+wSgtncmYUr5hKBzSP1hOvhwCU8Fk56Li0Lh
         TpVFV5SOxzUaF1S0NM1ty2DyNYE94m+0YeoDC+V39pEe74m9oBcHsne5Oo3d3FhgkBtd
         u25sKbfGUvlrxoJfo8Jv+XRYv50GeZBYnpkMfj3Aq8RjUk6VJ3pQx1UxT204TKb435uT
         MdPw==
X-Gm-Message-State: AOJu0YxF8fdu1irgMXMOOS7Ov5JEiOIMeLBfndm3tiddu6pG9KtEWPPF
	oUqrpMTsx2clEfNuoIKjSWNrXHY/g1TzCftbpczp9S1VKimuS2FTIJUnQLSWJA==
X-Gm-Gg: Acq92OGxvhj0drDDPE2EcGj5Xk/kGexCINzYbGCeUCCoB8K/GWVLi+MqIA2CAkeuNeT
	LQTRaygcXhN4MMSBijxSOD12Fs4DN7h2E91CRX5cGN2Gk/R6iOH7CvEhW28QiFe8wjA7d6D/iDM
	x6w4su02Cf8XNEczLqmpyEZUb6usW6jHVRj24ItFCNJNf6NXUbIz7+0yWbO9FUsz0IAIQ697mPm
	PJtley09pATxN2rqIa4pTmcxNAqVg856KIHT98ewBD8CvOGXpuSkqvSSqnUlSF/ul4NvUqloPcC
	6W2h7AxyXFafEm89nF2+qxToo2WdjefkPS7wELn+R/ukvlncvIdLdV8QeZOh1RNX+46PoRPN16L
	HQ5Xoa1UkY0jbMBg/KdYxMBfMLVdb+DBMluFox9eOeC8tGP47CWTvooFugOjGY77QMGcJ/0VbD0
	mcPXW7KlGtsbnBeTbWIRyPnaB7/WSCJ6+9NER8zIBWc6qiRDlWghaax973v7Dy/RCpAugVV1ali
	CMWTFUqyVsQ
X-Received: by 2002:a05:600c:1393:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-490428e5b31mr198468115e9.27.1779655565580;
        Sun, 24 May 2026 13:46:05 -0700 (PDT)
Received: from sarah-VirtualBox.Dlink ([46.31.102.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454ac6a6sm208148865e9.12.2026.05.24.13.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 13:46:04 -0700 (PDT)
From: Sarah Gershuni <sarah556726@gmail.com>
To: linux-media@vger.kernel.org
Cc: hverkuil+cisco@kernel.org,
	Sarah Gershuni <sarah556726@gmail.com>
Subject: [PATCH v4l-utils 0/2] v4l2-tracer: fix expected frame length calculation
Date: Sun, 24 May 2026 23:43:58 +0300
Message-ID: <20260524204400.8287-1-sarah556726@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62689-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sarah556726@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 371045C4379
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes the expected frame length calculation in v4l2-tracer within the get_expected_length_trace() function.
The current implementation assumes that the stride is always equal to the real width, which can lead to incorrect expected buffer sizes when bytesperline includes padding.
Update the calculation to use bytesperline as provided by the driver instead of width-based assumptions.

Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>


Sarah Gershuni (2):
  add plane_bytesperline to trace_context
  use bytesperline for better expected buffer length calculation

 utils/v4l2-tracer/trace-helper.cpp | 22 ++++++++++++++--------
 utils/v4l2-tracer/trace.h          |  1 +
 2 files changed, 15 insertions(+), 8 deletions(-)

-- 
2.43.0


