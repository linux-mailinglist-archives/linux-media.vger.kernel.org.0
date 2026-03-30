Return-Path: <linux-media+bounces-57643-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iExKO32VymkR+QUAu9opvQ
	(envelope-from <linux-media+bounces-57643-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:23:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5749435DBDE
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 777ED308D3D5
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46B533AD81;
	Mon, 30 Mar 2026 15:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJHRFUKy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64C6336EDA
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 15:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883219; cv=none; b=hvdOwEHjXSPsVRN07gSJ2gxT4U71JTsLtJ/QU/hG8cU1trYaAI8+mBb9osFq2HZO+OYElcUGV+F33xH3DZhOWNBy+TQwQZ6KFA4JNm1kjEFyRBpnvev73+wYj4G7CAv/oNTFvoYvRXsdrL5vrzw844RU4rgFEv6MTi2tk4hq0gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883219; c=relaxed/simple;
	bh=p+eWhg50WegLSEXAF6Nxv3eUiQbrMEZ4FanIPXGKwZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U56/uDNo2v8+m0ZJWXRnh3RIp+WiqZspCYH0EKMAZTMqGbnt4ZjsEq6tzVoApoIOUSkpAcj9gbR6HqRhQDETkWOCFv8BhR6wkrQ2nvl5A04xeeml+ILhQsEcgAtkQOzEXHH3fu46ZO8U6nbTMrWoBsVOMfzgwzY7trCAG+OqDa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJHRFUKy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so33325645e9.0
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 08:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774883216; x=1775488016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t10t7d90tvq1oIUR8H7YoceRX84rV+qS4jxtEp+R5O8=;
        b=IJHRFUKyzshU2gUyrxRM20SSsI8UtUedE97lr6jh6az9lwvjGXBo1EhLe5bN26SJGJ
         tJxB7cP9Heel4JdQVbPDyzFEQ0PJOENaTOLPnj34Wh0NzMhWz0CZ2oZD/XgGueeokU2o
         TYDYeStYwoIai25A8L7RS42HLEwKbpNTsGlBnVJdFxm5Ne2YixXqSC55uv+K8ZdVyLcO
         z+2wP3RgaeL9l4jQWZuzLWOoBDSPie/OKAwsQpt11rB03MhZ5LZHNG9e6psBaZWRQLh4
         wabhVa7LCph0acUurO6T0YhA/kPz1jrIAjjIn3crihUu8/5to0xSQ7cMFsKWD5qMBTxX
         RWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774883216; x=1775488016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t10t7d90tvq1oIUR8H7YoceRX84rV+qS4jxtEp+R5O8=;
        b=atbzLMgnFQDwR2Y8Ps49b8zXQFlikc4nBOi1nIOnl0eZuHhk9ILRv0+fkh3S5AK73y
         JvEhWIcjVpFe1wMpH9Wb2ePLv2TM6OdGyKvX6ys0OSmS4UMXlT+r/qNLjeaya471Tj0N
         5u495xZjKzbqcriICe9/tdCzqYcAxXX9oTHNg9J3ue6eoyvIRc6eMJuEVjv4rs6B/osQ
         JyLHqhqF9et+sKSqArEoTAH4WfQHMgihVaYUSUh/7Cpss7HeO0UINuR69AzCy68ckvJA
         jT1qN8Z5tQeROzi/i4chK7+n7eunPL6cAC2ON3/+BEw83E3pb2q8p4zU0VAKzwixJBAZ
         zxGQ==
X-Gm-Message-State: AOJu0YzTu//3uSuXnfqZm/8XZUNwCdCZhT2WbR8KWRyxxQukq3196XFh
	zddCNOjsTwpUFsL+XbUoPQD0znd4Fe5s7euNK484Iyg7eWRvwJGgc54f
X-Gm-Gg: ATEYQzx6/vcv0qZV2z0CkFg+RxU7ih1otMLww2caGKFeJC4YXrg7lGcuq/i3jp9SC7v
	4CAgo4Lr8LgjD+SlTVM84bTlzTKfBgD3b+Knl+5FEw6H9ft3mVmRSNnyN3yxX/taJh/S9gnJ0jf
	To5rCie+rTju/ln+uKBaVnCt58z6b/KHxKkvwpz1sWVb52CuvkvEyMlhttpWRkyCYETerad5tRs
	SL2MbMKaPUEIlXz6z1FDIncpxsA0FaIVhWrdoRYsXcgc8vzkcTyfEo3B/Lec63kxRPxiQVZwU58
	PuySOLhhJ4ejHtO7DOOWiKEQ3f9s8OD02AGtMhL8ELqEzmR97GLbvCdFb8ASIiSj+7JaXFJQYOF
	i7a5tsRgPl0rXR2pAX+l2TH9jmNvu04Bw1D3HrAOCIfxllQDFCAaYqnPL+5n6SubrlMPZ9OymMr
	9pKlNqtwsecnrYOhjWMfPIy0uIRyDInTJ0xBuWR0PhHXbjHyEaxS/e5KAo00/91Nw5bnsVtZAid
	Q7tZo5UoKmfwVqfOvEfPbHuTlFOhR5ruGC/bWcY6tHt/iU+
X-Received: by 2002:a05:600c:8589:b0:485:39d1:b500 with SMTP id 5b1f17b1804b1-48727eef71bmr193388595e9.16.1774883216135;
        Mon, 30 Mar 2026 08:06:56 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3b85:b2a6:8671:75d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d38a5fsm284031295e9.12.2026.03.30.08.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:06:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] media: rzg2l-cru: Switch to v4l2_subdev_get_frame_desc()
Date: Mon, 30 Mar 2026 16:06:39 +0100
Message-ID: <20260330150639.272174-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-57643-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 5749435DBDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace direct v4l2_subdev_call() invocations of the get_frame_desc pad
operation with the new v4l2_subdev_get_frame_desc() helper in both
rzg2l-csi2 and rzg2l-video.

Drop the -ENOIOCTLCMD handling and frame descriptor type validation as
these are redundant after switching to v4l2_subdev_get_frame_desc().
Set fd.type to V4L2_MBUS_FRAME_DESC_TYPE_CSI2 before calling the helper
as required by its API contract.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, this patch depends on the patch [0] posted by Sakari which adds
the v4l2_subdev_get_frame_desc() helper.

[0] https://lore.kernel.org/all/20260329195625.2840728-1-sakari.ailus@linux.intel.com/
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c    |  5 +++--
 .../platform/renesas/rzg2l-cru/rzg2l-video.c   | 18 +++++++-----------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 6dc4b53607b4..1fdd423f6e6c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -737,8 +737,9 @@ static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			csi2->remote_source->name, remote_pad);
 		return PTR_ERR(remote_pad);
 	}
-	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
-				remote_pad->index, fd);
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	return v4l2_subdev_get_frame_desc(csi2->remote_source,
+					  remote_pad->index, fd);
 }
 
 static const struct v4l2_subdev_video_ops rzg2l_csi2_video_ops = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 162e2ace6931..e701a591ce8a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -406,24 +406,20 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 
 static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 {
-	struct v4l2_mbus_frame_desc fd = { };
+	struct v4l2_mbus_frame_desc fd = {
+		.type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2,
+	};
 	struct media_pad *remote_pad;
 	int ret;
 
 	remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
-	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
-	if (ret < 0 && ret != -ENOIOCTLCMD) {
+
+	ret = v4l2_subdev_get_frame_desc(cru->ip.remote,
+					 remote_pad->index, &fd);
+	if (ret < 0) {
 		dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");
 		return ret;
 	}
-	/* If remote subdev does not implement .get_frame_desc default to VC0. */
-	if (ret == -ENOIOCTLCMD)
-		return 0;
-
-	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		dev_err(cru->dev, "get_frame_desc returned invalid bus type %d\n", fd.type);
-		return -EINVAL;
-	}
 
 	if (!fd.num_entries) {
 		dev_err(cru->dev, "get_frame_desc returned zero entries\n");
-- 
2.53.0


