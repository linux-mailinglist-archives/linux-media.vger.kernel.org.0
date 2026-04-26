Return-Path: <linux-media+bounces-59634-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vJaBFUxv7mmBtwAAu9opvQ
	(envelope-from <linux-media+bounces-59634-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 22:02:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CCF46B01C
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 22:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3BB1301650E
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 20:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F51F39021A;
	Sun, 26 Apr 2026 20:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marbe@gmx.de header.b="Pttb9xNa"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE800145B3F;
	Sun, 26 Apr 2026 20:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777233729; cv=none; b=UUCeieQxgvYKcq0mkD4WSFD+opUI3sMtr/xIvex/aDnjjN8ty5/YxDQq5VAXFEcec+Ny/HBXPRh9B63OGZ7LjBoogHEfZV38TedwxfmN8ySUvMovTAky//L88Ap2NNpWWkx+NqReostCx18Nqw2Bs+Xo29MtbpiYJbV1iAC0RgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777233729; c=relaxed/simple;
	bh=ZV30wKIQcrKtmzwE9f7NfCFJltkN1AS0Gn/5cD2KYmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nn4xhlTGmsma+tIugE+sKc7GEtmx7t5q5yVWJiqGkZSWhuDvuHCsiRiBBi73DCa6jeSqjlKoPgcyG8n+htsOEKaW5w5grd4LUZWDOsOH1fG093RozZdsTO3U2WP+nA7glZochXtI9LxF+Qd7etCrplTKM80DGq414HcCpEbrYSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marbe@gmx.de header.b=Pttb9xNa; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777233722; x=1777838522; i=marbe@gmx.de;
	bh=YvHrGEISsZ2myvc1f691xn7BT0VO9y5H4/OnwUX4FI0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Pttb9xNa0nqEKMCHxNe7Bnb5qvhXl59RDQMZBXlyWML5jP9HDzbetqLKQyfdIn67
	 oEQVdXZze2Mzww7vWtfDDBjUhvHpPUzl5PYgbeoO/QhLAM64xK0PHR6624NOKDz1z
	 Pg1t2/q8vhX0HHXJNLCVC5+nvcnl0T02qMl5rwsfY7PQjx7oy83HtBzKXHtoE/5DL
	 rL0pQENQxhVD8kzFsyttAII/xqr2dssSqtiCtTU/Pb/aA8Lo4VZEGrFJetxzEZXpS
	 97v9/37m6+nH2gpO+3G6xF2QpI9g9th5fEzF6ZWSZ5U6RkdbS8MTLT4kEZF3JiB/m
	 V05uUFGBUxczYNkYPg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdNcG-1vi1yU1BM8-00pVCI; Sun, 26
 Apr 2026 22:02:02 +0200
From: Marcel Berger <marbe@gmx.de>
To: Bryan O'Donoghue <bod@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcel Berger <marbe@gmx.de>
Subject: [PATCH] media: i2c: ov02e10: Add get_selection support
Date: Sun, 26 Apr 2026 22:01:43 +0200
Message-ID: <20260426200143.109896-1-marbe@gmx.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UpnCtP3D12mwWr7rlIDBPenxGphUKCY2N/Rb1QAiBgJ2TId4CoM
 SNpi7q8L8POfXJpQpsbWLI02TKooJMRrdioF67XmmNGkfJ33VBjz6fkdaUtpox+VN3LGA7q
 7bo2yHcb1fgXfz0OQKNXcxVN1Qu/7tpW/p7y2h/AYiLweuOZUl15k7WZOH5i0BIYoj+EcTP
 cUwfUj2JfsUATIyPWjSbg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PTtYOFQypEs=;gHOeQy33TDgntN9Ynj5Nl6nKtUd
 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
 HIqNjiGWp7vjDw/adl7irOIg==
X-Rspamd-Queue-Id: 97CCF46B01C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmx.de];
	TAGGED_FROM(0.00)[bounces-59634-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marbe@gmx.de,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmx.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Signed-off-by: Marcel Berger <marbe@gmx.de>
=2D--
 drivers/media/i2c/ov02e10.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/i2c/ov02e10.c b/drivers/media/i2c/ov02e10.c
index 4a64cba..097188f 100644
=2D-- a/drivers/media/i2c/ov02e10.c
+++ b/drivers/media/i2c/ov02e10.c
@@ -655,6 +655,30 @@ static int ov02e10_get_format(struct v4l2_subdev *sd,
 	return 0;
 }
=20
+static int ov02e10_get_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	struct ov02e10 *ov02e10 =3D to_ov02e10(sd);
+
+	if (sel->pad !=3D 0)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.left =3D 0;
+		sel->r.top =3D 0;
+		sel->r.width =3D ov02e10->cur_mode->width;
+		sel->r.height =3D ov02e10->cur_mode->height;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 static int ov02e10_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
@@ -703,6 +727,7 @@ static const struct v4l2_subdev_pad_ops ov02e10_pad_op=
s =3D {
 	.get_fmt =3D ov02e10_get_format,
 	.enum_mbus_code =3D ov02e10_enum_mbus_code,
 	.enum_frame_size =3D ov02e10_enum_frame_size,
+	.get_selection =3D ov02e10_get_selection,
 	.enable_streams =3D ov02e10_enable_streams,
 	.disable_streams =3D ov02e10_disable_streams,
 };
=2D-=20
2.53.0


