Return-Path: <linux-media+bounces-67319-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V3whC8lYUWqeCwMAu9opvQ
	(envelope-from <linux-media+bounces-67319-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 22:40:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E428C73E6F6
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 22:40:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=worksmobile.com header.s=s20171120 header.b=DCbJuL2k;
	dkim=pass header.d=korea.ac.kr header.s=naverworks header.b=VZ02bPB+;
	dmarc=pass (policy=none) header.from=korea.ac.kr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67319-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67319-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0DFE4302E7ED
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 20:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B1239A4C5;
	Fri, 10 Jul 2026 20:40:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cvsmtppost102.wmail.worksmobile.com (cvsmtppost102.wmail.worksmobile.com [125.209.209.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A7538237D
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 20:40:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783716033; cv=none; b=OtQYKfKyO5OD3iNDPmPcZoeRFH6RnceLZUj7HCB4jEz+gy09UhI9XyVtc+cNRSMyqiWif0JuvyKXraRrKvClTyo3RQnq2ILamaskXjBVyxMS4iLZUzsMdx24dE5B1Riq5krkNY8++MCWuqMNPFD7pl8U9IqxgCugZlTmz1sSFC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783716033; c=relaxed/simple;
	bh=u04zFavuYLvwHTm35ic5NAbzjGnp0TqATPQNqu4zp1s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CKJW+oMJgX/9hnWwgfOxgvGtqve7YnP0DjL3S2WJqF1cHNjJVwP526hkbkXcJ0oQRABvOBvPxD0QaUrU+YpsNpt80mQlRTGr05YYzO5pkl+MlSf/17BcY4eRj+SdsTDTmXeGF9LbFHrS+qDFCxTYkYwINMkksJKsBBiydCSPk18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr; spf=pass smtp.mailfrom=korea.ac.kr; dkim=pass (2048-bit key) header.d=worksmobile.com header.i=@worksmobile.com header.b=DCbJuL2k; dkim=pass (1024-bit key) header.d=korea.ac.kr header.i=@korea.ac.kr header.b=VZ02bPB+; arc=none smtp.client-ip=125.209.209.51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
	s=s20171120; t=1783715419;
	bh=u04zFavuYLvwHTm35ic5NAbzjGnp0TqATPQNqu4zp1s=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=DCbJuL2kyifsB8VHhQeeowvSNCIoljNueeYLB66cZDgx0lGZ4+gTPLd4w1ynoqzrH
	 lAGn7kz0wWy2Mi3fH2sb2zmjQilr/XQTvL8eoYg1vRZ+77HFwRWglg6GTf60MmKsZc
	 ATUrP7POriBNilvGwlOUo8MNS79NQVQATorqcof1MroY+TrwGr8DiWnA5ddTU6NQob
	 Fx4Cw+X3RjAvRCYbY4WZS3VP+9dy3lVGkMW7QkuM2S0Wv85dY3TjUB7yV88auRyyaC
	 60VdImm7KeY5M6fALl6j3K41KWN3ptKXS5uIXF4SGkg66Opn3sbnfRgSqRG6CVKp9r
	 Nsdhl0nhQ91oQ==
Received: from cvsendbo001.wmail ([10.113.20.163])
  by cvsmtppost102.wmail.worksmobile.com with ESMTP id Nc+tfTO3T0mtq1G0n32aJg
  for <linux-media@vger.kernel.org>;
  Fri, 10 Jul 2026 20:30:19 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=korea.ac.kr;
	s=naverworks; t=1783715419;
	bh=u04zFavuYLvwHTm35ic5NAbzjGnp0TqATPQNqu4zp1s=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=VZ02bPB+MW+9x09dprEHbgoycRxIRNAskpTw5Nw3qlYBBnMnLrJYZZo8aQH3Xf7E3
	 Wdl2WvDxkqGCfNU9Mq2XfUcsJvwkYtwFuA0Jaij+Gbx2mKH88oIspRkUEC35Z43Ynu
	 CobeTmc5ErHzvqqnzSIdBNDg3AjWSzF+tX6y+Ee8=
X-Session-ID: CvxIstBYSTqLhD9WR40Ghg
X-Works-Send-Opt: 5Yn/KqgmKAKmKAFYFqMXKAK/FqMXjAumKAgmKxEmFxudKoMqKNmmjACYKxb9Fob/FxMqFNwYjAg=
X-Works-Smtp-Source: IZK/FoK/FqJZ+Hm/Kxgq+6E=
Received: from s2lab05.. ([163.152.163.130])
  by jvnsmtp401.gwmail.worksmobile.com with ESMTP id CvxIstBYSTqLhD9WR40Ghg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Fri, 10 Jul 2026 20:30:18 -0000
From: Jang Ingyu <ingyujang25@korea.ac.kr>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rockchip: rkcif: Use IS_ERR() check for media_entity_remote_source_pad_unique()
Date: Sat, 11 Jul 2026 05:30:16 +0900
Message-Id: <20260710203016.2250058-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[korea.ac.kr,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[worksmobile.com:s=s20171120,korea.ac.kr:s=naverworks];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67319-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mehdi.djait@linux.intel.com,m:michael.riesch@collabora.com,m:mchehab@kernel.org,m:heiko@sntech.de,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ingyujang25@korea.ac.kr,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[ingyujang25@korea.ac.kr,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[worksmobile.com:+,korea.ac.kr:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,worksmobile.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E428C73E6F6

From: Ingyu Jang <ingyujang25@korea.ac.kr>

media_entity_remote_source_pad_unique() returns either a valid struct
media_pad pointer or an error pointer (ERR_PTR(-ENOTUNIQ) or
ERR_PTR(-ENOLINK)); it never returns NULL. The current NULL check
therefore never triggers, and the "pad not connected" error path is
unreachable.

Replace the NULL check with an IS_ERR() check so the validation
actually detects malformed media graphs.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
 drivers/media/platform/rockchip/rkcif/rkcif-stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index 3130d420ad559..542aa877919df 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -466,7 +466,7 @@ static int rkcif_stream_link_validate(struct media_link *link)
 	struct rkcif_stream *stream = to_rkcif_stream(vdev);
 	int ret = -EINVAL;
 
-	if (!media_entity_remote_source_pad_unique(link->sink->entity))
+	if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->entity)))
 		return -ENOTCONN;
 
 	sd = media_entity_to_v4l2_subdev(link->source->entity);
-- 
2.34.1


